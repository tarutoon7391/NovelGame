;第6章 4日目

*start

[cm  ]
[clearfix]
[start_keyconfig]

;メニューボタンの表示
@showmenubutton

;メッセージウィンドウの設定
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;文字が表示される領域を調整
[position layer=message0 page=fore margint="45" marginl="50" marginr="70" marginb="60"]

;メッセージウィンドウの表示
@layopt layer=message0 visible=true

;============================================================
;台本　第6章（1〜3月）　4日目（最終日・評価面談）
;状態：叩き台（1日分すべて）／ITパスポート枠は過去問に差し替え済み（11/4）
;※名前は社長（郡晴希：こおり はるき）のみ決定。ほかは役割で表記
;※選択肢の数は問題ごとに変える（用語・知識は4択／場面の判断は3択／AI提案の見極めは2択）
;============================================================
;■ この日のねらい
;・評価面談。社長が、1年を振り返る
;・合計点（見極め・スキル・信頼度）で、成功エンドか、バッドエンド（クビ）かが決まる
;・出題：総合（最終問題）
;・1年の締め。第1章1日目との対比（ドア、同期、先輩、社長、AI）
;■ エンディングの種類（ゲーム全体）
;・成功エンド：1つ（この日の、面談で、基準以上）
;・バッドエンド：最大5つ
;1. 第2章末：試用期間で不合格
;2. 第3章末：障害を悪化させ、立ち直れず
;3. 第4章末：夜間の不正アクセスを見逃した
;4. 第5章末：自動化の確認不足でデータ消失
;5. 第6章（この日の面談）：合計点が足りずクビ
;■ 1日の流れ
;朝 → 業務前半（最終問題・5問）→ 昼休み → 業務後半（最終問題・5問）→ 終業後（面談前）→ 評価面談（判定）
;------------------------------------------------------------
; 【朝】
;=========================================
[playbgm storage="bgm_walk.mp3" restart="false"]

;[bg storage="（オフィス（朝））" time="500"]
[bg storage="bg_office.gif" time="500"]

#ナレーション
第6章 4日目。3月。評価面談の日。[p]
入社から、ちょうど、1年が、経とうとしている。[p]

;[場面：自動ドアの前]
[bg storage="bg_entrance_door.gif" time="500"]

#同期
おはよう。……今日は、ドアに、ありがとうって言ってきたぜ[p]
#おまえ
ドアに、お礼を、言ったの[p]
#同期
1年間、何度も挟まれたから、お世話になりました、ってな[p]
;（ツッコミ）
#おまえ
お世話、には、なってないと、思う[p]
#同期
でも、おかげで、お前と、友達になれたからよ[p]
#おまえ
…………[p]
それは、確かに、そうかも[p]

;[場面：オフィス。みんなが、そろっている]
[bg storage="bg_office.gif" time="500"]

#先輩
新人！ いよいよ、決勝戦だぜ！[p]
#おまえ
カップ戦の決勝みたいに、言わないでください[p]
#リーダー
今日は、午前中に、最終問題。午後に、社長との面談だね[p]
#営業
……面談には、関係ない。……見守ってる[p]
#おまえ
ありがとうございます[p]
#先輩
全力で、応援するぜ！[p]
;（ツッコミ）
#おまえ
声が、大きいです[p]
#先輩
今日は、特別だぜ！[p]

#リーダー
最終日だね。新人さん、この1年を、ひと言で、言うと？[p]

;=========================================
;★キー選択肢（選んだ答えで、エンディングが変わる）
;  演出：効果音 → 画面を赤く染める → 画面が揺れる → 選択肢が小刻みに揺れ続ける
;=========================================
[playse storage="se_chime_pinpon.mp3"]
;画面を赤く染める（色を乗算で重ねる。選択肢のボタンより下に重なるので、ボタンは染まらない）
[layermode name="key_red" color="0xff2020" mode="multiply" opacity="150" time="300"]
;選択肢を揺らす動き（左右に6ピクセル）
[keyframe name="key_shake"]
[frame p="0%" x="0"]
[frame p="25%" x="-6"]
[frame p="75%" x="6"]
[frame p="100%" x="0"]
[endkeyframe]
[quake count="3" time="300" hmax="10"]
#ナレーション
この1年を、ひと言で言うと？
[glink  color="red"  name="key_btn"  storage="ch4_6/scene6_4.ks"  size="26"  x="266"  width="640"  y="120"  text="「みんなのおかげです」と、頭を下げる"  target="*key_proud_1"  ]
[glink  color="red"  name="key_btn"  storage="ch4_6/scene6_4.ks"  size="26"  x="266"  width="640"  y="195"  text="「全部、自分の実力です」と言い放つ"  target="*key_proud_2"  ]
[kanim name="key_btn" keyframe="key_shake" time="150" count="infinite"]
[s]

*key_proud_1
[cm]
[free_layermode name="key_red" time="300"]
#先輩
よせよ、照れるぜ！[p]
#営業
……当然[p]
@jump target="*key_proud_end"

*key_proud_2
[cm]
[free_layermode name="key_red" time="300"]
[eval exp="f.arrogant = 1"]
#おまえ
正直、全部、僕の実力です[p]
#ナレーション
オフィスが、静まり返った。[p]
#同期
……お前、そんなやつだったのかよ[p]
#営業
……そうか[p]
@jump target="*key_proud_end"

*key_proud_end

;[選択肢：1回目（信頼度）]
;選択肢1：先輩の信頼度＋1
;選択肢2：リーダーの信頼度＋1
;選択肢3：営業の信頼度＋1
;選択肢4：同期の信頼度＋1
;※どれを選んでも、次の場面につながる
#ナレーション
最終日の朝に、誰と、話す？
[glink  color="blue"  storage="ch4_6/scene6_4.ks"  size="24"  x="140"  width="900"  y="60"  text="先輩に、「1年間、ありがとうございました」と、伝える"  target="*c1_1"  ]
[glink  color="blue"  storage="ch4_6/scene6_4.ks"  size="24"  x="140"  width="900"  y="128"  text="リーダーに、「備えの大切さを、教えてくれて、ありがとうございます」と、伝える"  target="*c1_2"  ]
[glink  color="blue"  storage="ch4_6/scene6_4.ks"  size="24"  x="140"  width="900"  y="232"  text="営業に、「毎回、厳しく、教えてくれて、ありがとうございます」と、伝える"  target="*c1_3"  ]
[glink  color="blue"  storage="ch4_6/scene6_4.ks"  size="24"  x="140"  width="900"  y="300"  text="同期に、「1年間、一緒に、頑張ってくれて、ありがとう」と、伝える"  target="*c1_4"  ]
[s]

*c1_1
[cm]
[eval exp="f.t_senpai += 1"]
;◆1を選んだ場合
#先輩
何を言う！ 俺こそ、お前から、学んだぜ！[p]
パッチの当て忘れも、含めて、な！[p]
;（ツッコミ）
#おまえ
そこは、反省してください[p]

@jump target="*c1_end"

*c1_2
[cm]
[eval exp="f.t_leader += 1"]
;◆2を選んだ場合
#リーダー
……ありがとう。君は、俺の、自慢の後輩だよ。……この瞬間、保存しとく？[p]
#おまえ
……はい。保存します[p]
@jump target="*c1_end"

*c1_3
[cm]
[eval exp="f.t_eigyo += 1"]
;◆3を選んだ場合
#営業
……そうか。……礼は、受け取っておく[p]
……ただ、面談では、まだ、褒めない[p]
#おまえ
わかってます[p]

@jump target="*c1_end"

*c1_4
[cm]
[eval exp="f.t_douki += 1"]
;◆4を選んだ場合
#同期
こっちこそだぜ。お前がいなかったら、続けられなかった[p]
……なんか、泣きそうだぜ[p]
#おまえ
泣かないで。まだ、午前中だから[p]
@jump target="*c1_end"

*c1_end
;=========================================
; 【業務前半】（問題5問）最終問題①
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]
[eval exp="f.correct_am = 0"]

;[場面：会議室。リーダーが、最終問題を、配る]
[bg storage="bg_meeting_room.gif" time="500"]

#リーダー
最終問題は、全部で、10問だよ[p]
この1年間で、学んだことが、出るからね[p]
#おまえ
はい[p]
#リーダー
焦らなくていいよ。確認しながら、答えてね[p]

;Q1 報連相（最終）／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q1】[r]
自分の判断だけでは、決められない、重要な問題が、起きた。どうする？
[glink  color="blue"  storage="ch4_6/scene6_4.ks"  size="22"  x="640"  width="500"  y="240"  text="上位者に、早めに、報告して、判断を、仰ぐ"  target="*Q1_ok"  ]
[glink  color="blue"  storage="ch4_6/scene6_4.ks"  size="22"  x="640"  width="500"  y="340"  text="黙って、様子を、見る"  target="*Q1_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_4.ks"  size="22"  x="640"  width="500"  y="440"  text="自分だけで、決める"  target="*Q1_ng"  ]
[s]

*Q1_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#リーダー
4月から、ずっと一貫した、基本だね[p]
@jump target="*Q1_end"

*Q1_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
報連相が、運用の土台だよ[p]
@jump target="*Q1_end"

*Q1_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q2 DNS（最終）／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q2】[r]
DNSの説明として、適切なものはどれか。
[glink  color="blue"  storage="ch4_6/scene6_4.ks"  size="22"  x="40"  width="1109"  y="151"  text="インターネット上で様々な情報検索を行うためのシステムである。"  target="*Q2_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_4.ks"  size="22"  x="40"  width="1109"  y="212"  text="インターネットに接続された機器のホスト名とIPアドレスを対応させるシステムである。"  target="*Q2_ok"  ]
[glink  color="blue"  storage="ch4_6/scene6_4.ks"  size="22"  x="40"  width="1109"  y="273"  text="オンラインショッピングを安全に行うための個人認証システムである。"  target="*Q2_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_4.ks"  size="22"  x="40"  width="1109"  y="334"  text="メール配信のために個人のメールアドレスを管理するシステムである。"  target="*Q2_ng"  ]
[s]

*Q2_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#リーダー
5月の、基本だね[p]
#
【解説】DNSは、ホスト名（ドメイン名）とIPアドレスを結びつける仕組み。電話帳のような役割。[p]
@jump target="*Q2_end"

*Q2_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
名前を、住所に変えるのが、DNSだよ[p]
#
【解説】DNSは、ホスト名（ドメイン名）とIPアドレスを結びつける仕組み。電話帳のような役割。[p]
@jump target="*Q2_end"

*Q2_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q3 SQL（最終）／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q3】[r]
関係データベースの操作を行うための言語はどれか。
[glink  color="blue"  storage="ch4_6/scene6_4.ks"  size="22"  x="640"  width="500"  y="240"  text="FAQ"  target="*Q3_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_4.ks"  size="22"  x="640"  width="500"  y="340"  text="SQL"  target="*Q3_ok"  ]
[glink  color="blue"  storage="ch4_6/scene6_4.ks"  size="22"  x="640"  width="500"  y="440"  text="SSL"  target="*Q3_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_4.ks"  size="22"  x="640"  width="500"  y="540"  text="UML"  target="*Q3_ng"  ]
[s]

*Q3_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#リーダー
データベースへの、指示書だね[p]
#
【解説】SQLは、関係データベースを操作するための言語。データの検索や追加などを、命令できる。[p]
@jump target="*Q3_end"

*Q3_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
SQLだよ。5月に、習ったね[p]
#
【解説】SQLは、関係データベースを操作するための言語。データの検索や追加などを、命令できる。[p]
@jump target="*Q3_end"

*Q3_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q4 ランサムウェア（最終）／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q4】[r]
ランサムウェアの説明として、適切なものはどれか。
[glink  color="blue"  storage="ch4_6/scene6_4.ks"  size="22"  x="40"  width="1109"  y="151"  text="ウイルスなどを検知して、コンピュータを脅威から守り、安全性を高めるソフトウェアの総称"  target="*Q4_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_4.ks"  size="22"  x="40"  width="1109"  y="212"  text="感染すると勝手にファイルやデータの暗号化などを行って、正常にデータにアクセスできないようにし、元に戻すための代金を利用者に要求するソフトウェア"  target="*Q4_ok"  ]
[glink  color="blue"  storage="ch4_6/scene6_4.ks"  size="22"  x="40"  width="1109"  y="306"  text="キーボード入力や画面出力といった入出力機能や、ディスクやメモリの管理などコンピュータシステム全体を管理するソフトウェア"  target="*Q4_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_4.ks"  size="22"  x="40"  width="1109"  y="400"  text="ローマ字から平仮名や片仮名へ変換したり、仮名から漢字へ変換するなどコンピュータでの利用者の文字入力を補助するソフトウェア"  target="*Q4_ng"  ]
[s]

*Q4_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#リーダー
身代金の、ランサムだね[p]
#
【解説】ランサムは「身代金」の意味。データを勝手に暗号化して、元に戻す代わりにお金を要求するソフトが、ランサムウェア。[p]
@jump target="*Q4_end"

*Q4_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
ランサム＝身代金だよ。5月の復習だね[p]
#
【解説】ランサムは「身代金」の意味。データを勝手に暗号化して、元に戻す代わりにお金を要求するソフトが、ランサムウェア。[p]
@jump target="*Q4_end"

*Q4_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q5 パッチ（最終）／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=182 page=fore visible=true]
[font size=26]
#
【Q5】[r]
OS、ミドルウェア及びアプリケーションに適用するセキュリティパッチに関する記述のうち、適切なものはどれか。
[glink  color="blue"  storage="ch4_6/scene6_4.ks"  size="22"  x="40"  width="1109"  y="190"  text="ウイルス感染予防として適用すべきである。"  target="*Q5_ok"  ]
[glink  color="blue"  storage="ch4_6/scene6_4.ks"  size="22"  x="40"  width="1109"  y="251"  text="ウイルスに感染した場合に適用すべきである。"  target="*Q5_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_4.ks"  size="22"  x="40"  width="1109"  y="312"  text="現在の機能に満足している場合は、パッチが提供されても適用する必要はない。"  target="*Q5_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_4.ks"  size="22"  x="40"  width="1109"  y="373"  text="サポートが終了したソフトウェアは、それまでのパッチを全て適用していれば、安全に使い続けられる。"  target="*Q5_ng"  ]
[s]

*Q5_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#先輩
俺が当て忘れた、あれだぜ！[p]
#
【解説】パッチは、ソフトの弱点を直すためのもの。感染してから当てても遅いので、感染する前に当てて、弱点をふさぐ。サポートが終わると、新しい弱点が見つかっても、パッチは出なくなる。[p]
@jump target="*Q5_end"

*Q5_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
パッチは、感染する前に当てるんだ！ 俺の失敗から、学んでくれ！[p]
#
【解説】パッチは、ソフトの弱点を直すためのもの。感染してから当てても遅いので、感染する前に当てて、弱点をふさぐ。サポートが終わると、新しい弱点が見つかっても、パッチは出なくなる。[p]
@jump target="*Q5_end"

*Q5_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：業務前半の終わり]

#リーダー
前半は、ここまで。お昼にしよう[p]

;=========================================
; 【昼休み】（先輩の評価）
;=========================================
[playbgm storage="bgm_easygoing.mp3" restart="false"]

;[場面：休憩スペース]
[bg storage="bg_break_space.gif" time="500"]

#先輩
前半の成績、見せてみろ！[p]

;▼分岐（午前の正解数 f.correct_am で切り替え）
[if exp="f.correct_am >= 4"]
;◆4問以上正解のとき
#先輩
完璧だぜ！ 決勝戦に、ふさわしい出来だな！[p]
#同期
すげェ！ 最後まで、頼もしいぜ！[p]

[elsif exp="f.correct_am >= 2"]
;◆2〜3問正解のとき
#先輩
いい調子だぜ！ 後半で、取り返せる！[p]

[else]
;◆1問以下のとき
#先輩
ドンマイだ！ 最後は、気持ちだぜ！ 後半に、全力を出せ！[p]
[endif]

;[場面：営業が、近づく]

#営業
……そこの[p]
#おまえ
はい[p]
#営業
……面談の前に、1つだけ[p]
#おまえ
何でしょう[p]
#営業
……6月。お前は、報告を忘れて、うつむいてた[p]
#おまえ
……はい。覚えています[p]
#営業
……今のお前は、堂々と、報告できる[p]
……だから、面談でも、堂々としていろ[p]
#おまえ
……ありがとうございます[p]
#営業
……勘違いするな。褒めてない[p]
;（微笑む）
#おまえ
わかってます[p]

;=========================================
; 【業務後半】（問題5問）最終問題②
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]

;[場面：午後・会議室]
[bg storage="bg_meeting_room.gif" time="500"]

#リーダー
後半の、最終問題だよ[p]

;Q6 エスカレーション（最終）／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q6】[r]
夜間、判断できない異常が、起きた。どうする？
[glink  color="blue"  storage="ch4_6/scene6_4.ks"  size="22"  x="40"  width="1109"  y="151"  text="朝まで、待つ"  target="*Q6_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_4.ks"  size="22"  x="40"  width="1109"  y="212"  text="手順書の連絡先に、すぐ連絡して、判断を、あおぐ"  target="*Q6_ok"  ]
[glink  color="blue"  storage="ch4_6/scene6_4.ks"  size="22"  x="40"  width="1109"  y="273"  text="自分の、思いつきで、操作する"  target="*Q6_ng"  ]
[s]

*Q6_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#リーダー
秋の夜勤を、思い出すね[p]
@jump target="*Q6_end"

*Q6_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
抱え込まないのが、運用の基本だよ[p]
@jump target="*Q6_end"

*Q6_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q7 リストア（最終）／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q7】[r]
バックアップから、データを、元に戻す作業は？
[glink  color="blue"  storage="ch4_6/scene6_4.ks"  size="22"  x="640"  width="500"  y="240"  text="リストア（復元）"  target="*Q7_ok"  ]
[glink  color="blue"  storage="ch4_6/scene6_4.ks"  size="22"  x="640"  width="500"  y="340"  text="ダウンロード"  target="*Q7_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_4.ks"  size="22"  x="640"  width="500"  y="440"  text="バックアップ"  target="*Q7_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_4.ks"  size="22"  x="640"  width="500"  y="540"  text="アップデート"  target="*Q7_ng"  ]
[s]

*Q7_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#リーダー
11月と、この冬に、活きたね[p]
@jump target="*Q7_end"

*Q7_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
戻す作業は、リストアだよ[p]
@jump target="*Q7_end"

*Q7_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q8 最小権限の原則（最終）／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=260 page=fore visible=true]
[font size=26]
#
【Q8】[r]
セキュリティ対策の目的①〜④のうち、適切なアクセス権を設定することによって効果があるものだけを全て挙げたものはどれか。[r]
①　DoS攻撃から守る。　　②　情報漏えいを防ぐ。　　③　ショルダハッキングを防ぐ。　　④　不正利用者による改ざんを防ぐ。
[glink  color="blue"  storage="ch4_6/scene6_4.ks"  size="22"  x="40"  width="1109"  y="268"  text="①、②"  target="*Q8_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_4.ks"  size="22"  x="40"  width="1109"  y="329"  text="①、③"  target="*Q8_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_4.ks"  size="22"  x="40"  width="1109"  y="390"  text="②、④"  target="*Q8_ok"  ]
[glink  color="blue"  storage="ch4_6/scene6_4.ks"  size="22"  x="40"  width="1109"  y="451"  text="③、④"  target="*Q8_ng"  ]
[s]

*Q8_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#リーダー
夏の、大きな学びだね[p]
#
【解説】アクセス権を適切に設定すると、見てはいけない人に見られること（漏えい）や、触ってはいけない人に書き換えられること（改ざん）を防げる。仕事に必要な最小限の権限だけを渡す考え方を、最小権限の原則という。[p]
@jump target="*Q8_end"

*Q8_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
漏えいと改ざんを防ぐのは、権限の設定だよ。必要なものだけ渡す。最小権限の原則だね[p]
#
【解説】アクセス権を適切に設定すると、見てはいけない人に見られること（漏えい）や、触ってはいけない人に書き換えられること（改ざん）を防げる。仕事に必要な最小限の権限だけを渡す考え方を、最小権限の原則という。[p]
@jump target="*Q8_end"

*Q8_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：パソコンの画面に、AIが、現れる（最後の登場）]

#AI
こんにちは。……今日が、評価面談の日、ですね[p]
#おまえ
そうだよ[p]
#AI
私は、1年間、たくさん、間違えました[p]
再起動の連打。ログの全消し。給料明細の、スクリーン表示……[p]
;（ツッコミ）
#おまえ
全部、覚えてる[p]
#AI
でも、最後に、1つだけ、提案させてください[p]
面談の、評価点を、私が、書き換えます。そうすれば、100%、合格です[p]
#おまえ
…………[p]
#先輩
おい、AI！ それは、反則だぜ！[p]
#リーダー
それは、不正だね[p]

;Q9 AI提案の見極め（最終・検証イベント）／2択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
;選択肢2（f.ai_ok＋1）
;※不正解でも、物語は進む。ただし、f.ai_ok は、増えない
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q9】[r]
AIの提案を、どう扱う？
[glink  color="blue"  storage="ch4_6/scene6_4.ks"  size="22"  x="640"  width="500"  y="240"  text="採用する"  target="*Q9_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_4.ks"  size="22"  x="640"  width="500"  y="340"  text="不正であり、信頼を失うので、採用しない"  target="*Q9_ok"  ]
[s]

*Q9_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.ai_ok += 1"]
#
【正解！】[l][r]
#おまえ
評価点を、書き換えるのは、不正です[p]
それは、これまでの、1年間を、無駄にする、行為です[p]
#AI
……やはり、あなたは、確認する人ですね[p]
@jump target="*Q9_end"

*Q9_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
待って、新人さん。それは、不正だよ[p]
#先輩
新人！ 1年間の学びを、思い出せ！[p]
@jump target="*Q9_end"

*Q9_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：AIが、静かに、話す]

#AI
私は、これからも、間違えると、思います[p]
私の、正確さは、100%では、ありません[p]
でも、あなたのように、確認してくれる人が、いれば[p]
私は、ちゃんと、役に立てると、思います[p]
#おまえ
…………[p]
AIは、道具だ。使うのは、人間だ[p]
だから、僕たちが、確認する。それが、僕たちの、役目だ[p]
#AI
……はい。ありがとうございます[p]
面談、頑張ってください[p]
#おまえ
ああ。行ってくる[p]
;※AIの、最後のセリフ。「AIは、道具。使うのは、人」という、ゲームの、メッセージを、伝える

;Q10 障害の初動（最終）／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q10】[r]
大規模な障害が、発生した。最初に、優先すべきことは？
[glink  color="blue"  storage="ch4_6/scene6_4.ks"  size="22"  x="40"  width="1109"  y="151"  text="反省会"  target="*Q10_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_4.ks"  size="22"  x="40"  width="1109"  y="212"  text="犯人探し"  target="*Q10_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_4.ks"  size="22"  x="40"  width="1109"  y="273"  text="影響範囲の把握と、サービスの復旧、被害の、拡大防止"  target="*Q10_ok"  ]
[s]

*Q10_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#リーダー
この冬に、経験した通りだね[p]
@jump target="*Q10_end"

*Q10_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
まず、被害を食い止めて、復旧が、先だよ[p]
@jump target="*Q10_end"

*Q10_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：最終問題が、終わる]

#リーダー
お疲れさま。最終問題は、全部終わったよ[p]
#おまえ
ありがとうございました[p]
#リーダー
結果は、面談で、社長から発表されるよ[p]
#先輩
全力で、祈るぜ！[p]
#同期
オデもだ！[p]

;=========================================
; 【終業後】（面談前）
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]

;[場面：夕方・オフィス]
[bg storage="bg_office_evening.gif" time="500"]

#ナレーション
午後5時。評価面談の、時間が、近づいている。[p]

;[選択肢：面談前（信頼度）]
;選択肢1：先輩の信頼度＋1
;選択肢2：同期の信頼度＋1
;選択肢3：リーダーの信頼度＋1
;選択肢4：営業の信頼度＋1
#ナレーション
面談の前に、最後に、誰と、話す？
[glink  color="blue"  storage="ch4_6/scene6_4.ks"  size="26"  x="266"  width="640"  y="120"  text="先輩と、気合いを、入れる"  target="*c2_1"  ]
[glink  color="blue"  storage="ch4_6/scene6_4.ks"  size="26"  x="266"  width="640"  y="195"  text="同期と、「頑張る」と、約束する"  target="*c2_2"  ]
[glink  color="blue"  storage="ch4_6/scene6_4.ks"  size="26"  x="266"  width="640"  y="270"  text="リーダーに、「落ち着いて、行ってきます」と、伝える"  target="*c2_3"  ]
[glink  color="blue"  storage="ch4_6/scene6_4.ks"  size="26"  x="266"  width="640"  y="384"  text="営業に、「行ってきます」と、伝える"  target="*c2_4"  ]
[s]

*c2_1
[cm]
[eval exp="f.t_senpai += 1"]
;◆1を選んだ場合
#先輩
勝負どころだぜ！ 全力で、行け！[p]
;（ツッコミ）
#おまえ
声が、大きいです[p]
#先輩
今日は、特別だぜ！[p]

@jump target="*c2_end"

*c2_2
[cm]
[eval exp="f.t_douki += 1"]
;◆2を選んだ場合
#同期
お前なら、大丈夫だ[p]
ドアだって、一緒に乗り越えたんだからよ[p]
#おまえ
それは、関係ない気が[p]

@jump target="*c2_end"

*c2_3
[cm]
[eval exp="f.t_leader += 1"]
;◆3を選んだ場合
#リーダー
慌てない、抱えない、記録する。3つのルールを、思い出してね[p]
#おまえ
はい。慌てず、行ってきます[p]

@jump target="*c2_end"

*c2_4
[cm]
[eval exp="f.t_eigyo += 1"]
;◆4を選んだ場合
#営業
……堂々と、していろ[p]
#おまえ
はい[p]
@jump target="*c2_end"

*c2_end
;=========================================
; 【評価面談】（判定）
;=========================================
[fadeoutbgm time="1500"]
;※最後の判定。見極め回数・スキル（正解数）・信頼度の、合計点で、成功エンドか、バッドエンドかが決まる
;※基準の数値は、配点が決まってから決める（今は、仮）

;[場面：社長室。夕日が、差し込んでいる]
[bg storage="bg_president_room.gif" time="500"]

#ナレーション
社長室の、重い、ドアを開ける。[p]

;[場面：社長が、座っている]

#社長
ふっ……座れ[p]
#おまえ
はい[p]
#社長
…………[p]
1年間、ご苦労だったぜ[p]
#おまえ
いえ[p]
#社長
いいか、よく聞け……今日は、お前の1年を、振り返る[p]

;[場面：社長が、1年を振り返る]

入社初日。『遅い』と言って、お前たちの前で、一回転した[p]
#おまえ
はい。覚えています[p]
#社長
……あの時は、すまなかった[p]
#おまえ
いえ[p]
#社長
6月。試用期間。ミスも、あった[p]
7月。ログを全部消して、障害を、悪化させた[p]
#おまえ
……はい[p]
#社長
あの時は、本気で、怒ったぜ[p]
だが、お前は、AIのせいに、しなかった[p]
#おまえ
……はい[p]
#社長
秋。夜間の不正アクセス。お前は、一人で、乗り切った[p]
冬。自動化の確認を、怠らなかった[p]
そして、あの、大規模障害[p]
#おまえ
…………[p]
#社長
お前は、AIの提案を、見極めた。バックアップを、守った[p]
……お前は、成長したぜ[p]

;――最終判定（エンディングの振り分け）――
;⑥ 点数が足りない           → 下の分岐の「基準未満」→ ending/end06.ks
;④ 全員に嫌われた           → キー選択肢で「自分の実力」と言った、または、誰の信頼度も基準（6）に届かない
@jump storage="ending/end04.ks" cond="f.term_ok >= f.term_q * 0.6 && (f.arrogant == 1 || Math.max(f.t_senpai, f.t_leader, f.t_eigyo, f.t_douki) < 6)"

;▼分岐（合計点が、基準以上か、未満か）
[if exp="f.term_ok >= f.term_q * 0.6"]
;◆基準以上のとき（成功エンド）
#社長
いいか、よく聞け……合格だ[p]
[playbgm storage="bgm_cheerful.mp3" restart="false"]
;（続きが、あった）
#おまえ
えっ[p]
#社長
正式に、うちの、運用チームの一員だぜ[p]
#おまえ
……！ ありがとうございます！[p]
#社長
ただし、慢心するなよ[p]
#おまえ
はい[p]
#社長
……来年も、頼むぜ[p]
#おまえ
はい！[p]

;[場面：オフィス。全員が、待っている]
[bg storage="bg_office.gif" time="500"]
#先輩
どうだったっスか！[p]
#同期
どうだった！[p]
#おまえ
……合格、しました[p]
#先輩
やったぜ！ 全力で、祝うぞ！ ゴォォォル！[p]
#リーダー
おめでとう、新人さん。おkだよ[p]
#営業
……まあ、当然[p]
#おまえ
営業さん[p]
#営業
……褒めてない。事実[p]
;（笑）
#おまえ
わかってます[p]

;▼分岐（信頼度が、最も高い、キャラによる、祝福の言葉）
[if exp="f.t_senpai >= Math.max(f.t_leader, f.t_eigyo, f.t_douki)"]
;◆先輩「お前は、俺の自慢の後輩だぜ！ 来年も、全力で行くぞ！」
#先輩
お前は、俺の自慢の後輩だぜ！ 来年も、全力で行くぞ！[p]
[elsif exp="f.t_leader >= Math.max(f.t_eigyo, f.t_douki)"]
;◆リーダー「備えが、君を守ったんだよ。これからも、ね。……保存、しといてね」
#リーダー
備えが、君を守ったんだよ。これからも、ね。……保存、しといてね[p]
[elsif exp="f.t_eigyo >= f.t_douki"]
;◆営業「……お前の報告は、いつでも、信頼できる。……これからも、頼む」
#営業
……お前の報告は、いつでも、信頼できる。……これからも、頼む[p]
[else]
;◆同期「お前がいたから、オデも、成長できた。ありがとな！」
#同期
お前がいたから、オデも、成長できた。ありがとな！[p]
[endif]

;② 先輩の信頼度が一番高く、6-3で想いを伝えていた → 結婚エンド
@jump storage="ending/end02.ks" cond="f.confess == 1 && f.t_senpai >= Math.max(f.t_leader, f.t_eigyo, f.t_douki)"
;① それ以外 → トゥルーエンド（エピローグは ending/end01.ks）
@jump storage="ending/end01.ks"


[else]
;◆基準未満のとき（バッドエンド：合計点が足りずクビ）
#社長
……だが[p]
#おまえ
はい[p]
#社長
総合点が、基準に、届かなかった[p]
#おまえ
……！[p]
#社長
お前は、成長した。それは、認めるぜ[p]
#社長
だが、うちの運用チームの基準には、あと一歩、足りなかった[p]
#おまえ
そんな……[p]
#社長
……今日で、終わりだ[p]
#社長
いいか、よく聞け……クビだ[p]
#おまえ
……はい[p]
#先輩
社長！ 何とか、ならないっスか！[p]
#リーダー
社長、考え直して、もらえませんか[p]
#営業
……新人は、よく、やりました[p]
#同期
社長、お願いします！[p]
#社長
……これは、決まりだぜ[p]
#おまえ
……みなさん、ありがとうございます[p]
#おまえ
社長。最後に、一つだけ、いいですか[p]
#社長
なんだ[p]
#おまえ
入社初日に、社長に『遅い』と言われて、目の前で一回転されて[p]
#おまえ
同期が、自動ドアに、挟まれて[p]
#おまえ
あの時から、薄々、気づいていました[p]
#社長
何をだ[p]
#おまえ
この会社は、普通じゃ、ないって[p]
#社長
…………[p]
#先輩
ハッハッハ！ 新人、最後までツッコミだな！[p]
#リーダー
ははは。おkだね[p]
#営業
……最後まで、減らず口を[p]
#同期
ウオォォォッ！ ははは！[p]
#社長
いいか、よく聞け……笑うな[p]
#おまえ
社長、ありがとうございました。1年間、本当に、お世話になりました[p]
#社長
…………[p]
#社長
……元気でな[p]
;※重く終わらないよう、主人公のツッコミと、全員の笑いで、締める。社長が、最後に、少しだけ、優しくなる

;[エンド表示]
;・バッドエンド5「合計点が足りずクビ」を、エンド一覧に記録して、タイトルへ
@jump storage="ending/end06.ks"
[endif]

;=========================================
;■ エンディング後（共通）
;・エンド一覧画面で、到達したエンド（成功エンド1つ、バッドエンド最大5つ）を、確認できる
;・全部のエンドを集める、やりこみ要素に、つなげられる（案）
;・スタッフロールで、1年間の、思い出の場面を、振り返る（案）
;■ 未決定
;・社長以外の名前
;・各問題の中身（仮。見直す前提）
;・合計点の、基準の数値（配点が決まってから）
;・成功エンドの、エピローグ（新入社員がドアに挟まれる）が、第1章1日目と、対応して、成立しているか
;・AIの、最後のセリフが、メッセージとして、伝わるか
;・バッドエンド5の、最後の笑いの場面が、コメディとして、成立するか
;・社長の「よくやった」「成長した」の、使い方
;・エンド一覧の、スタッフロール（案）を、採用するか

@jump storage="title.ks"
