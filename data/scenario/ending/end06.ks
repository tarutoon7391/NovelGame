;=========================================
; END 6：BAD END「隕石と、職務経歴書」
;=========================================
*start
[cm]
[stopse buf="1"]
[stopse buf="2"]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]
[resetfont]

;BAD END：点数が足りずクビになり、転職先を探すが……（章末の判定・最終面談で、点数が足りないとき）
[bg storage="bg_home_night.gif" time="500"]

#ナレーション
会社を、クビになった。[p]
主人公は、次の仕事を、探し始めた。[p]
#おまえ
大丈夫。IT用語は、少しは、覚えた[p]
#ナレーション
書類選考、10社。全部、落ちた。[p]
#おまえ
……職務経歴書に、『自動ドアに詳しい』と、書いたのが、いけなかったのかな[p]
#ナレーション
11社目。ようやく、面接に、呼ばれた。[p]

[bg storage="bg_company_front.gif" time="1000"]
#おまえ
よし。今日こそ、決めるぞ[p]
#ナレーション
その時。空が、光った。[p]
[bg storage="bg_white.png" time="300"]
[quake count="6" time="300" hmax="30"]
#ナレーション
直径、30センチの、隕石だった。[p]
ピンポイントで、主人公の、職務経歴書に、落ちてきた。[p]
#おまえ
……せめて、書類だけでも……[p]
#ナレーション
面接会場に、主人公が、現れることは、なかった。[p]

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
[ptext layer="2" name="end_card" x="0" y="340" width="1280" align="center" size="40" color="0x222222" text="隕石と、職務経歴書"]
[ptext layer="2" name="end_card" x="0" y="430" width="1280" align="center" size="24" color="0x777777" text="No.6 ／ 10"]
;見たエンディングを、エンディング一覧に記録する（sf はシステム変数。セーブデータとは別に残る）
[eval exp="sf.end6 = true"]
[wait time="1500"]
[l]
[free layer="2" name="end_card"]
@jump storage="title.ks"
