;=========================================
; 章セレクト（タイトルの「章をえらぶ」から来る）
; 一度でも始めた章だけ選べる。まだの章は「？？？」。
;   sf.reach_ch2 〜 sf.reach_ch6 … その章を始めたことがあるか（各章の最初のファイルで true にする）
;
; 途中の章から始めるときは、変数を「その章の始まりらしい値」にしてから始める
;   信頼度 … 4人とも (章 − 1) × 2
;   所持金 … 30,000円　　用語図鑑 … 空っぽ　　全員と知り合い
;=========================================

*start
[cm]
[clearfix]
[bg storage="bg_black.png" time="300"]
[layopt layer="2" visible="true"]
[free layer="2" name="cs_text"]
[ptext layer="2" name="cs_text" x="0" y="24" width="1280" align="center" size="34" bold="true" color="0xe2c48a" text="章をえらぶ"]

;選べる章（glink）と、まだ選べない章（灰色の文字）
[glink  color="black"  storage="system/chapter_select.ks"  size="24"  x="240"  width="800"  y="100"  text="第1章　自動ドアは、新人を選ぶ"           target="*go"  exp="f.sel_ch = 1"  ]
[glink  color="black"  storage="system/chapter_select.ks"  size="24"  x="240"  width="800"  y="180"  text="第2章　AIは、100%を語る"                target="*go"  exp="f.sel_ch = 2"  cond="sf.reach_ch2"  ]
[glink  color="black"  storage="system/chapter_select.ks"  size="24"  x="240"  width="800"  y="260"  text="第3章　バカ野郎は、一度だけ"            target="*go"  exp="f.sel_ch = 3"  cond="sf.reach_ch3"  ]
[glink  color="black"  storage="system/chapter_select.ks"  size="24"  x="240"  width="800"  y="340"  text="第4章　午前3時の、監視者たち"           target="*go"  exp="f.sel_ch = 4"  cond="sf.reach_ch4"  ]
[glink  color="black"  storage="system/chapter_select.ks"  size="24"  x="240"  width="800"  y="420"  text="第5章　全財産ビンゴの夜"                target="*go"  exp="f.sel_ch = 5"  cond="sf.reach_ch5"  ]
[glink  color="black"  storage="system/chapter_select.ks"  size="24"  x="240"  width="800"  y="500"  text="第6章　サーバが落ちても、俺たちは落ちない"  target="*go"  exp="f.sel_ch = 6"  cond="sf.reach_ch6"  ]
[ptext layer="2" name="cs_text" x="240" y="196" width="800" align="center" size="24" color="0x666e80" text="第2章　？？？" cond="!sf.reach_ch2"]
[ptext layer="2" name="cs_text" x="240" y="276" width="800" align="center" size="24" color="0x666e80" text="第3章　？？？" cond="!sf.reach_ch3"]
[ptext layer="2" name="cs_text" x="240" y="356" width="800" align="center" size="24" color="0x666e80" text="第4章　？？？" cond="!sf.reach_ch4"]
[ptext layer="2" name="cs_text" x="240" y="436" width="800" align="center" size="24" color="0x666e80" text="第5章　？？？" cond="!sf.reach_ch5"]
[ptext layer="2" name="cs_text" x="240" y="516" width="800" align="center" size="24" color="0x666e80" text="第6章　？？？" cond="!sf.reach_ch6"]
[glink  color="black"  storage="system/chapter_select.ks"  size="22"  x="490"  width="300"  y="610"  text="タイトルにもどる"  target="*back"  ]
[s]

*back
[cm]
[free layer="2" name="cs_text"]
@jump storage="title.ks"

;---------------------------------------
; 選んだ章を始める
;---------------------------------------
*go
[cm]
[free layer="2" name="cs_text"]
[iscript]
var n = f.sel_ch;
var trust = (n - 1) * 2;
f.t_senpai = trust; f.t_leader = trust; f.t_eigyo = trust; f.t_douki = trust; f.shacho = 0;
f.term_q = 0; f.term_ok = 0; f.correct_am = 0; f.ai_ok = 0; f.confess = 0; f.arrogant = 0;
f.money = 30000; f.slot_count = 0; f.slot_total = 0; f.study = 0; f.terms = {}; f.wrong_today = [];
var met = (n >= 2);
f.met_senpai = met; f.met_leader = met; f.met_eigyo = met; f.met_douki = met;
f.sel_storage = ["", "ch1_3/scene1_1.ks", "ch1_3/scene2_1.ks", "ch1_3/scene3_1.ks",
                 "ch4_6/scene4_1.ks", "ch4_6/scene5_1.ks", "ch4_6/scene6_1.ks"][n];
[endscript]
[jump storage="&f.sel_storage"]
