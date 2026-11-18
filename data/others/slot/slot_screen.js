/* =========================================================
   パチスロの画面（1台を画面いっぱいに出して遊ぶ）
   - 上：液晶（障害モンスターとのバトル・活性化バトル・カットイン・討伐報酬などの演出）
   - 下：リール3本、クレジット・払い出し、BET・レバー・ストップボタン
   - 左右：所持金・投資・メダル貸出・精算 / データカウンター
   中身の抽選は slot_engine.js（SlotEngine）に任せる。

   シナリオからの呼び方（system/slot.ks）
     SlotScreen.open({
       no: 台番号, setting: 設定(1〜6), since: 前回の AT からのゲーム数,
       histGames / histAt / histMaxGet: データカウンターに出す、今までの数字,
       money: 所持金(円), maxGames: この日に回せる上限（通常時だけ止める。AT 中は最後まで打てる）,
       onClose: function (result) { ... }   // 精算したら呼ばれる
     });
     result = { money: 精算後の所持金, invest: 使った金額, back: 精算で戻った金額,
                games: 回したゲーム数, at: AT に当たった回数, maxGet: 1回の AT の最大獲得枚数 }

   操作
     マウス／タッチ：画面のボタン
     キーボード：スペース = BET・レバー　/　Z X C（または 1 2 3）= 左・中・右ストップ
     ストーリーと覚醒のあいだは「高速消化」ボタンで、自動でどんどん回せる
   ========================================================= */
(function () {
  "use strict";
  if (window.SlotScreen) return; // 2回読み込まれても、1回分だけ

  var E = window.SlotEngine;
  var YEN = E.YEN_PER_MEDAL;          // 1枚 = 20円
  var LEND_YEN = 1000;                // 1回の貸出 = 1,000円
  var LEND_MEDAL = LEND_YEN / YEN;    // = 50枚

  // ---- 大きさ（ゲーム画面 1280×720 の中の位置） ----
  var CELL_W = 132, CELL_H = 66;      // 図柄1コマ
  var REEL_GAP = 12;
  var SPIN_SPEED = 21 / 0.85;         // 1秒に何コマ流れるか（1周 0.85秒）

  // =========================================================
  // 図柄をドット絵で描く（44×22 マスに描いて、3倍に拡大）
  // =========================================================
  var SYM_CANVAS = {};
  function px(g, x, y, w, h, c) { g.fillStyle = c; g.fillRect(x, y, w || 1, h || 1); }
  function disc(g, cx, cy, r, c) {
    for (var y = -r; y <= r; y++) for (var x = -r; x <= r; x++)
      if (x * x + y * y <= r * r + r * 0.6) px(g, cx + x, cy + y, 1, 1, c);
  }
  // 3×5 の小さい文字
  var FONT = {
    R: ["111", "101", "110", "101", "101"], E: ["111", "100", "110", "100", "111"],
    P: ["111", "101", "111", "100", "100"], L: ["100", "100", "100", "100", "111"],
    A: ["010", "101", "111", "101", "101"], Y: ["101", "101", "010", "010", "010"],
    B: ["110", "101", "110", "101", "110"], U: ["101", "101", "101", "101", "111"],
    G: ["011", "100", "101", "101", "011"]
  };
  function text(g, str, x, y, c, s) {
    s = s || 1;
    for (var i = 0; i < str.length; i++) {
      var f = FONT[str[i]];
      for (var r = 0; r < 5; r++) for (var k = 0; k < 3; k++)
        if (f[r][k] === "1") px(g, x + (i * 4 + k) * s, y + r * s, s, s, c);
    }
  }
  var DRAW = {
    "7": function (g) {
      var D = "#3a0610", R = "#e8202a", W = "#ffb0a0";
      px(g, 14, 2, 16, 4, D); px(g, 15, 3, 14, 2, R); px(g, 16, 3, 8, 1, W);
      for (var i = 0; i < 15; i++) {
        var x = 26 - Math.floor(i * 0.62);
        px(g, x - 1, 5 + i, 6, 1, D); px(g, x, 5 + i, 4, 1, R);
      }
      px(g, 16, 19, 6, 1, D);
    },
    B: function (g) {
      px(g, 7, 4, 30, 14, "#111"); px(g, 8, 5, 28, 12, "#2a2a2a");
      px(g, 8, 5, 28, 1, "#555"); text(g, "BAR", 11, 6, "#f4f4f4", 2);
    },
    L: function (g) {
      var D = "#5a3a00", Y = "#ffd21a", W = "#fff6b0";
      disc(g, 22, 9, 7, D); disc(g, 22, 9, 6, Y);
      px(g, 14, 10, 17, 7, D); px(g, 15, 10, 15, 6, Y);
      px(g, 12, 16, 21, 3, D); px(g, 13, 16, 19, 2, Y);
      px(g, 19, 4, 3, 5, W); disc(g, 22, 20, 2, D); px(g, 21, 1, 3, 2, D);
    },
    R: function (g) {
      px(g, 4, 5, 36, 13, "#0c2a70"); px(g, 5, 6, 34, 11, "#2d6cf0");
      px(g, 5, 6, 34, 1, "#8fb6ff"); text(g, "REPLAY", 10, 9, "#ffffff", 1);
    },
    S: function (g) {
      var D = "#0b3a12";
      for (var y = 0; y <= 9; y++) {
        var w = Math.round(Math.sqrt(100 - y * y) * 1.55);
        px(g, 22 - w, 7 + y, w * 2, 1, D);
        px(g, 22 - w + 1, 7 + y, w * 2 - 2, 1, y > 7 ? "#3fbf4a" : "#e83a4a");
      }
      px(g, 8, 7, 28, 1, D);
      [[14, 9], [20, 11], [26, 9], [17, 13], [24, 13], [30, 11]].forEach(function (s) { px(g, s[0], s[1], 1, 2, "#111"); });
    },
    C: function (g) {
      px(g, 22, 2, 1, 6, "#1d6b2a"); px(g, 17, 6, 6, 1, "#1d6b2a"); px(g, 23, 6, 5, 1, "#1d6b2a");
      px(g, 16, 7, 1, 5, "#1d6b2a"); px(g, 28, 7, 1, 6, "#1d6b2a");
      disc(g, 16, 15, 5, "#4a0010"); disc(g, 16, 15, 4, "#e01c34"); px(g, 14, 13, 2, 2, "#ffb3bd");
      disc(g, 28, 16, 5, "#4a0010"); disc(g, 28, 16, 4, "#e01c34"); px(g, 26, 14, 2, 2, "#ffb3bd");
    },
    G: function (g) { // バグ（ハズレ図柄）：紫の虫
      var D = "#2a0f3a", P = "#8c4cc8";
      for (var i = 0; i < 3; i++) { px(g, 14, 9 + i * 3, 16, 1, D); }
      disc(g, 22, 12, 6, D); disc(g, 22, 12, 5, P); disc(g, 22, 5, 3, D); disc(g, 22, 5, 2, P);
      px(g, 20, 4, 1, 1, "#fff"); px(g, 23, 4, 1, 1, "#fff");
      px(g, 19, 1, 1, 2, D); px(g, 25, 1, 1, 2, D); px(g, 22, 8, 1, 9, D);
    }
  };
  function symbolCanvas(s) {
    if (SYM_CANVAS[s]) return SYM_CANVAS[s];
    var small = document.createElement("canvas"); small.width = 44; small.height = 22;
    DRAW[s](small.getContext("2d"));
    var big = document.createElement("canvas"); big.width = CELL_W; big.height = CELL_H;
    var g = big.getContext("2d"); g.imageSmoothingEnabled = false;
    g.drawImage(small, 0, 0, CELL_W, CELL_H);
    return (SYM_CANVAS[s] = big);
  }

  // =========================================================
  // 音（BGM と効果音）
  //   ファイルを同じ名前で置きかえれば、好きな音に変えられる
  //   BGM … data/bgm/bgm_slot_〜.mp3　　効果音 … data/sound/se_slot_〜.mp3
  // =========================================================
  var BGM_FILE = {
    normal: "bgm_slot_normal.mp3", cz: "bgm_slot_cz.mp3", battle: "bgm_slot_battle.mp3",
    story: "bgm_slot_story.mp3", awaken: "bgm_slot_awaken.mp3", upper: "bgm_slot_upper.mp3"
  };
  var SE_FILE = {
    lever: "se_slot_lever.mp3", stop: "se_slot_stop.mp3", pay: "se_slot_pay.mp3", bet: "se_slot_bet.mp3",
    reverse: "se_slot_reverse.mp3", freeze: "se_slot_freeze.mp3", cutin: "se_slot_cutin.mp3",
    aim7: "se_slot_aim7.mp3", seven: "se_slot_seven.mp3", gold: "se_slot_gold.mp3",
    levelup: "se_slot_levelup.mp3", hit: "se_slot_hit.mp3", win: "se_slot_win.mp3",
    lose: "se_slot_lose.mp3", cz: "se_slot_cz.mp3", lend: "se_slot_lend.mp3",
    overkill: "se_slot_overkill.mp3"   // オーバーキルに入ったときだけ鳴る（用意してもらった曲）
  };
  function vol(kind) {
    var c = (window.TYRANO && TYRANO.kag && TYRANO.kag.config) || {};
    var v = parseInt(kind === "bgm" ? c.defaultBgmVolume : c.defaultSeVolume, 10);
    return isNaN(v) ? 1 : Math.max(0, Math.min(1, v / 100));
  }
  var bgmAudio = null, bgmName = "", oneShot = null;
  function playBgm(name) {
    if (name === bgmName) return;
    stopBgm();
    bgmName = name;
    if (oneShot) return; // オーバーキルの曲が鳴っているあいだは、BGM を止めておく（終わったら流す）
    try {
      bgmAudio = new Audio("./data/bgm/" + BGM_FILE[name]);
      bgmAudio.loop = true; bgmAudio.volume = 0.6 * vol("bgm");
      bgmAudio.play().catch(function () {});
    } catch (e) { bgmAudio = null; }
  }
  function stopBgm() {
    if (bgmAudio) { try { bgmAudio.pause(); } catch (e) {} }
    bgmAudio = null; bgmName = "";
  }
  function se(name) {
    try {
      var a = new Audio("./data/sound/" + SE_FILE[name]);
      a.volume = 0.7 * vol("se");
      a.play().catch(function () {});
      return a;
    } catch (e) { return null; }
  }
  // オーバーキルの曲：BGM を止めて1回だけ鳴らし、終わったら今の状態の BGM に戻す
  function playOverkill() {
    var want = bgmName;
    stopBgm();
    if (oneShot) { try { oneShot.pause(); } catch (e) {} }
    oneShot = se("overkill");
    if (!oneShot) return;
    oneShot.addEventListener("ended", function () {
      oneShot = null;
      if (S) { var w = bgmName || want; bgmName = ""; playBgm(w || bgmFor(S.m)); }
    });
    bgmName = want;
  }
  function bgmFor(m) {
    if (m.upper && (m.mode === "battle" || m.mode === "story")) return "upper";
    if (m.mode === "cz") return "cz";
    if (m.mode === "battle") return "battle";
    if (m.mode === "awaken") return "awaken";
    if (m.mode === "story" || m.mode === "reward" || m.mode === "aim7") return "story";
    return "normal";
  }
  function stopAllSound() {
    stopBgm();
    if (oneShot) { try { oneShot.pause(); } catch (e) {} oneShot = null; }
  }

  // =========================================================
  // 液晶（130×70 のドット絵を4倍。文字は上に HTML で重ねる）
  // =========================================================
  var MON_COLOR = {
    slime:  { body: "#46c86a", dark: "#1c5a2c" },
    ghost:  { body: "#c9d2f2", dark: "#4a5170" },
    golem:  { body: "#c98a4a", dark: "#5a3612" },
    twins:  { body: "#f08ad0", dark: "#6a2458" },
    dragon: { body: "#e04848", dark: "#5a1010" },
    zeroday:{ body: "#1a1a24", dark: "#ff2040" }
  };
  function drawMonster(g, id, cx, cy, flash, t) {
    var c = MON_COLOR[id] || MON_COLOR.slime, B = flash ? "#ffffff" : c.body, D = c.dark;
    function eyes(x, y, s) { px(g, x - s - 2, y, 3, 3, "#fff"); px(g, x + s, y, 3, 3, "#fff"); px(g, x - s - 1, y + 1, 1, 1, "#200"); px(g, x + s + 1, y + 1, 1, 1, "#200"); }
    if (id === "slime") {
      disc(g, cx, cy + 4, 13, D); disc(g, cx, cy + 4, 12, B); px(g, cx - 13, cy + 10, 27, 7, D); px(g, cx - 12, cy + 10, 25, 6, B);
      px(g, cx + 6, cy + 16, 2, 3 + (Math.floor(t * 3) % 3), B); eyes(cx, cy, 4);
    } else if (id === "ghost") {
      disc(g, cx, cy, 12, D); disc(g, cx, cy, 11, B); px(g, cx - 12, cy, 25, 12, D); px(g, cx - 11, cy, 23, 11, B);
      for (var i = 0; i < 4; i++) px(g, cx - 11 + i * 6 + ((Math.floor(t * 4) + i) % 2) * 2, cy + 11, 3, 3, D);
      eyes(cx, cy - 2, 4);
    } else if (id === "golem") {
      px(g, cx - 12, cy - 12, 24, 30, D); px(g, cx - 11, cy - 11, 22, 28, B);
      px(g, cx - 18, cy - 4, 6, 16, D); px(g, cx + 12, cy - 4, 6, 16, D);
      px(g, cx - 8, cy - 4, 16, 2, D); px(g, cx - 6, cy - 8, 3, 3, "#ffe060"); px(g, cx + 3, cy - 8, 3, 3, "#ffe060");
    } else if (id === "twins") {
      disc(g, cx - 9, cy + 2, 9, D); disc(g, cx - 9, cy + 2, 8, B); disc(g, cx + 9, cy + 2, 9, D); disc(g, cx + 9, cy + 2, 8, "#8ad0f0");
      eyes(cx - 9, cy, 2); eyes(cx + 9, cy, 2);
    } else if (id === "dragon") {
      px(g, cx - 26, cy - 10, 14, 4, D); px(g, cx + 12, cy - 10, 14, 4, D); px(g, cx - 24, cy - 6, 10, 8, D); px(g, cx + 14, cy - 6, 10, 8, D);
      disc(g, cx, cy, 14, D); disc(g, cx, cy, 13, B); px(g, cx - 9, cy - 18, 3, 6, "#ffe0a0"); px(g, cx + 6, cy - 18, 3, 6, "#ffe0a0");
      px(g, cx - 6, cy + 6, 12, 3, "#fff"); eyes(cx, cy - 4, 5);
    } else { // ゼロデイ：黒い球と赤い目
      disc(g, cx, cy, 15, D); disc(g, cx, cy, 13, B);
      var r = 3 + Math.floor(t * 6) % 2; disc(g, cx, cy, r, "#ff2040"); px(g, cx - 1, cy - 1, 2, 2, "#fff");
      for (var k = 0; k < 8; k++) px(g, cx + Math.round(Math.cos(k + t) * 18), cy + Math.round(Math.sin(k + t) * 18), 2, 2, "#ff2040");
    }
  }

  function drawLcd(g, L, m, t) {
    var mode = m.mode;
    var bg = { normal: "#0e1630", cz: "#3a0b14", aim7: "#2a0606", reward: "#3a2a05", story: "#10233a", battle: "#0b2a3a", awaken: "#2a0b3a" }[mode] || "#0e1630";
    if (m.upper && (mode === "battle" || mode === "story")) bg = "#1a0630";
    if (L.gold > 0) bg = "#5a4206";
    px(g, 0, 0, 130, 70, bg);
    // サーバラック（背景）
    var speed = (mode === "normal" || mode === "story") ? 6 : 16;
    for (var i = 0; i < 6; i++) {
      var x = ((i * 26 - (t * speed) % 26) + 156) % 156 - 26;
      px(g, x, 10, 18, 44, "rgba(10,14,30,0.6)"); px(g, x + 1, 11, 16, 42, "rgba(40,52,100,0.55)");
      for (var k = 0; k < 6; k++) {
        px(g, x + 3, 14 + k * 6, 10, 2, "rgba(60,76,140,0.6)");
        if ((Math.floor(t * 4) + i + k) % 3 === 0) px(g, x + 14, 14 + k * 6, 1, 1, (mode === "cz" || mode === "battle") ? "#ff4040" : "#40ff80");
      }
    }
    px(g, 0, 54, 130, 16, "#0a0f20");
    // モンスター
    if (L.monsterId && (mode === "battle" || mode === "cz" || mode === "aim7")) {
      var bob = Math.round(Math.sin(t * 5) * 1.5), cx = 94, cy = 32 + bob;
      if (L.hitFlash > 0) cx += (Math.random() * 4 - 2) | 0;
      drawMonster(g, L.monsterId, cx, cy, L.hitFlash > 0, t);
      if (L.hp !== null) { px(g, 72, 4, 44, 4, "#000"); px(g, 73, 5, Math.max(0, Math.round(42 * L.hp)), 2, L.hp > 0.3 ? "#ff5050" : "#ffd040"); }
    }
    // 主人公（左下）
    var hx = 22, hy = 40 + ((mode === "normal" || mode === "story") ? (Math.floor(t * 6) % 2) : 0);
    px(g, hx, hy, 8, 8, "#f2c9a0"); px(g, hx, hy - 2, 8, 3, "#2a1a10");
    px(g, hx - 1, hy + 8, 10, 10, "#2b3f8a"); px(g, hx + 2, hy + 3, 1, 1, "#000"); px(g, hx + 5, hy + 3, 1, 1, "#000");
    if (mode !== "normal" && mode !== "story") { px(g, hx + 9, hy + 9, 10, 2, "#dfe6ff"); px(g, hx + 19, hy + 8, 2, 4, "#ffe060"); }
    // ストーリー中：仲間が並んで歩く
    if (mode === "story") {
      var cols = ["#d84040", "#4080d8", "#40a060", "#d8a040"];
      for (var p = 0; p < 4; p++) { var ox = 36 + p * 14, oy = 40 + ((Math.floor(t * 6) + p) % 2); px(g, ox, oy, 8, 8, "#f2c9a0"); px(g, ox, oy - 2, 8, 3, "#2a1a10"); px(g, ox - 1, oy + 8, 10, 10, cols[p]); }
    }
    // 攻撃・キラキラ
    if (L.hitFlash > 0) for (var s = 0; s < 8; s++) px(g, 72 + ((Math.random() * 40) | 0), 16 + ((Math.random() * 32) | 0), 2, 2, "#ffe060");
    if (mode === "aim7" || mode === "awaken" || L.gold > 0) for (var j = 0; j < 18; j++) px(g, (Math.random() * 130) | 0, (Math.random() * 70) | 0, 1, 1, L.gold > 0 ? "#fff2a0" : "#ffb0ff");
    // 終了準備中：黒いもやが濃くなる
    if (L.mist > 0) {
      for (var q = 0; q < 220 * L.mist; q++) px(g, (Math.random() * 130) | 0, (Math.random() * 70) | 0, 3, 2, "rgba(0,0,0,0.55)");
    }
  }

  // =========================================================
  // 画面を作る
  // =========================================================
  function el(tag, cls, parent, html) {
    var e = document.createElement(tag);
    if (cls) e.className = cls;
    if (html !== undefined) e.innerHTML = html;
    if (parent) parent.appendChild(e);
    return e;
  }

  var S = null; // 開いている間の状態

  function open(opt) {
    if (S) return;
    var m = new E.Machine(opt.setting);
    m.sinceBonus = opt.since || 0;

    var root = el("div", "slot_root");
    (document.querySelector(".tyrano_base") || document.body).appendChild(root);

    // ---- 左のパネル（お金） ----
    var left = el("div", "slot_side slot_left", root);
    el("div", "slot_side_title", left, "No." + opt.no);
    var moneyBox = el("div", "slot_kv", left);
    var investBox = el("div", "slot_kv", left);
    var lendBtn = el("button", "slot_btn slot_lend", left, "メダルを借りる<br><small>1,000円 → 50枚</small>");
    var cashBtn = el("button", "slot_btn slot_cash", left, "精算してやめる");
    el("div", "slot_help", left, "スペース：BET・レバー<br>Z・X・C：ストップ<br>1枚 = 20円");

    // ---- 右のパネル（データカウンター） ----
    var right = el("div", "slot_side slot_right", root);
    el("div", "slot_side_title", right, "データ");
    var dataBox = el("div", "slot_data", right);
    el("div", "slot_paytable", right,
      "<b>配当</b>　ベル 8枚（AT中 12枚）<br>スイカ 6枚／チェリー 2枚<br>リプレイ 再遊技<br>" +
      "<b>流れ</b>　CZ → AT「討伐報酬」<br>→ ST「障害交戦」で勝てばループ<br>天井 " + E.CEILING + "G");

    // ---- 真ん中（台） ----
    var cab = el("div", "slot_cabinet", root);
    el("div", "slot_top_lamp", cab, "障害討伐　デバッグラッシュ");
    var lcdWrap = el("div", "slot_lcd", cab);
    var lcd = el("canvas", "slot_lcd_canvas", lcdWrap); lcd.width = 130; lcd.height = 70;
    var lcdMode = el("div", "slot_lcd_mode", lcdWrap);
    var lcdSub = el("div", "slot_lcd_sub", lcdWrap);
    var lcdCount = el("div", "slot_lcd_count", lcdWrap);
    var lcdMsg = el("div", "slot_lcd_msg", lcdWrap);
    var lcdBig = el("div", "slot_lcd_big", lcdWrap);
    var lcdCut = el("div", "slot_cutin", lcdWrap);
    var lcdLadder = el("div", "slot_ladder", lcdWrap);

    var reelWin = el("div", "slot_reels", cab);
    var reelCanvas = el("canvas", "slot_reel_canvas", reelWin);
    reelCanvas.width = CELL_W * 3 + REEL_GAP * 2; reelCanvas.height = CELL_H * 3;
    el("div", "slot_payline", reelWin);
    var freezeCover = el("div", "slot_freeze", cab);

    var info = el("div", "slot_info_row", cab);
    var creditSeg = el("div", "slot_seg", info);
    var gameSeg = el("div", "slot_seg slot_seg_game", info);
    var paySeg = el("div", "slot_seg", info);

    var ctrl = el("div", "slot_ctrl", cab);
    var betBtn = el("button", "slot_btn slot_bet", ctrl, "MAX<br>BET");
    var lever = el("button", "slot_btn slot_lever", ctrl, "レバー");
    var stopBtns = [0, 1, 2].map(function (i) { return el("button", "slot_btn slot_stop", ctrl, ["左", "中", "右"][i]); });
    var fastBtn = el("button", "slot_btn slot_fast", cab, "高速消化");

    S = {
      opt: opt, m: m, root: root,
      money: opt.money, invest: 0, back: 0, credit: 0, games: 0,
      bet: 0, spinning: [false, false, false], pos: [0, 0, 0], target: [null, null, null],
      phase: "idle",            // idle / spin / freeze / reverse
      lastPay: 0, t: 0, timer: 0, fast: false, atGet: 0,
      lcd: { monsterId: null, hp: null, hitFlash: 0, gold: 0, mist: 0 },
      pending: [],              // 3つ止まったあとに見せる演出
      dom: { moneyBox: moneyBox, investBox: investBox, dataBox: dataBox, lcdMode: lcdMode, lcdSub: lcdSub, lcdCount: lcdCount,
             lcdMsg: lcdMsg, lcdBig: lcdBig, lcdCut: lcdCut, lcdLadder: lcdLadder, freezeCover: freezeCover,
             creditSeg: creditSeg, gameSeg: gameSeg, paySeg: paySeg, lendBtn: lendBtn, betBtn: betBtn, lever: lever,
             stopBtns: stopBtns, fastBtn: fastBtn },
      rg: reelCanvas.getContext("2d"), lcdG: lcd.getContext("2d"), raf: 0, lastTime: 0
    };
    for (var i = 0; i < 3; i++) S.pos[i] = Math.floor(Math.random() * E.N);

    lendBtn.onclick = guard(lend);
    cashBtn.onclick = guard(cashOut);
    betBtn.onclick = guard(bet);
    lever.onclick = guard(pull);
    stopBtns.forEach(function (b, i) { b.onclick = guard(function () { stop(i); }); });
    fastBtn.onclick = guard(function () { S.fast = !S.fast; refresh(); });
    // ゲーム本体のクリック（文字送り）に伝わらないようにする
    root.addEventListener("click", function (e) { e.stopPropagation(); });
    root.addEventListener("mousedown", function (e) { e.stopPropagation(); });
    document.addEventListener("keydown", onKeyGuarded, true);

    message("いらっしゃいませ。メダルを借りて、遊んでください");
    playBgm("normal");
    refresh();
    S.raf = requestAnimationFrame(loop);
  }

  var onKeyGuarded = guard(function (e) { onKey(e); });
  function onKey(e) {
    if (!S) return;
    var k = e.key.toLowerCase(), used = true;
    if (k === " " || k === "enter") { if (S.phase === "idle") { if (S.bet === 0 && S.m.betNeeded() > 0) bet(); else pull(); } }
    else if (k === "z" || k === "1") stop(0);
    else if (k === "x" || k === "2") stop(1);
    else if (k === "c" || k === "3") stop(2);
    else used = false;
    if (used) { e.preventDefault(); e.stopImmediatePropagation(); }
  }

  // ---- お金とメダル ----
  function lend() {
    if (S.phase !== "idle") return;
    if (S.money < LEND_YEN) { message("お金が、足りない……"); return; }
    S.money -= LEND_YEN; S.invest += LEND_YEN; S.credit += LEND_MEDAL;
    se("lend");
    refresh();
  }

  // 閉店：通常時だけ止める（AT・CZ の途中は、終わるまで打てる）
  function closed() { return S.opt.maxGames && S.games >= S.opt.maxGames && S.m.mode === "normal"; }

  function bet() {
    if (S.phase !== "idle" || S.bet > 0) return;
    if (S.m.betNeeded() === 0) { message(S.m.mode === "aim7" ? "レバーを叩いて、赤7を狙え！" : "リプレイ。そのままレバーを叩けます"); return; }
    if (closed()) { message("閉店の時間です。精算してください"); return; }
    if (S.credit < 3) { message("メダルが足りません。左の「メダルを借りる」で借りられます"); S.fast = false; return; }
    S.credit -= 3; S.bet = 3; S.lastPay = 0;
    se("bet");
    refresh();
  }

  function pull() {
    if (S.phase !== "idle" || S.revealing) return; // 獲得枚数の発表中は待つ
    var free = S.m.betNeeded() === 0;
    if (!free && S.bet === 0) { bet(); if (S.bet === 0) return; }
    if (free && closed()) { message("閉店の時間です。精算してください"); return; }
    var modeBefore = S.m.mode, overkillNext = S.m.next === "awaken";
    var res = S.m.lever();
    S.games++;
    S.lastPay = 0;
    S.target = [null, null, null];
    S.dom.lcdCut.className = "slot_cutin";
    if (modeBefore === "aim7") {
      // 赤7を狙え：オーバーキルのあとはフリーズ → 逆回転。いつもは逆回転だけ
      if (overkillNext && !S.fast) { S.phase = "freeze"; S.timer = 2.6; S.dom.freezeCover.classList.add("on"); se("freeze"); }
      else { startReverse(); }
    } else {
      se("lever");
      S.phase = "spin"; S.spinning = [true, true, true];
    }
    leverEffect(res, modeBefore);
    if (S.fast) autoStops();
    refresh();
  }
  function startReverse() {
    S.phase = "reverse"; S.timer = S.fast ? 0.05 : 1.1; S.spinning = [true, true, true];
    S.dom.freezeCover.classList.remove("on");
    big("赤7を狙え！！", "red"); message("リールが、逆に回り出した……！");
    se("reverse"); se("aim7");
  }

  function stop(i) {
    if (S.phase !== "spin" || !S.spinning[i] || S.target[i] !== null) return;
    var press = Math.floor(S.pos[i]) % E.N;
    S.target[i] = S.m.stop(i, press);
    if (!S.fast) se("stop");
    S.dom.stopBtns[i].classList.add("pressed");
  }
  // 高速消化：止める場所を決めてしまう
  function autoStops() {
    if (S.phase !== "spin") return;
    for (var i = 0; i < 3; i++) {
      var press = Math.floor(Math.random() * E.N);
      S.target[i] = S.m.stop(i, press);
      S.pos[i] = S.target[i]; S.spinning[i] = false;
    }
  }

  function afterStop() {
    var r = S.m.settle();
    S.bet = 0;
    if (r.pay) { S.credit += r.pay; S.lastPay = r.pay; if (!S.fast) se("pay"); }
    S.phase = "idle";
    S.dom.stopBtns.forEach(function (b) { b.classList.remove("pressed"); });
    resultEffect(r);
    refresh();
  }

  function cashOut() {
    if (S.phase !== "idle") return;
    if (S.m.mode !== "normal" && !S.confirmLeave) {
      S.confirmLeave = true; S.fast = false;
      message("今やめると、当たりを捨てることになる。それでも、もう一度押すとやめる");
      return;
    }
    var yen = S.credit * YEN;
    S.money += yen; S.back += yen; S.credit = 0;
    var result = { money: S.money, invest: S.invest, back: S.back, games: S.games, at: S.m.data.at, maxGet: S.m.data.maxGet };
    var opt = S.opt;
    close();
    if (opt.onClose) opt.onClose(result);
  }
  function close() {
    cancelAnimationFrame(S.raf);
    S.raf = 0;
    document.removeEventListener("keydown", onKeyGuarded, true);
    stopAllSound();
    S.root.parentNode.removeChild(S.root);
    S = null;
  }

  // =========================================================
  // 液晶の演出
  // =========================================================
  function message(s) { if (S) S.dom.lcdMsg.innerHTML = s; }
  function big(s, cls) {
    if (S.fast && cls !== "keep") return;
    var b = S.dom.lcdBig;
    b.className = "slot_lcd_big" + (cls ? " " + cls : "");
    b.innerHTML = s;
    b.style.animation = "none"; void b.offsetWidth; b.style.animation = "";
  }
  function cutin(color, text) {
    if (S.fast) return;
    var c = S.dom.lcdCut;
    c.className = "slot_cutin"; void c.offsetWidth;
    c.className = "slot_cutin on " + color;
    c.innerHTML = text;
    se("cutin");
  }
  function pickColor(list) { // [[色, 重み], …]
    var sum = 0, i; for (i = 0; i < list.length; i++) sum += list[i][1];
    var x = Math.random() * sum; for (i = 0; i < list.length; i++) { x -= list[i][1]; if (x < 0) return list[i][0]; }
    return list[0][0];
  }
  var COLOR_NAME = { blue: "青", green: "緑", red: "赤", gold: "金", rainbow: "虹" };
  function weakText(mon) {
    if (!mon) return "";
    if (mon.sure) return "弱点：なし（勝利濃厚！）";
    if (mon.weak.indexOf("rare") >= 0) return "弱点：リプレイ以外の全役";
    return "弱点：" + mon.weak.map(function (w) { return E.ROLE_NAME[w]; }).join("・");
  }

  // レバーを叩いたとき
  function leverEffect(res, modeBefore) {
    var m = S.m, f = res.flag, ev = res.event, L = S.lcd;
    L.hitFlash = 0;
    var roleText = (f && f !== "none" && f !== "L" && f !== "seven") ? E.ROLE_NAME[f] : "";

    if (modeBefore === "aim7") { message(S.phase === "freeze" ? "……" : ""); return; } // 文字は逆回転が始まるときに出す（startReverse）

    if (ev.indexOf("cz_in") >= 0) {
      L.monsterId = ["slime", "ghost", "golem"][(Math.random() * 3) | 0]; L.hp = 1;
      big("障害発生！！", "red"); message("障害対応チャンス！　10ゲーム以内に、たおせ！"); se("cz");
      return;
    }
    if (ev.indexOf("ceiling") >= 0) { big("天井到達！", "gold"); message("AT 確定！"); se("win"); return; }
    if (m.mode === "normal") {
      if (f === "chance") { big("！？", "red"); message("サーバルームが、ざわついている……"); }
      else if (f === "CC") { big("強チェリー！", "red"); message("強いエラーの気配！"); }
      else if (f === "S") message("スイカ……？　何かの予兆か");
      else if (f === "C") message("チェリー。小さなエラーログが流れた");
      else if (m.sinceBonus > E.CEILING - 100) message("天井まで あと " + (E.CEILING - m.sinceBonus) + "G");
      else if (!S.fast) message(["今日も、サーバは平和だ", "監視画面に、異常なし", "コーヒーがうまい", "ログが、静かに流れている"][(m.data.games >> 3) % 4]);
    } else if (m.mode === "cz" || modeBefore === "cz") {
      if (ev.indexOf("cz_win") >= 0 || ev.indexOf("at_win") >= 0) { L.hp = 0; L.hitFlash = 0.8; big("討伐！！", "gold"); message("AT 確定！"); se("win"); }
      else {
        L.hp = Math.max(0.08, (L.hp || 1) - (roleText ? 0.14 : 0.05)); L.hitFlash = 0.3;
        message("攻撃！" + (roleText ? "（" + roleText + "）" : "") + "　残り " + (m.left - 1) + "G"); if (!S.fast) se("hit");
      }
    } else if (m.mode === "reward") {
      big("討伐報酬", "gold"); message("このゲームで揃った役で、獲得枚数が決まる！");
    } else if (m.mode === "awaken") {
      var a = m.awaken;
      L.hitFlash = 0.3;
      S.pending.push(function () { big("+" + a.lastAdd + "枚", a.lastAdd >= 100 ? "gold" : "purple"); });
      message("フルスタック覚醒　" + a.games + "G目　上乗せ合計 " + a.total + "枚" + (roleText ? "（" + roleText + "）" : ""));
    } else if (m.mode === "story") {
      if (ev.indexOf("story_add") >= 0) { big("+100枚", "gold"); }
      if (!S.fast && m.data.games % 4 === 0) message(STORY_LINES[(m.data.games >> 2) % STORY_LINES.length]);
    } else if (m.mode === "battle") {
      battleLever(res);
    }
  }

  var STORY_LINES = [
    "障害報告書を、みんなで書いている……", "先輩「ナイスファイト！　次も全力でいくぞ！」", "リーダー「ログは、ちゃんと保存しといてね」",
    "営業「……助かった。礼は言わないぞ」", "同期「おれたち、けっこう強くなったよな！」", "再発防止策を、ホワイトボードにまとめた"
  ];

  // ST 中のレバー
  function battleLever(res) {
    var m = S.m, b = m.battle, f = res.flag, ev = res.event, L = S.lcd;
    var roleText = (f !== "none" && f !== "L") ? E.ROLE_NAME[f] : "";
    var weak = m.isWeak(f);
    if (ev.indexOf("active_in") >= 0) {
      S.active = { step: 0, win: b.win };
      var color = b.overkill ? pickColor([["rainbow", 60], ["gold", 40]])
        : b.win ? pickColor([["green", 15], ["red", 45], ["gold", 40]])
        : pickColor([["blue", 65], ["green", 30], ["red", 5]]);
      cutin(color, (weak ? "弱点！ " : "") + "活性化バトル");
      message((roleText ? roleText + "！　" : "") + "活性化バトルに突入！");
      return;
    }
    if (b.activeLeft > 0 && S.active) {
      S.active.step++;
      if (S.active.step === 1) {
        var hit = Math.random() < (b.win ? 0.7 : 0.35);
        L.hitFlash = 0.5; if (!S.fast) se("hit");
        message(hit ? "おまえの攻撃が、ヒット！" : "攻撃が、はじかれた……");
        S.active.hit = hit;
      } else if (S.active.step === 2) {
        var guard = Math.random() < (b.win ? 0.6 : 0.25);
        // 勝つときは、ときどき「矛盾」（はじかれたのにカウンター／ヒットしたのにダメージ）にする
        message(guard ? "敵の攻撃をガード → カウンター！" : "敵の攻撃を受けた……！");
        if (b.win && S.active.hit !== guard) big("矛盾！？", "red");
      } else {
        message("決着……！" + (weak ? "（弱点役！）" : ""));
      }
      if (weak) cutin(b.weakCount >= 2 ? "rainbow" : "gold", b.weakCount >= 2 ? "弱点 2回目！" : "弱点！");
      return;
    }
    // ふつうのゲーム
    if (weak) { L.hitFlash = 0.5; }
    if (b.endPrep) message("終了準備中……" + (roleText ? "（" + roleText + "）" : ""));
    else message(m.monster.name + "と交戦中" + (roleText ? "　" + roleText + "！" : ""));
    if (roleText && !weak && Math.random() < 0.5) cutin("blue", roleText);
  }

  // 3つ止まったあと
  function resultEffect(r) {
    var m = S.m, ev = r.event, L = S.lcd;
    while (S.pending.length) S.pending.shift()();
    if (ev.indexOf("cz_lose") >= 0) { big("逃げられた……", ""); message("障害は、どこかへ消えた"); L.monsterId = null; se("lose"); }
    if (ev.indexOf("seven") >= 0) { big("７７７", "gold"); se("seven"); }
    if (ev.indexOf("reward_start") >= 0) { message("討伐報酬！　レバーを叩いて、獲得枚数を決めろ！"); L.monsterId = null; }
    if (ev.indexOf("awaken_start") >= 0) { big("フルスタック覚醒", "purple"); message("毎ゲーム上乗せ！　継続率は……？"); }
    // 討伐報酬の結果
    var rw = m.lastReward;
    if (ev.indexOf("story_start") >= 0 && rw && !rw.shown) {
      rw.shown = true;
      if (rw.kind === "escalation") showEscalation(rw);
      else if (rw.kind === "gold") showGold(rw);
      else { big(rw.get + "枚", "gold"); message("獲得 " + rw.get + "枚" + (rw.weak ? "（弱点役で増えた！）" : "")); se("win"); }
    }
    if (ev.indexOf("awaken_end") >= 0) { big("覚醒終了", "purple"); message("上乗せ合計 " + m.awaken.total + "枚！"); }
    if (ev.indexOf("battle_start") >= 0) {
      L.monsterId = m.monster.id; L.hp = 1; L.mist = 0; S.active = null;
      big(m.monster.sure ? "ゼロデイ出現！！" : "障害交戦", m.monster.sure ? "red" : "blue");
      message(m.monster.name + " が現れた！　" + weakText(m.monster));
      S.fast = false;
    }
    if (ev.indexOf("active_lose") >= 0) { big("撤退……", ""); message("まだ、交戦は続く"); S.active = null; se("lose"); }
    if (ev.indexOf("battle_win") >= 0) { L.hp = 0; L.hitFlash = 1; big("討伐！！", "gold"); message("勝利！　" + (m.data.chain) + "連目"); se("win"); S.active = null; }
    if (ev.indexOf("battle_win_overkill") >= 0) {
      L.hp = 0; L.hitFlash = 1.5; big("OVERKILL!!", "rainbow"); message("オーバーキル！！　フルスタック覚醒へ！"); S.active = null;
      playOverkill();
    }
    if (ev.indexOf("upper_in") >= 0) { S.pending.push(function () { big("ゼロデイモード", "red"); message("上位ST 突入！　ゼロデイが現れやすくなった"); }); }
    if (ev.indexOf("endprep") >= 0) { message("終了準備中……　黒いもやが、近づいてくる"); }
    if (ev.indexOf("at_end") >= 0) {
      big("おつかれさまでした", "keep"); message("AT 終了　獲得 " + m.data.getThisAt + "枚"); L.monsterId = null; L.mist = 0; S.fast = false; se("lose");
    }
    if (m.mode === "battle" && m.battle.endPrep) L.mist = Math.min(1, L.mist + 0.25);
    if (m.mode === "battle" && !m.battle.endPrep) L.hp = Math.max(0.05, m.left / E.ST_GAMES);
    if (m.mode !== "story" && m.mode !== "awaken") S.fast = false;
  }

  // エスカレーション：510 → 750 → … と1段ずつ上がる
  function showEscalation(rw) {
    var lad = S.dom.lcdLadder, steps = rw.steps, i = 0;
    lad.innerHTML = E.ESCALATION.map(function (v) { return "<span>" + v + "</span>"; }).join("");
    lad.className = "slot_ladder on";
    S.revealing = true; refresh();
    message("エスカレーション！　どこまで上がる！？");
    var spans = lad.querySelectorAll("span");
    (function step() {
      if (!S) return;
      spans[i].className = "lit"; se("levelup");
      if (++i < steps.length) setTimeout(guard(step), S.fast ? 60 : 650);
      else setTimeout(guard(function () {
        if (!S) return;
        lad.className = "slot_ladder";
        S.revealing = false; refresh();
        big(rw.get + "枚！", "gold"); message("獲得 " + rw.get + "枚！" + (steps.length === E.ESCALATION.length ? "　最上段！！" : ""));
        se("win");
      }), S.fast ? 100 : 900);
    })();
  }
  // 金のパッチ：金色の画面で、数字が回って止まる
  function showGold(rw) {
    var L = S.lcd, n = 0, vals = [510, 750, 1000, 2000, 3000];
    L.gold = 3.5; se("gold");
    S.revealing = true; refresh();
    message("金のパッチ！！");
    (function roll() {
      if (!S) return;
      if (n++ < 18) { big(vals[n % 5] + "枚", "gold"); setTimeout(guard(roll), 90 + n * 8); }
      else { S.revealing = false; refresh(); big(rw.get + "枚！！", "gold"); message("金のパッチ　獲得 " + rw.get + "枚！"); se("win"); }
    })();
  }

  // =========================================================
  // 毎フレームの描画
  // =========================================================
  // 毎フレームの処理。途中で JS のエラーが起きたら、台を止めて精算し、シナリオに戻す（詰まらないように）
  function loop(now) {
    try { step(now); }
    catch (e) { emergency(e); }
  }
  // ボタンやキーから呼ぶ処理も、同じようにエラーから守る
  function guard(fn) {
    return function () {
      try { return fn.apply(this, arguments); }
      catch (e) { emergency(e); }
    };
  }
  function emergency(e) {
    if (window.console) console.error("[slot] エラーが起きたので、精算して台を閉じます", e);
    if (!S) return;
    var yen = S.credit * YEN;
    var result = { money: S.money + yen, invest: S.invest, back: S.back + yen, games: S.games,
                   at: S.m.data.at, maxGet: S.m.data.maxGet, error: true };
    var opt = S.opt;
    try { close(); } catch (e2) { S = null; }
    if (opt.onClose) opt.onClose(result);
  }

  function step(now) {
    if (!S) return;
    var dt = S.lastTime ? Math.min(0.05, (now - S.lastTime) / 1000) : 0;
    S.lastTime = now; S.t += dt;
    var m = S.m, i;

    if (S.phase === "freeze") {
      S.timer -= dt;
      if (S.timer <= 0) startReverse();
    } else if (S.phase === "reverse") {
      // 逆回転（下から上へ、ゆっくり戻る）
      S.timer -= dt;
      for (i = 0; i < 3; i++) S.pos[i] = (S.pos[i] - SPIN_SPEED * 0.45 * dt + E.N) % E.N;
      if (S.timer <= 0) { S.phase = "spin"; S.spinning = [true, true, true]; if (S.fast) autoStops(); refresh(); }
    } else if (S.phase === "spin") {
      var allStopped = true;
      for (i = 0; i < 3; i++) {
        if (!S.spinning[i]) continue;
        allStopped = false;
        if (S.target[i] !== null) {
          var dist = (S.target[i] - S.pos[i] + E.N * 2) % E.N;
          if (dist <= SPIN_SPEED * dt + 0.0001 || dist > E.N - 0.5) { S.pos[i] = S.target[i]; S.spinning[i] = false; continue; }
        }
        S.pos[i] = (S.pos[i] + SPIN_SPEED * dt) % E.N;
      }
      if (allStopped) afterStop();
    } else if (S.phase === "idle" && S.fast) {
      // 高速消化：自動で次のゲームへ
      S.timer -= dt;
      if (S.timer <= 0) { S.timer = 0.04; pull(); }
    }

    if (S.lcd.hitFlash > 0) S.lcd.hitFlash -= dt;
    if (S.lcd.gold > 0) S.lcd.gold -= dt;
    drawLcd(S.lcdG, S.lcd, m, S.t);
    drawReels();
    // BGM は状態に合わせて切りかえる
    if (!oneShot) playBgm(bgmFor(m));
    S.raf = requestAnimationFrame(loop);
  }

  function drawReels() {
    var g = S.rg;
    g.fillStyle = "#11131a"; g.fillRect(0, 0, g.canvas.width, g.canvas.height);
    for (var i = 0; i < 3; i++) {
      var x = i * (CELL_W + REEL_GAP);
      g.fillStyle = "#f6f3e8"; g.fillRect(x, 0, CELL_W, CELL_H * 3);
      // 中段（上から2コマ目）に pos のコマ。上には pos+1 が見えていて、下へ流れてくる
      var p = S.pos[i], base = Math.floor(p);
      for (var j = base - 1; j <= base + 2; j++) {
        var y = CELL_H + (p - j) * CELL_H;
        g.drawImage(symbolCanvas(E.sym(i, j)), x, Math.round(y));
      }
      if (S.spinning[i] && S.phase !== "freeze") { g.fillStyle = "rgba(246,243,232,0.25)"; g.fillRect(x, 0, CELL_W, CELL_H * 3); }
      var grd = g.createLinearGradient(0, 0, 0, CELL_H * 3);
      grd.addColorStop(0, "rgba(0,0,0,0.45)"); grd.addColorStop(0.25, "rgba(0,0,0,0)");
      grd.addColorStop(0.75, "rgba(0,0,0,0)"); grd.addColorStop(1, "rgba(0,0,0,0.45)");
      g.fillStyle = grd; g.fillRect(x, 0, CELL_W, CELL_H * 3);
    }
  }

  function seg(n, len) { var s = String(Math.max(0, n)); while (s.length < len) s = " " + s; return s; }

  var MODE_NAME = {
    normal: "通常", cz: "CZ 障害対応チャンス", aim7: "赤7を狙え", reward: "AT 討伐報酬",
    story: "AT ストーリー", battle: "ST 障害交戦", awaken: "フルスタック覚醒"
  };
  function refresh() {
    var d = S.dom, m = S.m;
    d.moneyBox.innerHTML = "所持金<br><b>" + S.money.toLocaleString() + "円</b>";
    var medalYen = S.credit * YEN, diff = S.money + medalYen - S.opt.money;
    d.investBox.innerHTML = "投資 " + S.invest.toLocaleString() + "円<br>メダル " + S.credit + "枚<br>（" + medalYen.toLocaleString() + "円分）<br>" +
      "<span class='" + (diff >= 0 ? "plus" : "minus") + "'>収支 " + (diff >= 0 ? "+" : "") + diff.toLocaleString() + "円</span>";
    d.creditSeg.innerHTML = "<small>CREDIT</small>" + seg(S.credit, 3);
    d.gameSeg.innerHTML = "<small>GAME</small>" + seg(m.sinceBonus, 4);
    d.paySeg.innerHTML = "<small>PAY</small>" + seg(S.lastPay, 2);
    d.dataBox.innerHTML =
      "総ゲーム数<br><b>" + (S.opt.histGames + S.games).toLocaleString() + "</b>" +
      "AT 回数<br><b>" + (S.opt.histAt + m.data.at) + "</b>" +
      "現在のゲーム数<br><b>" + m.sinceBonus + "</b>" +
      "最大獲得枚数<br><b>" + Math.max(S.opt.histMaxGet || 0, m.data.maxGet).toLocaleString() + "</b>";
    var name = MODE_NAME[m.mode] + (m.upper && m.mode === "battle" ? "（ゼロデイモード）" : "");
    if (m.mode === "battle") name += m.battle.endPrep ? "　残り ??G" : "　残り " + m.left + "G";
    if (m.mode === "cz") name += "　残り " + m.left + "G";
    d.lcdMode.innerHTML = name;
    d.lcdSub.innerHTML = (m.mode === "battle") ? weakText(m.monster) : "";
    d.lcdSub.style.display = d.lcdSub.innerHTML ? "" : "none";
    var cnt = "";
    if (m.mode === "story") cnt = "残り <b>" + m.stock + "</b> 枚";
    else if (m.mode === "awaken") cnt = "上乗せ <b>" + m.awaken.total + "</b> 枚";
    if (m.isAT() && m.mode !== "aim7") cnt += (cnt ? "　" : "") + "AT獲得 " + m.data.getThisAt + "枚";
    d.lcdCount.innerHTML = cnt; d.lcdCount.style.display = (cnt && !S.revealing) ? "" : "none";
    d.betBtn.classList.toggle("on", S.bet > 0 || m.betNeeded() === 0);
    d.lever.classList.toggle("ready", S.phase === "idle" && (S.bet > 0 || m.betNeeded() === 0));
    d.lendBtn.disabled = S.money < LEND_YEN;
    var canFast = m.mode === "story" || m.mode === "awaken";
    d.fastBtn.style.display = canFast ? "" : "none";
    if (!canFast) S.fast = false;
    d.fastBtn.classList.toggle("on", S.fast);
    d.fastBtn.innerHTML = S.fast ? "高速消化中<br><small>押すと止める</small>" : "高速消化";
  }

  window.SlotScreen = {
    open: open,
    isOpen: function () { return !!S; },
    state: function () { return S; } // テスト・デバッグ用（遊んでいる台の中身を見る）
  };
})();
