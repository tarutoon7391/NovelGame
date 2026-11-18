;=========================================
; END 2：GOOD END「先輩と、ゴールイン」
;=========================================
*start
[cm]
[stopse buf="1"]
[stopse buf="2"]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]
[resetfont]

;GOOD END：先輩と、結ばれる
;6-4 の最終面談で合格し、先輩の信頼度が一番高く、6-3 で想いを伝えていたとき
[playbgm storage="bgm_cheerful.mp3" restart="false"]
[bg storage="bg_office.gif" time="500"]

#先輩
新人！ ……いや、もう、新人じゃねェな[p]
#おまえ
先輩？[p]
#先輩
昨日の、あれ。オフサイドじゃ、なかったぜ[p]
#おまえ
……え[p]
#先輩
俺も、全力で、お前のことが、好きだ！[p]
#同期
ウオォォォッ！ 先輩が、決めたぜ！[p]
#リーダー
おやおや。……この瞬間は、保存しとくね[p]
#営業
……知ってた[p]

[bg storage="bg_white.png" time="1000"]
#ナレーション
それから、2年後。[p]
[bg storage="bg_company_front.gif" time="1000"]
会社の前で、小さな結婚式が、開かれた。[p]
#社長
ふっ……今日の司会は、俺だ。いいか、よく聞け……[p]
#ナレーション
社長は、続きを言わないまま、新郎たちの前で、一回転した。[p]
[playse storage="se_autodoor_close.mp3"]
#同期
……あれ？ 挟まった。今日に限って、挟まったぜ……[p]
#おまえ
今日くらいは、普通に通って！[p]
#先輩
ハッハッハ！ さあ、行くぞ！ 人生の、後半戦だぜ！[p]
#おまえ
……はい。延長戦まで、全力で、お願いします[p]

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
[ptext layer="2" name="end_card" x="0" y="230" width="1280" align="center" size="64" color="0x222222" bold="true" text="GOOD END"]
[ptext layer="2" name="end_card" x="0" y="340" width="1280" align="center" size="40" color="0x222222" text="先輩と、ゴールイン"]
[ptext layer="2" name="end_card" x="0" y="430" width="1280" align="center" size="24" color="0x777777" text="No.2 ／ 10"]
;見たエンディングを、エンディング一覧に記録する（sf はシステム変数。セーブデータとは別に残る）
[eval exp="sf.end2 = true"]
[wait time="1500"]
[l]
[free layer="2" name="end_card"]
@jump storage="title.ks"
