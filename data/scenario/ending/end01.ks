;=========================================
; END 1：TRUE END「疑って確かめる力を、身につけた」
;=========================================
*start
[cm]
[stopse buf="1"]
[stopse buf="2"]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]
[resetfont]

;TRUE END：2年目の社員として、新しい後輩を迎える
;6-4 の最終面談で合格し、結婚エンドの条件を満たしていないとき（6-4 から、エピローグをこちらに移した）
[playbgm storage="bgm_cheerful.mp3" restart="false"]
;[場面：エピローグ・翌年の4月]

#ナレーション
それから、1か月が、過ぎた。[p]
4月。新しい、新入社員が、入社する日。[p]

;[bg storage="（会社の前（朝））" time="500"]
[bg storage="bg_company_front.gif" time="500"]

#おまえ
今年は、僕が、新人を迎える側か[p]
#同期
ドアの前で、待ってようぜ[p]
#おまえ
それは、いい考え[p]
;[効果音：自動ドアが、開く]
[playse storage="se_autodoor_open.mp3"]
#新入社員
……あの、お先に、失礼します[p]
;[効果音：自動ドアが、閉まる]
[playse storage="se_autodoor_close.mp3"]
;（挟まれる）
…………[p]
#おまえ
…………[p]
#同期
…………[p]
;（ツッコミ）
#おまえ
また、挟まれた[p]
#同期
去年の、オデと、同じだぜ……[p]
;（ツッコミ）
#おまえ
ドアを、修理しろ！[p]
;（奥から）
#社長
ふっ……何をしているんだ、お前たち……[p]
#ナレーション
社長は、新入社員の前で、静かに、一回転した。[p]
#同期
今年も、始まるな[p]
#おまえ
……そうだね[p]
#ナレーション
こうして、2年目が、始まった。[p]
#おまえ
（……よし。まずは、ドアの通り方から、教えよう）[p]

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
[ptext layer="2" name="end_card" x="0" y="230" width="1280" align="center" size="64" color="0x222222" bold="true" text="TRUE END"]
[ptext layer="2" name="end_card" x="0" y="340" width="1280" align="center" size="40" color="0x222222" text="疑って確かめる力を、身につけた"]
[ptext layer="2" name="end_card" x="0" y="430" width="1280" align="center" size="24" color="0x777777" text="No.1 ／ 10"]
;見たエンディングを、エンディング一覧に記録する（sf はシステム変数。セーブデータとは別に残る）
[eval exp="sf.end1 = true"]
[wait time="1500"]
[l]
[free layer="2" name="end_card"]
@jump storage="title.ks"
