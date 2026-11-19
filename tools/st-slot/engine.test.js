// ST機の内部のテスト: node --test tools/st-slot/
const test = require('node:test');
const assert = require('node:assert');
const { createMachine, CONFIG } = require('../../data/others/st_slot/st_engine.js');

// 役を狙って出すための乱数の値（役の帯の真ん中）
const band = {};
{
  let acc = 0;
  for (const k of Object.keys(CONFIG.roles)) { const p = 1 / CONFIG.roles[k]; band[k] = acc + p / 2; acc += p; }
  band.none = 0.999;
}
// 決まった順に値を返す乱数（尽きたら 0.999 = ハズレ・抽選に外れる）
function seq(values) { let i = 0; return () => (i < values.length ? values[i++] : 0.999); }

function stMachine(enemy, rands) {
  const m = createMachine({ rand: seq(rands) });
  const s = m.debug.internal();
  s.phase = 'st';
  s.st = { enemy, games: CONFIG.stGames, superTsukuyomi: false, battle: null, jiriki: false, finalBattle: false, extra: [] };
  return { m, s };
}

test('クリティカル役（弱点の役）は直撃確定でバトルへ', () => {
  // ハンニバルの弱点はチャンス目。役 → 7揃い抽選（外れ）
  const { m, s } = stMachine('hannibal', [band.chance, 0.999]);
  const r = m.lever();
  assert.strictEqual(r.role, 'chance');
  assert.strictEqual(r.critical, true);
  assert.strictEqual(r.direct, true);
  assert.ok(s.st.battle && s.st.battle.win);
});

test('中段チェリーはオーバーキル＋次のSTはアマテラス', () => {
  // 役（中段）→ 7揃い（外れ）
  const { m, s } = stMachine('venus', [band.mcherry, 0.999]);
  m.lever();
  assert.ok(s.st.battle.win && s.st.battle.overkill);
  assert.strictEqual(s.nextEnemy, 'amaterasu');
});

test('バトル中はSTのゲーム数が減らない', () => {
  // 1G目: スイカ（ヴィーナス以外ならクリティカルでない）→ 7揃い外れ → 直撃抽選 外れ → バトル突入
  const { m, s } = stMachine('hannibal', [band.suika, 0.999, 0.999, 0.999]);
  m.lever();
  assert.ok(s.st.battle);
  const g = s.st.games;
  for (let i = 0; i < CONFIG.battleGames; i++) m.lever();
  assert.strictEqual(s.st.games, g);
  assert.strictEqual(s.st.battle, null);   // 4Gで負け
});

test('バトル中の直撃は勝ちに書き換え、もう一度引けばオーバーキル', () => {
  // 1G目: スイカでバトル突入（負け状態）/ 2G目: 強チェリー（クリティカルでない → 勝利確定）/ 3G目: 中段チェリー（オーバーキル）
  const { m, s } = stMachine('hannibal', [band.suika, 0.999, 0.999, 0.999, band.scherry, 0.999, 0.999, 0.5, band.mcherry, 0.999, 0.5]);
  m.lever();
  assert.strictEqual(s.st.battle.win, false);
  m.lever();
  assert.strictEqual(s.st.battle.win, true);
  assert.strictEqual(s.st.battle.overkill, false);
  m.lever();
  assert.strictEqual(s.st.battle.overkill, true);
});

test('ポイント60で、次のバトルのクリティカル役が3つ増える', () => {
  const m = createMachine({ rand: seq([band.mcherry]) });
  const s = m.debug.internal();
  s.phase = 'bonus';
  s.st = { enemy: 'hannibal', games: 30, superTsukuyomi: false, battle: null, jiriki: false, finalBattle: false, extra: [] };
  s.bonus = { weapon: 'isshiki', target: 200, paid: 0, games: 0 };
  m.lever();
  assert.strictEqual(s.extraLamps, 3);
  assert.strictEqual(s.points, 0);
});

test('武器選択で中段チェリーなら金ノ顎', () => {
  let hit = 0;
  for (let i = 0; i < 200; i++) {
    const mm = createMachine({ rand: seq([band.mcherry, 0.999, 0.5, 0.5]) });
    const ss = mm.debug.internal();
    ss.phase = 'seven';
    ss.st = { enemy: 'hannibal', games: 0, superTsukuyomi: false, battle: null, jiriki: false, finalBattle: false, extra: [] };
    const r = mm.lever();
    assert.strictEqual(r.role, null);          // 7揃いのゲームでは小役を隠す
    assert.strictEqual(r.shape, 'seven');
    const r2 = mm.lever();                      // 次のゲームで小役が出る
    assert.strictEqual(r2.role, 'mcherry');
    if (r.weapon.id === 'kinnoago' && r2.weapon.medals > 0) hit++;
  }
  assert.strictEqual(hit, 200);
});

test('ミズチは必ず200枚以上', () => {
  for (let seed = 1; seed <= 300; seed++) {
    const m = createMachine({ seed });
    const s = m.debug.internal();
    s.phase = 'seven';
    s.st = { enemy: 'hannibal', games: 0, superTsukuyomi: false, battle: null, jiriki: false, finalBattle: false, extra: [] };
    m.lever();
    const r = m.lever();
    if (r.weapon.id === 'mizuchi') assert.ok(r.weapon.medals >= 200);
  }
});

test('エンディング後のSTはディアウス・ビターか、弱点ランプが1つ多い最強ST', () => {
  let upper = 0;
  for (let seed = 1; seed <= 300; seed++) {
    const m = createMachine({ seed });
    m.debug.internal().ending = true;
    const r = m.lever();
    const st = m.debug.internal().st;
    if (r.enemy !== 'dyaus') {
      upper++;
      assert.ok(st.upper && st.upperLamp, r.enemy);
      assert.strictEqual(m.snapshot().lamps.length, CONFIG.enemies[r.enemy].lamps.length + 1);
    }
  }
  assert.ok(upper > 50 && upper < 130);
});

test('逆鱗ハンニバル戦はST 50G', () => {
  const m = createMachine({ seed: 3 });
  const s = m.debug.internal();
  s.chainMedals = 1200;
  const r = m.lever();
  assert.strictEqual(r.enemy, 'gekirin');
  assert.strictEqual(m.snapshot().stGames, 50);
});

test('バトル4Gの演出: 3G目のレバーまでに勝っていれば4G目は勝利、4G目で勝てば復活（違和感）', () => {
  // 1G目: スイカでバトル突入（負け）→ 1〜3G目はハズレ → 4G目に強チェリー（勝利確定）
  const { m } = stMachine('hannibal', [band.suika, 0.999, 0.999, 0.999, 0.999, 0.999, 0.5, 0.999, 0.999, 0.5, 0.999, 0.999, 0.5, band.scherry, 0.999, 0.999, 0.5]);
  m.lever();
  const fx = [];
  for (let i = 0; i < 4; i++) fx.push(m.lever().battleFx);
  assert.deepStrictEqual(fx.map((f) => f.n), [1, 2, 3, 4]);
  assert.ok(fx[2].aura);
  assert.strictEqual(fx[3].kind, 'revive');
  assert.ok(fx[3].revive === 'stopLock' || fx[3].revive === 'leverLock');
  assert.strictEqual(m.snapshot().phase, 'seven');
});

test('同じシードなら同じ結果', () => {
  const run = () => { const m = createMachine({ seed: 42 }); const out = []; for (let i = 0; i < 500; i++) { const r = m.lever(); if (!r) break; out.push(r.role); } return out.join(','); };
  assert.strictEqual(run(), run());
});

test('リール: どの役の形も、どの押し順・どこで押しても作れる', () => {
  const R = require('../../data/others/st_slot/st_reels.js');
  const orders = [[0, 1, 2], [0, 2, 1], [1, 0, 2], [1, 2, 0], [2, 0, 1], [2, 1, 0]];
  const shapes = Object.keys(R.SHAPES).filter((s) => !s.startsWith('gase')).concat('gase');
  for (const sh of shapes) for (const o of orders) for (let press = 0; press < 21; press++) {
    const c = R.createReelControl(sh);
    for (const reel of o) c.stop(reel, (press + reel * 7) % 21);
    const grid = R.gridAt(c.tops);
    const name = sh === 'gase' ? R.gaseShape(o) : sh;
    assert.ok(R.SHAPES[name](grid), `${sh} ${o.join('')} ${press}`);
  }
});

test('リール: カットインのハズレは、押し順どおりのタイミングで外れる', () => {
  const R = require('../../data/others/st_slot/st_reels.js');
  for (let press = 0; press < 21; press++) {
    // 逆押し: 右・中は中段7、左で外れ
    let c = R.createReelControl('gase'); c.stop(2, press); c.stop(1, press); c.stop(0, press);
    let g = R.gridAt(c.tops); assert.ok(g[2][1] === 'seven' && g[1][1] === 'seven' && g[0][1] !== 'seven');
    // 中押し: 最初の中で中段7なし
    c = R.createReelControl('gase'); c.stop(1, press); c.stop(0, press); c.stop(2, press);
    g = R.gridAt(c.tops); assert.ok(g[1][1] !== 'seven');
  }
});

test('バトルで増えた弱点ランプは、そのSTのあいだずっと残る', () => {
  // ポイントで増えた分（2つ）を持ってハンニバル（弱点チャンス目）のSTへ。スイカでバトルに入り、4Gで負ける
  const { m, s } = stMachine('hannibal', [band.suika, 0.999, 0.999, 0.1, 0.1, 0.999]);
  s.st.extra = [];
  s.extraLamps = 2;
  m.lever();
  const during = m.snapshot().lamps.length;
  assert.strictEqual(during, 3);
  for (let i = 0; i < 4; i++) m.lever();
  assert.strictEqual(s.st.battle, null);
  assert.strictEqual(m.snapshot().lamps.length, 3);   // バトルが終わっても残る
});
