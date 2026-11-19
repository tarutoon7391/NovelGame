/*
 * ST機のリール配列と制御（素のJS・ビルド不要）
 * ---------------------------------------------------------------------------
 * 配列は「こおりくんの大冒険」v1.0 を土台にした（こおりくん図柄 → エンブレム）。各リール21コマ。
 * 引き込みは無制限（目押し不要・取りこぼしなし）。役ごとに出目の形を決め、押した位置からいちばん近いところで止める。
 * リールは下方向に回る（k コマ滑ると上段は strip[top - k]）。
 *
 * ティラノ: [loadjs storage="st_slot/st_reels.js"] → window.StReels
 */
(function (root, factory) {
  if (typeof module === 'object' && module.exports) module.exports = factory();
  else root.StReels = factory();
})(typeof self !== 'undefined' ? self : this, function () {
  'use strict';

  var LETTERS = { S: 'suika', B: 'bell', R: 'replay', C: 'cherry', X: 'bar', 7: 'seven', K: 'emblem' };
  var STRIPS = [
    'SBRXCBRSBR7CBRSBRKCBR',
    'XRBS7RBKRBSXRB7RBSKRB',
    'XBRS7BRKBRSXBR7BRSKBR'
  ].map(function (s) { return s.split('').map(function (c) { return LETTERS[c]; }); });
  var LEN = 21;
  var BONUS = { bar: 1, seven: 1, emblem: 1 };

  function wrap(i) { return ((i % LEN) + LEN) % LEN; }
  function windowAt(reel, top) { return [0, 1, 2].map(function (r) { return STRIPS[reel][wrap(top + r)]; }); }
  function gridAt(tops) { return tops.map(function (t, reel) { return windowAt(reel, t); }); }
  function isBonus(s) { return !!BONUS[s]; }
  function kind(s) { return isBonus(s) ? 'bonus' : s; }

  // 入賞ライン: 中段（リプレイ・7）、右下がり（3枚役のベル）、上段（15枚ベル・ボーナス中）
  function lineWin(cols) {
    var a = cols[0][1], b = cols[1][1], c = cols[2][1];
    if (a === b && b === c && (a === 'replay' || a === 'seven')) return a;
    if (cols[0][0] === 'bell' && cols[1][1] === 'bell' && cols[2][2] === 'bell') return 'bell3';
    if (cols[0][0] === 'bell' && cols[1][0] === 'bell' && cols[2][0] === 'bell') return 'bell15';
    return null;
  }

  var LINES = { top: [0, 0, 0], middle: [1, 1, 1], bottom: [2, 2, 2], down: [0, 1, 2], up: [2, 1, 0] };
  function same3(k) { return k[0] === k[1] && k[1] === k[2]; }
  var LEFT = {
    BRX: ['bell', 'replay', 'bonus'],
    SBR: ['suika', 'bell', 'replay'],
    RXC: ['replay', 'bonus', 'cherry'],
    XCB: ['bonus', 'cherry', 'bell']
  };
  function left(cols, p) { return p.every(function (x, row) { return x === 'bonus' ? isBonus(cols[0][row]) : cols[0][row] === x; }); }
  function smallV(cols) { return cols[0][0] === 'bell' && cols[1][1] === 'bell' && cols[2][0] === 'bell'; }
  // 中段以外のラインで、許した以外の図柄が3つ同じにならない
  function clean(cols, allow) {
    allow = allow || {};
    for (var name in LINES) {
      var line = LINES[name];
      var k = line.map(function (row, reel) { return kind(cols[reel][row]); });
      if (same3(k) && k[0] !== 'cherry' && allow[name] !== k[0]) return false;
    }
    if (smallV(cols) && !allow.smallV) return false;
    return true;
  }

  // 役ごとの出目の形
  var SHAPES = {
    none: function (c) { return left(c, LEFT.BRX) && lineWin(c) === null && clean(c); },
    replay: function (c) { return left(c, LEFT.BRX) && lineWin(c) === 'replay' && clean(c, { middle: 'replay' }); },
    bell3: function (c) { return left(c, LEFT.BRX) && lineWin(c) === 'bell3' && clean(c, { down: 'bell' }); },
    bell15: function (c) { return left(c, LEFT.BRX) && lineWin(c) === 'bell15' && clean(c, { top: 'bell' }); },
    suika: function (c) { return left(c, LEFT.SBR) && c[1][1] === 'suika' && c[2][2] === 'suika' && lineWin(c) === null && clean(c, { down: 'suika' }); },
    chance: function (c) { return left(c, LEFT.BRX) && c[1][1] === 'bell' && c[2][0] === 'bell' && c[2][1] === 'replay' && lineWin(c) === null && clean(c, { smallV: true }); },
    wcherry: function (c) { return left(c, LEFT.RXC) && (c[2][1] === 'replay' || c[2][1] === 'bell') && lineWin(c) === null && clean(c); },
    scherry: function (c) { return left(c, LEFT.RXC) && isBonus(c[2][1]) && !isBonus(c[1][1]) && lineWin(c) === null && clean(c); },
    mcherry: function (c) { return left(c, LEFT.XCB) && c[1][1] === c[0][0] && c[2][2] === c[0][0] && lineWin(c) === null && clean(c, { down: 'bonus' }); },
    // 押し順ナビに従わなかったときの取りこぼし（ベルが揃わない）
    bell3Miss: function (c) { return left(c, LEFT.BRX) && lineWin(c) === null && clean(c); },
    bell15Miss: function (c) { return left(c, LEFT.BRX) && lineWin(c) === null && clean(c); },
    // 7揃い（中段）
    seven: function (c) { return lineWin(c) === 'seven'; },
    // ハズレのカットイン（押し順で外し方が変わる。仕様書「押し順と告知」）
    //   逆押し: 右・中は中段に7、左で外す
    gaseGyaku: function (c) { return c[2][1] === 'seven' && c[1][1] === 'seven' && c[0][1] !== 'seven' && lineWin(c) === null && clean(c); },
    //   はさみ（右→左）: 右は中段に7、左で外す（テンパイしない）
    gaseHasami: function (c) { return c[2][1] === 'seven' && c[0][1] !== 'seven' && lineWin(c) === null && clean(c); },
    //   中・左から押したら: 最初のリールで中段に7を止めない
    gaseNaka: function (c) { return c[1][1] !== 'seven' && lineWin(c) === null && clean(c); },
    gaseHidari: function (c) { return c[0][1] !== 'seven' && lineWin(c) === null && clean(c); }
  };

  // ハズレカットインの形（押した順で決まる）
  function gaseShape(order) {
    if (order[0] === 1) return 'gaseNaka';
    if (order[0] === 0) return 'gaseHidari';
    if (order[1] === 0) return 'gaseHasami';
    return 'gaseGyaku';
  }

  var cache = {};
  function combosFor(shape) {
    if (cache[shape]) return cache[shape];
    var test = SHAPES[shape];
    if (!test) throw new Error('知らない出目の形: ' + shape);
    var list = [];
    for (var a = 0; a < LEN; a++) for (var b = 0; b < LEN; b++) for (var c = 0; c < LEN; c++) {
      var tops = [a, b, c];
      if (test(gridAt(tops), tops)) list.push(tops);
    }
    cache[shape] = list;
    return list;
  }

  // 押し順ナビ: ナビの順（nav）どおりに押しているあいだは shape、外れたら shape + 'Miss'（ベルだけ。リプレイは取りこぼさない）
  function naviShape(shape, nav, order) {
    if (!nav || !SHAPES[shape + 'Miss']) return shape;
    for (var i = 0; i < order.length; i++) if (order[i] !== nav[i]) return shape + 'Miss';
    return shape;
  }

  // 1ゲーム分の制御。shape は形の名前、または 'gase'（押した順で形が決まる）。nav = 押し順ナビ [リール, リール, リール]
  function createReelControl(shape, nav) {
    var stopped = [null, null, null], order = [];
    function shapeNow() { return shape === 'gase' ? gaseShape(order) : naviShape(shape, nav, order); }
    return {
      stop: function (reel, press) {
        if (stopped[reel] !== null) return null;
        order.push(reel);
        var name = shapeNow();
        var cands = combosFor(name).filter(function (t) { return stopped.every(function (top, i) { return top === null || t[i] === top; }); });
        if (!cands.length) throw new Error('出目の形 ' + name + ' が作れません（押した順 ' + order.join('→') + '）');
        for (var slip = 0; slip < LEN; slip++) {
          var top = wrap(press - slip);
          if (cands.some(function (t) { return t[reel] === top; })) { stopped[reel] = top; return { top: top, slip: slip }; }
        }
        throw new Error('止まる位置がありません');
      },
      get tops() { return stopped.slice(); },
      get order() { return order.slice(); },
      get shape() { return shapeNow(); },
      // ナビどおりに押せたか（取りこぼしたら false）
      get followed() { return !/Miss$/.test(shapeNow()); }
    };
  }

  // 役 → 出目の形
  function shapeForRole(role) { return SHAPES[role] ? role : 'none'; }

  return { STRIPS: STRIPS, LENGTH: LEN, SHAPES: SHAPES, wrap: wrap, windowAt: windowAt, gridAt: gridAt, lineWin: lineWin, combosFor: combosFor, createReelControl: createReelControl, shapeForRole: shapeForRole, gaseShape: gaseShape, naviShape: naviShape };
});
