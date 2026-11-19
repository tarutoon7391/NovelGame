/*
 * ST機の画面（ドット絵の仮の側）。st_engine.js（中身）と st_reels.js（リール制御）を使って、
 * 液晶のバトル・リール・右の宝石ランプ・左のポイントカウンタを 640x360 の canvas に描く。
 * 操作: Space = レバー／次のリールを止める・PUSH（ミズチ連打）  Z X C = 左 中 右を止める  R = ST をはじめから
 */
(function () {
  'use strict';
  var W = 640, H = 360;
  var cv = document.getElementById('screen'), g = cv.getContext('2d');
  g.imageSmoothingEnabled = false;
  var R = StReels, A = StArt;

  var LAMPS = [
    { id: 'cherry', color: 'red', name: 'チェリー' },
    { id: 'suika', color: 'green', name: 'スイカ' },
    { id: 'chance', color: 'purple', name: 'チャンス目' },
    { id: 'replay', color: 'blue', name: 'リプレイ' }
  ];
  var ROLE_JA = { none: 'ハズレ', bell3: '3枚役', bell15: '15枚ベル', replay: 'リプレイ', suika: 'スイカ', chance: 'チャンス目', wcherry: '弱チェリー', scherry: '強チェリー', mcherry: '中段チェリー' };
  var WEAPON_COLOR = { isshiki: '#c9d3e0', mizuchi: '#5ad1ff', bendigar: '#ff9a3a', kinnoago: '#ffd23a' };
  var CUTIN = { blue: ['#123a8a', '#5aa9ff'], red: ['#8a1020', '#ff5a6a'], gold: ['#8a6a00', '#ffe066'] };

  // ---------------------------------------------------------------------
  // 状態
  // ---------------------------------------------------------------------
  var m, seed, ui;
  var qs = new URLSearchParams(location.search), firstSeed = qs.has('seed') ? Number(qs.get('seed')) : null;
  function boot() {
    seed = firstSeed != null ? firstSeed : (Math.random() * 1e9) >>> 0;
    firstSeed = null;
    m = StSlot.createMachine({ seed: seed });
    ui = {
      state: 'idle',            // idle / spinning / mizuchi / over
      reels: [0, 1, 2].map(function () { return { pos: Math.random() * R.LENGTH, spinning: false, target: null, settle: 0 }; }),
      ctl: null, game: null, events: [],
      spunAt: 0,
      msg: null,                // { text, sub, color, until }
      fx: null,                 // { kind, until } 撃破・オーバーキルなど
      cutin: null,              // { color, until }
      navi: null,
      win: null,                // 揃ったライン
      mizuchi: null,            // { presses, i, total }
      shownMedals: 0
    };
    m.on(function (e) { ui.events.push(e); });
    say('ST スタート！', 'Space でレバー、Z X C で停止', '#ffd23a', 2500);
  }
  function say(text, sub, color, ms) { ui.msg = { text: text, sub: sub || '', color: color || '#ffffff', until: now() + (ms || 1800) }; }
  function now() { return performance.now(); }

  // ---------------------------------------------------------------------
  // 操作
  // ---------------------------------------------------------------------
  function lever() {
    if (ui.state === 'mizuchi') return pushMizuchi();
    if (ui.state !== 'idle') return;
    ui.events = []; ui.win = null; ui.fx = null;
    ui.view = m.snapshot();   // リールが止まるまでは、レバー前の状態を見せる（結果は止まってから）
    var r = m.lever();
    if (!r) { ui.state = 'over'; say('ST 終了', 'R で ST をはじめから', '#ff6a6a', 99999); return; }
    ui.game = r;
    ui.ctl = R.createReelControl(r.shape);
    ui.reels.forEach(function (rl) { rl.spinning = true; rl.target = null; });
    ui.spunAt = now();
    ui.state = 'spinning';
    ui.navi = r.cutin ? null : (r.navi || null);
    if (r.cutin) { ui.cutin = { color: r.cutin, until: now() + 1600 }; }
    // その場で見せるもの（カットイン・敵決定・武器選択）
    if (r.phase === 'enemySelect') say('対戦相手 抽選中…', '', '#c4a0ff', 900);
    if (r.phase === 'weapon') say('武器 選択中…', '止めると決まる', '#ffd23a', 99999);
  }

  function stop(i) {
    if (ui.state !== 'spinning') return;
    var rl = ui.reels[i];
    if (!rl.spinning || rl.target !== null) return;
    if (now() - ui.spunAt < 250) return;
    var press = R.wrap(Math.floor(rl.pos));
    var res = ui.ctl.stop(i, press);
    if (!res) return;
    rl.target = res.top;
  }
  function nextStop() {
    if (ui.state !== 'spinning') return lever();
    // カットイン中は逆押し（右→中→左）、それ以外は左から
    var order = ui.game && ui.game.cutin ? [2, 1, 0] : [0, 1, 2];
    for (var k = 0; k < 3; k++) { var rl = ui.reels[order[k]]; if (rl.spinning && rl.target === null) return stop(order[k]); }
  }

  function pushMizuchi() {
    var mz = ui.mizuchi; if (!mz) return;
    if (mz.i < mz.presses.length) { mz.total += mz.presses[mz.i]; mz.i++; mz.pop = now(); }
    if (mz.i >= mz.presses.length) {
      ui.mizuchi = null; ui.state = 'idle';
      say('ミズチ ' + mz.total + '枚！', '連打 ' + mz.presses.length + '回', '#5ad1ff', 2200);
    }
  }

  // 全リールが止まったら、そのゲームの結果を見せる
  function allStopped() {
    ui.state = 'idle'; ui.navi = null; ui.msg = null;
    var grid = R.gridAt(ui.ctl.tops);
    ui.win = R.lineWin(grid);
    var r = ui.game, show = [];
    ui.events.forEach(function (e) {
      var d = e.data;
      if (e.type === 'enemy') show.push(['VS ' + d.name, '弱点: ' + (d.lamps.map(function (l) { return LAMPS.filter(function (x) { return x.id === l; })[0].name; }).join('・') || 'なし'), '#c4a0ff']);
      if (e.type === 'battleStart') { show.push(['BATTLE!', d.final ? '勝利確定バトル' : '4G のあいだ ST のゲーム数が減らない', '#ff6a6a']); }
      if (e.type === 'direct' && d.inBattle) ui.fx = { kind: 'hit', until: now() + 900 };
      if (e.type === 'overkill') { ui.fx = { kind: 'overkill', until: now() + 1500 }; show.push(['OVERKILL!!', 'ボーナス上乗せ', '#ff3aa0']); }
      if (e.type === 'battleEnd') {
        if (d.win) { ui.fx = { kind: d.overkill ? 'overkill' : 'win', until: now() + 1500 }; show.push(['撃破！', d.upperCZ ? '上位ATのCZへ（未実装）' : 'ボーナス確定', '#ffd23a']); }
        else show.push(['逃げられた…', '', '#8d99a8']);
      }
      if (e.type === 'vstock') show.push(['7 揃い！', 'V ストック ' + d.count + '個', '#ff3a3a']);
      if (e.type === 'vstockRevive') show.push(['V ストック 発動！', '復活してボーナス放出', '#ff3a3a']);
      if (e.type === 'weapon') {
        show.push([d.name, d.id === 'mizuchi' ? 'ボタンを連打しろ！（Space）' : d.medals + '枚' + (d.overkill ? ' ＋' + d.overkill : ''), WEAPON_COLOR[d.id]]);
        if (d.id === 'mizuchi') { ui.mizuchi = { presses: d.presses, i: 0, total: 0, pop: 0 }; ui.state = 'mizuchi'; }
      }
      if (e.type === 'pointsMax') show.push(['ポイント MAX！', '次のバトルの弱点 +1', '#ffd23a']);
      if (e.type === 'bonusEnd') show.push(['ボーナス終了', d.medals + '枚獲得', '#ffd23a']);
      if (e.type === 'ending') show.push(['ENDING', 'おめでとう！', '#ffffff']);
      if (e.type === 'stEnd') { ui.state = 'over'; show.push(['ST 終了', '一連 ' + d.chainMedals + '枚 ／ R ではじめから', '#ff6a6a']); }
    });
    if (r.direct && !r.battleStart && !(r.battle)) { /* ST中の直撃はバトル開始と一緒に見せる */ }
    if (r.critical) show.unshift(['CRITICAL!', ROLE_JA[r.role] + ' は弱点！', '#ffd23a']);
    if (show.length) { var last = show[show.length - 1]; say(last[0], last[1], last[2], ui.state === 'over' ? 99999 : 2200); if (show.length > 1) { var first = show[0]; ui.sub2 = { text: first[0] + '　' + first[1], until: now() + 2200 }; } }
  }

  // ---------------------------------------------------------------------
  // 描画
  // ---------------------------------------------------------------------
  function txt(s, x, y, size, col, align, bold) {
    g.font = (bold ? 'bold ' : '') + size + 'px "DotGothic16", "MS Gothic", monospace';
    g.textAlign = align || 'left'; g.textBaseline = 'alphabetic';
    g.fillStyle = '#000'; g.fillText(s, x + 1, y + 1);
    g.fillStyle = col || '#fff'; g.fillText(s, x, y);
  }
  function box(x, y, w, h, fill, line) { g.fillStyle = line || '#000'; g.fillRect(x - 2, y - 2, w + 4, h + 4); g.fillStyle = fill; g.fillRect(x, y, w, h); }
  function img(c, x, y, scale, flip) {
    if (flip) { g.save(); g.translate(x + c.width * scale, y); g.scale(-1, 1); g.drawImage(c, 0, 0, c.width * scale, c.height * scale); g.restore(); }
    else g.drawImage(c, x, y, c.width * scale, c.height * scale);
  }

  var LCD = { x: 120, y: 14, w: 400, h: 150 };
  var REEL = { x: 214, y: 182, cw: 64, ch: 34, gap: 8 };

  function drawCabinet(t) {
    g.fillStyle = '#0b0d14'; g.fillRect(0, 0, W, H);
    // 筐体の枠
    box(108, 6, 424, 346, '#1a1e2c', '#3a3f5a');
    for (var i = 0; i < 424; i += 16) { g.fillStyle = (Math.floor(t / 120) + i / 16) % 8 < 1 ? '#ffd23a' : '#2a2f45'; g.fillRect(108 + i, 4, 8, 2); g.fillRect(108 + i, 352, 8, 2); }
  }

  function drawLCD(t, s) {
    var x = LCD.x, y = LCD.y, w = LCD.w, h = LCD.h;
    // 背景（状態で色が変わる）
    var bg = s.phase === 'bonus' ? ['#3a2a00', '#7a5a10'] : s.battle ? ['#3a0a14', '#7a1a2a'] : s.phase === 'weapon' ? ['#1a2a3a', '#2a4a6a'] : ['#141a3a', '#3a2a5a'];
    var grad = g.createLinearGradient(0, y, 0, y + h); grad.addColorStop(0, bg[0]); grad.addColorStop(1, bg[1]);
    box(x, y, w, h, '#000', '#5a6080'); g.fillStyle = grad; g.fillRect(x, y, w, h);
    // 星・地面
    for (var k = 0; k < 18; k++) { var sx = x + ((k * 97 + Math.floor(t / 40)) % w), sy = y + (k * 31) % 70; g.fillStyle = k % 3 ? '#ffffff55' : '#ffd23a88'; g.fillRect(sx, sy, 2, 2); }
    g.fillStyle = '#00000066'; g.fillRect(x, y + 118, w, 32);
    g.fillStyle = '#ffffff22'; for (var gx = 0; gx < w; gx += 20) g.fillRect(x + gx + ((t / 30) % 20), y + 118, 10, 1);

    var bob = Math.floor(t / 300) % 2;
    // 主人公
    var hx = x + 60, hy = y + 50;
    if (ui.fx && ui.fx.until > t && (ui.fx.kind === 'hit' || ui.fx.kind === 'win' || ui.fx.kind === 'overkill')) hx += 150 * Math.min(1, (1 - (ui.fx.until - t) / 900));
    img(A.hero(bob), hx, hy, 3);
    // 敵
    if (s.enemy) {
      var ex = x + w - 140, ey = y + 22;
      var hit = ui.fx && ui.fx.until > t && Math.floor(t / 60) % 2;
      if (!hit) img(A.enemy(s.enemy.id, bob, Math.floor(t / 150)), ex, ey, 3);
      // 名前
      box(x + w - 158, y + 8, 150, 16, '#000000aa', '#ffffff55');
      txt(s.enemy.name, x + w - 83, y + 21, 12, '#ffffff', 'center');
    } else {
      txt('？？？', x + w - 90, y + 80, 22, '#c4a0ff', 'center', true);
    }
    // 上の帯: 状態
    var label = s.phase === 'bonus' ? 'BONUS' : s.battle ? (s.battle.final ? 'FINAL BATTLE' : 'BATTLE') : s.phase === 'weapon' ? 'WEAPON SELECT' : s.phase === 'enemySelect' ? 'ENEMY SELECT' : s.phase === 'end' ? 'GAME OVER' : 'ST';
    box(x + 6, y + 8, 120, 16, '#000000aa', '#ffffff55'); txt(label, x + 66, y + 21, 12, '#ffd23a', 'center', true);
    // 下の帯: 残りゲーム数・ボーナス
    var info = s.bonus ? ('獲得 ' + s.bonus.paid + ' / ' + s.bonus.target + ' 枚') : s.battle ? ('バトル 残り ' + s.battle.left + 'G　（ST ' + s.stGames + 'G で止まっている）') : s.enemy ? ('ST 残り ' + s.stGames + 'G') : '';
    txt(info, x + 10, y + h - 10, 12, '#ffffff');
    if (s.vstock) txt('V×' + s.vstock, x + w - 10, y + h - 10, 12, '#ff5a5a', 'right', true);

    // ナビ（ST中: 3枚役かリプレイ。ボーナス中: 黄と白）
    if (ui.navi && ui.state === 'spinning') {
      var nv = ui.navi === 'yellow' ? ['15枚ベル を狙え！', '#ffd23a'] : ui.navi === 'white' ? ['？ を狙え', '#ffffff'] : ['3枚役？ リプレイ？', '#9fd0ff'];
      txt(nv[0], x + w / 2, y + 42, 16, nv[1], 'center', true);
    }
    // ミズチ連打
    if (ui.mizuchi) {
      var mz = ui.mizuchi, pop = t - mz.pop < 200 ? 4 : 0;
      g.fillStyle = '#00000099'; g.fillRect(x, y + 30, w, 80);
      txt('連打しろ！', x + w / 2, y + 60, 22, '#5ad1ff', 'center', true);
      txt(mz.total + ' 枚', x + w / 2, y + 96 + pop, 26 + pop, '#ffffff', 'center', true);
      if (mz.i > 0) txt('+' + mz.presses[mz.i - 1], x + w / 2 + 90, y + 96, 16, '#ffd23a', 'left', true);
    }
    // メッセージ
    if (ui.msg && ui.msg.until > t) {
      g.fillStyle = '#000000aa'; g.fillRect(x, y + 52, w, 44);
      txt(ui.msg.text, x + w / 2, y + 76, 20, ui.msg.color, 'center', true);
      if (ui.msg.sub) txt(ui.msg.sub, x + w / 2, y + 92, 11, '#ffffff', 'center');
    }
    if (ui.sub2 && ui.sub2.until > t) txt(ui.sub2.text, x + w / 2, y + 44, 11, '#ffd23a', 'center');
    // エフェクト
    if (ui.fx && ui.fx.until > t && ui.fx.kind === 'overkill') { g.fillStyle = Math.floor(t / 70) % 2 ? '#ff3aa055' : '#ffffff33'; g.fillRect(x, y, w, h); }
    // カットイン
    if (ui.cutin && ui.cutin.until > t) {
      var c = CUTIN[ui.cutin.color], k2 = 1 - (ui.cutin.until - t) / 1600, cx = x - w + Math.min(1, k2 * 4) * w;
      g.fillStyle = c[0]; g.fillRect(cx, y + 40, w, 70); g.fillStyle = c[1]; g.fillRect(cx, y + 44, w, 4); g.fillRect(cx, y + 102, w, 4);
      txt('7 を狙え！', cx + w / 2, y + 82, 28, '#ffffff', 'center', true);
      txt('逆押し（右から）', cx + w / 2, y + 100, 11, '#ffffff', 'center');
    } else if (ui.game && ui.game.cutin && ui.state === 'spinning') {
      txt('▶ 逆押し（右から）で 7 を狙え', x + w / 2, y + 42, 13, CUTIN[ui.game.cutin][1], 'center', true);
    }
  }

  function drawReels(t) {
    var x0 = REEL.x, y0 = REEL.y, cw = REEL.cw, ch = REEL.ch, gap = REEL.gap;
    box(x0 - 6, y0 - 6, cw * 3 + gap * 2 + 12, ch * 3 + 12, '#000', '#5a6080');
    for (var i = 0; i < 3; i++) {
      var rl = ui.reels[i], rx = x0 + i * (cw + gap);
      g.save(); g.beginPath(); g.rect(rx, y0, cw, ch * 3); g.clip();
      g.fillStyle = '#f4f1e8'; g.fillRect(rx, y0, cw, ch * 3);
      var top = Math.floor(rl.pos), frac = rl.pos - top;
      for (var row = -1; row < 4; row++) {
        var sym = R.STRIPS[i][R.wrap(top + row)];
        var sy = y0 + (row - frac) * ch;   // pos が減ると下へ流れる
        img(A.symbol(sym), rx + 16, Math.round(sy + 1), 2);
      }
      if (rl.spinning && rl.target === null) { g.fillStyle = '#ffffff44'; g.fillRect(rx, y0, cw, ch * 3); }
      g.restore();
      // 停止ボタン
      var lit = rl.spinning && rl.target === null && ui.state === 'spinning';
      box(rx + 16, 300, 32, 14, lit ? '#ff5a3a' : '#3a3f5a', '#000');
      txt(['Z', 'X', 'C'][i], rx + 32, 311, 10, lit ? '#ffffff' : '#8d99a8', 'center', true);
    }
    // 入賞ライン
    if (ui.win && ui.state !== 'spinning') {
      g.strokeStyle = Math.floor(t / 150) % 2 ? '#ffd23a' : '#ffffff'; g.lineWidth = 2; g.beginPath();
      var L = ui.win === 'bell3' ? [0, 1, 2] : ui.win === 'bell15' ? [0, 0, 0] : [1, 1, 1];
      for (var j = 0; j < 3; j++) { var px = x0 + j * (cw + gap) + cw / 2, py = y0 + L[j] * ch + ch / 2; j ? g.lineTo(px, py) : g.moveTo(px, py); }
      g.stroke();
    }
    // レバー・PUSH
    var canLever = ui.state === 'idle';
    box(150, 290, 40, 30, '#2a2f45', '#000'); g.fillStyle = canLever ? '#ff3a3a' : '#5a2a2a'; g.fillRect(162, 270 + (canLever ? 0 : 10), 16, 16); g.fillStyle = '#c9d3e0'; g.fillRect(168, 286, 4, 10);
    txt('Space', 170, 334, 10, '#8d99a8', 'center');
    var canPush = ui.state === 'mizuchi';
    box(456, 290, 40, 30, canPush ? '#5ad1ff' : '#2a2f45', '#000'); txt('PUSH', 476, 309, 10, canPush ? '#000' : '#8d99a8', 'center', true);
  }

  function drawGems(t, s) {
    var x = 548, extra = s.battle ? s.battle.extraLamps : [];
    txt('弱点', x + 22, 30, 11, '#c9d3e0', 'center', true);
    LAMPS.forEach(function (L, k) {
      var on = s.lamps.indexOf(L.id) >= 0, ex = extra.indexOf(L.id) >= 0, y = 40 + k * 56;
      if (on) {   // 光
        var pulse = 0.5 + 0.5 * Math.sin(t / 200 + k);
        g.fillStyle = { red: '#ff3a5a', green: '#5aff7a', purple: '#b07aff', blue: '#5aa9ff' }[L.color] + (pulse > 0.5 ? '66' : '33');
        g.fillRect(x - 4, y - 4, 52, 52);
      }
      img(A.gem(L.color, on), x + 2, y, 2);
      if (on && Math.floor(t / 250 + k) % 4 === 0) { g.fillStyle = '#ffffff'; g.fillRect(x + 12, y + 8, 3, 3); }
      if (ex) txt('+', x + 42, y + 12, 14, '#ffffff', 'center', true);
      txt(L.name, x + 22, y + 52, 10, on ? '#ffffff' : '#5a6080', 'center');
    });
  }

  function drawPoints(t, s) {
    var x = 30, y = 30, inBonus = s.phase === 'bonus';
    txt('POINT', x + 25, y - 6, 11, inBonus ? '#ffd23a' : '#5a6080', 'center', true);
    box(x + 10, y, 30, 200, '#0a0c14', '#3a3f5a');
    for (var k = 0; k < 20; k++) {
      var on = k < s.points;
      g.fillStyle = on ? (k > 15 ? '#ff5a3a' : '#ffd23a') : '#1a1e2c';
      g.fillRect(x + 13, y + 197 - (k + 1) * 10 + 1, 24, 8);
    }
    txt(s.points + '/20', x + 25, y + 216, 11, '#ffffff', 'center');
    if (s.extraLamps) txt('弱点+' + s.extraLamps, x + 25, y + 232, 11, '#ffd23a', 'center', true);
    txt('差枚', x + 25, 300, 10, '#8d99a8', 'center'); txt(String(s.totalNet), x + 25, 314, 12, '#ffffff', 'center', true);
    txt('一連', x + 25, 330, 10, '#8d99a8', 'center'); txt(String(s.chainMedals), x + 25, 344, 12, '#ffffff', 'center', true);
  }

  // ---------------------------------------------------------------------
  // ループ
  // ---------------------------------------------------------------------
  var last = now();
  function frame(t) {
    var dt = Math.min(50, t - last); last = t;
    // リールを回す（下へ流れる = pos が減る）
    var speed = 0.018 * dt * R.LENGTH / 21 * 1.2;
    var spinning = 0;
    ui.reels.forEach(function (rl) {
      if (!rl.spinning) return;
      spinning++;
      if (rl.target === null) { rl.pos -= speed; if (rl.pos < 0) rl.pos += R.LENGTH; return; }
      // 目標まで滑る
      var d = R.wrap(Math.floor(rl.pos) - rl.target) + (rl.pos - Math.floor(rl.pos));
      if (d <= speed) { rl.pos = rl.target; rl.spinning = false; rl.target = null; spinning--; }
      else { rl.pos -= Math.min(speed, d); if (rl.pos < 0) rl.pos += R.LENGTH; }
    });
    if (ui.state === 'spinning' && ui.reels.every(function (rl) { return !rl.spinning; })) allStopped();

    var s = ui.state === 'spinning' && ui.view ? ui.view : m.snapshot();
    drawCabinet(t);
    drawLCD(t, s);
    drawReels(t);
    drawGems(t, s);
    drawPoints(t, s);
    requestAnimationFrame(frame);
  }

  // ---------------------------------------------------------------------
  // 入力
  // ---------------------------------------------------------------------
  document.addEventListener('keydown', function (e) {
    if (e.repeat) return;
    if (e.code === 'Space' || e.code === 'Enter') { e.preventDefault(); if (ui.state === 'spinning') nextStop(); else lever(); }
    else if (e.code === 'KeyZ' || e.code === 'ArrowLeft') stop(0);
    else if (e.code === 'KeyX' || e.code === 'ArrowDown') stop(1);
    else if (e.code === 'KeyC' || e.code === 'ArrowRight') stop(2);
    else if (e.code === 'KeyB') pushMizuchi();
    else if (e.code === 'KeyR') boot();
  });
  cv.addEventListener('pointerdown', function (e) {
    var r = cv.getBoundingClientRect(), x = (e.clientX - r.left) * W / r.width, y = (e.clientY - r.top) * H / r.height;
    for (var i = 0; i < 3; i++) { var rx = REEL.x + i * (REEL.cw + REEL.gap); if (x >= rx && x <= rx + REEL.cw && y >= 290 && y <= 320) return stop(i); }
    if (x >= 140 && x <= 200 && y >= 260 && y <= 330) return lever();
    if (x >= 450 && x <= 500 && y >= 285 && y <= 325) return pushMizuchi();
    if (ui.state === 'over') return boot();
    if (ui.state === 'spinning') nextStop(); else lever();
  });

  boot();
  requestAnimationFrame(frame);
  window.StScreen = { machine: function () { return m; }, ui: function () { return ui; } };
})();
