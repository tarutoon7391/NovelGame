/*
 * ST機の内部（抽選と状態）。ノベルゲームのパチスロ用。
 * ---------------------------------------------------------------------------
 * 仕様書: 「ノベルゲーム用 ST機 仕様書 v0.1」（Claude Docs）
 * 約束書: docs/st-slot/events.md（側＝演出を作る人は、ここに書いた窓口とイベントだけを使う）
 *
 * - ビルド不要の素のJS。ティラノでは [loadjs storage="st_slot/st_engine.js"] で読み込み、window.StSlot を使う。
 *   Node では require() で読める（テスト・シミュレーション用）。
 * - 今は ST とボーナスだけ。通常時・リール配列・最強ST・上位ATのCZ・オーバーキルの特化ゾーンの中身は未実装
 *   （仮の動きは CONFIG と各所の「仮」コメントを見ること）。
 */
(function (root, factory) {
  if (typeof module === 'object' && module.exports) module.exports = factory();
  else root.StSlot = factory();
})(typeof self !== 'undefined' ? self : this, function () {
  'use strict';

  // =========================================================================
  // 設定（数字はすべてここ）
  // =========================================================================
  var CONFIG = {
    bet: 3,
    stGames: 30,
    gekirinStGames: 50,   // 逆鱗ハンニバル戦だけ ST 50G
    battleGames: 4,

    // バトル4Gの演出（勝っているか＝その時点で直撃当選しているかで振り分け。仮の占有率）
    battleFx: {
      g1: { win: { guard: 30, hit: 40, critical: 30 }, lose: { guard: 75, hit: 22, critical: 3 } },     // 味方の攻撃
      g2: { win: { hit: 30, guard: 40, counter: 30 }, lose: { hit: 75, guard: 22, counter: 3 } },      // 敵の攻撃
      g3: { win: { blue: 30, red: 40, rainbow: 30 }, lose: { blue: 85, red: 15 } }                      // つばぜり合いのオーラ
    },
    // ST中（バトル外）の演出。結果（何もなし／バトル突入／直撃）ごとに振り分け。仮の占有率
    //   slash: 味方がボスに切りかかる / minion: 色つきの雑魚敵を切る（色＝その色の役が揃う。揃わなければ激熱）/ panel: 4分割の液晶（白→青→緑→赤の順にチャンス）
    stFx: {
      kinds: {
        none:   { colored: { minion: 40, panel: 30, slash: 15, plain: 15 }, plain: { panel: 15, slash: 8, plain: 77 } },
        battle: { colored: { minion: 35, panel: 40, slash: 25 }, plain: { panel: 60, slash: 40 } },
        direct: { colored: { minion: 35, panel: 40, slash: 25 }, plain: { panel: 60, slash: 40 } }
      },
      panel: { none: { white: 70, blue: 22, green: 7, red: 1 }, battle: { blue: 40, green: 40, red: 20 }, direct: { blue: 15, green: 35, red: 50 } },
      minionMismatch: 0.5   // 直撃のとき、雑魚敵の色を役と違う色にする（＝揃わない激熱）割合
    },
    replayNavi: 0.5,        // ST中のリプレイ: ナビあり:ナビなし = 1:1

    // 4G目の復活（3G目のレバーまでに勝っていなくて、4G目で直撃を引いた）。違和感の種類
    revive: { stopLock: 50, leverLock: 50 },

    // 役の確率（1/x）。残りはハズレ（ベル含む）
    roles: {
      bell3: 9.8,      // 3枚役
      replay: 8.5,
      suika: 79.9,
      chance: 150,     // チャンス目
      wcherry: 102.4,  // 弱チェリー
      scherry: 799,    // 強チェリー
      mcherry: 16384   // 中段チェリー
    },

    // チェリー変換（通常時・ST中。ボーナス中はなし）。カリギュラは5倍
    cherryUp: { weakToStrong: 0.10, strongToMiddle: 0.05, caligulaRate: 5 },

    // ST中の抽選
    direct: { rare: 0.25, replay: 0.10 },   // クリティカル役でないレア役・リプレイの直撃率
    battleFromReplay: 0.50,

    // 7揃い（1/x）
    seven: { normal: 1000, tsukuyomi: 90, superTsukuyomi: 1.7 },
    superTsukuyomiRate: 0.01,
    // カットインの色（7揃いのときの色の振り分け）と期待度。ハズレカットインは期待度から逆算する
    cutin: { winColors: { blue: 0.25, red: 0.50, gold: 0.25 }, expect: { blue: 0.20, red: 0.80, gold: 1 } },

    // 敵。lamps = 弱点（クリティカル役のランプ）
    enemies: {
      hannibal:   { name: 'ハンニバル', lamps: ['chance'] },
      aither:     { name: 'アイテール', lamps: ['cherry'] },
      venus:      { name: 'ヴィーナス', lamps: ['suika'] },
      tsukuyomi:  { name: 'ツクヨミ', lamps: ['chance'] },
      caligula:   { name: 'カリギュラ', lamps: ['cherry'] },
      tezcatlipoca: { name: 'テスカトリポカ', lamps: ['cherry', 'suika'] },
      dyaus:      { name: 'ディアウス・ビター', lamps: ['chance'] },
      amaterasu:  { name: 'アマテラス', lamps: [] },
      gekirin:    { name: '逆鱗ハンニバル', lamps: [] },
      saikyo:     { name: '最強ST', lamps: [] }   // 使わない（最強ST は「ふつうの敵＋ランプ1つ追加」）
    },
    // 敵決定ゲームの振り分け（引いた役ごと）
    enemyTable: {
      base:   { hannibal: 25, aither: 25, venus: 25, tsukuyomi: 15, caligula: 5, tezcatlipoca: 5 },
      replay: { hannibal: 20 / 3, aither: 20 / 3, venus: 20 / 3, tsukuyomi: 48, caligula: 16, tezcatlipoca: 16 },
      weak:   { tsukuyomi: 60, caligula: 20, tezcatlipoca: 20 },
      strong: { amaterasu: 25, tezcatlipoca: 75 }
    },
    gekirinMedals: 1000,         // 一連のSTの獲得がこれを超えたら、次のSTで逆鱗ハンニバル（1回だけ）
    gekirinExtraLamp: 0.5,
    dyausOverkill: 0.70,
    ending: { diff: 1900, oneShot: 2400, dyaus: 0.70 },   // エンディング後: 70%でディアウス・ビター、30%で最強ST（ふつうの敵＋弱点ランプ1つ追加）

    // バトルで足すランプ（ポイント・アマテラス・逆鱗）。リプレイはめったに出ない（仮の重み）
    extraLampWeights: { cherry: 1, suika: 1, chance: 1, replay: 0.15 },

    // ポイントカウンタ（ボーナス中のみ）
    points: { max: 20, replay: 1, wcherry: 5, suika: 5, chance: 10, scherry: 20, mcherry: 60 },

    // ボーナス
    bonus: { net: 9, yellowNavi: 0.75, bellPay: 15, smallPay: 3 },
    // オーバーキルの上乗せ特化ゾーン: 300枚に届くまでは毎ゲーム上乗せ。届いたあとは70%で継続
    //   1回の上乗せ枚数は引いた役で決まる（「以上」の下限は仕様。上の振り分けは仮）
    okZone: {
      min: 300, cont: 0.70,
      add: {
        normal:  { 30: 60, 50: 25, 100: 10, 200: 5 },        // ハズレ・3枚役・リプレイ: 30枚以上
        weak:    { 50: 50, 100: 30, 200: 15, 300: 5 },       // 弱チェリー・スイカ: 50枚以上
        chance:  { 100: 60, 200: 30, 300: 10 },              // チャンス目: 100枚以上
        scherry: { 200: 60, 300: 30, 500: 10 },              // 強チェリー: 200枚以上
        mcherry: { 1000: 80, 2000: 20 }                      // 中段チェリー: 1000枚以上
      }
    },

    // 武器選択フェーズ: 引いた役 → 武器の振り分け [一式, ミズチ, ベンディガー, 金ノ顎]
    weaponTable: {
      none:      [75, 20, 4, 1],
      replay:    [30, 60, 9, 1],
      replayC:   [0, 90, 5, 5],
      weak:      [0, 80, 15, 5],
      weakC:     [0, 50, 40, 10],
      chance:    [0, 60, 35, 5],
      chanceC:   [0, 30, 50, 20],
      scherry:   [0, 20, 60, 20],
      scherryC:  [0, 0, 50, 50],
      mcherry:   [0, 0, 0, 100]
    },
    weapons: [
      { id: 'isshiki', name: '一式', medals: { 200: 50, 250: 30, 300: 15, 510: 4, 750: 0.5, 1000: 0.5 } },
      { id: 'mizuchi', name: 'ミズチ', press: [1, 2, 5, 10, 20], endRate: 0.03, min: 200 },
      { id: 'bendigar', name: 'ベンディガー', medals: { 300: 30, 510: 50, 750: 10, 1000: 4, 2000: 3, 3000: 3 } },
      { id: 'kinnoago', name: '金ノ顎', medals: { 510: 15, 750: 15, 1000: 20, 2000: 20, 3000: 30 } }
    ]
  };

  var RARE = { suika: 1, chance: 1, wcherry: 1, scherry: 1, mcherry: 1 };
  var LAMP_OF = { replay: 'replay', suika: 'suika', chance: 'chance', wcherry: 'cherry', scherry: 'cherry', mcherry: 'cherry' };

  // =========================================================================
  // 乱数（シード付き。同じシードなら同じ結果）
  // =========================================================================
  function mulberry32(a) {
    return function () {
      a |= 0; a = (a + 0x6D2B79F5) | 0;
      var t = Math.imul(a ^ (a >>> 15), 1 | a);
      t = (t + Math.imul(t ^ (t >>> 7), 61 | t)) ^ t;
      return ((t ^ (t >>> 14)) >>> 0) / 4294967296;
    };
  }
  function pickWeighted(rand, table) {
    var keys = Object.keys(table), sum = 0, i;
    for (i = 0; i < keys.length; i++) sum += table[keys[i]];
    var r = rand() * sum;
    for (i = 0; i < keys.length; i++) { r -= table[keys[i]]; if (r < 0) return keys[i]; }
    return keys[keys.length - 1];
  }

  // =========================================================================
  // 台
  // =========================================================================
  function createMachine(opts) {
    opts = opts || {};
    var cfg = CONFIG;
    var rand = opts.rand || mulberry32(opts.seed == null ? (Math.random() * 4294967296) >>> 0 : opts.seed);
    var listeners = [];

    var s = {
      phase: 'enemySelect',   // enemySelect → st ⇄ battle → seven（7揃い） → reveal（小役の答え合わせ） → bonus → enemySelect … / end
      game: 0,
      st: null,               // { enemy, games, superTsukuyomi, battle, jiriki }
      vstock: 0,
      points: 0,
      extraLamps: 0,          // ポイントで増えた、次のバトルで使えるクリティカル役の数
      chainMedals: 0,         // 一連のSTの獲得枚数
      gekirinDone: false,
      nextEnemy: null,        // 次のSTの敵が決まっているとき（アマテラスのループ・中段チェリー）
      ending: false,
      totalNet: 0,            // 差枚（ST中のハズレの -3 も含む）
      pending: null,          // 当選後の流れ { overkill, upperCZ, reason }
      hidden: null,           // 7揃いのゲームで隠して引いた小役と武器
      okzone: null,           // オーバーキルの上乗せ特化ゾーン { total, games }
      bonus: null             // { weapon, target, paid, games, presses }
    };

    var NAV_ORDERS = [[0, 1, 2], [0, 2, 1], [1, 0, 2], [1, 2, 0], [2, 0, 1], [2, 1, 0]];
    var lastGain = 0;

    function emit(type, data) {
      var ev = { type: type, game: s.game, data: data || {} };
      for (var i = 0; i < listeners.length; i++) listeners[i](ev);
      return ev;
    }

    // ----- 役 ---------------------------------------------------------------
    function drawRole(withCherryUp) {
      var r = rand(), acc = 0, role = 'none', k;
      for (k in cfg.roles) { acc += 1 / cfg.roles[k]; if (r < acc) { role = k; break; } }
      var upgraded = false;
      if (withCherryUp && (role === 'wcherry' || role === 'scherry')) {
        var mul = s.st && s.st.enemy === 'caligula' ? cfg.cherryUp.caligulaRate : 1;
        if (role === 'wcherry' && rand() < cfg.cherryUp.weakToStrong * mul) { role = 'scherry'; upgraded = true; }
        if (role === 'scherry' && rand() < cfg.cherryUp.strongToMiddle * mul) { role = 'mcherry'; upgraded = true; }
      }
      return { role: role, upgraded: upgraded };
    }

    // ナビ（ST中: 3枚役とリプレイだけ。ハズレとレア役はナビなし）
    function stNavi(role) {
      if (role === 'replay') return rand() < cfg.replayNavi ? 'replay' : null;   // ナビなしでも揃うことがある
      if (role === 'bell3') return 'bell3';
      return null;
    }
    // ボーナス以外の払い出し（3枚役は3枚、リプレイは次のゲームがタダ＝3枚分、ハズレは0）。仮: レア役は0（払い出しが決まったら直す）
    function payoutOf(role) { return role === 'bell3' || role === 'replay' ? cfg.bet : 0; }
    function addNet(role) { s.totalNet += payoutOf(role) - cfg.bet; }

    function lampsNow() {
      var e = cfg.enemies[s.st.enemy];
      var lamps = e.lamps.slice();
      if (s.st.upperLamp && lamps.indexOf(s.st.upperLamp) < 0) lamps.push(s.st.upperLamp);
      // バトルで増えたランプは、そのSTのあいだずっと残る
      for (var i = 0; i < s.st.extra.length; i++) if (lamps.indexOf(s.st.extra[i]) < 0) lamps.push(s.st.extra[i]);
      return lamps;
    }
    function isCritical(role) { return !!LAMP_OF[role] && lampsNow().indexOf(LAMP_OF[role]) >= 0; }
    function randomExtraLamp(exclude) {
      var t = {}, k;
      for (k in cfg.extraLampWeights) if (exclude.indexOf(k) < 0) t[k] = cfg.extraLampWeights[k];
      if (!Object.keys(t).length) return null;
      return pickWeighted(rand, t);
    }

    // ----- 敵決定ゲーム -------------------------------------------------------
    function decideEnemy(role) {
      var enemy, upper = false;
      if (s.ending && rand() < cfg.ending.dyaus) enemy = 'dyaus';
      else if (s.ending) { upper = true; enemy = pickWeighted(rand, cfg.enemyTable.base); }   // 最強ST
      else if (s.chainMedals >= cfg.gekirinMedals && !s.gekirinDone) { enemy = 'gekirin'; s.gekirinDone = true; }
      else if (s.nextEnemy) enemy = s.nextEnemy;
      else if (role === 'mcherry') enemy = 'amaterasu';
      else if (role === 'scherry') enemy = pickWeighted(rand, cfg.enemyTable.strong);
      else if (role === 'wcherry' || role === 'suika' || role === 'chance') enemy = pickWeighted(rand, cfg.enemyTable.weak);
      else if (role === 'replay') enemy = pickWeighted(rand, cfg.enemyTable.replay);
      else enemy = pickWeighted(rand, cfg.enemyTable.base);
      s.nextEnemy = null;
      var sup = enemy === 'tsukuyomi' && rand() < cfg.superTsukuyomiRate;
      s.st = { enemy: enemy, games: enemy === 'gekirin' ? cfg.gekirinStGames : cfg.stGames, superTsukuyomi: sup, battle: null, jiriki: false, finalBattle: false, upper: upper, upperLamp: null, extra: [] };
      if (upper) s.st.upperLamp = randomExtraLamp(cfg.enemies[enemy].lamps);
      s.phase = 'st';
      emit('enemy', { enemy: enemy, name: cfg.enemies[enemy].name, lamps: lampsNow(), upper: upper, games: s.st.games });
      // superTsukuyomi は画面に出さない（イベントにも載せない）
    }

    // ----- バトル -------------------------------------------------------------
    function startBattle(win, final) {
      var extra = [], base = lampsNow(), l;   // 今ついているランプ（前のバトルで増えた分も含む）以外から足す
      while (s.extraLamps > 0) {
        l = randomExtraLamp(base.concat(extra)); if (!l) break;
        extra.push(l); s.extraLamps--;
      }
      s.extraLamps = 0;
      if (s.st.enemy === 'amaterasu') {
        l = ['cherry', 'suika', 'chance', 'replay'][Math.floor(rand() * 4)];   // 完全に均等（もうついているランプなら増えない）
        if (extra.indexOf(l) < 0 && base.indexOf(l) < 0) extra.push(l);
      }
      if (s.st.enemy === 'gekirin' && rand() < cfg.gekirinExtraLamp) {
        l = randomExtraLamp(base.concat(extra)); if (l) extra.push(l);
      }
      for (var k = 0; k < extra.length; k++) if (s.st.extra.indexOf(extra[k]) < 0) s.st.extra.push(extra[k]);   // ST のあいだずっと残す
      s.st.battle = { left: cfg.battleGames, win: !!win, overkill: false, extra: extra, final: !!final, winAt3: false, result: null };
      emit('battleStart', { extraLamps: extra.slice(), lamps: lampsNow(), final: !!final });
    }

    function winBattle(how) {
      var b = s.st.battle;
      if (!b) return;
      // アマテラスの最後の勝利確定バトル: 最初に引いた直撃は「自力の撃破」（オーバーキルにはしない）
      if (b.final && !s.st.jiriki && how === 'direct') { s.st.jiriki = true; return; }
      if (b.win) { if (!b.overkill) { b.overkill = true; emit('overkill', { how: how }); } }
      else { b.win = true; }
      if (how !== 'final') s.st.jiriki = true;
    }

    function finishBattle() {
      var b = s.st.battle;
      s.st.battle = null;
      if (b.win) {
        var overkill = b.overkill || (s.st.enemy === 'dyaus' && rand() < cfg.dyausOverkill);
        var nextAma = s.st.enemy === 'amaterasu' && s.st.jiriki;
        if (nextAma) s.nextEnemy = 'amaterasu';
        b.result = { win: true, overkill: overkill };
        emit('battleEnd', { win: true, overkill: overkill, upperCZ: s.st.enemy === 'gekirin' });
        s.pending = { overkill: overkill, upperCZ: s.st.enemy === 'gekirin', reason: 'battle' };
        s.phase = 'seven';
        return;
      }
      b.result = { win: false };
      emit('battleEnd', { win: false });
      if (s.st.games <= 0) endST();
    }

    function endST() {
      // アマテラス: ゲーム数を使い切ったら勝利確定のバトル（そこで自力で勝てなければ、次はアマテラスではない）
      if (s.st.enemy === 'amaterasu' && !s.st.finalBattle) {
        s.st.finalBattle = true; s.st.jiriki = false;
        startBattle(true, true);
        return;
      }
      if (s.vstock > 0) {
        s.vstock--;
        emit('vstockRevive', { left: s.vstock });
        s.pending = { overkill: false, upperCZ: false, reason: 'vstock' };
        s.phase = 'seven';
        return;
      }
      emit('stEnd', { chainMedals: s.chainMedals });
      s.phase = 'end';
      s.st = null; s.points = 0; s.extraLamps = 0; s.chainMedals = 0; s.gekirinDone = false; s.nextEnemy = null;
    }

    // バトルの演出（n = バトルの何ゲーム目か）。勝ち負けはその時点の状態で振り分ける
    function battleFx(b, n) {
      var t = cfg.battleFx;
      if (n === 1) return { n: 1, kind: pickWeighted(rand, b.win ? t.g1.win : t.g1.lose) };
      if (n === 2) return { n: 2, kind: pickWeighted(rand, b.win ? t.g2.win : t.g2.lose) };
      if (n === 3) return { n: 3, aura: pickWeighted(rand, b.win ? t.g3.win : t.g3.lose) };
      if (n === 4) {
        var r = b.result || { win: b.win };
        if (b.winAt3) return { n: 4, kind: 'victory', overkill: !!r.overkill };
        if (r.win) return { n: 4, kind: 'revive', revive: pickWeighted(rand, cfg.revive), overkill: !!r.overkill };
        return { n: 4, kind: 'defeat' };
      }
      return null;
    }

    // ST中（バトル外）の演出の抽選
    var MINION_COLOR = { wcherry: 'red', scherry: 'red', mcherry: 'red', suika: 'green', chance: 'purple', replay: 'blue' };
    function stFx(role, result, cutin) {
      if (cutin) return null;
      var colored = !!MINION_COLOR[role];
      var kind = pickWeighted(rand, cfg.stFx.kinds[result][colored ? 'colored' : 'plain']);
      if (kind === 'plain') return null;
      if (kind === 'panel') return { kind: 'panel', color: pickWeighted(rand, cfg.stFx.panel[result]) };
      if (kind === 'minion') {
        var color = MINION_COLOR[role];
        if (result === 'direct' && rand() < cfg.stFx.minionMismatch) {
          var others = ['red', 'green', 'purple', 'blue'].filter(function (c) { return c !== color; });
          color = others[Math.floor(rand() * others.length)];
        }
        return { kind: 'minion', color: color };
      }
      return { kind: 'slash' };
    }

    // ----- 7揃い・カットイン ----------------------------------------------------
    function sevenLottery() {
      var x = s.st.superTsukuyomi ? cfg.seven.superTsukuyomi : s.st.enemy === 'tsukuyomi' ? cfg.seven.tsukuyomi : cfg.seven.normal;
      var p7 = 1 / x;
      var c = cfg.cutin, k, hz = 0, hzTable = {};
      for (k in c.winColors) { var h = c.winColors[k] * (1 - c.expect[k]) / c.expect[k]; hzTable[k] = h; hz += h; }
      var pHz = Math.min(p7 * hz, 1 - p7);
      var r = rand();
      if (r < p7) return { cutin: pickWeighted(rand, c.winColors), win: true };
      if (r < p7 + pHz) return { cutin: pickWeighted(rand, hzTable), win: false };
      return null;
    }

    // ----- 1ゲーム（ST・バトル） ------------------------------------------------
    function playST(out) {
      var st = s.st, d = drawRole(true), role = d.role;
      out.role = role; out.upgraded = d.upgraded; out.navi = stNavi(role);
      out.critical = isCritical(role);
      out.lamps = lampsNow();
      out.payout = payoutOf(role); addNet(role);

      // 7揃い（ST中もバトル中も）
      var sv = sevenLottery();
      if (sv) {
        out.cutin = sv.cutin; out.seven = sv.win;
        emit('cutin', { color: sv.cutin, win: sv.win });
        if (sv.win) { s.vstock++; emit('vstock', { count: s.vstock }); }
      }

      // 直撃抽選
      var direct = false, overkill = false;
      if (role === 'mcherry') { direct = true; overkill = true; s.nextEnemy = 'amaterasu'; }
      else if (role === 'scherry') { direct = true; if (out.critical) overkill = true; }
      else if (out.critical) direct = true;
      else if (RARE[role]) direct = rand() < cfg.direct.rare;
      else if (role === 'replay') direct = rand() < cfg.direct.replay;
      out.direct = direct;

      if (st.battle) {
        // バトル中: 直撃抽選だけ。ゲーム数は減らない
        var b = st.battle, n = cfg.battleGames - b.left + 1;
        if (direct) { winBattle('direct'); if (overkill) winBattle('overkill'); emit('direct', { inBattle: true, overkill: b.overkill }); }
        if (n === 3) b.winAt3 = b.win;
        b.left--;
        out.battle = { left: b.left, n: n };
        if (b.left <= 0) finishBattle();
        out.battleFx = battleFx(b, n);
        if (out.battleFx) emit('battleFx', out.battleFx);
        return;
      }

      // ST中: ゲーム数を減らし、バトル突入を抽選
      st.games--;
      var toBattle = direct || RARE[role] || (role === 'replay' && rand() < cfg.battleFromReplay);
      out.stFx = stFx(role, direct ? 'direct' : toBattle ? 'battle' : 'none', !!out.cutin);
      if (out.stFx) emit('stFx', out.stFx);
      if (toBattle) {
        startBattle(false, false);
        if (direct) { winBattle('direct'); if (overkill) winBattle('overkill'); emit('direct', { inBattle: false, overkill: st.battle.overkill }); }
        out.battleStart = true;
        return;
      }
      if (st.games <= 0) endST();
    }

    // ----- ボーナス当選後: 7揃い（擬似遊技）。小役を隠して引き、その小役で武器が決まる ----------------
    function chooseWeapon(role, crit) {
      var row;
      if (role === 'mcherry') row = 'mcherry';
      else if (role === 'scherry') row = crit ? 'scherryC' : 'scherry';
      else if (role === 'chance') row = crit ? 'chanceC' : 'chance';
      else if (role === 'wcherry' || role === 'suika') row = crit ? 'weakC' : 'weak';
      else if (role === 'replay') row = crit ? 'replayC' : 'replay';
      else row = 'none';   // ハズレ・3枚役・ベル
      var w = cfg.weaponTable[row], idx = Number(pickWeighted(rand, { 0: w[0], 1: w[1], 2: w[2], 3: w[3] }));
      var weapon = cfg.weapons[idx], target = 0, presses = null;
      if (weapon.id === 'mizuchi') {
        presses = []; var ended = false;
        while (true) {
          var add = weapon.press[Math.floor(rand() * weapon.press.length)];
          target += add; presses.push(add);
          if (rand() < weapon.endRate) ended = true;
          if (ended && target >= weapon.min) break;
        }
      } else {
        target = Number(pickWeighted(rand, weapon.medals));
      }
      return { weapon: weapon, medals: target, presses: presses };
    }

    function playSeven(out) {
      var d = drawRole(true), role = d.role, crit = !!(s.st && isCritical(role));
      var w = chooseWeapon(role, crit);
      s.hidden = { role: role, upgraded: d.upgraded, critical: crit, weapon: w.weapon, medals: w.medals, presses: w.presses, overkill: !!(s.pending && s.pending.overkill), upperCZ: !!(s.pending && s.pending.upperCZ) };
      s.pending = null;
      out.role = null;              // 引いた小役は隠す（次のゲームの出目で見せる）
      out.payout = 0; s.totalNet -= cfg.bet;
      out.weapon = { id: w.weapon.id, name: w.weapon.name };   // 第3停止で見せる（枚数はまだ）
      emit('bonusWin', out.weapon);
      s.phase = 'reveal';
    }

    // ----- 答え合わせのゲーム: 隠していた小役をリールで揃える。レバーで枚数を見せる ----------------
    function playReveal(out) {
      var h = s.hidden; s.hidden = null;
      out.role = h.role; out.upgraded = h.upgraded; out.critical = h.critical;
      out.payout = payoutOf(h.role); addNet(h.role);
      s.bonus = { weapon: h.weapon.id, weaponMedals: h.medals, overkill: 0, target: h.medals, paid: 0, games: 0 };
      out.weapon = { id: h.weapon.id, name: h.weapon.name, medals: h.medals, presses: h.presses, overkill: h.overkill };
      emit('weapon', out.weapon);
      if (h.upperCZ) emit('upperCZ', {});   // 仮: 上位ATのCZは未実装
      if (h.overkill) {
        // オーバーキル: ボーナスの前に上乗せ特化ゾーン
        s.okzone = { total: 0, games: 0 };
        emit('okZoneStart', {});
        s.phase = 'okzone';
        return;
      }
      emit('bonusStart', { target: s.bonus.target });
      s.phase = 'bonus';
    }

    // ----- オーバーキルの上乗せ特化ゾーン（1ゲーム） ----------------------------
    function playOkZone(out) {
      var d = drawRole(true), role = d.role, z = s.okzone, t = cfg.okZone;
      out.role = role; out.upgraded = d.upgraded;
      out.payout = payoutOf(role); addNet(role);
      var cat = role === 'mcherry' ? 'mcherry' : role === 'scherry' ? 'scherry' : role === 'chance' ? 'chance' : (role === 'wcherry' || role === 'suika') ? 'weak' : 'normal';
      var add = Number(pickWeighted(rand, t.add[cat]));
      z.total += add; z.games++;
      var cont = z.total < t.min ? true : rand() < t.cont;
      out.okzone = { add: add, total: z.total, cont: cont, games: z.games };
      emit('okZoneAdd', out.okzone);
      if (!cont) {
        s.bonus.overkill = z.total; s.bonus.target += z.total;
        emit('okZoneEnd', { total: z.total, games: z.games });
        s.okzone = null;
        emit('bonusStart', { target: s.bonus.target });
        s.phase = 'bonus';
      }
    }

    // ----- ボーナス（1ゲーム） ------------------------------------------------
    function playBonus(out) {
      var d = drawRole(false), role = d.role, b = s.bonus;
      out.role = role;
      if (RARE[role]) {
        // レア役: ナビなし（仮: 払い出しは15枚ベルと同じ扱い。リール配列が決まったら直す）
        out.navi = null;
        out.payout = cfg.bonus.bellPay;
      } else {
        // それ以外: 黄ナビ（15枚ベル）か白ナビ（リプレイか3枚役。押すまで分からない）
        var yellow = rand() < cfg.bonus.yellowNavi;
        out.navi = yellow ? 'yellow' : 'white';
        role = yellow ? 'bell15' : (rand() < 0.5 ? 'replay' : 'bell3');
        out.role = role;
        out.payout = yellow ? cfg.bonus.bellPay : cfg.bonus.smallPay;
      }
      var gain = Math.min(out.payout - cfg.bet, b.target - b.paid);
      b.paid += gain; b.games++;
      s.totalNet += gain;
      out.bonus = { paid: b.paid, target: b.target };

      var pt = cfg.points[role] || 0;
      if (pt) {
        s.points += pt;
        while (s.points >= cfg.points.max) { s.points -= cfg.points.max; s.extraLamps++; emit('pointsMax', { extraLamps: s.extraLamps }); }
        emit('points', { points: s.points, max: cfg.points.max, added: pt });
      }

      if (b.paid >= b.target) {
        s.chainMedals += b.target;
        emit('bonusEnd', { medals: b.target, chainMedals: s.chainMedals });
        s.bonus = null;
        if (!s.ending && (s.totalNet >= cfg.ending.diff || s.chainMedals >= cfg.ending.oneShot)) { s.ending = true; emit('ending', {}); }
        s.phase = 'enemySelect';
      }
    }

    // =========================================================================
    // 窓口
    // =========================================================================
    return {
      config: cfg,
      on: function (fn) { listeners.push(fn); return function () { listeners.splice(listeners.indexOf(fn), 1); }; },

      // 1ゲーム回す（レバー〜全停止までを1回で）。そのゲームの結果を返す
      lever: function () {
        if (s.phase === 'end') return null;
        s.game++;
        var out = { phase: s.phase, game: s.game };
        if (s.phase === 'enemySelect') {
          var d = drawRole(true);
          out.role = d.role; out.upgraded = d.upgraded; out.payout = payoutOf(d.role); addNet(d.role);
          decideEnemy(d.role);
          out.enemy = s.st.enemy;
        } else if (s.phase === 'st') playST(out);
        else if (s.phase === 'seven') playSeven(out);
        else if (s.phase === 'reveal') playReveal(out);
        else if (s.phase === 'okzone') playOkZone(out);
        else if (s.phase === 'bonus') playBonus(out);
        // リールの出目の形（st_reels.js の SHAPES の名前。'gase' はハズレのカットイン＝押した順で外し方が決まる）
        if (out.phase === 'seven') out.shape = 'seven';
        else if (out.cutin) out.shape = out.seven ? 'seven' : 'gase';
        else out.shape = out.role === 'none' || !out.role ? 'none' : out.role;
        // 押し順ナビ（ナビが出るゲームだけ）。6通りから抽選
        if (out.navi && !out.cutin) out.naviOrder = NAV_ORDERS[Math.floor(rand() * NAV_ORDERS.length)].slice();
        lastGain = out.phase === 'bonus' ? Math.max(0, out.payout - cfg.bet) : 0;
        emit('game', out);
        return out;
      },

      // 押し順ナビに従わずベルを取りこぼしたとき、側から呼ぶ（ボーナス中はそのゲームの払い出しを取り消す）
      missLast: function () {
        if (!lastGain) return;
        s.totalNet -= lastGain;
        if (s.bonus) s.bonus.paid -= lastGain;
        lastGain = 0;
      },

      // ST をはじめからやり直す（デモ用。通常時が決まるまでは、ここからスタート）
      startST: function () {
        s.phase = 'enemySelect'; s.st = null; s.vstock = 0; s.points = 0; s.extraLamps = 0;
        s.chainMedals = 0; s.gekirinDone = false; s.nextEnemy = null; s.bonus = null; s.pending = null;
      },

      snapshot: function () {
        var st = s.st;
        return {
          phase: s.phase,
          game: s.game,
          enemy: st ? { id: st.enemy, name: cfg.enemies[st.enemy].name, upper: !!st.upper } : null,
          lamps: st ? lampsNow() : [],
          addedLamps: st ? st.extra.slice().concat(st.upperLamp ? [st.upperLamp] : []) : [],   // 弱点以外に増えたランプ（最強ST・バトルで増えた分）
          stGames: st ? st.games : 0,
          battle: st && st.battle ? { left: st.battle.left, extraLamps: st.battle.extra.slice(), final: st.battle.final } : null,
          vstock: s.vstock,
          points: s.points,
          extraLamps: s.extraLamps,
          chainMedals: s.chainMedals,
          totalNet: s.totalNet,
          ending: s.ending,
          bonus: s.bonus ? { weapon: s.bonus.weapon, target: s.bonus.target, paid: s.bonus.paid } : null,
          okzone: s.okzone ? { total: s.okzone.total, games: s.okzone.games } : null
        };
      },

      // テスト・デバッグ用（演出の判断には使わないこと）
      debug: {
        internal: function () { return s; },
        setEnemy: function (id) { s.nextEnemy = id; }
      }
    };
  }

  return { createMachine: createMachine, CONFIG: CONFIG };
});
