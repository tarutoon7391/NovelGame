;=========================================
; 自宅：画面の物をクリックして、夜の行動を選ぶ（[call] で呼ぶ）
;   机     … 勉強する（今日まちがえた用語の復習・用語図鑑）
;   スマホ … 誰かに連絡する（信頼度が上がる）
;   ドア   … 外出する（パチスロ・コンビニ）
;   ベッド … 寝る（[return] で呼んだ場所に戻り、次の日へ）
; 1晩に行動できるのは2回まで（f.home_ap）。寝るのは、いつでもできる。
;
; 使う変数
;   f.home_ap       … 今夜あと何回行動できるか
;   f.money         … 所持金
;   f.terms         … 用語図鑑（{ 用語: 説明 }）
;   f.wrong_today   … 今日まちがえた用語のリスト
;   f.met_〜        … 連絡先を知っているか（会った人だけ、スマホと信頼度メーターに出る）
;   f.t_〜          … 信頼度（右上の信頼度メーターに出る）
;
; 呼び方
;   [call storage="system/home.ks"]
;=========================================

*start
[eval exp="f.home_ap = 2"]
;古いセーブデータ（パチスロを入れる前）を読み込んだときのために、無ければ 0 にしておく
[eval exp="f.slot_total = f.slot_total || 0; f.slot_count = f.slot_count || 0"]

*hub
[cm]
[layopt layer="message0" visible="false"]
[bg storage="bg_home_night.gif" time="500"]
[playbgm storage="bgm_walk.mp3" restart="false"]
[layopt layer="2" visible="true"]
[free layer="2" name="home_label"]
[free layer="2" name="panel"]

;上の案内（残り回数と所持金）
[iscript]
f.home_text = (f.home_ap > 0)
  ? '今夜は、何をする？　（あと ' + f.home_ap + ' 回）　所持金：' + f.money.toLocaleString() + '円'
  : 'もう、遅い時間だ。そろそろ寝よう。　所持金：' + f.money.toLocaleString() + '円';
[endscript]
[ptext layer="2" name="home_label home_tag" x="320" y="16" width="640" align="center" size="24" color="0xffffff" text="&f.home_text"]

;信頼度メーター（会った人だけ。ゲージは 15 でいっぱい。10 以上で、キー選択肢で止めてくれる）
[iscript]
var people = [
  { name: "先輩",     v: f.t_senpai, met: f.met_senpai, color: "#e05a5a" },
  { name: "リーダー", v: f.t_leader, met: f.met_leader, color: "#5a9ae0" },
  { name: "営業",     v: f.t_eigyo,  met: f.met_eigyo,  color: "#5ac08a" },
  { name: "同期",     v: f.t_douki,  met: f.met_douki,  color: "#e0b45a" }
];
var html = "<span class='trust_title'>信頼度</span>";
people.forEach(function (p) {
  if (!p.met) return;
  var w = Math.round(Math.min(p.v, 15) / 15 * 100);
  html += "<span class='trust_row'><span class='trust_name'>" + p.name + "</span>" +
          "<span class='trust_bar'><span style='width:" + w + "%;background:" + p.color + "'></span>" +
          "<i></i></span><span class='trust_num'>" + p.v + "</span></span>";
});
f.trust_html = html;
[endscript]
[ptext layer="2" name="home_label home_trust" x="1004" y="70" width="256" size="18" color="0xfdf6e3" text="&f.trust_html" cond="f.met_senpai || f.met_leader || f.met_eigyo || f.met_douki"]

;クリックできる場所（見た目には出さない。物の上の虫眼鏡が目印）
[clickable x="16"  y="88"  width="96"  height="340" opacity="255" target="*door"  cond="f.home_ap > 0"]
[clickable x="115" y="330" width="335" height="150" opacity="255" target="*desk"  cond="f.home_ap > 0"]
[clickable x="464" y="560" width="280" height="120" opacity="255" target="*phone" cond="f.home_ap > 0"]
[clickable x="784" y="368" width="490" height="272" opacity="255" target="*bed"]

;目印の虫眼鏡（data/image/ui/icon_search.png）と、名札
;name に「home_label」を入れておくと、[free layer="2" name="home_label"] でまとめて消せる
[image layer="2" folder="image" storage="ui/icon_search.png" name="home_label home_icon icon_door"  x="40"   y="170" cond="f.home_ap > 0"]
[image layer="2" folder="image" storage="ui/icon_search.png" name="home_label home_icon icon_desk"  x="190"  y="280" cond="f.home_ap > 0"]
[image layer="2" folder="image" storage="ui/icon_search.png" name="home_label home_icon icon_phone" x="580"  y="500" cond="f.home_ap > 0"]
[image layer="2" folder="image" storage="ui/icon_search.png" name="home_label home_icon icon_bed"   x="1000" y="320"]
[ptext layer="2" name="home_label home_tag tag_door"  x="22"   y="224" size="20" color="0xffe296" text="外出する" cond="f.home_ap > 0"]
[ptext layer="2" name="home_label home_tag tag_desk"  x="172"  y="334" size="20" color="0xffe296" text="勉強する" cond="f.home_ap > 0"]
[ptext layer="2" name="home_label home_tag tag_phone" x="562"  y="554" size="20" color="0xffe296" text="連絡する" cond="f.home_ap > 0"]
[ptext layer="2" name="home_label home_tag tag_bed"   x="1002" y="374" size="20" color="0xffe296" text="寝る"]

;V6の [clickable] は name を class にしないので、ここで目印の class「home_spot」を付ける。
;マウスを乗せた場所の虫眼鏡と名札に「hover」を付けて、大きく・明るくする（見た目は game_ui.css）
[iscript]
var spotName = { 16: "door", 115: "desk", 464: "phone", 784: "bed" };
$(".layer_free").children("div").not(".glink_button").each(function () {
  var key = spotName[parseInt(this.style.left)];
  $(this).addClass("home_spot").hover(
    function () { $(".icon_" + key + ", .tag_" + key).addClass("hover"); },
    function () { $(".icon_" + key + ", .tag_" + key).removeClass("hover"); }
  );
});
[endscript]
[s]


;---------------------------------------
; 机：勉強する
;---------------------------------------
*desk
[cm]
[free layer="2" name="home_label"]
[eval exp="f.home_ap -= 1"]
[playse storage="se_keyboard.mp3" buf="2"]

;まちがえた用語と、用語図鑑の中身を、行のリストにして、12行ずつのページに分ける
[iscript]
//同じ用語を何回かまちがえていても、1回だけ表示する
f.wrong_today = f.wrong_today.filter(function (w, i, a) { return a.indexOf(w) === i; });
var lines = [];
lines.push('【まちがえた用語（まだ復習していないもの）】');
if (f.wrong_today.length === 0) {
  lines.push('なし。全部、正解できている！');
} else {
  f.wrong_today.forEach(function (w) { lines.push('・' + w + '：' + (f.terms[w] || '')); });
}
lines.push('');
lines.push('【用語図鑑】（これまでに覚えた用語）');
Object.keys(f.terms).forEach(function (k) {
  if (f.wrong_today.indexOf(k) === -1) lines.push('・' + k + '：' + f.terms[k]);
});
f.desk_pages = [];
for (var i = 0; i < lines.length; i += 12) {
  f.desk_pages.push(lines.slice(i, i + 12).join('<br>'));
}
f.desk_page = 0;
[endscript]

*desk_show
[cm]
[free layer="2" name="panel"]
[ptext layer="2" name="panel" x="90" y="40" width="1100" size="22" color="0xfdf6e3" text="&f.desk_pages[f.desk_page] + '<br><br>（' + (f.desk_page + 1) + ' / ' + f.desk_pages.length + ' ページ）'"]
[glink  color="black"  storage="system/home.ks"  size="22"  x="330"  width="260"  y="630"  text="次のページ"  target="*desk_next"  cond="f.desk_page < f.desk_pages.length - 1"  ]
[glink  color="black"  storage="system/home.ks"  size="22"  x="690"  width="260"  y="630"  text="閉じる"      target="*desk_close"  ]
[s]

*desk_next
[eval exp="f.desk_page += 1"]
@jump target="*desk_show"

*desk_close
[cm]
[free layer="2" name="panel"]
[stopse buf="2"]

[layopt layer="message0" visible="true"]
#おまえ
（……よし。今日の分は、頭に入った）[p]
;復習した用語は「まちがえた用語」から外す
[eval exp="f.study = (f.study || 0) + 1; f.wrong_today = []"]
@jump target="*hub"


;---------------------------------------
; スマホ：誰かに連絡する（会った人だけ）
;---------------------------------------
*phone
[cm]
[free layer="2" name="home_label"]
[layopt layer="message0" visible="true"]
#おまえ
（誰に、連絡しよう）
[glink  color="black"  storage="system/home.ks"  size="24"  x="340"  width="600"  y="110"  text="先輩"      target="*call_senpai"  cond="f.met_senpai"  ]
[glink  color="black"  storage="system/home.ks"  size="24"  x="340"  width="600"  y="180"  text="リーダー"  target="*call_leader"  cond="f.met_leader"  ]
[glink  color="black"  storage="system/home.ks"  size="24"  x="340"  width="600"  y="250"  text="営業"      target="*call_eigyo"   cond="f.met_eigyo"   ]
[glink  color="black"  storage="system/home.ks"  size="24"  x="340"  width="600"  y="320"  text="同期"      target="*call_douki"   cond="f.met_douki"   ]
[glink  color="black"  storage="system/home.ks"  size="24"  x="340"  width="600"  y="390"  text="やっぱり、やめる"  target="*hub"  ]
[s]

*call_senpai
[cm]
[eval exp="f.home_ap -= 1"]
#先輩
（メッセージ）おう！ 今日もナイスファイトだったぜ！ 明日も全力で走るぞ！ 早く寝ろよ！[p]
[eval exp="f.t_senpai += 1; f.toast = '先輩の信頼度が上がった！'"]
[call storage="system/toast.ks"]
@jump target="*hub"

*call_leader
[cm]
[eval exp="f.home_ap -= 1"]
#リーダー
（メッセージ）おつかれさま。今日のこと、保存しとく？ ……冗談だよ。おやすみ[p]
[eval exp="f.t_leader += 1; f.toast = 'リーダーの信頼度が上がった！'"]
[call storage="system/toast.ks"]
@jump target="*hub"

*call_eigyo
[cm]
[eval exp="f.home_ap -= 1"]
#営業
（メッセージ）……既読。……早く、寝ろ[p]
[eval exp="f.t_eigyo += 1; f.toast = '営業の信頼度が上がった！'"]
[call storage="system/toast.ks"]
@jump target="*hub"

*call_douki
[cm]
[eval exp="f.home_ap -= 1"]
#同期
（メッセージ）おう！ 明日は、ドアに挟まらないように、早めに行くぜ！[p]
[eval exp="f.t_douki += 1; f.toast = '同期の信頼度が上がった！'"]
[call storage="system/toast.ks"]
@jump target="*hub"


;---------------------------------------
; ドア：外出する
;---------------------------------------
*door
[cm]
[free layer="2" name="home_label"]
[layopt layer="message0" visible="true"]
#おまえ
（どこへ行こう）
[glink  color="black"  storage="system/home.ks"  size="24"  x="340"  width="600"  y="150"  text="パチスロに行く（1枚 20円）"  target="*go_slot"  cond="f.money >= 1000"  ]
;パチスロで通算5万円以上負けていて、お金がないのに、まだ行こうとする → エンディング⑩（パチスロ版）
[glink  color="red"    storage="system/home.ks"  size="24"  x="340"  width="600"  y="150"  text="パチスロに行く（……財布は、空っぽだ）"  target="*go_slot_broke"  cond="f.money < 1000 && f.slot_total <= -50000"  ]
[glink  color="black"  storage="system/home.ks"  size="24"  x="340"  width="600"  y="230"  text="コンビニで、夜食を買う（500円）"  target="*go_conbini"  cond="f.money >= 500"  ]
[glink  color="black"  storage="system/home.ks"  size="24"  x="340"  width="600"  y="310"  text="やっぱり、やめる"  target="*hub"  ]
[s]

*go_slot
[cm]
[eval exp="f.home_ap -= 1"]
@jump storage="system/slot.ks"

*go_slot_broke
[cm]
[eval exp="f.end10_route = 'slot'"]
@jump storage="ending/end10.ks"

*go_conbini
[cm]
[eval exp="f.home_ap -= 1; f.money -= 500"]
[bg storage="bg_conbini_night.gif" time="300"]
#ナレーション
近所のコンビニで、からあげを買った。[p]
#おまえ
（……うまい。社会人の味がする）[p]
@jump target="*hub"


;---------------------------------------
; ベッド：寝る（呼んだ場所に戻る）
;---------------------------------------
*bed
[cm]
[free layer="2" name="home_label"]
[layopt layer="message0" visible="true"]
#おまえ
（もう、寝ようかな）
[glink  color="black"  storage="system/home.ks"  size="24"  x="340"  width="600"  y="190"  text="寝る"  target="*sleep"  ]
[glink  color="black"  storage="system/home.ks"  size="24"  x="340"  width="600"  y="270"  text="まだ、起きている"  target="*hub"  cond="f.home_ap > 0"  ]
[s]

*sleep
[cm]
[free layer="2" name="home_label"]
#おまえ
……おやすみなさい[p]
[return]
