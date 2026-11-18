/* =========================================================
   パチスロ「障害討伐 デバッグラッシュ」の中身（抽選とリール制御）
   - 画面（液晶・リール・ボタン）は slot_screen.js が作る
   - ここは「1ゲームで何が当たるか」「リールがどこに止まるか」だけを決める
   - ブラウザでも Node（シミュレーション）でも動くように書いている

   機械の流れ（AT＋ST。スマスロ ゴッドイーター リザレクションの流れを参考にしたオリジナル）

     通常 ─(レア役)→ CZ「障害対応チャンス」10G ─成功┐
       └─(天井 800G)────────────────────────────┤
                                                 ▼
                                  赤7を狙え（擬似遊技。リール逆回転）
                                                 ▼
                ┌──────── 討伐報酬（1G。揃った役で獲得枚数が決まる）
                │            ├ リプレイ → エスカレーション（510→750→1000→2000→3000、各50%で上がる）
                │            └ ハズレ   → 金のパッチ（510〜3000 を一発で決める）
                │         ※ オーバーキルで勝ったときは → フルスタック覚醒（8G＋α、毎G上乗せ）
                ▼
            ストーリー（決まった枚数を払い出す）
                ▼
            ST「障害交戦」25G＋α（モンスターと戦う）
                ├ 勝ち → 赤7を狙え → 討伐報酬 … とループ
                └ 負け → 通常へ（AT終了）

   ST の勝ち方（1ゲームごとに、引いた役で抽選）
     弱点役（モンスターごとに違う）… 勝ち確定
     リプレイ … 20%　/　チェリー・スイカ・チャンス目 … 25%　/　強チェリー … 勝ち確定
     勝ちが決まると「活性化バトル」（3G）で結果を見せる
   オーバーキル（勝ちが決まっているときに抽選）
     弱点役 … 25%（チャンス目は50%）　/　弱点役以外 … 0.4%　/　強チェリー … 25%（弱点役なら確定）
     1回のバトルで弱点役を2回引いたら、オーバーキル確定
   1枚 = 20円（1,000円で50枚）
   ========================================================= */
(function (root) {
  "use strict";

  // ---- 図柄 ----
  // 7:赤7  B:BAR  L:ベル  R:リプレイ  S:スイカ  C:チェリー  G:バグ（ハズレ図柄）
  var SYMBOLS = { "7": "赤7", B: "BAR", L: "ベル", R: "リプレイ", S: "スイカ", C: "チェリー", G: "バグ" };

  // ---- リール配列（各21コマ。中段に来る順番） ----
  // リプレイ・ベル・左のチェリーは、どこで押しても4コマすべりで中段に止まる
  // スイカと7は、狙わないと止まらない（目押しが必要）
  var REELS = [
    "7RLCSRLCGRLCBRLCSRLCG".split(""),
    "7RLGRLSRLBRLGRLSRLCRL".split(""),
    "7RLGRLSRLBRLGRLSRLCRL".split("")
  ];
  var N = 21;      // 1本のコマ数
  var SLIP = 4;    // 最大すべりコマ数

  // ---- 小役（役の名前） ----
  //   none:ハズレ  R:リプレイ  L:ベル  S:スイカ  C:弱チェリー  CC:強チェリー  chance:チャンス目
  var ROLE_NAME = { none: "ハズレ", R: "リプレイ", L: "ベル", S: "スイカ", C: "チェリー", CC: "強チェリー", chance: "チャンス目" };

  // ---- 払い出し（中段1ライン。チェリーは左リールの中段だけでよい） ----
  // AT 中のベルは押し順ナビが出るので、たくさん払い出す（AT の純増）
  var PAY = { L: 8, L_AT: 12, S: 6, C: 2, CC: 2 };

  // ---- 設定ごとの数字（1〜6） ----
  //   chance … 通常時のチャンス目の確率
  //   czChance / czSuika / czCherry … その役で CZ に入る確率（強チェリーは必ず CZ）
  //   czWin … CZ が成功する確率
  var SETTING = {
    1: { chance: 1 / 114, czChance: 0.37, czSuika: 0.14, czCherry: 0.05, czWin: 0.190 },
    2: { chance: 1 / 113, czChance: 0.38, czSuika: 0.14, czCherry: 0.05, czWin: 0.205 },
    3: { chance: 1 / 110, czChance: 0.39, czSuika: 0.15, czCherry: 0.05, czWin: 0.225 },
    4: { chance: 1 / 107, czChance: 0.41, czSuika: 0.15, czCherry: 0.06, czWin: 0.245 },
    5: { chance: 1 / 104, czChance: 0.43, czSuika: 0.16, czCherry: 0.06, czWin: 0.270 },
    6: { chance: 1 / 100, czChance: 0.45, czSuika: 0.17, czCherry: 0.07, czWin: 0.295 }
  };

  // ---- 小役の確率（合計が1を超えないこと。残りがハズレ） ----
  var ROLE_TABLE = {
    normal: { R: 1 / 7.3, L: 1 / 8.5, S: 1 / 80, C: 1 / 45, CC: 1 / 200 }, // チャンス目は設定から
    at:     { R: 1 / 7.3, L: 0.66, S: 1 / 60, C: 1 / 40, CC: 1 / 150, chance: 1 / 80 },  // ストーリー・報酬・覚醒（ナビでベルが揃う）
    battle: { R: 1 / 7.3, L: 0.32, S: 1 / 60, C: 1 / 40, CC: 1 / 150, chance: 1 / 80 }   // ST 交戦中（ナビは少なめ）
  };

  // ---- モンスター（ST で戦う相手） ----
  //   weak … 弱点役（引けば勝ち確定）。"rare" は、リプレイ以外のレア役すべて
  //   w    … 出てくる重み（通常の ST / 上位 ST）
  var MONSTERS = [
    { id: "slime",  name: "ヌルポ・スライム",         weak: ["C"],             w: 30, wUp: 15 },
    { id: "ghost",  name: "メモリリーク・ゴースト",   weak: ["S"],             w: 25, wUp: 12 },
    { id: "golem",  name: "デッドロック・ゴーレム",   weak: ["chance"],        w: 22, wUp: 12 },
    { id: "twins",  name: "レースコンディション双子", weak: ["C", "S"],        w: 15, wUp: 12 },
    { id: "dragon", name: "本番DB削除ドラゴン",       weak: ["rare"],          w: 8,  wUp: 14 },
    { id: "zeroday", name: "ゼロデイ",                weak: [],                w: 0,  wUp: 35, sure: true }
  ];

  // ---- 報酬 ----
  // 討伐報酬：揃った役で決まる獲得枚数 [弱点役以外, 弱点役]
  var REWARD_BASE = { none: [100, 100], L: [100, 100], R: [120, 200], C: [150, 200], S: [150, 200], chance: [150, 300], CC: [300, 510] };
  var ESCALATION = [510, 750, 1000, 2000, 3000]; // エスカレーション：1段ごとに 50% で上がる
  var GOLD_PATCH = [ [510, 0.1875], [750, 0.1875], [1000, 0.1875], [2000, 0.1875], [3000, 0.25] ]; // 金のパッチ
  var ESCALATION_IN = 0.15;   // 討伐報酬でリプレイ → エスカレーション
  var GOLD_IN = 0.10;         // 討伐報酬でハズレ → 金のパッチ
  // フルスタック覚醒：毎ゲームの上乗せ（役ごと）
  var AWAKEN_ADD = { none: 10, L: 10, R: 20, C: 50, S: 50, chance: 100, CC: 300 };
  var AWAKEN_GAMES = 8;
  var AWAKEN_CONT = [ [0.65, 0.5], [0.72, 0.35], [0.85, 0.15] ]; // [継続率, 選ばれる割合]

  // ---- ST ----
  var ST_GAMES = 14;
  var ST_WIN = { R: 0.20, C: 0.25, S: 0.25, chance: 0.25, CC: 1.0 };
  var OVERKILL = { normal: 0.004, weak: 0.10, weakChance: 0.25, CC: 0.15 };
  var OVERKILL_DRAGON = { R: 0.25, rare: 0.75 };
  var END_PREP_LOSE = 0.45;   // 残り0Gのあと（終了準備中）、勝てなかったゲームで終わる確率
  var UPPER_IN = 0.10;        // 勝ったときに上位ST「ゼロデイモード」に上がる確率
  var UPPER_WIN_BONUS = 1.6;  // 上位ST中は勝ちやすい
  var ACTIVE_GAMES = 3;       // 活性化バトルの長さ
  var FAKE_ACTIVE = 0.5;      // 勝っていないリプレイでも、活性化バトルに進む確率（負けバトル）

  var CEILING = 800;          // 天井（通常のゲーム数）
  var CZ_GAMES = 10;

  // ---- 乱数（シミュレーションで同じ結果を出せるように差し替えられる） ----
  function makeRand(seed) {
    if (seed === undefined) return Math.random;
    var s = seed >>> 0;
    return function () { // mulberry32
      s = (s + 0x6D2B79F5) >>> 0;
      var t = s;
      t = Math.imul(t ^ (t >>> 15), t | 1);
      t ^= t + Math.imul(t ^ (t >>> 7), t | 61);
      return ((t ^ (t >>> 14)) >>> 0) / 4294967296;
    };
  }
  function sym(reel, pos) { return REELS[reel][((pos % N) + N) % N]; }
  function pickWeighted(r, list, key) {
    var sum = 0, i;
    for (i = 0; i < list.length; i++) sum += list[i][key];
    var x = r() * sum;
    for (i = 0; i < list.length; i++) { x -= list[i][key]; if (x < 0) return list[i]; }
    return list[list.length - 1];
  }

  // =========================================================
  // 台（1台ぶんの状態）
  // =========================================================
  // mode
  //   normal … 通常      cz … CZ        aim7 … 赤7を狙え（擬似遊技）
  //   reward … 討伐報酬  awaken … フルスタック覚醒
  //   story … ストーリー（獲得枚数を払い出す）    battle … ST「障害交戦」
  function Machine(setting, seed) {
    this.setting = setting || 1;
    this.rand = makeRand(seed);
    this.mode = "normal";
    this.left = 0;           // その状態の残りゲーム数
    this.upper = false;      // 上位ST「ゼロデイモード」中か
    this.czWin = false;
    this.next = null;        // 赤7のあとに行く状態（reward / awaken）
    this.sinceBonus = 0;     // 通常のゲーム数（天井用）
    this.replay = false;     // 前のゲームがリプレイ → 今回はメダル不要
    this.flag = null;        // 今のゲームの小役
    this.stops = [null, null, null];
    // ST のバトル
    this.monster = null;
    this.battle = null;      // { win, overkill, weakCount, activeLeft, endPrep }
    // 報酬
    this.stock = 0;          // ストーリーで払い出す残り枚数
    this.awaken = null;      // { left, cont }
    this.lastReward = null;  // 画面に出すための、直前の報酬の中身
    // 台のデータカウンター
    this.data = { games: 0, at: 0, chain: 0, maxChain: 0, maxGet: 0, getThisAt: 0 };
  }

  Machine.prototype.betNeeded = function () { return (this.replay || this.mode === "aim7") ? 0 : 3; };
  Machine.prototype.isAT = function () { return this.mode !== "normal" && this.mode !== "cz"; };

  // 弱点役か
  Machine.prototype.isWeak = function (flag) {
    if (!this.monster) return false;
    var w = this.monster.weak;
    if (w.indexOf("rare") >= 0) return flag !== "none" && flag !== "R" && flag !== "L";
    return w.indexOf(flag) >= 0 || (flag === "CC" && w.indexOf("C") >= 0);
  };

  // ---- 小役を引く ----
  Machine.prototype.drawRole = function () {
    var r = this.rand, x = r(), acc = 0, k;
    var table = this.mode === "battle" ? ROLE_TABLE.battle : (this.isAT() ? ROLE_TABLE.at : ROLE_TABLE.normal);
    if (!this.isAT()) {
      acc += SETTING[this.setting].chance;
      if (x < acc) return "chance";
    }
    for (k in table) { acc += table[k]; if (x < acc) return k; }
    return "none";
  };

  // ---- レバーを叩いた（1ゲームの抽選） ----
  // 戻り値: { flag, event: [...] }  event は液晶演出のきっかけ
  Machine.prototype.lever = function () {
    var r = this.rand, ev = [];
    this.curBet = this.betNeeded();   // このゲームで入れたメダル（リプレイ・擬似遊技は0枚）
    this.leverMode = this.mode;       // レバーを叩いたときの状態（settle で、この状態を1ゲーム進める）
    this.replay = false;
    this.stops = [null, null, null];
    this.data.games++;

    // 赤7を狙え（擬似遊技）：役は引かない。7が揃う
    if (this.mode === "aim7") {
      this.flag = "seven";
      ev.push("aim7");
      return { flag: this.flag, event: ev };
    }

    var flag = this.drawRole();
    this.flag = flag;

    if (this.mode === "normal") this.leverNormal(flag, ev);
    else if (this.mode === "cz") this.leverCz(flag, ev);
    else if (this.mode === "reward") this.leverReward(flag, ev);
    else if (this.mode === "awaken") this.leverAwaken(flag, ev);
    else if (this.mode === "story") this.leverStory(flag, ev);
    else if (this.mode === "battle") this.leverBattle(flag, ev);
    return { flag: flag, event: ev };
  };

  Machine.prototype.leverNormal = function (flag, ev) {
    var r = this.rand, st = SETTING[this.setting], to = 0;
    this.sinceBonus++;
    if (flag === "chance") to = st.czChance;
    else if (flag === "S") to = st.czSuika;
    else if (flag === "C") to = st.czCherry;
    else if (flag === "CC") to = 0.35;
    if (to && r() < to) {
      this.mode = "cz"; this.left = CZ_GAMES;
      this.czWin = (flag === "CC") ? r() < 0.5 : r() < st.czWin;
      ev.push("cz_in");
      return;
    }
    if (this.sinceBonus >= CEILING) { this.startAT(ev); ev.push("ceiling"); }
  };

  Machine.prototype.leverCz = function (flag, ev) {
    var r = this.rand;
    this.sinceBonus++;
    // 成功する CZ は、最後のゲームまでに必ず当たる（レア役なら、その場で当たりやすい）
    if (this.czWin && (flag === "S" || flag === "C" || flag === "CC" || flag === "chance" || this.left <= 1 || r() < 0.08)) {
      this.startAT(ev); ev.push("cz_win");
    }
  };

  // AT が始まる（赤7を狙え → 討伐報酬）
  Machine.prototype.startAT = function (ev) {
    this.mode = "aim7"; this.next = "reward"; this.left = 1;
    this.monster = null; this.upper = false;
    this.data.at++; this.data.chain = 0; this.data.getThisAt = 0;
    this.sinceBonus = 0;
    ev.push("at_win");
  };

  // ---- 討伐報酬（1G） ----
  Machine.prototype.leverReward = function (flag, ev) {
    var r = this.rand, weak = this.isWeak(flag), get, kind = "base", steps = null;
    var base = REWARD_BASE[flag] || REWARD_BASE.none;
    get = base[weak ? 1 : 0];
    if (flag === "R" && r() < ESCALATION_IN) {
      kind = "escalation"; steps = [ESCALATION[0]];
      for (var i = 1; i < ESCALATION.length && r() < 0.5; i++) steps.push(ESCALATION[i]);
      get = Math.max(get, steps[steps.length - 1]);
    } else if (flag === "none" && r() < GOLD_IN) {
      kind = "gold"; get = pickWeighted(r, GOLD_PATCH.map(function (g) { return { v: g[0], p: g[1] }; }), "p").v;
    }
    this.lastReward = { kind: kind, get: get, steps: steps, flag: flag, weak: weak };
    this.addStock(get);
    ev.push("reward_" + kind);
  };

  // ---- フルスタック覚醒 ----
  Machine.prototype.leverAwaken = function (flag, ev) {
    var r = this.rand, a = this.awaken;
    var add = AWAKEN_ADD[flag] || 30;
    this.addStock(add);
    a.total += add; a.games++;
    a.lastAdd = add;
    ev.push("awaken_add");
    // 8G を過ぎたら、毎ゲーム「続くかどうか」を抽選する（継続率 65% / 72% / 85%）
    if (a.games >= AWAKEN_GAMES && r() >= a.cont) a.end = true;
  };

  // ---- ストーリー（払い出し） ----
  Machine.prototype.leverStory = function (flag, ev) {
    if (flag === "CC") { this.addStock(100); ev.push("story_add"); }
  };

  // ---- ST「障害交戦」 ----
  Machine.prototype.leverBattle = function (flag, ev) {
    var r = this.rand, b = this.battle, m = this.monster, weak = this.isWeak(flag);
    if (weak) b.weakCount++;

    if (b.activeLeft > 0) {
      // 活性化バトル中：勝ちが決まっていれば、オーバーキルの抽選を続ける
      if (b.win) this.drawOverkill(flag, weak);
      if (!b.win && (weak || flag === "CC")) { b.win = true; this.drawOverkill(flag, weak); } // バトル中に弱点役を引けば逆転
      return;
    }

    // 勝ち抽選
    // リプレイは、まず活性化バトルに進むかを抽選（50%）。進んだときだけ勝ち抽選をする
    var p = 0;
    if (m.sure) p = 1;
    else if (weak) p = 1;
    else if (flag === "R") p = (r() < FAKE_ACTIVE) ? ST_WIN.R : 0;
    else p = ST_WIN[flag] || 0;
    if (this.upper && p < 1) p = Math.min(1, p * UPPER_WIN_BONUS);
    if (p && r() < p) {
      b.win = true;
      this.drawOverkill(flag, weak);
    }
    // 活性化バトルに進むか（勝ちのときは必ず。負けのリプレイ・レア役でも半分くらい進む）
    if (b.win || ((flag === "R" || flag === "S" || flag === "C" || flag === "chance") && r() < FAKE_ACTIVE)) {
      b.activeLeft = ACTIVE_GAMES + 1; // このゲームを含めて数える（settle で1つ減る）
      ev.push("active_in");
      return;
    }
    if (b.endPrep) ev.push("endprep_game");
  };

  Machine.prototype.drawOverkill = function (flag, weak) {
    var r = this.rand, b = this.battle, p;
    if (b.overkill) return;
    if (b.weakCount >= 2) { b.overkill = true; return; }
    if (this.monster.id === "dragon") p = (flag === "R") ? OVERKILL_DRAGON.R : (flag === "none" || flag === "L" ? 0 : OVERKILL_DRAGON.rare);
    else if (flag === "CC") p = weak ? 1 : OVERKILL.CC;
    else if (weak) p = (flag === "chance") ? OVERKILL.weakChance : OVERKILL.weak;
    else p = (flag === "none" || flag === "L") ? 0 : OVERKILL.normal;
    if (r() < p) b.overkill = true;
  };

  Machine.prototype.addStock = function (n) {
    this.stock += n;
    this.data.getThisAt += n;
    if (this.data.getThisAt > this.data.maxGet) this.data.maxGet = this.data.getThisAt;
  };

  Machine.prototype.startBattle = function (ev) {
    this.mode = "battle"; this.left = ST_GAMES;
    this.monster = pickWeighted(this.rand, MONSTERS, this.upper ? "wUp" : "w");
    this.battle = { win: false, overkill: false, weakCount: 0, activeLeft: 0, endPrep: false };
    ev.push("battle_start");
  };

  // ---- ストップボタン（reel: 0〜2, pressPos: 押した瞬間に中段にいたコマ） ----
  // 戻り値: 止まったコマ（中段のコマ番号）
  Machine.prototype.stop = function (reel, pressPos) {
    var best = null, k;
    // 擬似遊技の赤7は、どこで押しても揃う（すべりの上限なしで7まで回す）
    if (this.flag === "seven") {
      for (k = 0; k < N; k++) if (sym(reel, pressPos + k) === "7") { best = pressPos + k; break; }
    }
    // 1) 揃えたい図柄が、4コマ以内に来るなら、そこまですべらせる（引き込み）
    var want = this.wantSymbol(reel);
    if (best === null && want) {
      for (k = 0; k <= SLIP; k++) if (sym(reel, pressPos + k) === want) { best = pressPos + k; break; }
    }
    // 2) 揃えたくない図柄が揃いそうなら、ずらす（蹴飛ばし）
    if (best === null) {
      for (k = 0; k <= SLIP; k++) if (!this.isBad(reel, sym(reel, pressPos + k))) { best = pressPos + k; break; }
    }
    if (best === null) best = pressPos;
    this.stops[reel] = ((best % N) + N) % N;
    return this.stops[reel];
  };

  // このリールで、中段に止めたい図柄
  Machine.prototype.wantSymbol = function (reel) {
    var f = this.flag;
    if (f === "L" || f === "R" || f === "S") return f;
    if (f === "C") return reel === 0 ? "C" : null;
    if (f === "CC") return (reel === 0 || reel === 2) ? "C" : null;    // 強チェリー：左と右にチェリー
    if (f === "chance") return reel === 0 ? "B" : (reel === 2 ? "S" : null); // BAR・？・スイカ のハズレ目
    return null;
  };

  // この図柄を、中段に止めてはいけないか
  Machine.prototype.isBad = function (reel, s) {
    var f = this.flag;
    if (s === "7") return true;                                         // 7は、擬似遊技のときだけ
    if (s === "C" && reel === 0 && f !== "C" && f !== "CC") return true;
    if (reel === 2) {
      var a = sym(0, this.stops[0]), b = sym(1, this.stops[1]);
      if (a === b && b === s && f !== s) return true;                    // 当たっていない役が揃う
    }
    return false;
  };

  // ---- 3つ止まったあと（払い出しと、状態を進める） ----
  // 戻り値: { win, pay, event: [...], mode, symbols }
  Machine.prototype.settle = function () {
    var a = sym(0, this.stops[0]), b = sym(1, this.stops[1]), c = sym(2, this.stops[2]);
    var win = null, pay = 0, ev = [], f = this.flag;
    if (a === b && b === c && a !== "B" && a !== "G") win = a;
    else if (a === "C") win = "C";
    if (win === "R") this.replay = true;
    else if (win === "L") pay = this.isAT() ? PAY.L_AT : PAY.L;
    else if (win === "S") pay = PAY.S;
    else if (win === "C") pay = (f === "CC") ? PAY.CC : PAY.C;

    // ストーリー中は、増えたメダル（差枚）の分だけ、払い出す残り枚数を減らす
    // リプレイは「次のゲームの3枚」が浮くので、3枚増えたことにする
    if (this.mode === "story") {
      this.stock = Math.max(0, this.stock - (pay - this.curBet + (win === "R" ? 3 : 0)));
    }

    this.advance(win, ev);
    return { win: win, pay: pay, event: ev, mode: this.mode, left: this.left, symbols: [a, b, c] };
  };

  // 状態を1ゲーム進める
  Machine.prototype.advance = function (win, ev) {
    var r = this.rand;
    switch (this.leverMode) {
      case "cz":
        if (this.mode !== "cz") break;   // このゲームで AT に当たった
        this.left--;
        if (this.left <= 0) { this.mode = "normal"; ev.push("cz_lose"); }
        break;

      case "aim7":
        ev.push("seven");
        if (this.next === "awaken") {
          this.mode = "awaken";
          var c = pickWeighted(r, AWAKEN_CONT.map(function (x) { return { v: x[0], p: x[1] }; }), "p").v;
          this.awaken = { games: 0, cont: c, total: 0, lastAdd: 0, end: false };
          ev.push("awaken_start");
        } else {
          this.mode = "reward"; ev.push("reward_start");
        }
        break;

      case "reward":
        this.mode = "story"; ev.push("story_start");
        break;

      case "awaken":
        if (this.awaken.end) { this.mode = "story"; ev.push("awaken_end"); ev.push("story_start"); }
        break;

      case "story":
        if (this.stock <= 0) { this.startBattle(ev); }
        break;

      case "battle":
        var bt = this.battle;
        if (bt.activeLeft > 0) {
          bt.activeLeft--;
          if (bt.activeLeft === 0) {
            if (bt.win) this.battleWin(ev);
            else ev.push("active_lose");
          }
          break;
        }
        if (this.left > 0) {
          this.left--;
          if (this.left === 0) { bt.endPrep = true; ev.push("endprep"); }
        } else if (r() < END_PREP_LOSE) {
          this.mode = "normal"; this.monster = null; this.upper = false;
          ev.push("at_end");
        }
        break;
    }
  };

  Machine.prototype.battleWin = function (ev) {
    var bt = this.battle;
    this.data.chain++;
    if (this.data.chain > this.data.maxChain) this.data.maxChain = this.data.chain;
    ev.push(bt.overkill ? "battle_win_overkill" : "battle_win");
    if (!this.upper && this.rand() < UPPER_IN) { this.upper = true; ev.push("upper_in"); }
    this.mode = "aim7"; this.next = bt.overkill ? "awaken" : "reward";
  };

  // =========================================================
  // シミュレーション用（Node から使う）
  //   skill: 0〜1。スイカを狙って押せる割合（1 = 毎回完璧に目押し）
  // =========================================================
  Machine.prototype.autoPlay = function (skill) {
    var res = this.lever(), r = this.rand;
    for (var i = 0; i < 3; i++) {
      var press = Math.floor(r() * N);
      var target = this.wantSymbol(i);
      if (target && r() < skill) {
        for (var p = 0; p < N; p++) if (sym(i, p) === target) { press = p - Math.floor(r() * (SLIP + 1)); break; }
      }
      this.stop(i, ((press % N) + N) % N);
    }
    return this.settle();
  };

  // ホールのデータカウンター用に、その設定で回したときの履歴を作る
  function fakeHistory(setting, seed, games) {
    var m = new Machine(setting, seed);
    for (var g = 0; g < games; g++) m.autoPlay(0.9);
    // AT の途中で終わったら、通常に戻るまで回す（データカウンターは通常時の数字を出す）
    for (var k = 0; k < 5000 && m.mode !== "normal"; k++) m.autoPlay(0.9);
    // そのあと、通常で少し回したところで止まっている（データの「現在のゲーム数」がばらける）
    var more = 20 + Math.floor(m.rand() * 650);
    for (var j = 0; j < 20000 && (m.mode !== "normal" || m.sinceBonus < more); j++) m.autoPlay(0.9);
    return { games: m.data.games, at: m.data.at, now: m.sinceBonus, maxChain: m.data.maxChain, maxGet: m.data.maxGet };
  }

  var api = {
    SYMBOLS: SYMBOLS, ROLE_NAME: ROLE_NAME, REELS: REELS, N: N, SLIP: SLIP, PAY: PAY, SETTING: SETTING,
    MONSTERS: MONSTERS, ESCALATION: ESCALATION, CEILING: CEILING, CZ_GAMES: CZ_GAMES, ST_GAMES: ST_GAMES,
    AWAKEN_GAMES: AWAKEN_GAMES, ACTIVE_GAMES: ACTIVE_GAMES,
    YEN_PER_MEDAL: 20, Machine: Machine, sym: sym, fakeHistory: fakeHistory
  };
  if (typeof module !== "undefined" && module.exports) module.exports = api;
  else root.SlotEngine = api;
})(this);
