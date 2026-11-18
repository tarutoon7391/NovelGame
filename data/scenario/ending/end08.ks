;=========================================
; END 8：BAD END「自動ドアの、勝利」
;=========================================
*start
[cm]
[stopse buf="1"]
[stopse buf="2"]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]
[resetfont]

;BAD END：自動ドアに、勝負を挑んで、負ける（1-4 のキー選択肢）
[bg storage="bg_entrance_door.gif" time="500"]

#おまえ
うおおおおお！[p]
[playse storage="se_autodoor_open.mp3"]
#ナレーション
自動ドアは、開いた。主人公は、走り込んだ。[p]
[playse storage="se_autodoor_close.mp3"]
そして、ドアは、閉まった。[p]
[bg storage="ev_door_stuck.gif" time="300"]
[quake count="3" time="300" hmax="15"]
#おまえ
ぐえっ[p]
#同期
お前ェェェ！ だから、オデは、毎日、挟まってたんだぜ！ このドアは、本気だ！[p]
#先輩
新人！ そこは、オフサイドだ！[p]
#おまえ
……今、言うこと、ですか……[p]
#ナレーション
自動ドアは、その日から、二度と、開かなかった。[p]
会社の入口には、小さな、張り紙が、残された。[p]
『このドアは、勝者です』[p]

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
[ptext layer="2" name="end_card" x="0" y="340" width="1280" align="center" size="40" color="0x222222" text="自動ドアの、勝利"]
[ptext layer="2" name="end_card" x="0" y="430" width="1280" align="center" size="24" color="0x777777" text="No.8 ／ 10"]
;見たエンディングを、エンディング一覧に記録する（sf はシステム変数。セーブデータとは別に残る）
[eval exp="sf.end8 = true"]
[wait time="1500"]
[l]
[free layer="2" name="end_card"]
@jump storage="title.ks"
