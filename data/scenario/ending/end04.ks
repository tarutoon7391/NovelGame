;=========================================
; END 4：BAD END「ひとりぼっちの退職」
;=========================================
*start
[cm]
[stopse buf="1"]
[stopse buf="2"]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]
[resetfont]

;BAD END：全員に嫌われて、退職する
;6-4 の朝に「全部、自分の実力です」と言った、または、誰の信頼度も基準（6）に届かなかったとき
[bg storage="bg_president_room.gif" time="500"]

#社長
……と、言いたいところだが[p]
#おまえ
え？[p]
#社長
みんなに、お前の話を、聞いた[p]
#リーダー
……sry。正直に、話したよ[p]
#先輩
パスを、出しても、返ってこないんだぜ……[p]
#営業
……一緒に、客の前に、立ちたくない[p]
#同期
オデ、ずっと、友達だと、思ってたのによ[p]
#社長
いいか、よく聞け……仕事は、一人じゃ、できないんだぜ[p]
#おまえ
（……続きが、あった）[p]

[bg storage="bg_home_night.gif" time="1000"]
#ナレーション
その月の終わりに、主人公は、会社を辞めた。[p]
送別会は、開かれなかった。[p]
#おまえ
……誰か、一人くらい、引き止めてくれても[p]
#ナレーション
スマホの通知が、1件だけ、届いていた。[p]
『自動ドアより：今まで、ありがとうございました』[p]
#おまえ
……ドアだけは、優しかった[p]

;=========================================
; 【エンディング表示】記録して、タイトルへ
;=========================================
[fadeoutbgm time="2000"]
[stopse]
[cm]
[hidemenubutton]
[layopt layer="message0" visible="false"]
[bg storage="bg_white.png" time="1000"]
[layopt layer="2" visible="true"]
[ptext layer="2" name="end_card" x="0" y="230" width="1280" align="center" size="64" color="0x222222" bold="true" text="BAD END"]
[ptext layer="2" name="end_card" x="0" y="340" width="1280" align="center" size="40" color="0x222222" text="ひとりぼっちの退職"]
[ptext layer="2" name="end_card" x="0" y="430" width="1280" align="center" size="24" color="0x777777" text="No.4 ／ 10"]
;見たエンディングを、エンディング一覧に記録する（sf はシステム変数。セーブデータとは別に残る）
[eval exp="sf.end4 = true"]
[wait time="1500"]
[l]
[free layer="2" name="end_card"]
@jump storage="title.ks"
