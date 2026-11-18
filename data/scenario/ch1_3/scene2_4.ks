;第2章 4日目

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
;台本　第2章（5〜6月）　4日目（第2章の最終日）
;状態：叩き台（1日分すべて）／ITパスポート枠は過去問に差し替え済み（11/4）
;※名前は社長（郡晴希：こおり はるき）のみ決定。ほかは役割で表記
;※選択肢の数は問題ごとに変える（用語・知識は4択／場面の判断は3択／AI提案の見極めは2択）
;============================================================
;■ この日のねらい
;・営業に文句を言われ、報連相の小さな失敗を経験する。少し自信がつく
;・出題：一般常識（報連相）、第2章の総復習
;・章末に、最初の途中判定（バッドエンドあり）
;■ 1日の流れ
;朝 → 業務前半（5問）→ 昼休み → 業務後半（5問）→ 終業後 → 自宅（リザルト）→ 章末の途中判定
;------------------------------------------------------------
; 【朝】
;=========================================
[playbgm storage="bgm_walk.mp3" restart="false"]

;[bg storage="（オフィス（朝））" time="500"]
[bg storage="bg_office.gif" time="500"]

#ナレーション
第2章 4日目。OJTも、もうすぐ、一区切りだ。[p]
#同期
あっという間だったな、5月[p]
#おまえ
ほんとに。まだ、6月に入った気がしない[p]
#同期
今日で、この章が終わりなんだよな[p]
#おまえ
うん。最後まで、油断しないでいこう[p]

;[場面：営業が、勢いよく入ってくる]

#営業
……そこの。来い[p]
#おまえ
はい、何でしょう[p]
#営業
……先週。客のシステム、つながりにくい件。調べると言ったな[p]
#おまえ
（あっ）[p]
#営業
……結果、まだ来てない。……客に聞かれて、答えられなかった[p]
#おまえ
す、すみません。調べて、先輩には、報告したんですが、営業さんには、言いそびれて[p]
#営業
……依頼したのは、こっち。……報告の相手も、こっちだ[p]
#同期
あ、あのォ……[p]
#営業
……後で[p]
#同期
……うっす[p]
;※営業の文句。主人公の「報連相」の、小さな失敗。ただし、営業の言い分は、筋が通っている

;[選択肢：1回目（営業への返事・固定イベント寄り）]
;選択肢1：営業の信頼度＋1
;選択肢2：営業の信頼度±0
;選択肢3：営業の信頼度－1
;※場面の判断なので3択。どれを選んでも、次の場面につながる。ただし、信頼度の増減が違う（変数を入れる段階で追加する）
#ナレーション
営業に、どう返事をする？
[glink  color="blue"  storage="ch1_3/scene2_4.ks"  size="26"  x="266"  width="640"  y="120"  text="「すみません。すぐに、状況をまとめて、報告します」と謝る"  target="*c1_1"  ]
[glink  color="blue"  storage="ch1_3/scene2_4.ks"  size="26"  x="266"  width="640"  y="234"  text="「先輩には、報告したので、伝わってると思いました」と言い訳する"  target="*c1_2"  ]
[glink  color="blue"  storage="ch1_3/scene2_4.ks"  size="26"  x="266"  width="640"  y="348"  text="黙って、うつむく"  target="*c1_3"  ]
[s]

*c1_1
[cm]
[eval exp="f.t_eigyo += 1"]
;◆1を選んだ場合
#営業
……よし。最初から、それを言え[p]
……依頼者に、返す。それが、基本。……覚えておけ[p]
#おまえ
はい、肝に銘じます[p]

@jump target="*c1_end"

*c1_2
[cm]
;◆2を選んだ場合
#営業
……言い訳[p]
……先輩に言ったから、伝わった、じゃない。……依頼した人に返すのが、報告[p]
#おまえ
（ぐうの音も出ない）[p]

@jump target="*c1_end"

*c1_3
[cm]
[eval exp="f.t_eigyo -= 1"]
;◆3を選んだ場合
#営業
……黙っていても、何も変わらない[p]
……失敗したら、認めて、次の行動を言え[p]
#おまえ
（……はい）[p]
;→ 次の場面へ
@jump target="*c1_end"

*c1_end

;[場面：リーダーが、フォロー]

#リーダー
おやおや、営業。少し言いすぎだね。でも、言ってること自体は正しいよ[p]
新人さん。今日の問題で、報連相を、もう一度整理しようか[p]
#おまえ
はい。お願いします[p]

;=========================================
; 【業務前半】（問題5問）報連相の総まとめ（一般常識）
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]
[eval exp="f.correct_am = 0"]

;[場面：会議室]
[bg storage="bg_meeting_room.gif" time="500"]

#先輩
いいか、新人！ 今日のテーマは、報連相の本番だぜ！[p]
報告は、依頼した人に。連絡は、関係する人に。相談は、困る前に！ パスは、受け手を見て出すんだぜ！[p]

;Q1 報告の相手／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q1】[r]
上司Aから頼まれた仕事の結果を、報告する相手は？
[glink  color="blue"  storage="ch1_3/scene2_4.ks"  size="22"  x="640"  width="500"  y="240"  text="一番、偉い人"  target="*Q1_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_4.ks"  size="22"  x="640"  width="500"  y="340"  text="同じチームの、先輩だけ"  target="*Q1_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_4.ks"  size="22"  x="640"  width="500"  y="440"  text="依頼してきた、上司A"  target="*Q1_ok"  ]
[s]

*Q1_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#先輩
依頼した人に、返す。これが、基本だぜ！[p]
@jump target="*Q1_end"

*Q1_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
パスを出した人に、ボールを返すんだぜ！[p]
@jump target="*Q1_end"

*Q1_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q2 折り返し連絡／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q2】[r]
お客様から、不在中に、電話があったと伝言を受けた。どうする？
[glink  color="blue"  storage="ch1_3/scene2_4.ks"  size="22"  x="640"  width="500"  y="240"  text="次に電話が来るまで、待つ"  target="*Q2_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_4.ks"  size="22"  x="640"  width="500"  y="340"  text="できるだけ早く、折り返しの連絡をする"  target="*Q2_ok"  ]
[glink  color="blue"  storage="ch1_3/scene2_4.ks"  size="22"  x="640"  width="500"  y="440"  text="メモだけ残して、忘れる"  target="*Q2_ng"  ]
[s]

*Q2_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#先輩
連絡は、早さが信頼につながるぜ！[p]
@jump target="*Q2_end"

*Q2_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
お客様を、待たせるな！ 折り返しは、早いほどいいぜ！[p]
@jump target="*Q2_end"

*Q2_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q3 敬語（ビジネスのことば）／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q3】[r]
目上の人に対して、仕事のあとにかける、ふさわしい言葉は？
[glink  color="blue"  storage="ch1_3/scene2_4.ks"  size="22"  x="640"  width="500"  y="240"  text="お疲れ様です"  target="*Q3_ok"  ]
[glink  color="blue"  storage="ch1_3/scene2_4.ks"  size="22"  x="640"  width="500"  y="340"  text="ご苦労様です"  target="*Q3_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_4.ks"  size="22"  x="640"  width="500"  y="440"  text="ご苦労さん"  target="*Q3_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_4.ks"  size="22"  x="640"  width="500"  y="540"  text="お疲れちゃん"  target="*Q3_ng"  ]
[s]

*Q3_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#先輩
言葉遣いは、礼儀の第一歩だぜ！[p]
#
【解説】「ご苦労様」は、目上から目下に使う言葉。目上の人には、「お疲れ様です」を使う。[p]
@jump target="*Q3_end"

*Q3_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
「ご苦労様」は、上から目線に聞こえるぜ！[p]
#
【解説】「ご苦労様」は、目上から目下に使う言葉。目上の人には、「お疲れ様です」を使う。[p]
@jump target="*Q3_end"

*Q3_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面転換：同期が、そわそわしている]

#同期
なあ、さっきお客様にメール送ったんだけどよ……宛先、間違えたかもしれねェ[p]
#おまえ
えっ、どうしよう[p]
#先輩
落ち着け！ まず、何をするんだ！[p]
#同期
えっと……黙っておく？[p]
#おまえ
いや、それは、だめだと思う[p]
#同期
だよな……[p]
;※第1章の「報連相」の復習を、同期の失敗で、自然に入れる

;Q4 誤送信／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q4】[r]
メールを、間違った宛先に、送ってしまった。どうする？
[glink  color="blue"  storage="ch1_3/scene2_4.ks"  size="22"  x="640"  width="500"  y="240"  text="相手が気づくまで、待つ"  target="*Q4_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_4.ks"  size="22"  x="640"  width="500"  y="340"  text="気づかなかったことにする"  target="*Q4_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_4.ks"  size="22"  x="640"  width="500"  y="440"  text="すぐに、上司に報告して、指示をもらう"  target="*Q4_ok"  ]
[s]

*Q4_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#先輩
それだ！ 早い報告が、被害を小さくするぜ！[p]
@jump target="*Q4_end"

*Q4_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
隠すほど、問題が大きくなる！ すぐに報告だぜ！[p]
@jump target="*Q4_end"

*Q4_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q5 優先順位／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q5】[r]
同時に、3つの依頼が来た。どうする？
[glink  color="blue"  storage="ch1_3/scene2_4.ks"  size="22"  x="640"  width="500"  y="240"  text="期限と重要度を、確認して、優先順位をつける"  target="*Q5_ok"  ]
[glink  color="blue"  storage="ch1_3/scene2_4.ks"  size="22"  x="640"  width="500"  y="340"  text="好きなものから、やる"  target="*Q5_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_4.ks"  size="22"  x="640"  width="500"  y="440"  text="全部、同時に、やろうとする"  target="*Q5_ng"  ]
[s]

*Q5_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#先輩
優先順位が、仕事の腕を決めるぜ！[p]
@jump target="*Q5_end"

*Q5_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
同時には、無理だ！ 順番を決めろ！[p]
@jump target="*Q5_end"

*Q5_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：業務前半の終わり]

#先輩
前半は、ここまで！ ハーフタイムだぜ！[p]
#リーダー
前半の報連相の問題、よくできてたね[p]
#おまえ
ありがとうございます。さっきの失敗が、効きました[p]
#リーダー
失敗が、一番の先生だね[p]

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
報連相が、体に入ってきたな！[p]
#営業
……（遠くから）……まあまあ[p]
#おまえ
（営業さんに、少し、認められた気がする）[p]

[elsif exp="f.correct_am >= 2"]
;◆2〜3問正解のとき
#先輩
いい調子だぜ！ 後半は、総復習だ！[p]

[else]
;◆1問以下のとき
#先輩
ドンマイだぜ！ 報連相は、慣れだ！ 後半に、もう一度やるぞ！[p]
[endif]

;[場面：営業が、近づいてくる（昼休みの会話）]

#営業
……そこの[p]
#おまえ
はい[p]
#営業
……さっきは、言いすぎた。……だが、依頼者に報告するのは、本当に大事だ[p]
#おまえ
はい。次から、必ず、営業さんにも、報告します[p]
;（少し、照れくさそう）
#営業
……頼む[p]
#同期
営業さんが、謝ったぜ！[p]
#営業
……謝ってない[p]
#おまえ
（認めてはくれてるのかも）[p]

;=========================================
; 【業務後半】（問題5問）第2章の総復習
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]

;[場面：午後・会議室]
[bg storage="bg_meeting_room.gif" time="500"]

#先輩
後半は、5月と6月の総復習だぜ！ 今月学んだこと、全部出すぞ！[p]

;Q6 DNSの障害／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=260 page=fore visible=true]
[font size=26]
#
【Q6】[r]
情報処理技術者試験の日程を確認するために、Webブラウザのアドレスバーに情報処理技術者試験センターのURL「https://www.jitec.ipa.go.jp/」を入力したところ、正しく入力しているにもかかわらず、何度入力しても接続エラーとなってしまった。そこで、あらかじめ調べておいたIPアドレスを使って接続したところ接続できた。接続エラーの原因として最も疑われるものはどれか。
[glink  color="blue"  storage="ch1_3/scene2_4.ks"  size="22"  x="40"  width="1109"  y="268"  text="DHCPサーバの障害"  target="*Q6_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_4.ks"  size="22"  x="40"  width="1109"  y="329"  text="DNSサーバの障害"  target="*Q6_ok"  ]
[glink  color="blue"  storage="ch1_3/scene2_4.ks"  size="22"  x="40"  width="1109"  y="390"  text="PCに接続されているLANケーブルの断線"  target="*Q6_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_4.ks"  size="22"  x="40"  width="1109"  y="451"  text="デフォルトルータの障害"  target="*Q6_ng"  ]
[s]

*Q6_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#先輩
名前から住所を引く、電話帳が壊れてたんだな！[p]
#
【解説】IPアドレスを直接入力すると接続できたので、ネットワーク自体は生きている。名前からIPアドレスを引く役目のDNSサーバが、うまく働いていない。[p]
@jump target="*Q6_end"

*Q6_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
DNSは、名前と住所を結びつける電話帳だぜ！[p]
#
【解説】IPアドレスを直接入力すると接続できたので、ネットワーク自体は生きている。名前からIPアドレスを引く役目のDNSサーバが、うまく働いていない。[p]
@jump target="*Q6_end"

*Q6_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q7 関係データベースの作り方（復習）／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=182 page=fore visible=true]
[font size=26]
#
【Q7】[r]
関係データベースの構築を、次のa〜cの工程で行うとき、実行順序として適切なものはどれか。[r]
a　管理するデータ項目の洗い出し　　b　対象業務の分析　　c　表の作成
[glink  color="blue"  storage="ch1_3/scene2_4.ks"  size="22"  x="40"  width="1109"  y="190"  text="a → b → c"  target="*Q7_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_4.ks"  size="22"  x="40"  width="1109"  y="251"  text="b → a → c"  target="*Q7_ok"  ]
[glink  color="blue"  storage="ch1_3/scene2_4.ks"  size="22"  x="40"  width="1109"  y="312"  text="b → c → a"  target="*Q7_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_4.ks"  size="22"  x="40"  width="1109"  y="373"  text="c → a → b"  target="*Q7_ng"  ]
[s]

*Q7_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#先輩
まず業務、次に項目、最後に表だ！ 順番を守れたな！[p]
#
【解説】まず、どんな仕事のデータかを調べ（業務の分析）、必要なデータ項目を洗い出してから、表を作る。[p]
@jump target="*Q7_end"

*Q7_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
表を作る前に、何を入れるか決める！ 昨日も言ったぜ！[p]
#
【解説】まず、どんな仕事のデータかを調べ（業務の分析）、必要なデータ項目を洗い出してから、表を作る。[p]
@jump target="*Q7_end"

*Q7_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q8 ログの確認／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q8】[r]
ログファイルの、最後の部分を、確認するコマンドは？
[glink  color="blue"  storage="ch1_3/scene2_4.ks"  size="22"  x="640"  width="500"  y="240"  text="cd"  target="*Q8_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_4.ks"  size="22"  x="640"  width="500"  y="340"  text="mkdir"  target="*Q8_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_4.ks"  size="22"  x="640"  width="500"  y="440"  text="pwd"  target="*Q8_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_4.ks"  size="22"  x="640"  width="500"  y="540"  text="tail"  target="*Q8_ok"  ]
[s]

*Q8_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#先輩
しっぽを、見るんだったな！[p]
@jump target="*Q8_end"

*Q8_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
tail は、しっぽ（最後）だぜ！[p]
@jump target="*Q8_end"

*Q8_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q9 ランサムウェア／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q9】[r]
ランサムウェアの説明として、適切なものはどれか。
[glink  color="blue"  storage="ch1_3/scene2_4.ks"  size="22"  x="40"  width="1109"  y="151"  text="ウイルスなどを検知して、コンピュータを脅威から守り、安全性を高めるソフトウェアの総称"  target="*Q9_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_4.ks"  size="22"  x="40"  width="1109"  y="212"  text="感染すると勝手にファイルやデータの暗号化などを行って、正常にデータにアクセスできないようにし、元に戻すための代金を利用者に要求するソフトウェア"  target="*Q9_ok"  ]
[glink  color="blue"  storage="ch1_3/scene2_4.ks"  size="22"  x="40"  width="1109"  y="306"  text="キーボード入力や画面出力といった入出力機能や、ディスクやメモリの管理などコンピュータシステム全体を管理するソフトウェア"  target="*Q9_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_4.ks"  size="22"  x="40"  width="1109"  y="400"  text="ローマ字から平仮名や片仮名へ変換したり、仮名から漢字へ変換するなどコンピュータでの利用者の文字入力を補助するソフトウェア"  target="*Q9_ng"  ]
[s]

*Q9_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#先輩
身代金の、ランサムだな！[p]
#
【解説】ランサムは「身代金」の意味。データを勝手に暗号化して、元に戻す代わりにお金を要求するソフトが、ランサムウェア。[p]
@jump target="*Q9_end"

*Q9_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
ランサム＝身代金！ 忘れるなよ！[p]
#
【解説】ランサムは「身代金」の意味。データを勝手に暗号化して、元に戻す代わりにお金を要求するソフトが、ランサムウェア。[p]
@jump target="*Q9_end"

*Q9_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q10 AI提案の見極め（総復習・検証イベント）／2択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
;選択肢1（f.ai_ok＋1）
;※第2章の締めの検証イベント。Q6でDNSの意味を復習しているため、気づきやすくしてある
#先輩
最後に、AIに聞いてみるぜ。『DNSって、何？』[p]
#AI
DNSとは、メールを、送る仕組みです！ 100%、確実です！[p]
;（ツッコミ）
#おまえ
また、100%って言ってる[p]
#先輩
さあ、どうする？ シュートを決めるのは、お前だぜ！[p]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q10】[r]
[glink  color="blue"  storage="ch1_3/scene2_4.ks"  size="22"  x="640"  width="500"  y="240"  text="本当に正しいか、確認してから使う"  target="*Q10_ok"  ]
[glink  color="blue"  storage="ch1_3/scene2_4.ks"  size="22"  x="640"  width="500"  y="340"  text="そのまま採用する"  target="*Q10_ng"  ]
[s]

*Q10_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.ai_ok += 1"]
#
【正解！】[l][r]
#先輩
その調子だぜ！ DNSは、名前を、IPアドレスに直す仕組みだ！[p]
@jump target="*Q10_end"

*Q10_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
今日は、練習試合だ！ 間違いに気づくのも、勉強だぜ！[p]
@jump target="*Q10_end"

*Q10_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：業務後半の終わり]

#先輩
OJTの練習は、これで終わりだ！ よくやったぜ、新人ども！[p]
#同期
先輩、泣いてるっすか？[p]
#先輩
泣いてない！ 目に、汗が入っただけだぜ！[p]
#おまえ
（先輩、熱い）[p]

;=========================================
; 【終業後】（誰と過ごすか）
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]

;[場面：夕方・オフィス]
[bg storage="bg_office_evening.gif" time="500"]

#ナレーション
第2章の、最後の夕方。外は、雨が降り始めている。[p]

;[選択肢：終業後（信頼度）]
;選択肢1：先輩の信頼度＋1
;選択肢2：同期の信頼度＋1
;選択肢3：リーダーの信頼度＋1
;選択肢4：営業の信頼度＋1
#ナレーション
今日の夕方、誰と過ごす？
[glink  color="blue"  storage="ch1_3/scene2_4.ks"  size="26"  x="266"  width="640"  y="120"  text="先輩と、今月の振り返りをする"  target="*c2_1"  ]
[glink  color="blue"  storage="ch1_3/scene2_4.ks"  size="26"  x="266"  width="640"  y="195"  text="同期と、章の終わりを祝う"  target="*c2_2"  ]
[glink  color="blue"  storage="ch1_3/scene2_4.ks"  size="26"  x="266"  width="640"  y="270"  text="リーダーに、この1か月の成長について、聞く"  target="*c2_3"  ]
[glink  color="blue"  storage="ch1_3/scene2_4.ks"  size="26"  x="266"  width="640"  y="345"  text="営業に、さっきの報告の、続きを話す"  target="*c2_4"  ]
[s]

*c2_1
[cm]
[eval exp="f.t_senpai += 1"]
;◆1を選んだ場合
#先輩
1か月で、ここまで成長するとは、立派だぜ！ 俺の指導が、効いたな！[p]
#おまえ
先輩の指導は、確かに、効きました。声の大きさ、込みで[p]

@jump target="*c2_end"

*c2_2
[cm]
[eval exp="f.t_douki += 1"]
;◆2を選んだ場合
#同期
ここまで来られたのは、お前のおかげだぜ[p]
#おまえ
こっちこそ。同期がいたから、続けられた[p]
#同期
電源コードは、踏むけどな！[p]
;（ツッコミ）
#おまえ
それは、直してほしい[p]

@jump target="*c2_end"

*c2_3
[cm]
[eval exp="f.t_leader += 1"]
;◆3を選んだ場合
#リーダー
1か月前より、ずっと落ち着いてきたね[p]
でも、まだまだ。慢心は、最大の敵だよ。……ちなみに、俺の最大の敵は、花粉だね[p]
#おまえ
（心に刻もう。前半だけ）[p]

@jump target="*c2_end"

*c2_4
[cm]
[eval exp="f.t_eigyo += 1"]
;◆4を選んだ場合
#営業
……原因。ネットワーク機器の、設定ミスだった[p]
……客には、こっちから、説明しておく[p]
#おまえ
ありがとうございます[p]
#営業
……次から、報告、忘れるな[p]
@jump target="*c2_end"

*c2_end
;=========================================
; 【自宅】（リザルト）
;=========================================
[playbgm storage="bgm_walk.mp3" restart="false"]

;[bg storage="（自宅の部屋（夜））" time="500"]
[bg storage="bg_home_night.gif" time="500"]

#ナレーション
布団の中で、1か月を振り返る。[p]

;[リザルト表示]
;・今日の正解数：○／10
;・スキル：＋○
;・AI見極め回数：＋○（Q10で見極めたら＋1）
;・信頼度の変化：（選んだキャラ）＋1（営業への返事の分も、加算・減算）

;[ナレーション]
#おまえ
失敗したけど、営業さんに、報告の大事さを、教えてもらえた[p]
明日から、6月の後半。もう少し、頑張ろう[p]
#ナレーション
第2章 おわり[p]

;=========================================
; 【第2章の章末：途中判定】
;=========================================
[fadeoutbgm time="1500"]
;※最初の途中判定。見極め回数・スキル（正解数）・信頼度の、合計点で判定する
;※基準の数値は、配点が決まってから決める（今は、仮）

;[判定の場面：翌朝・会議室（試用期間の終わり）]
[bg storage="bg_meeting_room.gif" time="500"]

#ナレーション
6月の終わり。入社から、3か月が、経った。[p]
試用期間の、最終面談の日だ。[p]

;[場面：社長・リーダー・先輩が、並んでいる]

#社長
ふっ……座れ[p]
#おまえ
はい[p]
#社長
3か月間の成績を、見せてもらったぜ[p]

;▼分岐（合計点が、基準以上か、未満か）
[if exp="f.term_ok >= f.term_q * 0.6"]
;◆基準以上のとき（合格）
#社長
……ふっ。悪くない[p]
試用期間は、終わりだ。本採用だぜ[p]
#おまえ
ありがとうございます！[p]
#リーダー
よく頑張ったね。おkだよ[p]
#先輩
当然っス！ 俺の指導が、よかったんスよ！[p]
#社長
いいか、よく聞け……[p]
#先輩
……はいっス[p]
#おまえ
（続きは、やっぱりなかった。でも、少しだけ、認められた）[p]
#社長
次は、夏だ。気を抜くなよ。ミスをしたら……ふっ、わかってるな[p]
#おまえ
（何がわかってるのか、わからないけど）はい[p]
;→ 第3章 1日目へ

[else]
;◆基準未満のとき（バッドエンド：試用期間で不合格）
#社長
……残念だが[p]
#社長
確認が足りない。報連相も、不安定だ。……うちでは、使えないぜ[p]
#おまえ
そんな……[p]
#社長
試用期間は、ここまでだ。今日で、終わりだ[p]
#リーダー
おやおや……もう少しだったのにね[p]
#先輩
すまねェ、新人！ 俺の指導が、足りなかった！[p]
;（少しだけ、惜しそう）
#営業
……もう少し、報告できれば[p]
#同期
そんな……一緒に、頑張ってきたのによ[p]
#おまえ
……あの、一つだけ、いいですか[p]
#社長
なんだ[p]
#おまえ
自動ドアが、同期を、挟んだ時点で、もっと、不安になるべきでした[p]
#社長
……そこか？[p]
;※コメディ寄りの締め。主人公のツッコミで、重くならないように終える
;→ バッドエンド1「試用期間で不合格」を、エンド一覧に記録して、タイトルへ
@jump storage="ending/end06.ks"
[endif]

;=========================================
;■ 次回予告（第3章 1日目）
;7月。平穏な日。主人公が、AIを便利に使い始め、頼りすぎる。笑い多め。
;出題：ITパスポート（マネジメント：サービス管理）
;※第3章は、重い失敗（AIの提案を鵜呑み）が起きる章。章末の途中判定は、基準を緩める
;■ 未決定
;・社長以外の名前
;・各問題の中身（仮。見直す前提）
;・章末の途中判定の基準（配点が決まってから）
;・バッドエンド1の、見送りの場面の、細かい調整
;・営業への返事（3択）の、信頼度の増減値は仮

;次のファイルへ
@jump storage="ch1_3/scene3_1.ks"
