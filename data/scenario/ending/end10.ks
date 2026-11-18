;=========================================
; END 10：BAD END「オールイン」
;=========================================
*start
[cm]
[stopse buf="1"]
[stopse buf="2"]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]
[resetfont]

;BAD END：ギャンブルに、のめり込む
;  入り方は2つ
;   ・5-4 のキー選択肢（全財産ビンゴ）
;   ・パチスロで通算5万円以上負けて、お金がないのに、まだ行こうとする（f.end10_route = 'slot'。自宅のドアから）
@jump target="*slot_route" cond="f.end10_route == 'slot'"

[bg storage="bg_izakaya.gif" time="500"]

#社長
ふっ……ビンゴだ。俺の、勝ちだぜ[p]
#おまえ
まだです！ 次は、来月の給料を、賭けます！[p]
#同期
お前、目が、ペンギンみたいに、なってるぜ……[p]
[bg storage="bg_home_night.gif" time="1000"]
#ナレーション
年が明けても、主人公は、賭け続けた。[p]

;ここから先は、どちらの入り方でも同じ
*common
#ナレーション
給料も、ボーナスも、魚肉ソーセージも、全部、なくなった。[p]
#リーダー
（電話）……新人さん。お金の話なら、まず、相談してほしいな[p]
#おまえ
大丈夫です。次で、全部、取り返します[p]

[bg storage="bg_president_room.gif" time="1000"]
#社長
……最後の勝負だ。いいか、よく聞け……賭けるのは、お前の、命だ[p]
#おまえ
……乗ります[p]
[quake count="4" time="300" hmax="20"]
#ナレーション
社長が、ゆっくりと、カードを、めくった。[p]
#社長
……ふっ[p]
#ナレーション
主人公の、負けだった。[p]
社長は、何も言わずに、一回転して、部屋を出ていった。[p]
主人公の姿を見た者は、それから、一人もいない。[p]
@jump target="*card"

;---------------------------------------
; パチスロからの入り方（最初の @jump から来る）
;---------------------------------------
*slot_route
[bg storage="bg_pachinko_front.gif" time="500"]
#ナレーション
財布の中には、小銭しかない。それでも、足は、店に向かっていた。[p]
#おまえ
次は、来る。デバッグラッシュは、絶対に、来る……[p]
#同期
（電話）おい、今どこだよ！ 明日も、朝会あるんだぞ！[p]
#おまえ
大丈夫。次で、全部、取り返すから[p]
[bg storage="bg_home_night.gif" time="1000"]
#ナレーション
給料日が来るたびに、お金は、メダルに変わった。[p]
メダルは、いつも、すぐに、なくなった。[p]
@jump target="*common"

;=========================================
; 【エンディング表示】記録して、タイトルへ
;=========================================
*card
[fadeoutbgm time="2000"]
[stopse]
[cm]
[hidemenubutton]
[layopt layer="message0" visible="false"]
[bg storage="bg_white.png" time="1000"]
[layopt layer="2" visible="true"]
[ptext layer="2" name="end_card" x="0" y="230" width="1280" align="center" size="64" color="0x222222" bold="true" text="BAD END"]
[ptext layer="2" name="end_card" x="0" y="340" width="1280" align="center" size="40" color="0x222222" text="オールイン"]
[ptext layer="2" name="end_card" x="0" y="430" width="1280" align="center" size="24" color="0x777777" text="No.10 ／ 10"]
;見たエンディングを、エンディング一覧に記録する（sf はシステム変数。セーブデータとは別に残る）
[eval exp="sf.end10 = true"]
[wait time="1500"]
[l]
[free layer="2" name="end_card"]
@jump storage="title.ks"
