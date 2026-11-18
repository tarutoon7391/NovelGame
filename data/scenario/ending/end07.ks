;=========================================
; END 7：BAD END「宇宙一、遠い夜勤」
;=========================================
*start
[cm]
[stopse buf="1"]
[stopse buf="2"]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]
[resetfont]

;BAD END：夜の当番中に、窓の外の光を見に行き、宇宙生物に、連れ去られる（4-2 のキー選択肢）
[bg storage="bg_company_front.gif" time="500"]

#ナレーション
午前1時半。会社の前に、出た。[p]
真上に、緑色に光る、巨大な円盤が、浮かんでいる。[p]
#おまえ
……え。本物？[p]
[bg storage="bg_white.png" time="300"]
#ナレーション
まぶしい光に、包まれた。[p]

[bg storage="bg_datacenter.gif" time="1000"]
#？？？
ピポ……ピポ……[p]
#おまえ
ここ、どこですか……[p]
#？？？
オマエ、当番ノ、人間カ[p]
当番ナノニ、持チ場ヲ、離レタ人間ハ、珍シイ。サンプルニ、スル[p]
#おまえ
（……監視画面、つけっぱなしで、来ちゃった）[p]
#ナレーション
宇宙船の窓の外には、無数の星と、無数の、目玉が、並んでいた。[p]
その頃、会社では、アラートが、誰にも気づかれずに、鳴り続けていた。[p]
#リーダー
（翌朝）……おやおや。当番の新人さん、どこに行ったんだろうね[p]
#ナレーション
主人公が、地球に戻ることは、なかった。[p]

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
[ptext layer="2" name="end_card" x="0" y="340" width="1280" align="center" size="40" color="0x222222" text="宇宙一、遠い夜勤"]
[ptext layer="2" name="end_card" x="0" y="430" width="1280" align="center" size="24" color="0x777777" text="No.7 ／ 10"]
;見たエンディングを、エンディング一覧に記録する（sf はシステム変数。セーブデータとは別に残る）
[eval exp="sf.end7 = true"]
[wait time="1500"]
[l]
[free layer="2" name="end_card"]
@jump storage="title.ks"
