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
  s.st = { enemy, games: CONFIG.stGames, superTsukuyomi: false, battle: null, jiriki: false, finalBattle: false };
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
  const { m, s } = stMachine('hannibal', [band.suika, 0.999, 0.999]);
  m.lever();
  assert.ok(s.st.battle);
  const g = s.st.games;
  for (let i = 0; i < CONFIG.battleGames; i++) m.lever();
  assert.strictEqual(s.st.games, g);
  assert.strictEqual(s.st.battle, null);   // 4Gで負け
});

test('バトル中の直撃は勝ちに書き換え、もう一度引けばオーバーキル', () => {
  // 1G目: スイカでバトル突入（負け状態）/ 2G目: 強チェリー（クリティカルでない → 勝利確定）/ 3G目: 中段チェリー（オーバーキル）
  const { m, s } = stMachine('hannibal', [band.suika, 0.999, 0.999, band.scherry, 0.999, 0.999, band.mcherry, 0.999]);
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
  s.st = { enemy: 'hannibal', games: 30, superTsukuyomi: false, battle: null, jiriki: false, finalBattle: false };
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
    ss.phase = 'weapon';
    ss.st = { enemy: 'hannibal', games: 0, superTsukuyomi: false, battle: null, jiriki: false, finalBattle: false };
    const r = mm.lever();
    if (r.weapon.id === 'kinnoago') hit++;
  }
  assert.strictEqual(hit, 200);
});

test('ミズチは必ず200枚以上', () => {
  for (let seed = 1; seed <= 300; seed++) {
    const m = createMachine({ seed });
    const s = m.debug.internal();
    s.phase = 'weapon';
    s.st = { enemy: 'hannibal', games: 0, superTsukuyomi: false, battle: null, jiriki: false, finalBattle: false };
    const r = m.lever();
    if (r.weapon.id === 'mizuchi') assert.ok(r.weapon.medals >= 200);
  }
});

test('エンディング後のSTはディアウス・ビターか最強STだけ', () => {
  for (let seed = 1; seed <= 300; seed++) {
    const m = createMachine({ seed });
    m.debug.internal().ending = true;
    const r = m.lever();
    assert.ok(r.enemy === 'dyaus' || r.enemy === 'saikyo', r.enemy);
  }
});

test('同じシードなら同じ結果', () => {
  const run = () => { const m = createMachine({ seed: 42 }); const out = []; for (let i = 0; i < 500; i++) { const r = m.lever(); if (!r) break; out.push(r.role); } return out.join(','); };
  assert.strictEqual(run(), run());
});
