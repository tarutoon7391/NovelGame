/*
 * ST機の画面（ドット絵の仮の側）。st_engine.js（中身）と st_reels.js（リール制御）を使って、
 * 液晶のバトル・リール・右の宝石ランプ・左のポイントカウンタを 640x360 の canvas に描く。
 * 操作: Space = レバー／次のリールを止める・PUSH（ミズチ連打）  Z X C = 左 中 右を止める  R = ST をはじめから  Esc = 精算（組み込み時）
 *
 * 見せ方の決まり（結果が先に見えないように）
 * - 液晶の結果はリールが全部止まってから。バトルは4Gすべてに演出（1G 味方の攻撃／2G 敵の攻撃／3G つばぜり合いのオーラ／4G 決着）
 * - 4G目の復活は「違和感」だけで知らせる（第3停止が押せない／第3停止後にレバーが効かない → 2秒後に起き上がって勝利）
 * - ボーナス当選後: 7揃い（擬似遊技）の第3停止で武器 → 次のゲームのレバーで枚数 → その出目で「隠していた小役」を見せる（液晶では言わない）
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
  var RARE_JA = { suika: ['スイカ！', '#5aff7a'], chance: ['チャンス目！', '#b07aff'], wcherry: ['チェリー！', '#ff7a90'], scherry: ['強チェリー！！', '#ff3a5a'], mcherry: ['中段チェリー！！！', '#ffd23a'] };
  var WEAPON_COLOR = { isshiki: '#c9d3e0', mizuchi: '#5ad1ff', bendigar: '#ff9a3a', kinnoago: '#ffd23a' };
  var CUTIN = { blue: ['#123a8a', '#5aa9ff'], red: ['#8a1020', '#ff5a6a'], gold: ['#8a6a00', '#ffe066'] };
  var AURA = { blue: '#3a8aff', red: '#ff3a3a' };
  var FX1 = { guard: ['ガード！', '#c9d3e0'], hit: ['ヒット！', '#ffd23a'], critical: ['クリティカルヒット！！', '#ff3a5a'] };
  var FX2 = { hit: ['被弾…', '#ff9a9a'], guard: ['ガード！', '#5aa9ff'], counter: ['反撃！！', '#ff3a5a'] };
  var LOCK_MS = 2000;
  // 敵選択のクリスタル（左上から、上の段→下の段）
  var CRYSTALS = ['aither', 'tsukuyomi', 'tezcatlipoca', 'amaterasu', 'hannibal', 'venus', 'caligula', 'dyaus'];
  // 4分割の液晶（時計回りに光る: 左上 白 → 右上 青 → 右下 赤 → 左下 緑）
  var PANEL = [{ c: 'white', col: '#f4f4f4', dx: 0, dy: 0 }, { c: 'blue', col: '#3a8aff', dx: 1, dy: 0 }, { c: 'red', col: '#ff3a3a', dx: 1, dy: 1 }, { c: 'green', col: '#3fd46a', dx: 0, dy: 1 }];
  var MINION_HEX = { red: '#ff3a5a', green: '#5aff7a', purple: '#b07aff', blue: '#5aa9ff' };

  // ---------------------------------------------------------------------
  // 状態
  // ---------------------------------------------------------------------
  var m, seed, ui;
  var qs = new URLSearchParams(location.search), firstSeed = qs.has('seed') ? Number(qs.get('seed')) : null;

  // ノベルゲームに組み込むとき（?embed=1&money=所持金）: 1枚20円、クレジットが足りないと1,000円で50枚借りる。Esc で精算して帰る
  var EMBED = qs.get('embed') === '1';
  var MONEY0 = Math.max(0, Math.floor(Number(qs.get('money')) || 0));
  var wallet = { credit: 0, invest: 0, games: 0 }, closed = false;
  var PAY = { bell15: 15, bell3: 3, replay: 3 };
  function post(msg) { try { if (window.parent !== window) window.parent.postMessage(Object.assign({ source: 'st-slot' }, msg), '*'); } catch (e) { /* 単体 */ } }
  function ensureCredit() {
    if (!EMBED || wallet.credit >= 3) return true;
    if (MONEY0 - wallet.invest < 1000) return false;
    wallet.invest += 1000; wallet.credit += 50;
    return true;
  }
  function settle() {
    if (!EMBED || closed || (ui.state !== 'idle' && ui.state !== 'over') || locked()) return;
    closed = true;
    var back = wallet.credit * 20;
    post({ type: 'close', result: { money: MONEY0 - wallet.invest + back, invest: wallet.invest, back: back, games: wallet.games, at: 0, maxGet: 0 } });
  }

  function boot() {
    seed = firstSeed != null ? firstSeed : (Math.random() * 1e9) >>> 0;
    firstSeed = null;
    m = StSlot.createMachine({ seed: seed });
    ui = {
      state: 'idle',            // idle / spinning / count（枚数決定）/ over
      reels: [0, 1, 2].map(function () { return { pos: Math.random() * R.LENGTH, spinning: false, target: null }; }),
      ctl: null, game: null, events: [],
      spunAt: 0,
      msg: null, sub2: null,
      cutin: null, navi: null, win: null,
      count: null,              // 枚数決定画面 { id, medals, overkill, ... }
      bfx: null,                // そのゲームのバトル演出 { fx, at, done }
      scene: null,              // 液晶に残しておく場面（敗北の暗転・勝利の虹枠など） { kind, at }
      lock: null,               // 違和感 { kind: 'stop'|'lever', from }
      revivedAt: 0,
      bonusTitle: null          // ボーナス当選後に見せている武器・枚数 { name, color, medals }
    };
    m.on(function (e) { ui.events.push(e); });
    say('ST スタート！', EMBED ? 'Space でレバー ／ Esc で精算して帰る' : 'Space でレバー、Z X C で停止', '#ffd23a', 2500);
  }
  function say(text, sub, color, ms) { ui.msg = { text: text, sub: sub || '', color: color || '#ffffff', until: now() + (ms || 1800) }; }
  function now() { return performance.now(); }
  function locked() { return !!ui.lock; }

  // ---------------------------------------------------------------------
  // 操作
  // ---------------------------------------------------------------------
  function lever() {
    if (ui.state === 'count') return pushDown();
    if (ui.state !== 'idle' || locked()) return;
    if (!ensureCredit()) { say('所持金が足りない…', 'Esc で精算して帰る', '#ff6a6a', 2500); return; }
    if (EMBED) { wallet.credit -= 3; wallet.games++; }
    ui.events = []; ui.win = null; ui.msg = null; ui.sub2 = null; ui.cutin = null;
    ui.view = m.snapshot();   // リールが止まるまでは、レバー前の状態を見せる（結果は止まってから）
    var r = m.lever();
    if (!r) { ui.state = 'over'; say('ST 終了', EMBED ? 'R でもう一度 ／ Esc で精算' : 'R で ST をはじめから', '#ff6a6a', 99999); return; }
    ui.game = r;
    ui.ctl = R.createReelControl(r.shape, r.naviOrder);
    ui.reels.forEach(function (rl) { rl.spinning = true; rl.target = null; });
    ui.spunAt = now();
    ui.state = 'spinning';
    ui.navi = r.cutin ? null : (r.navi || null);
    if (r.cutin) ui.cutin = { color: r.cutin, until: now() + 1600 };

    // バトルの演出はレバーで始まる（結果は止まってから）
    ui.bfx = r.battleFx ? { fx: r.battleFx, at: now(), done: false } : null;
    if (r.battleFx && r.battleFx.n !== 4) ui.scene = null;
    if (r.battleFx && r.battleFx.n === 4) {
      // 4G目: 3G目までに勝っていれば虹枠で勝利。そうでなければ倒れて暗転（復活は違和感で）
      ui.scene = { kind: r.battleFx.kind === 'victory' ? 'victory' : 'down', at: now(), overkill: r.battleFx.overkill };
    } else if (!r.battleFx && r.phase !== 'seven' && r.phase !== 'reveal') {
      if (ui.scene && (ui.scene.kind === 'down' || ui.scene.kind === 'victory')) ui.scene = null;
    }

    // ボーナス当選後
    if (r.phase === 'seven') { ui.scene = { kind: 'bonus', at: now() }; ui.bonusTitle = null; say('BONUS！', '7 を揃えろ！', '#ffd23a', 99999); }
    if (r.phase === 'reveal') {
      // レバーで枚数を見せる（どの小役で当たったかは、このゲームの出目で知らせる）
      var w = r.weapon;
      ui.bonusTitle = { name: w.name, color: WEAPON_COLOR[w.id], medals: null, overkill: w.overkill };   // 枚数は止まったあとの枚数決定画面で
    }
    if (r.phase === 'bonus') ui.bonusTitle = null;
    ui.select = r.phase === 'enemySelect' ? { at: now(), enemy: r.enemy, done: 0 } : null;
    ui.stfx = r.stFx ? { fx: r.stFx, at: now(), done: 0, battle: !!r.battleStart } : null;
  }

  function stop(i) {
    if (ui.state !== 'spinning') return;
    var rl = ui.reels[i];
    if (!rl.spinning || rl.target !== null) return;
    if (now() - ui.spunAt < 250) return;
    // 違和感（第3停止が押せない）: 2つ止めたあと、2秒たって起き上がるまで3つ目が効かない
    var stoppedCount = ui.reels.filter(function (x) { return !x.spinning || x.target !== null; }).length;
    if (stoppedCount === 2 && reviveKind() === 'stopLock' && ui.revivedAt === 0) {
      if (!ui.lock) ui.lock = { kind: 'stop', from: now() };
      return;
    }
    var press = R.wrap(Math.floor(rl.pos));
    var res = ui.ctl.stop(i, press);
    if (!res) return;
    rl.target = res.top;
  }
  function reviveKind() { var f = ui.bfx && ui.bfx.fx; return f && f.kind === 'revive' ? f.revive : null; }

  function nextStop() {
    if (ui.state !== 'spinning') return lever();
    // カットイン中は逆押し（右→中→左）、押し順ナビがあればその順、それ以外は左から
    var order = ui.game && ui.game.cutin ? [2, 1, 0] : ui.game && ui.game.naviOrder ? ui.game.naviOrder : [0, 1, 2];
    for (var k = 0; k < 3; k++) { var rl = ui.reels[order[k]]; if (rl.spinning && rl.target === null) return stop(order[k]); }
  }

  // ---------------------------------------------------------------------
  // 枚数決定画面（武器ごと）
  //   一式: ボタン1回で枚数 / ミズチ: 連打 / ベンディガー: 長押しでオーラが上がり、上がり切ったら「離せ」→ 離すと枚数
  //   金ノ顎: ボタンで開始。510 → 750 → 1000 → 2000 → 3000 の数字を1つずつ自動で壊していく
  // ---------------------------------------------------------------------
  var BEN_LEVELS = [{ c: 'white', col: '#f4f4f4', min: 0 }, { c: 'blue', col: '#3a8aff', min: 300 }, { c: 'green', col: '#3fd46a', min: 510 }, { c: 'red', col: '#ff3a3a', min: 750 }, { c: 'rainbow', col: null, min: 1000 }];
  var KIN_STEPS = [510, 750, 1000, 2000, 3000];
  function startCount(d) {
    var c = { id: d.id, name: d.name, medals: d.medals, overkill: d.overkill, presses: d.presses, at: now(), shown: false };
    if (d.id === 'mizuchi') { c.i = 0; c.total = 0; c.pop = 0; }
    if (d.id === 'bendigar') { c.level = 0; c.max = 0; BEN_LEVELS.forEach(function (L, k) { if (d.medals >= L.min) c.max = k; }); c.holding = false; c.holdMs = 0; }
    if (d.id === 'kinnoago') { c.started = false; c.step = 0; c.stepAt = 0; }
    ui.count = c; ui.state = 'count';
  }
  function finishCount() {
    var c = ui.count; c.shown = true; c.shownAt = now();
    ui.bonusTitle = { name: c.name, color: WEAPON_COLOR[c.id], medals: c.medals + c.overkill, overkill: c.overkill };
  }
  function closeCount() { if (ui.count && ui.count.shown) { ui.count = null; ui.state = 'idle'; } }
  // ボタンを押した
  function pushDown() {
    var c = ui.count; if (!c) return;
    if (c.shown) { if (now() - c.shownAt > 400) closeCount(); return; }
    if (c.id === 'isshiki') return finishCount();
    if (c.id === 'mizuchi') {
      if (c.i < c.presses.length) { c.total += c.presses[c.i]; c.i++; c.pop = now(); }
      if (c.i >= c.presses.length) finishCount();
      return;
    }
    if (c.id === 'bendigar') { c.holding = true; return; }
    if (c.id === 'kinnoago' && !c.started) { c.started = true; c.stepAt = now(); }
  }
  // ボタンを離した（ベンディガー: 上がり切っていたら枚数）
  function pushUp() {
    var c = ui.count; if (!c || c.id !== 'bendigar') return;
    c.holding = false;
    if (c.level >= c.max && !c.shown) finishCount();
  }
  function updateCount(t, dt) {
    var c = ui.count; if (!c) return;
    if (c.shown) { if (t - c.shownAt > 1500) closeCount(); return; }
    if (c.id === 'bendigar' && c.holding && c.level < c.max) {
      c.holdMs += dt;
      if (c.holdMs >= 600) { c.holdMs = 0; c.level++; }
    }
    if (c.id === 'kinnoago' && c.started) {
      // 1つの数字を 1.1 秒見せて、当たっている枚数より小さければ壊して次へ
      if (t - c.stepAt > 1100) {
        if (KIN_STEPS[c.step] < c.medals) { c.step++; c.stepAt = t; }
        else finishCount();
      }
    }
  }

  // 全リールが止まったら、そのゲームの結果を見せる
  function allStopped() {
    ui.state = 'idle'; ui.navi = null; ui.msg = null;
    var grid = R.gridAt(ui.ctl.tops);
    ui.win = R.lineWin(grid);
    var r = ui.game, show = [];
    if (r.naviOrder && !ui.ctl.followed) { m.missLast(); show.push(['取りこぼし…', '押し順ナビに従ってね', '#8d99a8']); }
    if (EMBED) wallet.credit += PAY[ui.win] || 0;
    if (ui.bfx) ui.bfx.done = now();
    if (ui.stfx) ui.stfx.done = now();
    if (ui.select) ui.select.done = now();

    // 違和感（第3停止後にレバーが効かない）
    if (reviveKind() === 'leverLock' && ui.revivedAt === 0) ui.lock = { kind: 'lever', from: now() };

    var inBattle = !!r.battleFx, quiet = inBattle || r.phase === 'seven' || r.phase === 'reveal';
    ui.events.forEach(function (e) {
      var d = e.data;
      if (e.type === 'enemy') {
        ui.scene = null;
        show.push([(d.upper ? '最強ST　' : '') + 'VS ' + d.name, '弱点: ' + (d.lamps.map(function (l) { return LAMPS.filter(function (x) { return x.id === l; })[0].name; }).join('・') || 'なし') + (d.games !== 30 ? '　ST ' + d.games + 'G' : ''), '#c4a0ff']);
      }
      if (e.type === 'battleStart') show.push(['BATTLE!', d.final ? '最後のバトル' : '4G のあいだ ST のゲーム数が減らない', '#ff6a6a']);
      if (e.type === 'vstock') show.push(['7 揃い！', 'V ストック ' + d.count + '個', '#ff3a3a']);
      if (e.type === 'vstockRevive') show.push(['V ストック 発動！', '復活！', '#ff3a3a']);
      if (e.type === 'bonusWin') { ui.bonusTitle = { name: d.name, color: WEAPON_COLOR[d.id], medals: null }; }   // 第3停止で武器（枚数はまだ）
      if (e.type === 'weapon') startCount(d);   // 答え合わせのゲームが止まったら、枚数決定画面
      if (e.type === 'pointsMax') show.push(['ポイント MAX！', '次のバトルの弱点 +1', '#ffd23a']);
      if (e.type === 'bonusEnd') { ui.bonusTitle = null; ui.scene = null; show.push(['ボーナス終了', d.medals + '枚獲得', '#ffd23a']); }
      if (e.type === 'ending') show.push(['ENDING', 'おめでとう！', '#ffffff']);
      if (e.type === 'stEnd') { ui.state = 'over'; ui.scene = null; show.push(['ST 終了', '一連 ' + d.chainMedals + '枚 ／ ' + (EMBED ? 'R でもう一度・Esc で精算' : 'R ではじめから'), '#ff6a6a']); }
    });
    if (!quiet) {
      if (r.critical) show.unshift(['CRITICAL!', ROLE_JA[r.role] + ' は弱点！', '#ffd23a']);
      else if (RARE_JA[r.role] && !r.cutin) show.unshift([RARE_JA[r.role][0], r.upgraded ? 'チェリー変換！' : '', RARE_JA[r.role][1]]);
    }
    if (show.length) {
      var last = show[show.length - 1];
      say(last[0], last[1], last[2], ui.state === 'over' ? 99999 : 2200);
      if (show.length > 1) { var first = show[0]; ui.sub2 = { text: first[0] + '　' + first[1], until: now() + 2200 }; }
    }
  }

  // ---------------------------------------------------------------------
  // 描画の道具
  // ---------------------------------------------------------------------
  function txt(s, x, y, size, col, align, bold) {
    g.font = (bold ? 'bold ' : '') + size + 'px "DotGothic16", "MS Gothic", monospace';
    g.textAlign = align || 'left'; g.textBaseline = 'alphabetic';
    g.fillStyle = '#000'; g.fillText(s, x + 1, y + 1);
    g.fillStyle = col || '#fff'; g.fillText(s, x, y);
  }
  function box(x, y, w, h, fill, line) { g.fillStyle = line || '#000'; g.fillRect(x - 2, y - 2, w + 4, h + 4); g.fillStyle = fill; g.fillRect(x, y, w, h); }
  function img(c, x, y, scale, opts) {
    opts = opts || {};
    g.save();
    if (opts.alpha != null) g.globalAlpha = opts.alpha;
    if (opts.rotate) { g.translate(x + c.width * scale / 2, y + c.height * scale / 2); g.rotate(opts.rotate); g.drawImage(c, -c.width * scale / 2, -c.height * scale / 2, c.width * scale, c.height * scale); }
    else g.drawImage(c, x, y, c.width * scale, c.height * scale);
    g.restore();
  }
  function rainbow(t, k) { return 'hsl(' + ((t / 4 + (k || 0) * 40) % 360) + ',100%,60%)'; }
  function ease(k) { return k < 0 ? 0 : k > 1 ? 1 : 1 - (1 - k) * (1 - k); }

  var LCD = { x: 120, y: 14, w: 400, h: 150 };
  var REEL = { x: 214, y: 182, cw: 64, ch: 34, gap: 8 };

  function drawCabinet(t) {
    g.fillStyle = '#0b0d14'; g.fillRect(0, 0, W, H);
    box(108, 6, 424, 346, '#1a1e2c', '#3a3f5a');
    for (var i = 0; i < 424; i += 16) { g.fillStyle = (Math.floor(t / 120) + i / 16) % 8 < 1 ? '#ffd23a' : '#2a2f45'; g.fillRect(108 + i, 4, 8, 2); g.fillRect(108 + i, 352, 8, 2); }
  }

  // ---------------------------------------------------------------------
  // 液晶
  // ---------------------------------------------------------------------
  function drawLCD(t, s) {
    var x = LCD.x, y = LCD.y, w = LCD.w, h = LCD.h;
    // ボーナスの画面にするのは、ボーナス当選後のゲームから（バトル4G目の勝利は、次のレバーまで見せておく）
    var gp = ui.game && ui.game.phase;
    var bonusLike = gp === 'seven' || gp === 'reveal' || gp === 'bonus' || (!gp && s.phase === 'bonus');
    var bg = bonusLike ? ['#3a2a00', '#7a5a10'] : s.battle ? ['#3a0a14', '#7a1a2a'] : ['#141a3a', '#3a2a5a'];
    var grad = g.createLinearGradient(0, y, 0, y + h); grad.addColorStop(0, bg[0]); grad.addColorStop(1, bg[1]);
    box(x, y, w, h, '#000', '#5a6080'); g.fillStyle = grad; g.fillRect(x, y, w, h);
    g.save(); g.beginPath(); g.rect(x, y, w, h); g.clip();
    for (var k = 0; k < 18; k++) { var sx = x + ((k * 97 + Math.floor(t / 40)) % w), sy = y + (k * 31) % 70; g.fillStyle = k % 3 ? '#ffffff55' : '#ffd23a88'; g.fillRect(sx, sy, 2, 2); }
    g.fillStyle = '#00000066'; g.fillRect(x, y + 118, w, 32);
    g.fillStyle = '#ffffff22'; for (var gx = 0; gx < w; gx += 20) g.fillRect(x + gx + ((t / 30) % 20), y + 118, 10, 1);

    if (ui.select && (ui.game && ui.game.phase === 'enemySelect')) drawCrystals(t, x, y, w);
    else drawFighters(t, s, x, y, w, bonusLike);
    if (ui.stfx && ui.stfx.fx.kind === 'panel') drawPanel(t, x, y);

    // 敗北の暗転（復活したら明るくなる）
    var down = ui.scene && ui.scene.kind === 'down' && !ui.revivedAt;
    if (down) { g.fillStyle = 'rgba(0,0,0,' + Math.min(0.7, (t - ui.scene.at) / 600) + ')'; g.fillRect(x, y, w, h); }
    g.restore();

    // 上の帯
    if (s.enemy && !bonusLike) { box(x + w - 158, y + 8, 150, 16, '#000000aa', '#ffffff55'); txt(s.enemy.name, x + w - 83, y + 21, 12, '#ffffff', 'center'); }
    var label = bonusLike ? 'BONUS' : s.battle ? (s.battle.final ? 'FINAL BATTLE' : 'BATTLE') : s.phase === 'enemySelect' ? 'ENEMY SELECT' : s.phase === 'end' ? 'GAME OVER' : (s.enemy && s.enemy.upper ? '最強ST' : 'ST');
    box(x + 6, y + 8, 120, 16, '#000000aa', '#ffffff55'); txt(label, x + 66, y + 21, 12, '#ffd23a', 'center', true);

    // 下の帯
    var info = s.bonus && !ui.bonusTitle ? ('獲得 ' + s.bonus.paid + ' / ' + s.bonus.target + ' 枚') : s.battle ? ((s.battle.left === 4 && ui.state !== 'spinning' ? 'バトル突入' : 'バトル ' + (4 - s.battle.left + (ui.state === 'spinning' ? 1 : 0)) + 'G目') + '　（ST ' + s.stGames + 'G で止まっている）') : s.enemy && !bonusLike ? ('ST 残り ' + s.stGames + 'G') : '';
    if (s.phase === 'bonus' && s.bonus && ui.bonusTitle === null) info = '獲得 ' + s.bonus.paid + ' / ' + s.bonus.target + ' 枚';
    txt(info, x + 10, y + h - 10, 12, '#ffffff');
    if (s.vstock) txt('V×' + s.vstock, x + w - 10, y + h - 10, 12, '#ff5a5a', 'right', true);

    // ボーナス当選後: 武器と枚数
    if (ui.bonusTitle && bonusLike && !(ui.count && !ui.count.shown)) {
      var bt = ui.bonusTitle;
      g.fillStyle = '#000000aa'; g.fillRect(x, y + 34, w, 76);
      txt(bt.name, x + w / 2, y + 70, 28, bt.color, 'center', true);
      if (bt.medals != null) txt(bt.medals + ' 枚' + (bt.overkill ? '（オーバーキル +' + bt.overkill + '）' : ''), x + w / 2, y + 98, 18, '#ffffff', 'center', true);

    }

    // 押し順ナビ
    if (ui.navi && ui.state === 'spinning' && ui.game.naviOrder) {
      var NAME = ['左', '中', '右'], col = ui.navi === 'yellow' ? '#ffd23a' : '#ffffff';
      txt('押し順ナビ　' + ui.game.naviOrder.map(function (i) { return NAME[i]; }).join(' → '), x + w / 2, y + 44, 16, col, 'center', true);
    }
    // 枚数決定画面
    if (ui.count && !ui.count.shown) drawCount(t, x, y, w);
    // メッセージ
    if (ui.msg && ui.msg.until > t && !(ui.bonusTitle && bonusLike)) {
      g.fillStyle = '#000000aa'; g.fillRect(x, y + 52, w, 44);
      txt(ui.msg.text, x + w / 2, y + 76, 20, ui.msg.color, 'center', true);
      if (ui.msg.sub) txt(ui.msg.sub, x + w / 2, y + 92, 11, '#ffffff', 'center');
    }
    if (ui.sub2 && ui.sub2.until > t) txt(ui.sub2.text, x + w / 2, y + 44, 11, '#ffd23a', 'center');

    // 勝利: 枠を虹に光らせる
    var won = (ui.scene && ui.scene.kind === 'victory') || (ui.revivedAt && t - ui.revivedAt > 700);
    if (won && !bonusLike) {
      for (var b = 0; b < 4; b++) { g.fillStyle = rainbow(t, b); g.fillRect(x - 4 + b, y - 4 + b, w + 8 - b * 2, 2); g.fillRect(x - 4 + b, y + h + 2 - b, w + 8 - b * 2, 2); g.fillRect(x - 4 + b, y - 4 + b, 2, h + 8 - b * 2); g.fillRect(x + w + 2 - b, y - 4 + b, 2, h + 8 - b * 2); }
      txt('勝利', x + w / 2, y + 60, 30, rainbow(t), 'center', true);
      var ok = (ui.scene && ui.scene.overkill) || (ui.bfx && ui.bfx.fx.overkill);
      if (ok && Math.floor(t / 200) % 2) txt('OVERKILL!!', x + w / 2, y + 84, 16, '#ff3aa0', 'center', true);
    }

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

  function drawCount(t, x, y, w) {
    var c = ui.count;
    g.fillStyle = '#000000cc'; g.fillRect(x, y + 30, w, 90);
    txt(c.name, x + w / 2, y + 52, 16, WEAPON_COLOR[c.id], 'center', true);
    if (c.id === 'isshiki') { if (Math.floor(t / 300) % 2) txt('ボタンを押せ！', x + w / 2, y + 90, 22, '#ffffff', 'center', true); }
    if (c.id === 'mizuchi') {
      var pop = t - c.pop < 200 ? 4 : 0;
      txt('連打しろ！', x + w / 2, y + 78, 18, '#5ad1ff', 'center', true);
      txt(c.total + ' 枚', x + w / 2, y + 108 + pop, 24 + pop, '#ffffff', 'center', true);
      if (c.i > 0) txt('+' + c.presses[c.i - 1], x + w / 2 + 90, y + 108, 16, '#ffd23a', 'left', true);
    }
    if (c.id === 'bendigar') {
      var L = BEN_LEVELS[c.level], col = L.c === 'rainbow' ? rainbow(t) : L.col, pulse = 4 + Math.sin(t / 80) * 3;
      for (var a = 0; a < 3; a++) { g.globalAlpha = 0.4; g.fillStyle = L.c === 'rainbow' ? rainbow(t, a) : col; g.fillRect(x + w / 2 - 40 - a * 8 - pulse, y + 60 - a * 6, 80 + a * 16 + pulse * 2, 56 + a * 6); }
      g.globalAlpha = 1;
      img(A.hero(Math.floor(t / 150) % 2), x + w / 2 - 36, y + 50, 3);
      var msg = c.level >= c.max ? (Math.floor(t / 200) % 2 ? '離せ！' : '') : c.holding ? 'オーラ上昇中…' : '長押ししろ！';
      txt(msg, x + w / 2, y + 116, 18, c.level >= c.max ? '#ff3a3a' : '#ffffff', 'center', true);
    }
    if (c.id === 'kinnoago') {
      if (!c.started) { if (Math.floor(t / 300) % 2) txt('ボタンを押せ！', x + w / 2, y + 90, 22, '#ffffff', 'center', true); }
      else {
        var k = (t - c.stepAt) / 1100, n = KIN_STEPS[c.step], breaking = KIN_STEPS[c.step] < c.medals && k > 0.6;
        var shake = breaking ? (Math.floor(t / 40) % 2 ? 3 : -3) : 0;
        txt(n + ' 枚', x + w / 2 + shake, y + 96, 30, breaking ? '#ff9a3a' : '#ffd23a', 'center', true);
        if (breaking) { g.strokeStyle = '#ffffff'; g.lineWidth = 2; g.beginPath(); g.moveTo(x + w / 2 - 50, y + 70); g.lineTo(x + w / 2 + 10, y + 100); g.lineTo(x + w / 2 - 10, y + 104); g.lineTo(x + w / 2 + 50, y + 120); g.stroke(); }
        txt('目指せ 3000', x + w / 2, y + 116, 11, '#c9d3e0', 'center');
      }
    }
  }

  // 主人公と敵（バトルの演出つき）
  // 敵選択: 8個のクリスタル。回っているあいだはランダムに光り、第3停止で当選した敵のクリスタルが光る
  function drawCrystals(t, x, y, w) {
    var sel = ui.select, cw = 64, chh = 52, ox = x + (w - cw * 4 - 12 * 3) / 2, oy = y + 30;
    var gek = sel.enemy === 'gekirin', since = sel.done ? t - sel.done : -1;
    var lit = sel.done ? CRYSTALS.indexOf(sel.enemy) : Math.floor(((t - sel.at) / 110 * 7.3) % 8);
    if (gek && since >= 0) {
      // 逆鱗ハンニバル: クリスタルを全部壊してから出てくる
      if (since < 900) {
        CRYSTALS.forEach(function (id, i) {
          var cx = ox + (i % 4) * (cw + 12), cy = oy + Math.floor(i / 4) * (chh + 8), k = since / 900;
          for (var p = 0; p < 6; p++) { g.fillStyle = p % 2 ? '#9fd0ff' : '#e8f4ff'; g.fillRect(cx + cw / 2 + Math.cos(i + p) * k * 90, cy + chh / 2 + Math.sin(i * 2 + p) * k * 70 + k * k * 40, 6, 6); }
        });
        if (Math.floor(t / 60) % 2) { g.fillStyle = '#ff3a3a55'; g.fillRect(x, y, w, 150); }
      } else {
        img(A.enemy('gekirin', Math.floor(t / 300) % 2, Math.floor(t / 150)), x + w / 2 - 48, y + 22, 3);
      }
      return;
    }
    CRYSTALS.forEach(function (id, i) {
      var cx = ox + (i % 4) * (cw + 12), cy = oy + Math.floor(i / 4) * (chh + 8), on = i === lit;
      g.fillStyle = on ? (sel.done ? '#fff7a8' : '#cfe8ff') : '#2a3a6a'; g.fillRect(cx, cy, cw, chh);
      g.fillStyle = on ? '#ffffff' : '#4a6aa0'; g.fillRect(cx + 4, cy + 4, cw - 8, 3);
      g.fillStyle = on ? (sel.done ? '#ffe066' : '#9fd0ff') : '#16224a'; g.fillRect(cx + 4, cy + 8, cw - 8, chh - 12);
      img(A.silhouette(id), cx + cw / 2 - 16, cy + 10, 1.25);
      if (on && sel.done && Math.floor(t / 120) % 2) { g.fillStyle = '#ffffff88'; g.fillRect(cx - 3, cy - 3, cw + 6, chh + 6); }
    });
  }

  // 4分割の液晶（白 青 / 緑 赤）。時計回りに1つずつ光り、第3停止で止まる
  function drawPanel(t, x, y) {
    var f = ui.stfx, size = 26, ox = x + 160, oy = y + 34;
    var idx = f.done ? PANEL.map(function (p) { return p.c; }).indexOf(f.fx.color) : Math.floor((t - f.at) / 140) % 4;
    PANEL.forEach(function (p, i) {
      var on = i === idx, px = ox + p.dx * (size + 4), py = oy + p.dy * (size + 4);
      box(px, py, size, size, on ? p.col : '#1a1e2c', on ? '#ffffff' : '#3a3f5a');
      if (on && f.done && Math.floor(t / 100) % 2) { g.fillStyle = '#ffffff66'; g.fillRect(px, py, size, size); }
    });
  }

  function drawFighters(t, s, x, y, w, bonusLike) {
    var bob = Math.floor(t / 300) % 2;
    var hx = x + 60, hy = y + 50, ex = x + w - 140, ey = y + 22;
    if (bonusLike) { img(A.hero(bob), x + w / 2 - 36, hy, 3); return; }   // ボーナス中は味方だけ、真ん中に
    var sf = ui.stfx && ui.stfx.fx;
    if (sf && sf.kind === 'slash') {
      // 味方がボスに切りかかる（止まったとき、バトルなら当たる・それ以外はかわされる）
      hx += ease((t - ui.stfx.at) / 600) * 130;
    }
    if (sf && sf.kind === 'minion') {
      // 色つきの雑魚敵。第3停止で切る
      var mx = x + w / 2, my = y + 70, mdone = ui.stfx.done ? t - ui.stfx.done : -1;
      if (mdone < 0 || mdone < 300) img(A.minion(sf.color, bob), mx, my, 3, { alpha: mdone < 0 ? 1 : 1 - mdone / 300 });
      if (mdone >= 0 && mdone < 300) { g.strokeStyle = '#ffffff'; g.lineWidth = 3; g.beginPath(); g.moveTo(mx - 10, my + 50); g.lineTo(mx + 60, my - 4); g.stroke(); }
      if (mdone < 0) { g.fillStyle = MINION_HEX[sf.color] + '44'; g.fillRect(mx - 6, my - 6, 60, 60); }
      hx += mdone < 0 ? ease((t - ui.stfx.at) / 600) * 40 : 40;
    }
    var heroRot = 0, heroAlpha = 1, enemyFlash = false, heroFlash = false;
    var bf = ui.bfx, fx = bf && bf.fx, label = null;

    if (fx && fx.n === 1) {
      // 1G目: 味方の攻撃（回っているあいだに飛び込み、止まったら結果）
      var k = ease((t - bf.at) / 600); hx += k * 120;
      if (bf.done) {
        var since = t - bf.done; label = FX1[fx.kind];
        if (fx.kind === 'guard') { if (since < 500) { g.fillStyle = '#c9d3e0'; g.fillRect(ex - 10, ey + 10, 6, 80); } }
        else enemyFlash = since < 600 && Math.floor(t / 60) % 2;
        if (fx.kind === 'critical' && since < 400) { g.fillStyle = '#ffffffaa'; g.fillRect(x, y, w, 150); }
      }
    } else if (fx && fx.n === 2) {
      // 2G目: 敵の攻撃
      var k2 = ease((t - bf.at) / 600); ex -= k2 * 120;
      if (bf.done) {
        var since2 = t - bf.done; label = FX2[fx.kind];
        if (fx.kind === 'hit') heroFlash = since2 < 600 && Math.floor(t / 60) % 2;
        if (fx.kind === 'guard' && since2 < 500) { g.fillStyle = '#5aa9ff'; g.fillRect(hx + 76, hy + 4, 6, 70); }
        if (fx.kind === 'counter') { enemyFlash = since2 < 600 && Math.floor(t / 60) % 2; if (since2 < 300) { g.fillStyle = '#ffffffaa'; g.fillRect(x, y, w, 150); } }
      }
    } else if (fx && fx.n === 3) {
      // 3G目: つばぜり合い。レバーでオーラの色が出る
      hx = x + 120; ex = x + w - 200;
      var col = fx.aura === 'rainbow' ? rainbow(t) : AURA[fx.aura];
      for (var a = 0; a < 3; a++) {
        g.globalAlpha = 0.35 + 0.2 * Math.sin(t / 90 + a);
        g.fillStyle = fx.aura === 'rainbow' ? rainbow(t, a) : col;
        g.fillRect(hx - 8 - a * 4, hy - 8 - a * 4 + bob, 88 + a * 8, 96 + a * 8);
        g.fillRect(ex - 8 - a * 4, ey - 8 - a * 4, 112 + a * 8, 112 + a * 8);
      }
      g.globalAlpha = 1;
      if (Math.floor(t / 80) % 2) { g.fillStyle = '#ffffff'; g.fillRect(x + w / 2 - 14, y + 70, 6, 6); g.fillRect(x + w / 2 + 2, y + 62, 4, 4); }
      txt('つばぜり合い！', x + w / 2, y + 116, 14, '#ffffff', 'center', true);
    }

    // 4G目: 倒れている（横向き）→ 違和感から2秒で起き上がって攻撃
    var downScene = ui.scene && ui.scene.kind === 'down';
    if (downScene && !ui.revivedAt) { heroRot = -Math.PI / 2; hy += 18; heroAlpha = 0.9; }
    if (ui.revivedAt) {
      var rk = (t - ui.revivedAt) / 700;
      if (rk < 1) { hx += ease(rk) * 150; } else if (rk < 1.6) { enemyFlash = Math.floor(t / 60) % 2; hx += 150; }
      else hx += 150 * Math.max(0, 1 - (rk - 1.6) * 2);
    }

    if (!heroFlash) img(A.hero(bob), hx, hy, 3, { rotate: heroRot, alpha: heroAlpha });
    if (sf && sf.kind === 'slash' && ui.stfx.done) {
      var sd = t - ui.stfx.done;
      if (ui.stfx.battle) enemyFlash = sd < 600 && Math.floor(t / 60) % 2;
      else { ex += sd < 400 ? Math.sin(sd / 400 * Math.PI) * 30 : 0; if (sd < 900) label = ['かわされた', '#8d99a8']; }
    }
    if (s.enemy && !enemyFlash) img(A.enemy(s.enemy.id, bob, Math.floor(t / 150)), ex, ey, 3);
    if (label) txt(label[0], x + w / 2, y + 68, 22, label[1], 'center', true);
  }

  // ---------------------------------------------------------------------
  // リール・ランプ・ポイント
  // ---------------------------------------------------------------------
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
        var sy = y0 + (row - frac) * ch;
        img(A.symbol(sym), rx + 16, Math.round(sy + 1), 2);
      }
      if (rl.spinning && rl.target === null) { g.fillStyle = '#ffffff44'; g.fillRect(rx, y0, cw, ch * 3); }
      g.restore();
      if (ui.state === 'spinning' && ui.game && ui.game.naviOrder) {
        var no = ui.game.naviOrder.indexOf(i) + 1, ncol = ui.navi === 'yellow' ? '#ffd23a' : '#ffffff';
        if (rl.spinning && rl.target === null) { box(rx + 20, y0 - 22, 24, 16, ncol, '#000'); txt(String(no), rx + 32, y0 - 9, 14, '#000', 'center', true); }
      }
      // 停止ボタン（違和感のあいだも見た目は変えない）
      var lit = rl.spinning && rl.target === null && ui.state === 'spinning';
      box(rx + 16, 300, 32, 14, lit ? '#ff5a3a' : '#3a3f5a', '#000');
      txt(['Z', 'X', 'C'][i], rx + 32, 311, 10, lit ? '#ffffff' : '#8d99a8', 'center', true);
    }
    if (ui.win && ui.state !== 'spinning') {
      g.strokeStyle = Math.floor(t / 150) % 2 ? '#ffd23a' : '#ffffff'; g.lineWidth = 2; g.beginPath();
      var L = ui.win === 'bell3' ? [0, 1, 2] : ui.win === 'bell15' ? [0, 0, 0] : [1, 1, 1];
      for (var j = 0; j < 3; j++) { var px = x0 + j * (cw + gap) + cw / 2, py = y0 + L[j] * ch + ch / 2; j ? g.lineTo(px, py) : g.moveTo(px, py); }
      g.stroke();
    }
    var canLever = ui.state === 'idle';
    box(150, 290, 40, 30, '#2a2f45', '#000'); g.fillStyle = canLever ? '#ff3a3a' : '#5a2a2a'; g.fillRect(162, 270 + (canLever ? 0 : 10), 16, 16); g.fillStyle = '#c9d3e0'; g.fillRect(168, 286, 4, 10);
    txt('Space', 170, 334, 10, '#8d99a8', 'center');
    var canPush = ui.state === 'count';
    box(456, 290, 40, 30, canPush ? '#5ad1ff' : '#2a2f45', '#000'); txt('PUSH', 476, 309, 10, canPush ? '#000' : '#8d99a8', 'center', true);
  }

  function drawGems(t, s) {
    var x = 548, extra = s.battle ? s.battle.extraLamps : [];
    txt('弱点', x + 22, 30, 11, '#c9d3e0', 'center', true);
    LAMPS.forEach(function (L, k) {
      var on = s.lamps.indexOf(L.id) >= 0, ex = extra.indexOf(L.id) >= 0, y = 40 + k * 56;
      if (on) {
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
      g.fillStyle = k < s.points ? (k > 15 ? '#ff5a3a' : '#ffd23a') : '#1a1e2c';
      g.fillRect(x + 13, y + 197 - (k + 1) * 10 + 1, 24, 8);
    }
    txt(s.points + '/20', x + 25, y + 216, 11, '#ffffff', 'center');
    if (s.extraLamps) txt('弱点+' + s.extraLamps, x + 25, y + 232, 11, '#ffd23a', 'center', true);
    if (EMBED) {
      txt('クレジット', x + 25, 262, 10, '#8d99a8', 'center'); txt(String(wallet.credit), x + 25, 276, 14, '#ffd23a', 'center', true);
      txt('所持金', x + 25, 296, 10, '#8d99a8', 'center'); txt((MONEY0 - wallet.invest) + '円', x + 25, 310, 11, '#ffffff', 'center', true);
      var canSettle = (ui.state === 'idle' || ui.state === 'over') && !locked();
      box(x - 4, 322, 58, 22, canSettle ? '#3b2f08' : '#1a1e2c', canSettle ? '#ffd23a' : '#3a3f5a');
      txt('精算(Esc)', x + 25, 337, 10, canSettle ? '#ffd23a' : '#5a6080', 'center', true);
    } else {
      txt('差枚', x + 25, 300, 10, '#8d99a8', 'center'); txt(String(s.totalNet), x + 25, 314, 12, '#ffffff', 'center', true);
      txt('一連', x + 25, 330, 10, '#8d99a8', 'center'); txt(String(s.chainMedals), x + 25, 344, 12, '#ffffff', 'center', true);
    }
  }

  // ---------------------------------------------------------------------
  // ループ
  // ---------------------------------------------------------------------
  var last = now();
  function frame(t) {
    var dt = Math.min(50, t - last); last = t;
    var speed = 0.018 * dt * 1.2;
    ui.reels.forEach(function (rl) {
      if (!rl.spinning) return;
      if (rl.target === null) { rl.pos -= speed; if (rl.pos < 0) rl.pos += R.LENGTH; return; }
      var d = R.wrap(Math.floor(rl.pos) - rl.target) + (rl.pos - Math.floor(rl.pos));
      if (d <= speed) { rl.pos = rl.target; rl.spinning = false; rl.target = null; }
      else { rl.pos -= Math.min(speed, d); if (rl.pos < 0) rl.pos += R.LENGTH; }
    });
    if (ui.state === 'spinning' && ui.reels.every(function (rl) { return !rl.spinning; })) allStopped();
    updateCount(t, dt);
    // 違和感から2秒で復活
    if (ui.lock && t - ui.lock.from >= LOCK_MS) { ui.lock = null; ui.revivedAt = t; }
    if (ui.revivedAt && ui.state === 'idle' && t - ui.revivedAt > 4000 && ui.scene && ui.scene.kind === 'down') { ui.scene = { kind: 'victory', at: t, overkill: ui.bfx && ui.bfx.fx.overkill }; }

    var s = ui.state === 'spinning' && ui.view ? ui.view : m.snapshot();
    drawCabinet(t);
    drawLCD(t, s);
    drawReels(t);
    drawGems(t, s);
    drawPoints(t, s);
    requestAnimationFrame(frame);
  }

  // 次のゲームに入るとき、前のゲームの復活の印を消す
  var _lever = lever;
  lever = function () { if (ui.state === 'idle' && !locked()) ui.revivedAt = 0; return _lever(); };

  // ---------------------------------------------------------------------
  // 入力
  // ---------------------------------------------------------------------
  document.addEventListener('keyup', function (e) { if (e.code === 'Space' || e.code === 'Enter' || e.code === 'KeyB') pushUp(); });
  cv.addEventListener('pointerup', function () { pushUp(); });
  document.addEventListener('keydown', function (e) {
    if (e.repeat) return;
    if (e.code === 'Space' || e.code === 'Enter') { e.preventDefault(); if (ui.state === 'spinning') nextStop(); else lever(); }
    else if (e.code === 'KeyB' && ui.state === 'count') pushDown();
    else if (e.code === 'KeyZ' || e.code === 'ArrowLeft') stop(0);
    else if (e.code === 'KeyX' || e.code === 'ArrowDown') stop(1);
    else if (e.code === 'KeyC' || e.code === 'ArrowRight') stop(2);
    else if (e.code === 'KeyR') { if (!EMBED || ui.state === 'over') boot(); }
    else if (e.code === 'Escape') settle();
  });
  cv.addEventListener('pointerdown', function (e) {
    var r = cv.getBoundingClientRect(), x = (e.clientX - r.left) * W / r.width, y = (e.clientY - r.top) * H / r.height;
    for (var i = 0; i < 3; i++) { var rx = REEL.x + i * (REEL.cw + REEL.gap); if (x >= rx && x <= rx + REEL.cw && y >= 290 && y <= 320) return stop(i); }
    if (x >= 140 && x <= 200 && y >= 260 && y <= 330) return lever();
    if (x >= 450 && x <= 500 && y >= 285 && y <= 325) return pushDown();
    if (EMBED && x >= 20 && x <= 90 && y >= 318 && y <= 348) return settle();
    if (ui.state === 'over' && !EMBED) return boot();
    if (ui.state === 'spinning') nextStop(); else lever();
  });

  boot();
  requestAnimationFrame(frame);
  if (EMBED) post({ type: 'ready' });
  window.StScreen = { machine: function () { return m; }, ui: function () { return ui; } };
})();
