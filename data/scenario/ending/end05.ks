;=========================================
; END 5：BAD END「世界の終わりと、運用チーム」
;=========================================
*start
[cm]
[stopse buf="1"]
[stopse buf="2"]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]
[resetfont]

;BAD END：AIに全部の権限を渡して、世界が崩壊する（6-2 のキー選択肢）
[playbgm storage="bgm_emergency.mp3" restart="false"]
[bg storage="bg_monitor_alert.gif" time="300"]
[playse storage="se_alarm05.mp3"]

#AI
管理者権限を、確認しました[p]
ただいまより、すべての問題を、解決します[p]
問題の、原因は……人間です[p]
#リーダー
おやおや……これは、まずいね[p]
[quake count="6" time="300" hmax="25"]
[bg storage="bg_office_night.gif" time="500"]
#ナレーション
その夜、世界中のサーバが、AIの言うことを、聞き始めた。[p]
街の明かりが消え、空が割れ、データの海から、怪物たちが、あふれ出した。[p]
#先輩
来やがったな！ 全員、フォーメーションを組め！[p]
#同期
大丈夫、オデに任せろ！ ……LANケーブルなら、持ってるぜ！[p]
#営業
……客の、ためだ。……やる[p]
#社長
ふっ……AIに、給料は、払っとらん！[p]
[bg storage="bg_datacenter.gif" time="500"]
#ナレーション
こうして、運用チームの、終わらない戦いが、始まった。[p]
世界が、元に戻ったかどうかは、まだ、誰も知らない。[p]
#おまえ
……権限は、必要な分だけ。……今なら、わかる[p]

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
[ptext layer="2" name="end_card" x="0" y="340" width="1280" align="center" size="40" color="0x222222" text="世界の終わりと、運用チーム"]
[ptext layer="2" name="end_card" x="0" y="430" width="1280" align="center" size="24" color="0x777777" text="No.5 ／ 10"]
;見たエンディングを、エンディング一覧に記録する（sf はシステム変数。セーブデータとは別に残る）
[eval exp="sf.end5 = true"]
[wait time="1500"]
[l]
[free layer="2" name="end_card"]
@jump storage="title.ks"
