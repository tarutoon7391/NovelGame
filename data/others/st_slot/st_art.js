/*
 * ST機のドット絵（図柄・主人公・敵・宝石ランプ）。すべてプログラムで描く。
 * window.StArt.symbol(name) / hero(frame) / enemy(id, frame) / gem(color, lit, t) は、小さな canvas を返す（拡大は描く側で）。
 */
(function (root) {
  'use strict';
  var cache = {};

  function mk(w, h) { var c = document.createElement('canvas'); c.width = w; c.height = h; var g = c.getContext('2d'); g.imageSmoothingEnabled = false; return { c: c, g: g }; }
  function P(g) { return function (x, y, w, h, col) { g.fillStyle = col; g.fillRect(x, y, w || 1, h || 1); }; }
  // 文字の地図から描く（'.' は透明）
  function map(g, rows, pal, ox, oy) {
    for (var y = 0; y < rows.length; y++) for (var x = 0; x < rows[y].length; x++) {
      var ch = rows[y][x]; if (ch === '.' || ch === ' ') continue;
      g.fillStyle = pal[ch]; g.fillRect((ox || 0) + x, (oy || 0) + y, 1, 1);
    }
  }
  function memo(key, fn) { return cache[key] || (cache[key] = fn()); }

  // ===================================================================
  // 図柄 16x16
  // ===================================================================
  var SYM = {
    seven: { pal: { k: '#2a0a0a', r: '#e8323a', h: '#ff8a8a', w: '#ffffff' }, rows: [
      '................',
      '..kkkkkkkkkkkk..',
      '..krrrrrrrrrrk..',
      '..khhhhhhhhrrk..',
      '..kkkkkkkkrrrk..',
      '.........krrk...',
      '........krrk....',
      '.......krrk.....',
      '......krrrk.....',
      '......krrk......',
      '.....krrrk......',
      '.....krrk.......',
      '.....krrk.......',
      '.....kkkk.......',
      '................',
      '................'] },
    bar: { pal: { k: '#111111', y: '#ffd23a', w: '#f4f4f4', g: '#555555' }, rows: [
      '................',
      '................',
      '................',
      '.kkkkkkkkkkkkkk.',
      '.kyyyyyyyyyyyyk.',
      '.kkkkkkkkkkkkkk.',
      '.kwwkwwwkwwwwkk.',
      '.kwkwkwkwkwkkwk.',
      '.kwwkwwwkwwwwkk.',
      '.kwkwkwkwkwkwkk.',
      '.kwwkwkwkwkkwwk.',
      '.kkkkkkkkkkkkkk.',
      '.kyyyyyyyyyyyyk.',
      '.kkkkkkkkkkkkkk.',
      '................',
      '................'] },
    cherry: { pal: { k: '#2a0a0a', r: '#d81b3c', h: '#ff8fa3', g: '#2e8b3a', d: '#1b5e20' }, rows: [
      '................',
      '..........dd....',
      '.........dggd...',
      '........dg..dd..',
      '.......dg....g..',
      '......dg.....g..',
      '.....dg......g..',
      '....dg.......g..',
      '...kkkk....kkkk.',
      '..krrhrk..krrhrk',
      '..krrrhk..krrrhk',
      '..krrrrk..krrrrk',
      '..krrrrk..krrrrk',
      '...kkkk....kkkk.',
      '................',
      '................'] },
    suika: { pal: { k: '#0b2a12', g: '#2fa84f', d: '#1d6b33', r: '#ff4d5e', s: '#1a1a1a', w: '#ffffff' }, rows: [
      '................',
      '................',
      '................',
      '.kkkkkkkkkkkkkk.',
      '.krrrrrrrrrrrrk.',
      '.krrsrrrrrsrrrk.',
      '.krrrrrsrrrrrrk.',
      '..krrsrrrrrsrk..',
      '..kwwwwwwwwwwk..',
      '...kggggggggk...',
      '...kdgdgdgdgk...',
      '....kggggggk....',
      '.....kkkkkk.....',
      '................',
      '................',
      '................'] },
    bell: { pal: { k: '#3a2a00', y: '#ffd23a', h: '#fff2a8', d: '#c79a00' }, rows: [
      '................',
      '.......kk.......',
      '......kyyk......',
      '.....kyhyyk.....',
      '....kyhyyyyk....',
      '....kyhyyyyk....',
      '...kyhyyyyyyk...',
      '...kyhyyyyyyk...',
      '..kyhyyyyyyyyk..',
      '..kyyyyyyyyydk..',
      '.kkkkkkkkkkkkkk.',
      '.kddddddddddddk.',
      '.kkkkkkkkkkkkkk.',
      '......kddk......',
      '.......kk.......',
      '................'] },
    replay: { pal: { k: '#08183a', b: '#2f7bff', h: '#8fbaff', w: '#ffffff' }, rows: [
      '................',
      '..kkkkkkkkkkkk..',
      '.kbbbbbbbbbbbbk.',
      '.kbhhhhhhhhhhbk.',
      '.kbwwwwwwwbbbbk.',
      '.kbwwbbbbwwbbbk.',
      '.kbwwbbbbwwbbbk.',
      '.kbwwwwwwwbbbbk.',
      '.kbwwbwwbbbbbbk.',
      '.kbwwbbwwbbbbbk.',
      '.kbwwbbbwwbbbbk.',
      '.kbbbbbbbbbbbbk.',
      '.kbbbbbbbbbbbbk.',
      '..kkkkkkkkkkkk..',
      '................',
      '................'] },
    emblem: { pal: { k: '#1b1b2a', s: '#c9d3e0', w: '#ffffff', y: '#ffd23a', p: '#7a3cff' }, rows: [
      '................',
      '..kkkkkkkkkkkk..',
      '..kssssssssssk..',
      '..kswssssssssk..',
      '..kssssyyssssk..',
      '..ksssyppysssk..',
      '..kssyppppyssk..',
      '..ksssyppysssk..',
      '...kssyyyyssk...',
      '...ksssssssk....',
      '....kssssssk....',
      '.....kssssk.....',
      '......kssk......',
      '.......kk.......',
      '................',
      '................'] }
  };
  function symbol(name) {
    return memo('sym:' + name, function () { var s = SYM[name], m = mk(16, 16); map(m.g, s.rows, s.pal); return m.c; });
  }

  // ===================================================================
  // 主人公 24x24（2コマ）
  // ===================================================================
  function hero(frame) {
    return memo('hero:' + frame, function () {
      var m = mk(24, 24), p = P(m.g), up = frame ? 0 : 1;
      p(8, 2 + up, 8, 2, '#3b6fd8'); p(7, 4 + up, 10, 6, '#f2c9a0'); p(7, 4 + up, 10, 2, '#5a3a1a');  // 髪
      p(9, 6 + up, 2, 2, '#1a1a1a'); p(13, 6 + up, 2, 2, '#1a1a1a');                                 // 目
      p(6, 10 + up, 12, 8, '#2f5fbf'); p(8, 11 + up, 8, 6, '#9fc0ff'); p(11, 11 + up, 2, 6, '#ffd23a'); // 鎧
      p(4, 11 + up, 2, 6, '#f2c9a0'); p(18, 11 + up, 2, 6, '#f2c9a0');                                // 腕
      p(19, 2 + up, 2, 12, '#dfe7f2'); p(18, 12 + up, 4, 2, '#8a5a20');                               // 剣
      p(7, 18, 4, 5, '#3a2a1a'); p(13, 18, 4, 5, '#3a2a1a');                                          // 足
      return m.c;
    });
  }

  // ===================================================================
  // 敵 32x32（2コマ）。人型の土台に、それぞれの飾りを足す
  // ===================================================================
  function body(p, o, up) {
    // o: { skin, hair, robe, robe2, trim, eye }
    p(11, 5 + up, 10, 9, o.skin);                       // 顔
    p(10, 3 + up, 12, 4, o.hair);                       // 髪
    if (o.longHair) { p(8, 5 + up, 3, 14, o.hair); p(21, 5 + up, 3, 14, o.hair); }
    p(13, 9 + up, 2, 2, o.eye || '#1a1a1a'); p(17, 9 + up, 2, 2, o.eye || '#1a1a1a');
    p(9, 14 + up, 14, 14, o.robe);                      // 体
    p(9, 14 + up, 14, 2, o.trim); p(15, 16 + up, 2, 12, o.robe2);
    p(6, 15 + up, 3, 9, o.robe2); p(23, 15 + up, 3, 9, o.robe2);   // 腕
    p(6, 23 + up, 3, 2, o.skin); p(23, 23 + up, 3, 2, o.skin);
    p(10, 28, 5, 3, '#1a1a1a'); p(17, 28, 5, 3, '#1a1a1a');
  }
  var ENEMY = {
    hannibal: function (p, up) {
      p(4, 4 + up, 2, 26, '#8a5a20'); p(3, 1 + up, 4, 4, '#c9d3e0');                       // 槍
      body(p, { skin: '#d9a77a', hair: '#7a7f8a', robe: '#5a5f6a', robe2: '#3a3f4a', trim: '#c9a227' }, up);
      p(10, 2 + up, 12, 3, '#9aa3b0'); p(15, -1 + up, 2, 4, '#d81b3c'); p(14, 0 + up, 4, 2, '#d81b3c');   // 兜と羽飾り
      p(23, 16 + up, 6, 9, '#8a6a2a'); p(24, 17 + up, 4, 7, '#c9a227');                    // 盾
    },
    gekirin: function (p, up, t) {
      var fl = (t || 0) % 2 ? '#ff6a00' : '#ffb000';
      p(2, 6, 2, 22, fl); p(28, 6, 2, 22, fl); p(6, 1, 20, 2, fl);                         // 怒りの炎
      p(4, 4 + up, 2, 26, '#3a1a10'); p(3, 1 + up, 4, 4, '#ff3a3a');
      body(p, { skin: '#b5704a', hair: '#2a0a0a', robe: '#6a1010', robe2: '#3a0505', trim: '#ff3a3a', eye: '#ffef00' }, up);
      p(10, 2 + up, 12, 3, '#3a0505'); p(14, -1 + up, 4, 4, '#ff3a3a');
      p(23, 16 + up, 6, 9, '#3a0505'); p(24, 17 + up, 4, 7, '#ff3a3a');
    },
    aither: function (p, up) {
      p(1, 10 + up, 8, 12, '#bff3ff'); p(23, 10 + up, 8, 12, '#bff3ff'); p(2, 12 + up, 6, 8, '#e8fbff'); p(24, 12 + up, 6, 8, '#e8fbff');   // 翼
      p(11, 0 + up, 10, 2, '#fff7a8');                                                       // 輪
      body(p, { skin: '#f6dcc6', hair: '#e8fbff', robe: '#f4f8ff', robe2: '#cfe6ff', trim: '#7fd8ff', longHair: true }, up);
    },
    venus: function (p, up) {
      body(p, { skin: '#f8d5c2', hair: '#ff8fc8', robe: '#fff0f6', robe2: '#ffc4e1', trim: '#ff5aa5', longHair: true }, up);
      p(13, 18 + up, 2, 2, '#ff5aa5'); p(17, 18 + up, 2, 2, '#ff5aa5'); p(14, 19 + up, 4, 3, '#ff5aa5');   // ハート
      p(12, 2 + up, 8, 2, '#ffd23a');
    },
    tsukuyomi: function (p, up) {
      p(20, 1, 10, 10, '#e8e8ff'); p(23, 1, 8, 8, '#1a1a3a');                              // 三日月
      body(p, { skin: '#e6dcf0', hair: '#c9c9ff', robe: '#1e1e5a', robe2: '#2e2e8a', trim: '#c9c9ff', longHair: true, eye: '#7a7aff' }, up);
    },
    caligula: function (p, up) {
      p(4, 14 + up, 24, 14, '#a01020');                                                      // マント
      body(p, { skin: '#d9a77a', hair: '#3a2a1a', robe: '#6a2a9a', robe2: '#4a1a7a', trim: '#ffd23a' }, up);
      p(10, 2 + up, 2, 3, '#3fae49'); p(20, 2 + up, 2, 3, '#3fae49'); p(12, 1 + up, 8, 2, '#ffd23a');   // 月桂冠と冠
    },
    tezcatlipoca: function (p, up) {
      p(8, -1 + up, 3, 6, '#2fa84f'); p(14, -2 + up, 4, 6, '#2fa84f'); p(21, -1 + up, 3, 6, '#2fa84f');   // 羽飾り
      body(p, { skin: '#3a2a1a', hair: '#e0b030', robe: '#e0b030', robe2: '#b07a10', trim: '#1a1a1a', eye: '#ffef00' }, up);
      [[10, 17], [19, 19], [12, 24], [20, 25]].forEach(function (s) { p(s[0], s[1] + up, 2, 2, '#1a1a1a'); });   // 斑点
      p(14, 18 + up, 4, 4, '#111111'); p(15, 19 + up, 1, 1, '#9fd0ff');                    // 黒曜石の鏡
    },
    dyaus: function (p, up, t) {
      if ((t || 0) % 3 === 0) { p(26, 2, 2, 6, '#fff7a8'); p(24, 7, 2, 6, '#fff7a8'); }    // 稲妻
      body(p, { skin: '#f0d0b0', hair: '#ffffff', robe: '#2a6fd8', robe2: '#1a4f9a', trim: '#ffffff' }, up);
      p(11, 11 + up, 10, 7, '#ffffff');                                                      // ひげ
    },
    amaterasu: function (p, up, t) {
      var c = (t || 0) % 2 ? '#ffd23a' : '#ffb000';
      p(6, 0, 20, 2, c); p(2, 6, 2, 16, c); p(28, 6, 2, 16, c); p(4, 2, 2, 4, c); p(26, 2, 2, 4, c);   // 日輪
      body(p, { skin: '#f8dcc6', hair: '#1a1a1a', robe: '#ffffff', robe2: '#e8323a', trim: '#ffd23a', longHair: true }, up);
      p(13, 1 + up, 6, 3, '#ffd23a');
    },
    saikyo: function (p, up, t) {
      var cols = ['#ff3a3a', '#ffd23a', '#3fae49', '#2f7bff', '#7a3cff'];
      p(2, 2, 28, 28, cols[(t || 0) % 5]); p(4, 4, 24, 24, '#0a0a12');
      body(p, { skin: '#2a2a3a', hair: '#0a0a12', robe: '#1a1a2a', robe2: '#3a3a5a', trim: cols[((t || 0) + 2) % 5], eye: '#ffffff' }, up);
    }
  };
  function enemy(id, frame, t) {
    var key = 'enemy:' + id + ':' + frame + ':' + ((t || 0) % 6);
    return memo(key, function () {
      var m = mk(32, 32), p = P(m.g);
      (ENEMY[id] || ENEMY.saikyo)(p, frame ? 0 : 1, t || 0);
      return m.c;
    });
  }

  // ===================================================================
  // 雑魚敵 16x16（色つきのスライム。色はその色の役に対応）
  // ===================================================================
  var MINION = { red: ['#5a0a14', '#e8323a', '#ff9aa8'], green: ['#0a3a18', '#2fa84f', '#9fffb0'], purple: ['#2a0a4a', '#8a4cff', '#d0b0ff'], blue: ['#08183a', '#2f7bff', '#9fc4ff'] };
  function minion(color, frame) {
    return memo('minion:' + color + ':' + frame, function () {
      var m = mk(16, 16), c = MINION[color] || MINION.blue;
      var rows = frame ? ['................', '................', '................', '......kkkk......', '....kkmmmmkk....', '...kmmhhmmmmk...', '..kmmhhmmmmmmk..', '..kmmmmmmmmmmk..', '.kmmwkmmmmwkmmk.', '.kmmkkmmmmkkmmk.', '.kmmmmmmmmmmmmk.', '.kmmmmmkkmmmmmk.', '..kmmmmmmmmmmk..', '...kkkkkkkkkk...', '................', '................']
                     : ['................', '................', '................', '................', '.....kkkkkk.....', '...kkmmmmmmkk...', '..kmmhhmmmmmmk..', '.kmmhhmmmmmmmmk.', '.kmmwkmmmmwkmmk.', '.kmmkkmmmmkkmmk.', 'kmmmmmmmmmmmmmmk', 'kmmmmmmkkmmmmmmk', '.kmmmmmmmmmmmmk.', '..kkkkkkkkkkkk..', '................', '................'];
      map(m.g, rows, { k: c[0], m: c[1], h: c[2], w: '#ffffff' });
      return m.c;
    });
  }

  // 敵のシルエット（クリスタルの中に入れる）
  function silhouette(id) {
    return memo('sil:' + id, function () {
      var src = enemy(id, 0, 0), m = mk(32, 32);
      m.g.drawImage(src, 0, 0);
      m.g.globalCompositeOperation = 'source-in'; m.g.fillStyle = '#0a0820'; m.g.fillRect(0, 0, 32, 32);
      return m.c;
    });
  }

  // ===================================================================
  // 宝石ランプ 20x20（チェリー=赤・スイカ=緑・チャンス目=紫・リプレイ=青）
  // ===================================================================
  var GEM = { red: ['#5a0a14', '#d81b3c', '#ff7a90', '#ffe0e6'], green: ['#0a3a18', '#2fa84f', '#7fe39a', '#e6ffe9'], purple: ['#2a0a4a', '#7a3cff', '#c4a0ff', '#f0e6ff'], blue: ['#08183a', '#2f7bff', '#8fbaff', '#e6f0ff'] };
  function gem(color, lit) {
    return memo('gem:' + color + ':' + lit, function () {
      var m = mk(20, 20), p = P(m.g), c = GEM[color];
      var dark = lit ? c : ['#151520', '#2a2a3a', '#3a3a4a', '#4a4a5a'];
      var rows = ['......kkkkkk......', '....kkmmmmmmkk....', '...kmmhhhhmmmmk...', '..kmhhwwhhmmmmmk..', '.kmmhwwhhmmmmmmmk.', '.kmmhhhhmmmmmmmdk.', 'kmmmmmmmmmmmmmmddk', 'kmmmmmmmmmmmmmdddk', 'kmmmmmmmmmmmmddddk', '.kmmmmmmmmmmddddk.', '..kmmmmmmmmdddk...', '...kkmmmmmddkk....', '.....kkmmdkk......', '.......kkk........'];
      map(m.g, rows, { k: dark[0], m: dark[1], h: dark[2], w: dark[3], d: dark[0] }, 1, 3);
      return m.c;
    });
  }

  root.StArt = { symbol: symbol, hero: hero, enemy: enemy, gem: gem, minion: minion, silhouette: silhouette };
})(typeof self !== 'undefined' ? self : this);
