;=========================================
; 章・日が変わるときの演出（[call] で呼ぶ）
; 文章も枠も消して、黒い画面の真ん中に文字を出す。クリックで次へ。
;
; 呼び方（先に f.tr_〜 に文字を入れておく）
;   [eval exp="f.tr_chapter = '第1章'; f.tr_title = '自動ドアは、新人を選ぶ'; f.tr_date = '4月1日'"]
;   [call storage="system/transition.ks" target="*chapter"]
;
;   [eval exp="f.tr_date = '4月2日'"]
;   [call storage="system/transition.ks" target="*day"]
;
;   章の終わり（f.tr_next に、次の章の名前を入れる）
;   [eval exp="f.tr_chapter = '第1章'; f.tr_next = '第2章「AIは、100%を語る」'"]
;   [call storage="system/transition.ks" target="*chapter_end"]
;=========================================

*chapter
[cm]
[hidemenubutton]
[layopt layer="message0" visible="false"]
[fadeoutbgm time="800"]
[bg storage="bg_black.png" time="800"]
[layopt layer="2" visible="true"]
[playse storage="se_pikon.mp3"]
[ptext layer="2" name="tr_text" x="0" y="220" width="1280" align="center" size="30" color="0xe2c48a" text="&f.tr_chapter"]
[wait time="400"]
[ptext layer="2" name="tr_text" x="0" y="290" width="1280" align="center" size="56" bold="true" color="0xffffff" text="&f.tr_title"]
[wait time="400"]
[ptext layer="2" name="tr_text" x="0" y="420" width="1280" align="center" size="28" color="0xbbbbbb" text="&'～ ' + f.tr_date + ' ～'"]
[wait time="600"]
[l]
@jump target="*finish"

*chapter_end
[cm]
[hidemenubutton]
[layopt layer="message0" visible="false"]
[fadeoutbgm time="1200"]
[bg storage="bg_black.png" time="1000"]
[layopt layer="2" visible="true"]
[playse storage="se_pikon.mp3"]
[ptext layer="2" name="tr_text" x="0" y="270" width="1280" align="center" size="52" bold="true" color="0xffffff" text="&f.tr_chapter + '　おわり'"]
[wait time="600"]
[ptext layer="2" name="tr_text" x="0" y="400" width="1280" align="center" size="26" color="0xe2c48a" text="&'次は　' + f.tr_next"]
[wait time="600"]
[l]
@jump target="*finish"

*day
[cm]
[hidemenubutton]
[layopt layer="message0" visible="false"]
[fadeoutbgm time="600"]
[bg storage="bg_black.png" time="600"]
[layopt layer="2" visible="true"]
[playse storage="se_piko.mp3"]
[ptext layer="2" name="tr_text" x="0" y="320" width="1280" align="center" size="44" color="0xffffff" text="&'～ ' + f.tr_date + ' ～'"]
[wait time="700"]
[l]

*finish
[free layer="2" name="tr_text" time="400"]
[layopt layer="message0" visible="true"]
@showmenubutton
[return]
