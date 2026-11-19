;=========================================
; パチスロ（AT＋STタイプ「障害討伐 デバッグラッシュ」）
; 自宅のドア → 「パチスロに行く」から [jump] で来て、帰るときは自宅に [jump] で戻る。
;
; 流れ
;   店の前 → 台を選ぶ（6台。データカウンターを見て選ぶ）→ 1台を画面いっぱいに出して遊ぶ → 精算して帰る
;   1枚 = 20円（1,000円で50枚）。精算も1枚20円（等価）。
;   台の中身（抽選・リール）は data/others/slot/slot_engine.js
;   台の画面（液晶・リール・ボタン）は data/others/slot/slot_screen.js と slot.css
;
; 使う変数
;   f.money        … 所持金
;   f.slot_count   … パチスロに行った回数（あとで、ギャンブルのエンディングの条件に使う）
;   f.slot_total   … パチスロの通算の収支（円。マイナスなら負けている）
;   f.slot_hall    … 今夜の6台のデータ（設定は見えない）
;   f.slot_pick    … 選んだ台（f.slot_hall の何番目か）
;   f.slot_result  … 精算したときの結果（投資・回収など）
;=========================================

*start
[cm]
[layopt layer="message0" visible="true"]
[bg storage="bg_pachinko_front.gif" time="500"]
[playbgm storage="bgm_cheerful.mp3" restart="false"]

;台のプログラムと見た目を読み込む（2回目からは読み込まない）
[if exp="!window.SlotScreen"]
[loadcss file="./data/others/slot/slot.css"]
[loadjs storage="slot/slot_engine.js"]
[loadjs storage="slot/slot_screen.js"]
[endif]

[eval exp="f.slot_count = (f.slot_count || 0) + 1; f.slot_total = f.slot_total || 0"]
#
駅前のパチスロ店。夜の街で、いちばん明るい場所だ。[p]
#おまえ
（1枚20円。1,000円で、50枚。……50枚って、すぐなくなるんだよな）[p]

;今夜の6台を作る。設定（1〜6）はランダムで、プレイヤーには見えない。
;データカウンターの数字は、その設定で実際に回したらどうなるかを、計算して作る。
[iscript]
var pickSetting = function () {
  var r = Math.random();
  if (r < 0.40) return 1;
  if (r < 0.65) return 2;
  if (r < 0.80) return 3;
  if (r < 0.90) return 4;
  if (r < 0.96) return 5;
  return 6;
};
f.slot_hall = [];
for (var i = 0; i < 6; i++) {
  var setting = pickSetting();
  var games = 800 + Math.floor(Math.random() * 5000);
  var h = SlotEngine.fakeHistory(setting, Math.floor(Math.random() * 1e9), games);
  f.slot_hall.push({
    no: 101 + i, setting: setting,
    games: h.games, at: h.at, now: h.now, maxGet: h.maxGet,
    label: "No." + (101 + i) + "　総 " + h.games.toLocaleString() + "G　AT " + h.at + "回　現在 " + h.now + "G　最大 " + h.maxGet.toLocaleString() + "枚"
  });
}
[endscript]

*aisle
[cm]
[bg storage="bg_hall_aisle.gif" time="400"]
#
（どの台に座ろう。上のデータを、よく見て選ぼう）
[glink  color="black"  storage="system/slot.ks"  size="22"  x="190"  width="900"  y="20"   text="&f.slot_hall[0].label"  target="*sit"  exp="f.slot_pick = 0"  ]
[glink  color="black"  storage="system/slot.ks"  size="22"  x="190"  width="900"  y="78"   text="&f.slot_hall[1].label"  target="*sit"  exp="f.slot_pick = 1"  ]
[glink  color="black"  storage="system/slot.ks"  size="22"  x="190"  width="900"  y="136"  text="&f.slot_hall[2].label"  target="*sit"  exp="f.slot_pick = 2"  ]
[glink  color="black"  storage="system/slot.ks"  size="22"  x="190"  width="900"  y="194"  text="&f.slot_hall[3].label"  target="*sit"  exp="f.slot_pick = 3"  ]
[glink  color="black"  storage="system/slot.ks"  size="22"  x="190"  width="900"  y="252"  text="&f.slot_hall[4].label"  target="*sit"  exp="f.slot_pick = 4"  ]
[glink  color="black"  storage="system/slot.ks"  size="22"  x="190"  width="900"  y="310"  text="&f.slot_hall[5].label"  target="*sit"  exp="f.slot_pick = 5"  ]
;7台目：GOLDEN（Aタイプ）。中身は data/others/golden/（ソースは tools/golden-slot/ を Vite でビルドしたもの）
[glink  color="black"  storage="system/slot.ks"  size="22"  x="190"  width="270"  y="368"  text="No.107　GOLDEN"  target="*sit_frame"  exp="f.slot_frame = 'golden'"  ]
;8台目：こおりくんの大冒険（AT機）。中身は data/others/koori/（ソースは tools/koori-slot/ を1ファイルにビルドしたもの）
[glink  color="black"  storage="system/slot.ks"  size="22"  x="500"  width="270"  y="368"  text="No.108　こおりくん"  target="*sit_frame"  exp="f.slot_frame = 'koori'"  ]
;9台目：本番用のST機（開発中）。中身は data/others/st_slot/（素のJS。ビルドなし）
[glink  color="black"  storage="system/slot.ks"  size="22"  x="810"  width="270"  y="368"  text="No.109　ST機（新台）"  target="*sit_frame"  exp="f.slot_frame = 'st'"  ]
[glink  color="black"  storage="system/slot.ks"  size="22"  x="390"  width="500"  y="426"  text="やっぱり、帰る"  target="*go_home"  ]
[s]

;---------------------------------------
; 別の台（GOLDEN・こおりくん）に座って遊ぶ。どちらの台かは f.slot_frame（'golden' / 'koori'）
; 画面は data/others/golden/ または data/others/koori/ の index.html を iframe で重ねて出す。
; 「精算して帰る」を押すと、台から postMessage で結果が届いて *leave へ進む（デバッグラッシュと同じ形の f.slot_result）。
;---------------------------------------
*sit_frame
[cm]
[layopt layer="message0" visible="false"]
[hidemenubutton]
[stopbgm]
[bg storage="bg_hall_aisle.gif" time="300"]
[iscript]
(function () {
  var MACHINES = {
    golden: { src: "./data/others/golden/index.html", source: "golden-slot" },
    koori:  { src: "./data/others/koori/index.html",  source: "koori-slot" },
    st:     { src: "./data/others/st_slot/index.html", source: "st-slot" }
  };
  var m = MACHINES[f.slot_frame] || MACHINES.golden;
  // 設定は店の6台と同じ置き方（1が多め、6はまれ）
  var r = Math.random();
  var setting = r < 0.40 ? 1 : r < 0.65 ? 2 : r < 0.80 ? 3 : r < 0.90 ? 4 : r < 0.96 ? 5 : 6;
  var c = TYRANO.kag.config || {};
  var v = parseInt(c.defaultSeVolume, 10);
  var vol = isNaN(v) ? 1 : Math.max(0, Math.min(1, v / 100));

  var done = false;
  var finish = function (res) {
    if (done) return;
    done = true;
    window.removeEventListener("message", onMessage);
    clearTimeout(readyTimer);
    if (frame.parentNode) frame.parentNode.removeChild(frame);
    f.slot_result = res;
    f.money = res.money;
    f.slot_total += res.back - res.invest;
    TYRANO.kag.ftag.startTag("jump", { storage: "system/slot.ks", target: "*leave" });
  };
  // 台が開けなかった・途中で落ちたとき：お金は動かさずに店を出る
  var fail = function (why) {
    if (window.console) console.error("[" + m.source + "] " + why);
    finish({ money: f.money, invest: 0, back: 0, games: 0, at: 0, maxGet: 0, error: true });
  };
  var onMessage = function (e) {
    var d = e.data || {};
    if (d.source !== m.source) return;
    if (d.type === "ready") { clearTimeout(readyTimer); frame.focus(); return; }
    if (d.type === "close" && d.result) finish(d.result);
  };

  var frame = document.createElement("iframe");
  frame.id = "slot_frame";
  frame.src = m.src + "?embed=1&money=" + f.money + "&setting=" + setting + "&vol=" + vol;
  frame.setAttribute("allowtransparency", "true");
  frame.style.cssText = "position:absolute;left:0;top:0;width:1280px;height:720px;border:0;z-index:9000;background:transparent;";
  window.addEventListener("message", onMessage);
  var readyTimer = setTimeout(function () { fail("台を開けませんでした"); }, 15000);
  try {
    (document.querySelector(".tyrano_base") || document.body).appendChild(frame);
  } catch (err) {
    fail("台を開けませんでした " + err);
  }
})();
[endscript]
[s]

;---------------------------------------
; 台に座って遊ぶ
; 画面は slot_screen.js が作る。「精算してやめる」を押すと、onClose が呼ばれて *leave へ進む。
;---------------------------------------
*sit
[cm]
[layopt layer="message0" visible="false"]
[hidemenubutton]
;台の BGM は slot_screen.js が鳴らすので、店の BGM は止める
[stopbgm]
[iscript]
var d = f.slot_hall[f.slot_pick];
var backToScenario = function () {
  TYRANO.kag.ftag.startTag("jump", { storage: "system/slot.ks", target: "*leave" });
};
try {
SlotScreen.open({
  no: d.no, setting: d.setting, since: d.now,
  histGames: d.games, histAt: d.at, histMaxGet: d.maxGet,
  money: f.money, maxGames: 600,
  onClose: function (r) {
    f.slot_result = r;
    f.money = r.money;
    f.slot_total += r.back - r.invest;
    backToScenario();
  }
});
} catch (e) {
  // 台を開けなかったとき：お金は動かさずに、店を出る
  if (window.console) console.error("[slot] 台を開けませんでした", e);
  f.slot_result = { money: f.money, invest: 0, back: 0, games: 0, at: 0, maxGet: 0, error: true };
  setTimeout(backToScenario, 0);
}
[endscript]
[s]

*leave
[cm]
[showmenubutton]
[playbgm storage="bgm_walk.mp3"]
[layopt layer="message0" visible="true"]
[bg storage="bg_street_night.gif" time="500"]
[if exp="f.slot_result.error"]
#
台の調子が悪いようだ。店員さんが、メダルを精算してくれた。[p]
[endif]
#
投資 [emb exp="f.slot_result.invest.toLocaleString()"] 円、回収 [emb exp="f.slot_result.back.toLocaleString()"] 円。（[emb exp="f.slot_result.games"] ゲーム）[p]
[if exp="f.slot_result.back - f.slot_result.invest > 0"]
#おまえ
（……勝った。財布が、あったかい。これが、続けばいいのに）[p]
[elsif exp="f.slot_result.invest == 0"]
#おまえ
（見るだけで、帰ってきた。……えらいぞ、おれ）[p]
[else]
#おまえ
（……負けた。この金額があれば、何が買えたんだろう）[p]
[endif]

*go_home
[cm]
@jump storage="system/home.ks" target="*hub"
