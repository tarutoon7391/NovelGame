;第2章 1日目

*start
;章セレクトで、この章を選べるようにする
[eval exp="sf.reach_ch2 = true"]

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
;台本　第2章（5〜6月）　1日目
;状態：叩き台（1日分すべて）／ITパスポート枠は過去問に差し替え済み（11/4）
;※名前は社長（郡晴希：こおり はるき）のみ決定。ほかは役割で表記
;※選択肢の数は問題ごとに変える（用語・知識は4択／場面の判断は3択／AI提案の見極めは2択）
;============================================================
;■ この章のねらい
;OJT・監視当番。少し自信がつく。第2章の末に、最初の途中判定（バッドエンド）がある。
;■ この日のねらい
;・1か月が過ぎた演出（時間経過）。入社時より、少し慣れた様子
;・OJT開始。先輩について、監視当番の準備をする
;・出題：ITパスポート（ネットワーク：IPアドレス、DNS）、運用の基礎（監視）
;■ 1日の流れ
;朝 → 業務前半（5問）→ 昼休み → 業務後半（5問）→ 終業後 → 自宅（リザルト）
;------------------------------------------------------------
; 【朝】
;=========================================
[playbgm storage="bgm_walk.mp3" restart="false"]

;[bg storage="（真っ白な画面（時間経過の演出））" time="500"]
[bg storage="bg_white.png" time="500"]

#ナレーション
あっという間に、1か月が過ぎた。[p]
5月。ゴールデンウィークが明けて、会社の空気も、少し、ゆるんでいる。[p]

;[bg storage="（オフィス（朝））" time="500"]
[bg storage="bg_office.gif" time="500"]

#同期
なあ、聞いてくれよ！ 今朝、自動ドアに、1回も挟まれなかったぜ！[p]
;（ツッコミ）
#おまえ
1か月かかったのか[p]
#同期
いや、途中から挟まれてねェよ。でも、今朝は記念日だ！[p]
#おまえ
記念日にしないで[p]

;[場面：先輩が、気合いを入れて登場]

#先輩
おはよう、新人ども！ 今日からOJTだぜ！ 実戦形式の、練習試合だ！[p]
#おまえ
OJT……職場で、実際の仕事をしながら学ぶ、研修ですね[p]
#先輩
そのとおり！ 知ってるじゃないか！ 俺の指導が効いてるな！[p]
#おまえ
ネットで調べました[p]
#先輩
そこは、俺のアシストってことにしとけ！[p]

;[場面：リーダーが説明]

#リーダー
今月から、二人にも、監視当番の準備をしてもらうよ[p]
#同期
監視当番、っすか[p]
#リーダー
サーバやネットワークが、ちゃんと動いてるか見張る係だね。異変があったら、すぐ教えてくれればおkだよ[p]
#おまえ
責任が、重いです[p]
#リーダー
大丈夫。最初は先輩と一緒だから。安心して[p]

;[場面：営業が、ドアを開けて顔を出す]

#営業
……運用。客のシステム、ときどき、つながりにくい[p]
#先輩
それを見張るのが、監視当番だぜ！ 新人、練習の成果を見せてやれ！[p]
#営業
……そこの。信頼は、結果で稼げ[p]
#おまえ
（言い方は短いけど、頼られてる気がする）[p]

;[選択肢：1回目（信頼度）]
;選択肢1：先輩の信頼度＋1
;選択肢2：リーダーの信頼度＋1
;選択肢3：同期の信頼度＋1
;※どれを選んでも、次の場面につながる
#ナレーション
OJTの初日。まず、誰に話しかける？
[glink  color="blue"  storage="ch1_3/scene2_1.ks"  size="26"  x="266"  width="640"  y="120"  text="先輩に、「監視の基本を教えてください」と頼む"  target="*c1_1"  ]
[glink  color="blue"  storage="ch1_3/scene2_1.ks"  size="26"  x="266"  width="640"  y="195"  text="リーダーに、「監視当番の心得を教えてください」と頼む"  target="*c1_2"  ]
[glink  color="blue"  storage="ch1_3/scene2_1.ks"  size="26"  x="266"  width="640"  y="309"  text="同期と、「一緒に頑張ろう」と声をかけ合う"  target="*c1_3"  ]
[s]

*c1_1
[cm]
[eval exp="f.t_senpai += 1"]
;◆1を選んだ場合
#先輩
監視の基本は、キーパーと同じだぜ！ ボールから目を離すな！[p]
#おまえ
（わかりやすいような、わかりにくいような）[p]
@jump target="*c1_end"

*c1_2
[cm]
[eval exp="f.t_leader += 1"]
;◆2を選んだ場合
#リーダー
心得かい？ 慌てないこと。あと、昼は魚肉ソーセージ。これでおkだね[p]
#おまえ
（後半は、たぶん関係ない）[p]
@jump target="*c1_end"

*c1_3
[cm]
[eval exp="f.t_douki += 1"]
;◆3を選んだ場合
#同期
おう、一緒に頑張ろうぜ！ 大丈夫、オデに任せろ！[p]
#おまえ
（今日も、任されてしまった）[p]
;→ 次の場面へ
@jump target="*c1_end"

*c1_end

;=========================================
; 【業務前半】（問題5問）ネットワークの基礎
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]
[eval exp="f.correct_am = 0"]

;[場面：会議室のホワイトボードの前]
[bg storage="bg_meeting_room.gif" time="500"]

#先輩
監視を始める前に、ネットワークの基本を確認するぜ！[p]
ネットワークは、パスの通り道だ。宛先がなければ、ボールは届かない！[p]

;Q1 IPアドレス／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=182 page=fore visible=true]
[font size=26]
#
【Q1】[r]
インターネットにサーバを接続するときに設定するIPアドレスに関する記述のうち、適切なものはどれか。ここで、設定するIPアドレスはグローバルIPアドレスである。
[glink  color="blue"  storage="ch1_3/scene2_1.ks"  size="22"  x="40"  width="1109"  y="190"  text="IPアドレスは一度設定すると変更することができない。"  target="*Q1_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_1.ks"  size="22"  x="40"  width="1109"  y="251"  text="IPアドレスは他で使用されていなければ、許可を得ることなく自由に設定し、使用することができる。"  target="*Q1_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_1.ks"  size="22"  x="40"  width="1109"  y="312"  text="現在使用しているサーバと同じIPアドレスを他のサーバにも設定して、2台同時に使用することができる。"  target="*Q1_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_1.ks"  size="22"  x="40"  width="1109"  y="373"  text="サーバが故障して使用できなくなった場合、そのサーバで使用していたIPアドレスを、新しく購入したサーバに設定して利用することができる。"  target="*Q1_ok"  ]
[s]

*Q1_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#先輩
そのとおり！ 宛先がないと、パスは届かないぜ！[p]
#
【解説】グローバルIPアドレスは、インターネット上で1つだけの番号。同じ番号を2台で使ったり、勝手に決めたりはできないが、故障した機器の番号を、新しい機器に引き継ぐことはできる。[p]
@jump target="*Q1_end"

*Q1_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
IPアドレスは、世界で1つだけの住所だ！ 勝手には決められないぜ！[p]
#
【解説】グローバルIPアドレスは、インターネット上で1つだけの番号。同じ番号を2台で使ったり、勝手に決めたりはできないが、故障した機器の番号を、新しい機器に引き継ぐことはできる。[p]
@jump target="*Q1_end"

*Q1_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q2 DNS／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q2】[r]
DNSの説明として、適切なものはどれか。
[glink  color="blue"  storage="ch1_3/scene2_1.ks"  size="22"  x="40"  width="1109"  y="151"  text="インターネット上で様々な情報検索を行うためのシステムである。"  target="*Q2_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_1.ks"  size="22"  x="40"  width="1109"  y="212"  text="インターネットに接続された機器のホスト名とIPアドレスを対応させるシステムである。"  target="*Q2_ok"  ]
[glink  color="blue"  storage="ch1_3/scene2_1.ks"  size="22"  x="40"  width="1109"  y="273"  text="オンラインショッピングを安全に行うための個人認証システムである。"  target="*Q2_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_1.ks"  size="22"  x="40"  width="1109"  y="334"  text="メール配信のために個人のメールアドレスを管理するシステムである。"  target="*Q2_ng"  ]
[s]

*Q2_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#先輩
電話帳みたいな役割だな！ ナイスだぜ！[p]
#
【解説】DNSは、ホスト名（ドメイン名）とIPアドレスを結びつける仕組み。電話帳のような役割。[p]
@jump target="*Q2_end"

*Q2_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
名前から住所を引くのが、DNSだぜ！[p]
#
【解説】DNSは、ホスト名（ドメイン名）とIPアドレスを結びつける仕組み。電話帳のような役割。[p]
@jump target="*Q2_end"

*Q2_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q3 ドメイン名／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q3】[r]
インターネットで使用されているドメイン名の説明として、適切なものはどれか。
[glink  color="blue"  storage="ch1_3/scene2_1.ks"  size="22"  x="40"  width="1109"  y="151"  text="Web閲覧や電子メールを送受信するアプリケーションが使用する通信規約の名前"  target="*Q3_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_1.ks"  size="22"  x="40"  width="1109"  y="212"  text="コンピュータやネットワークなどを識別するための名前"  target="*Q3_ok"  ]
[glink  color="blue"  storage="ch1_3/scene2_1.ks"  size="22"  x="40"  width="1109"  y="273"  text="通信を行うアプリケーションを識別するための名前"  target="*Q3_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_1.ks"  size="22"  x="40"  width="1109"  y="334"  text="電子メールの宛先として指定する相手の名前"  target="*Q3_ng"  ]
[s]

*Q3_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#先輩
名前で見分ける仕組みだな！ 背番号みたいなもんだぜ！[p]
#
【解説】ドメイン名は、インターネット上のコンピュータやネットワークを見分けるための名前。数字のIPアドレスの代わりに使う、人が読みやすい名前。[p]
@jump target="*Q3_end"

*Q3_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
ドメイン名は、機器やネットワークを見分ける名前だ！ 覚えとけよ！[p]
#
【解説】ドメイン名は、インターネット上のコンピュータやネットワークを見分けるための名前。数字のIPアドレスの代わりに使う、人が読みやすい名前。[p]
@jump target="*Q3_end"

*Q3_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面転換：同期が、そわそわしている]

#同期
なあ……ルーターって、どれのことだ？[p]
#おまえ
あの、ランプがついてる箱[p]
#同期
あ、あれか。さっき、電源コード、踏んじまった[p]
#おまえ
えっ[p]
#先輩
ネットワークが、切れたぞ！[p]
;（ツッコミ）
#おまえ
やっぱり、機械が苦手だ[p]
;（落ち着いて電源を差し直す）
#リーダー
おやおや、すぐ直すね[p]
#同期
わりィ……[p]
;※同期の「機械が苦手」が、ネットワークの話題で、また出る。軽いトラブルのみ

;Q4 ルーター／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q4】[r]
ルータの機能の説明として、適切なものはどれか。
[glink  color="blue"  storage="ch1_3/scene2_1.ks"  size="22"  x="40"  width="1109"  y="151"  text="写真や絵、文字原稿などを光学的に読み込み、デジタルデータに変換する。"  target="*Q4_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_1.ks"  size="22"  x="40"  width="1109"  y="212"  text="デジタル信号とアナログ信号の相互変換を行う。"  target="*Q4_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_1.ks"  size="22"  x="40"  width="1109"  y="273"  text="データの通信経路を制御し、ネットワーク間を中継する。"  target="*Q4_ok"  ]
[glink  color="blue"  storage="ch1_3/scene2_1.ks"  size="22"  x="40"  width="1109"  y="334"  text="ネットワークを利用してWebページのデータ蓄積や提供を行う。"  target="*Q4_ng"  ]
[s]

*Q4_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#先輩
ルーターは、ネットワークの司令塔だぜ！[p]
#
【解説】ルーターは、データを送る道すじを選んで、別のネットワークへ中継する機器。[p]
@jump target="*Q4_end"

*Q4_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
違うネットワークをつなぐ、司令塔の役目だぜ！[p]
#
【解説】ルーターは、データを送る道すじを選んで、別のネットワークへ中継する機器。[p]
@jump target="*Q4_end"

*Q4_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q5 HTTPS／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q5】[r]
Webの通信で使用されるHTTPSに関する説明のうち、適切なものはどれか。
[glink  color="blue"  storage="ch1_3/scene2_1.ks"  size="22"  x="40"  width="1109"  y="151"  text="HTTPによる通信を二重化して可用性を高めるためのプロトコルである。"  target="*Q5_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_1.ks"  size="22"  x="40"  width="1109"  y="212"  text="HTTPよりも通信手順を簡略化するためのプロトコルである。"  target="*Q5_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_1.ks"  size="22"  x="40"  width="1109"  y="273"  text="SSLを使って通信内容を暗号化するためのプロトコルである。"  target="*Q5_ok"  ]
[glink  color="blue"  storage="ch1_3/scene2_1.ks"  size="22"  x="40"  width="1109"  y="334"  text="Webを使った商取引の成立を保証するためのプロトコルである。"  target="*Q5_ng"  ]
[s]

*Q5_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#先輩
鍵つきの通信は、安心だな！[p]
#
【解説】HTTPSは、HTTPの通信を、SSL（のちのTLS）で暗号化したもの。アドレスの先頭に、鍵のマークが出ることも多い。[p]
@jump target="*Q5_end"

*Q5_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
HTTPS の S は、Secure（安全）の S だぜ！[p]
#
【解説】HTTPSは、HTTPの通信を、SSL（のちのTLS）で暗号化したもの。アドレスの先頭に、鍵のマークが出ることも多い。[p]
@jump target="*Q5_end"

*Q5_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：業務前半の終わり]

#先輩
前半は、ここまで！ 後半は、いよいよ監視の画面を見るぜ！[p]
#おまえ
画面を見るだけなら、いい気がしてきました[p]
#先輩
見るだけじゃないぞ！ 異変に気づく目を、養うんだぜ！[p]

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
ネットワークの基礎は、もう完璧だな！ ナイスだぜ！[p]
#営業
……そこの。午後の監視、こっちの客の件でもある。……頼んだ[p]
#おまえ
（営業さんに、本気で頼られてる）[p]

[elsif exp="f.correct_am >= 2"]
;◆2〜3問正解のとき
#先輩
いい調子だぜ！ 後半も、集中していくぞ！[p]

[else]
;◆1問以下のとき
#先輩
ドンマイだぜ！ 住所の話は、慣れるまでややこしい！[p]
#先輩
後半に、画面を見ながら、もう一度覚えれば大丈夫だぜ！[p]
[endif]

;[場面：社長が、通りがかる]

#社長
ふっ……監視当番の準備を、始めたそうだな[p]
#おまえ
はい[p]
#社長
サーバが落ちたら、うちの売上も落ちるぜ……見逃すなよ[p]
#おまえ
責任重大ですね……[p]
;（立ち去る）
#社長
いいか、よく聞け……責任は、結果で示せ[p]
#同期
なあ、あの人、いつも何考えてるか、わかんねェよな[p]
#おまえ
でも、嫌いにはなれない[p]
#同期
オデも同感だぜ[p]

;=========================================
; 【業務後半】（問題5問）監視の基礎
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]

;[場面：午後・監視画面の前]
[bg storage="bg_monitor.gif" time="500"]

#先輩
これが、監視の画面だぜ。ここに、サーバの状態が表示される[p]
緑は正常、黄色はイエローカード、赤はレッドカードだ！[p]
#おまえ
信号みたいですね[p]
#先輩
そのとおり！ レッドが出たら、止まって考えろ！[p]

;Q6 監視の目的／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q6】[r]
サーバの監視をする、一番の目的は？
[glink  color="blue"  storage="ch1_3/scene2_1.ks"  size="22"  x="640"  width="500"  y="240"  text="画面を、眺めて楽しむ"  target="*Q6_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_1.ks"  size="22"  x="640"  width="500"  y="340"  text="異常を早めに見つけて、被害を小さくする"  target="*Q6_ok"  ]
[glink  color="blue"  storage="ch1_3/scene2_1.ks"  size="22"  x="640"  width="500"  y="440"  text="社長に、報告のネタを作る"  target="*Q6_ng"  ]
[s]

*Q6_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#先輩
異常は、早く見つけるほど、被害が小さいぜ！[p]
@jump target="*Q6_end"

*Q6_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
監視は、遊びじゃない！ 早く見つけて、早く対応するんだぜ！[p]
@jump target="*Q6_end"

*Q6_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q7 ping／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q7】[r]
相手の機器と、通信できるかを確かめるコマンドは？
[glink  color="blue"  storage="ch1_3/scene2_1.ks"  size="22"  x="640"  width="500"  y="240"  text="ls"  target="*Q7_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_1.ks"  size="22"  x="640"  width="500"  y="340"  text="ping"  target="*Q7_ok"  ]
[glink  color="blue"  storage="ch1_3/scene2_1.ks"  size="22"  x="640"  width="500"  y="440"  text="cd"  target="*Q7_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_1.ks"  size="22"  x="640"  width="500"  y="540"  text="mkdir"  target="*Q7_ng"  ]
[s]

*Q7_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#先輩
ピンと来たな！ 通信確認の基本だぜ！[p]
#
【解説】pingは、相手に小さな信号を送って、返事があるかを確かめる。[p]
@jump target="*Q7_end"

*Q7_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
ping は、ネットワークへの呼びかけだぜ！[p]
#
【解説】pingは、相手に小さな信号を送って、返事があるかを確かめる。[p]
@jump target="*Q7_end"

*Q7_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面転換：同期が、赤いランプに気づく]

#同期
なあ……この画面、赤くなってるぞ[p]
#おまえ
赤は、危険……本当だ[p]
#先輩
どれどれ。……なんだ、ただのテスト用のサーバだぜ[p]
#同期
よかったァ……[p]
#先輩
ただし、赤いのは赤いのだ！ 報告は、必ずしろよ！[p]
;※今日は軽い練習。本格的なアラートは、2日目

;Q8 アラートの初動／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q8】[r]
画面に、赤いアラートが表示された。最初にどうする？
[glink  color="blue"  storage="ch1_3/scene2_1.ks"  size="22"  x="640"  width="500"  y="240"  text="自分で、勝手に、設定を変える"  target="*Q8_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_1.ks"  size="22"  x="640"  width="500"  y="340"  text="気づかなかったことにする"  target="*Q8_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_1.ks"  size="22"  x="640"  width="500"  y="440"  text="先輩やリーダーに、すぐ報告する"  target="*Q8_ok"  ]
[s]

*Q8_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#先輩
それだ！ 報告が早いほど、チームが動けるぜ！[p]
@jump target="*Q8_end"

*Q8_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
自分だけで抱えるな！ 報告が、最優先だぜ！[p]
@jump target="*Q8_end"

*Q8_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q9 ログ／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
;※ログは、第3章で「全部消せば直る」と、AIが危ない提案をする伏線
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q9】[r]
サーバの動きの記録を、何という？
[glink  color="blue"  storage="ch1_3/scene2_1.ks"  size="22"  x="640"  width="500"  y="240"  text="ログ"  target="*Q9_ok"  ]
[glink  color="blue"  storage="ch1_3/scene2_1.ks"  size="22"  x="640"  width="500"  y="340"  text="アイコン"  target="*Q9_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_1.ks"  size="22"  x="640"  width="500"  y="440"  text="キャッシュ"  target="*Q9_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_1.ks"  size="22"  x="640"  width="500"  y="540"  text="ショートカット"  target="*Q9_ng"  ]
[s]

*Q9_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#先輩
ログは、サーバの日記だぜ！[p]
#
【解説】ログは、サーバやソフトの動きを、時間とともに記録したもの。原因を調べる手がかりになる。[p]
@jump target="*Q9_end"

*Q9_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
ログは、サーバの日記帳だぜ！[p]
#
【解説】ログは、サーバやソフトの動きを、時間とともに記録したもの。原因を調べる手がかりになる。[p]
@jump target="*Q9_end"

*Q9_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q10 報連相（復習）／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q10】[r]
作業中に、いつもと違う動きに気づいた。どうする？
[glink  color="blue"  storage="ch1_3/scene2_1.ks"  size="22"  x="640"  width="500"  y="240"  text="確認できる範囲で状況をメモして、報告する"  target="*Q10_ok"  ]
[glink  color="blue"  storage="ch1_3/scene2_1.ks"  size="22"  x="640"  width="500"  y="340"  text="誰にも言わず、自分で直す"  target="*Q10_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_1.ks"  size="22"  x="640"  width="500"  y="440"  text="気のせいだと思って、続ける"  target="*Q10_ng"  ]
[s]

*Q10_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#先輩
確認して、報告する。いい動きだぜ！[p]
@jump target="*Q10_end"

*Q10_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
小さな違和感を、大事にしろよ！[p]
@jump target="*Q10_end"

*Q10_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：業務後半の終わり]

#先輩
試合終了だ！ 初めての監視画面、よく見たな！[p]
#リーダー
お疲れさま。明日は、いよいよ監視当番のデビューだね[p]
#おまえ
えっ、もうですか[p]
#リーダー
大丈夫。先輩と一緒だから[p]
#先輩
任せてくださいっス！ 新人、俺がそばにいるぜ！[p]
#おまえ
（それが一番、不安かもしれない）[p]

;=========================================
; 【終業後】（誰と過ごすか）
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]

;[場面：夕方・オフィス]
[bg storage="bg_office_evening.gif" time="500"]

#ナレーション
OJTの初日が終わった。画面の赤と緑が、まだ、目に残っている。[p]

;[選択肢：終業後（信頼度）]
;選択肢1：先輩の信頼度＋1
;選択肢2：同期の信頼度＋1
;選択肢3：リーダーの信頼度＋1
;選択肢4：営業の信頼度＋1
#ナレーション
今日の夕方、誰と過ごす？
[glink  color="blue"  storage="ch1_3/scene2_1.ks"  size="26"  x="266"  width="640"  y="120"  text="先輩と、明日の監視当番の、予行練習をする"  target="*c2_1"  ]
[glink  color="blue"  storage="ch1_3/scene2_1.ks"  size="26"  x="266"  width="640"  y="195"  text="同期と、今日覚えた用語を、整理する"  target="*c2_2"  ]
[glink  color="blue"  storage="ch1_3/scene2_1.ks"  size="26"  x="266"  width="640"  y="270"  text="リーダーに、監視当番の、心構えを聞く"  target="*c2_3"  ]
[glink  color="blue"  storage="ch1_3/scene2_1.ks"  size="26"  x="266"  width="640"  y="345"  text="営業に、お客様のシステムの、困りごとを聞く"  target="*c2_4"  ]
[s]

*c2_1
[cm]
[eval exp="f.t_senpai += 1"]
;◆1を選んだ場合
#先輩
やる気があるな！ 明日の本番に、備えるぜ！[p]
#おまえ
（予行練習なのに、すごく声が大きい）[p]

@jump target="*c2_end"

*c2_2
[cm]
[eval exp="f.t_douki += 1"]
;◆2を選んだ場合
#同期
IPアドレスは住所、DNSは電話帳。覚えたぜ！[p]
#おまえ
その覚え方、わかりやすい[p]
#同期
お前も、先輩みたいなたとえが、できるじゃねェか[p]
#おまえ
先輩のたとえは、全部サッカーだよ[p]

@jump target="*c2_end"

*c2_3
[cm]
[eval exp="f.t_leader += 1"]
;◆3を選んだ場合
#リーダー
監視当番は、慌てないのが一番だね[p]
焦ったら、深呼吸。それでも焦ったら、俺に電話して。おkだよ[p]
#おまえ
（頼もしい）[p]

@jump target="*c2_end"

*c2_4
[cm]
[eval exp="f.t_eigyo += 1"]
;◆4を選んだ場合
#営業
……客。昨日の夜、サイトが見られなかったらしい[p]
……原因。わかったら、すぐ、こっちに[p]
#おまえ
はい。調べます[p]
#営業
……頼りにしてる。……仕事の話だ[p]
@jump target="*c2_end"

*c2_end
;=========================================
; 【自宅】（リザルト）
;=========================================
[playbgm storage="bgm_walk.mp3" restart="false"]

;[bg storage="（自宅の部屋（夜））" time="500"]
[bg storage="bg_home_night.gif" time="500"]

#ナレーション
布団の中で、今日の監視画面を、思い出す。[p]

;[リザルト表示]
;・今日の正解数：○／10
;・スキル：＋○
;・信頼度の変化：（選んだキャラ）＋1

;[ナレーション]
#おまえ
赤、黄色、緑。信号みたいな画面だった[p]
明日は、初めての監視当番。何も起きなければいいけど[p]
#ナレーション
第2章 2日目へ。[p]

;=========================================
;■ 次回予告（第2章 2日目）
;初の監視当番。アラートが鳴って慌てる。リーダーが落ち着いて対応する。
;出題：運用（監視、ログ）を少し、ITパスポート（データベース）
;■ 未決定
;・社長以外の名前
;・各問題の中身（仮。見直す前提）
;・第2章末の途中判定の基準（配点が決まってから）
;・Q9（ログ）は、第3章の伏線。表現は、あとで調整する

;次のファイルへ
@jump storage="ch1_3/scene2_2.ks"
