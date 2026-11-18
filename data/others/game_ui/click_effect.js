/*
 * クリック（タッチ）した所に、光の輪と小さな火花を出す演出。
 * first.ks の [loadjs storage="game_ui/click_effect.js"] で読み込む。
 * 見た目は game_ui.css の .click_ripple / .click_spark で決めている。
 * 画面の拡大縮小に関係なく、押した位置にそのまま出すため position: fixed を使う。
 */
(function () {
  if (window.__clickEffectLoaded) return; // 2回読み込まれても、1回だけ動かす
  window.__clickEffectLoaded = true;

  function spawn(x, y) {
    // 光の輪を2つ（少しずらして広がる）
    ["", " second"].forEach(function (extra) {
      var ring = document.createElement("div");
      ring.className = "click_ripple" + extra;
      ring.style.left = x + "px";
      ring.style.top = y + "px";
      document.body.appendChild(ring);
      setTimeout(function () { ring.remove(); }, 700);
    });
    // 火花を6つ、放射状に飛ばす
    for (var i = 0; i < 6; i++) {
      var a = (Math.PI * 2 * i) / 6 + Math.random() * 0.5;
      var d = 26 + Math.random() * 14;
      var s = document.createElement("div");
      s.className = "click_spark";
      s.style.left = x + "px";
      s.style.top = y + "px";
      s.style.setProperty("--dx", Math.cos(a) * d + "px");
      s.style.setProperty("--dy", Math.sin(a) * d + "px");
      document.body.appendChild(s);
      setTimeout((function (el) { return function () { el.remove(); }; })(s), 600);
    }
  }

  document.addEventListener("pointerdown", function (e) {
    spawn(e.clientX, e.clientY);
  }, true);
})();
