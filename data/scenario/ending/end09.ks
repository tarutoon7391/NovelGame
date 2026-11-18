;=========================================
; END 9：BAD END「レッドカード」
;=========================================
*start
[cm]
[stopse buf="1"]
[stopse buf="2"]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]
[resetfont]

;BAD END：パッチを当て忘れた先輩を責めて、殴られる（4-3 のキー選択肢。先輩の信頼度が低いときだけ出る）
[bg storage="bg_meeting_room.gif" time="500"]

#先輩
……新人。ミスを、責めても、ボールは、戻ってこねェんだぜ[p]
#おまえ
でも、先輩のミスです！[p]
#先輩
ああ、俺のミスだ。だから、次に、どうするかを、話そうとしたんだ[p]
#おまえ
話し合う前に、まず、謝ってください！[p]
#先輩
……そうか。全力で、謝るぜ[p]
[quake count="5" time="300" hmax="30"]
[playse storage="se_hatch_open_close.mp3"]
#ナレーション
先輩の、全力の謝罪は、全力の、シュートだった。[p]
主人公は、会議室の窓から、きれいな弧を描いて、飛んでいった。[p]
[bg storage="bg_white.png" time="500"]
#リーダー
おやおや……ゴールキーパーは、いなかったね[p]
#営業
……レッドカード[p]
#ナレーション
障害のふりかえりは、人を責めるためでは、なく、次に活かすためにある。[p]
主人公が、それを知ることは、もう、なかった。[p]

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
[ptext layer="2" name="end_card" x="0" y="340" width="1280" align="center" size="40" color="0x222222" text="レッドカード"]
[ptext layer="2" name="end_card" x="0" y="430" width="1280" align="center" size="24" color="0x777777" text="No.9 ／ 10"]
;見たエンディングを、エンディング一覧に記録する（sf はシステム変数。セーブデータとは別に残る）
[eval exp="sf.end9 = true"]
[wait time="1500"]
[l]
[free layer="2" name="end_card"]
@jump storage="title.ks"
