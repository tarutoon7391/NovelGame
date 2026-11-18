;=========================================
; END 3：BAD END「会社、爆発」
;=========================================
*start
[cm]
[stopse buf="1"]
[stopse buf="2"]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]
[resetfont]

;BAD END：再起動ボタンを連打して、会社が爆発する（3-2 のキー選択肢）
[bg storage="bg_monitor_alert.gif" time="300"]
[playse storage="se_alarm05.mp3"]
[quake count="5" time="300" hmax="20"]

#AI
警告。再起動の、命令が、1秒間に、128回、届いています[p]
サーバが、混乱しています。……私も、混乱しています[p]
#おまえ
えっ、止まって！ 止まってってば！[p]
[quake count="8" time="300" hmax="30"]
[bg storage="bg_white.png" time="200"]
#ナレーション
その日、会社は、爆発した。[p]
けが人は、いなかった。サーバも、会社も、なくなった。[p]

[bg storage="bg_home_night.gif" time="1000"]
#ナレーション
翌日から、主人公は、無職になった。[p]
#同期
（電話）……なあ。オデたち、明日から、どこに出社すればいいんだ？[p]
#おまえ
……わからない[p]
#同期
とりあえず、焼け跡の、自動ドアの前に、行ってみるぜ[p]
#おまえ
ドアは、もう、ないと思う[p]
#ナレーション
障害のときは、まず、状況を確かめる。再起動は、最後の手段だ。[p]

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
[ptext layer="2" name="end_card" x="0" y="340" width="1280" align="center" size="40" color="0x222222" text="会社、爆発"]
[ptext layer="2" name="end_card" x="0" y="430" width="1280" align="center" size="24" color="0x777777" text="No.3 ／ 10"]
;見たエンディングを、エンディング一覧に記録する（sf はシステム変数。セーブデータとは別に残る）
[eval exp="sf.end3 = true"]
[wait time="1500"]
[l]
[free layer="2" name="end_card"]
@jump storage="title.ks"
