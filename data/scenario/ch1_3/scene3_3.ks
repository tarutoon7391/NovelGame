;第3章 3日目

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
;台本　第3章（7〜8月）　3日目
;状態：叩き台（1日分すべて）／ITパスポート枠は過去問に差し替え済み（11/4）
;※名前は社長（郡晴希：こおり はるき）のみ決定。ほかは役割で表記
;※選択肢の数は問題ごとに変える（用語・知識は4択／場面の判断は3択／AI提案の見極めは2択）
;============================================================
;■ この日のねらい
;・絶望の日。社長は静かに怒り、先輩は熱血をやめ、リーダーはおネエ口調が消える
;・ただし、コメディの味は、少し残す。全部が暗いだけの日にはしない
;・主人公が、「確認しなかったのは自分だ」と向き合う日
;・出題：ITパスポート（アクセス権限）、障害対応の考え方
;■ この日の、みんなの変化（2日目の失敗のあと）
;・社長：怒鳴らない。静かに、淡々と話す（これが、一番怖い）
;・先輩：声が小さく、スポーツのたとえを、一切言わない
;・リーダー：おネエ口調が消えて、普通の話し方になる
;・営業：口は悪いが、AIのせいにしないことを、主人公に求める
;・同期：変わらず、いつもの調子で、そばにいる（立ち直りの伏線）
;■ 1日の流れ
;朝 → 業務前半（5問）→ 昼休み → 業務後半（5問）→ 終業後 → 自宅（リザルト）
;------------------------------------------------------------
; 【朝】
;=========================================
[playbgm storage="bgm_walk.mp3" restart="false"]

;[bg storage="（オフィス（朝））" time="500"]
[bg storage="bg_office.gif" time="500"]

#ナレーション
第3章 3日目。昨日の障害から、一夜が明けた。[p]
会社に行きたくない、と思った。それでも、足は、会社に向かった。[p]

;[場面：自動ドアの前]
[bg storage="bg_entrance_door.gif" time="500"]

#おまえ
（自動ドアが、開く）[p]
（……今日は、挟まれたい気分だ）[p]
#同期
おう……おはよう[p]
#おまえ
おはよう……[p]
#同期
今日は、挟まれなかったな[p]
#おまえ
……そうだね[p]
;（心配そうな顔）
#同期
…………[p]
;※いつもなら、ツッコミを入れる場面。今日は、ツッコミが出てこない

;[場面：オフィスの中。空気が、重い]
[bg storage="bg_office.gif" time="500"]

#ナレーション
オフィスは、静かだった。[p]
誰も、大声を出さない。[p]

;[場面：先輩が、席にいる]

#先輩
……おはよう[p]
#おまえ
おはようございます[p]
#先輩
…………[p]
#おまえ
（先輩の、声が、小さい）[p]
（いつもの『全力で、走るぞ！』が、ない）[p]

;[場面：リーダーが、近づく]

#リーダー
おはよう。……今日は、復旧のあとの、確認作業がある[p]
#おまえ
（あれ、リーダーの、話し方が……）[p]
#リーダー
昨日のことは、ちゃんと振り返る。報告書も、書く必要がある[p]
#おまえ
はい……[p]
（いつもの『おやおや』も、『おk』も、ない）[p]

;[場面：社長が、入ってくる]

#社長
…………[p]
#おまえ
（何を言われるのか、わからなくて、こわい）[p]
#社長
新人[p]
#おまえ
……はい[p]
#社長
…………報告書は、今日中に出せ。……以上だ[p]
#おまえ
……はい[p]
#ナレーション
社長は、静かに去っていった。いつもの奇行は、なかった。[p]
#同期
……何も、なかったな[p]
#おまえ
……何かされたほうが、まだ、ましだった[p]
;※奇行も「いいか、よく聞け」もない社長が、一番、怖い

;[選択肢：1回目（信頼度）]
;選択肢1：先輩の信頼度＋1
;選択肢2：リーダーの信頼度＋1
;選択肢3：信頼度の増減なし
;※場面の判断なので3択。どれを選んでも、次の場面につながる
#ナレーション
昨日のことで、まず、誰に謝る？
[glink  color="blue"  storage="ch1_3/scene3_3.ks"  size="26"  x="266"  width="640"  y="120"  text="先輩に、謝る"  target="*c1_1"  ]
[glink  color="blue"  storage="ch1_3/scene3_3.ks"  size="26"  x="266"  width="640"  y="195"  text="リーダーに、謝る"  target="*c1_2"  ]
[glink  color="blue"  storage="ch1_3/scene3_3.ks"  size="26"  x="266"  width="640"  y="270"  text="誰にも、謝れず、席に座る"  target="*c1_3"  ]
[s]

*c1_1
[cm]
[eval exp="f.t_senpai += 1"]
;◆1を選んだ場合
#おまえ
先輩、昨日は、本当に、すみませんでした[p]
#先輩
…………[p]
……謝る前に、何がまずかったか、考えろ[p]
#おまえ
はい……[p]
#先輩
それが、今日のお前の仕事だ[p]

@jump target="*c1_end"

*c1_2
[cm]
[eval exp="f.t_leader += 1"]
;◆2を選んだ場合
#おまえ
リーダー、昨日は、ご迷惑を、おかけしました[p]
#リーダー
……謝罪は、受け取る。でも、大事なのは、次にどう活かすか、だよ[p]
#おまえ
はい[p]

@jump target="*c1_end"

*c1_3
[cm]
;◆3を選んだ場合
#おまえ
（……言葉が、出てこない）[p]
（席に、座るしか、なかった）[p]
@jump target="*c1_end"

*c1_end
;=========================================
; 【業務前半】（問題5問）アクセス権限
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]
[eval exp="f.correct_am = 0"]

;[場面：会議室]
[bg storage="bg_meeting_room.gif" time="500"]

#リーダー
今日は、昨日の障害の振り返りをする[p]
そのために、まず、アクセス権限の話をしよう[p]
#おまえ
アクセス権限、ですか[p]
#リーダー
昨日、君は、ログを全部消せる権限を、持っていた[p]
それが、危険だったんだ[p]

;Q1 アクセス制御／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=182 page=fore visible=true]
[font size=26]
#
【Q1】[r]
データベースの内容を、利用者の業務の機密性に応じて限定的に表示するようにしたい。その手法として、最も適切なものはどれか。
[glink  color="blue"  storage="ch1_3/scene3_3.ks"  size="22"  x="40"  width="1109"  y="190"  text="アクセス権を、データと利用者の組合せに対して設定する。"  target="*Q1_ok"  ]
[glink  color="blue"  storage="ch1_3/scene3_3.ks"  size="22"  x="40"  width="1109"  y="251"  text="利用者ごとに限定されたデータベースの複製を配布する。"  target="*Q1_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_3.ks"  size="22"  x="40"  width="1109"  y="312"  text="利用者ごとに専用のデータ項目（列）を設ける。"  target="*Q1_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_3.ks"  size="22"  x="40"  width="1109"  y="373"  text="レコードごとにパスワードを設定して保護する。"  target="*Q1_ng"  ]
[s]

*Q1_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#リーダー
そう。誰に、何をさせるか、決めておくんだ[p]
#
【解説】誰が、どのデータに、どこまで触れてよいかを決めるのが、アクセス権の設定（アクセス制御）。データと利用者の組合せごとに決める。[p]
@jump target="*Q1_end"

*Q1_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
利用の範囲を決めるのが、アクセス制御だよ[p]
#
【解説】誰が、どのデータに、どこまで触れてよいかを決めるのが、アクセス権の設定（アクセス制御）。データと利用者の組合せごとに決める。[p]
@jump target="*Q1_end"

*Q1_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q2 最小権限の原則／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
;※昨日の失敗の根本原因の一つ（新人が、重要なファイルを全て消せる権限を持っていた）
[position layer="message0" left=0 top=0 width=1280 height=260 page=fore visible=true]
[font size=26]
#
【Q2】[r]
セキュリティ対策の目的①〜④のうち、適切なアクセス権を設定することによって効果があるものだけを全て挙げたものはどれか。[r]
①　DoS攻撃から守る。　　②　情報漏えいを防ぐ。　　③　ショルダハッキングを防ぐ。　　④　不正利用者による改ざんを防ぐ。
[glink  color="blue"  storage="ch1_3/scene3_3.ks"  size="22"  x="40"  width="1109"  y="268"  text="①、②"  target="*Q2_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_3.ks"  size="22"  x="40"  width="1109"  y="329"  text="①、③"  target="*Q2_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_3.ks"  size="22"  x="40"  width="1109"  y="390"  text="②、④"  target="*Q2_ok"  ]
[glink  color="blue"  storage="ch1_3/scene3_3.ks"  size="22"  x="40"  width="1109"  y="451"  text="③、④"  target="*Q2_ng"  ]
[s]

*Q2_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#リーダー
権限の設定で、漏えいと改ざんは防げる。昨日の、俺たちの反省点でもある[p]
#
【解説】アクセス権を適切に設定すると、見てはいけない人に見られること（漏えい）や、触ってはいけない人に書き換えられること（改ざん）を防げる。仕事に必要な最小限の権限だけを渡す考え方を、最小権限の原則という。[p]
@jump target="*Q2_end"

*Q2_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
アクセス権で防げるのは、漏えいと改ざん。必要なものだけ渡す。それが最小権限の原則だよ[p]
#
【解説】アクセス権を適切に設定すると、見てはいけない人に見られること（漏えい）や、触ってはいけない人に書き換えられること（改ざん）を防げる。仕事に必要な最小限の権限だけを渡す考え方を、最小権限の原則という。[p]
@jump target="*Q2_end"

*Q2_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q3 利用者認証／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q3】[r]
システムの利用者認証に関する記述のうち、適切なものはどれか。
[glink  color="blue"  storage="ch1_3/scene3_3.ks"  size="22"  x="40"  width="1109"  y="151"  text="1回の認証で、複数のサーバやアプリケーションなどへのログインを実現する仕組みを、チャレンジレスポンス認証という。"  target="*Q3_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_3.ks"  size="22"  x="40"  width="1109"  y="245"  text="指紋や声紋など、身体的な特徴を利用して本人認証を行う仕組みを、シングルサインオンという。"  target="*Q3_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_3.ks"  size="22"  x="40"  width="1109"  y="306"  text="情報システムが利用者の本人確認のために用いる、数字列から成る暗証番号のことを、PINという。"  target="*Q3_ok"  ]
[glink  color="blue"  storage="ch1_3/scene3_3.ks"  size="22"  x="40"  width="1109"  y="367"  text="特定の数字や文字の並びではなく、位置についての情報を覚えておき、認証時には画面に表示された表の中で、自分が覚えている位置に並んでいる数字や文字をパスワードとして入力する方式を、多要素認証という。"  target="*Q3_ng"  ]
[s]

*Q3_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#リーダー
そう。本人確認の方法には、暗証番号（PIN）みたいに、名前がついているんだ[p]
#
【解説】本人確認の方法には、名前がついている。数字だけの暗証番号はPIN、1回の認証で複数のシステムに入れる仕組みはシングルサインオン、指紋や声紋は生体認証。[p]
@jump target="*Q3_end"

*Q3_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
本人確認が、認証。その方法の名前を、整理しよう[p]
#
【解説】本人確認の方法には、名前がついている。数字だけの暗証番号はPIN、1回の認証で複数のシステムに入れる仕組みはシングルサインオン、指紋や声紋は生体認証。[p]
@jump target="*Q3_end"

*Q3_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面転換：主人公が、うつむいている]

#リーダー
……聞いてる？[p]
#おまえ
あ、すみません。聞いています[p]
#リーダー
顔色が、悪いね[p]
#おまえ
大丈夫です[p]
#リーダー
……無理は、しないでね[p]
;※リーダーの口調が、少しだけ、いつもの「〜だね」に戻りかける

;Q4 認証情報の更新／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=182 page=fore visible=true]
[font size=26]
#
【Q4】[r]
認証に必要な情報の変更又は更新を定期的に行う必要がないものだけを全て挙げたものはどれか。[r]
a　虹彩認証　　b　電子証明書による認証　　c　パスワード認証
[glink  color="blue"  storage="ch1_3/scene3_3.ks"  size="22"  x="40"  width="1109"  y="190"  text="a"  target="*Q4_ok"  ]
[glink  color="blue"  storage="ch1_3/scene3_3.ks"  size="22"  x="40"  width="1109"  y="251"  text="b"  target="*Q4_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_3.ks"  size="22"  x="40"  width="1109"  y="312"  text="a、b"  target="*Q4_ng"  ]
[s]

*Q4_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#リーダー
そう。認証の情報にも、更新が要るものと、要らないものがあるんだ[p]
#
【解説】虹彩（目の模様）は、変わらないので、更新はいらない。電子証明書には有効期限があり、パスワードも変えていくもの。[p]
@jump target="*Q4_end"

*Q4_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
電子証明書には有効期限があるし、パスワードは変えていくもの。虹彩は、変わらないよ[p]
#
【解説】虹彩（目の模様）は、変わらないので、更新はいらない。電子証明書には有効期限があり、パスワードも変えていくもの。[p]
@jump target="*Q4_end"

*Q4_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q5 パスワード管理／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q5】[r]
パスワード管理に関する記述のうち、適切なものはどれか。
[glink  color="blue"  storage="ch1_3/scene3_3.ks"  size="22"  x="40"  width="1109"  y="151"  text="業務システムで使用しているパスワードを、私的なインターネットサービスの利用では使用しない。"  target="*Q5_ok"  ]
[glink  color="blue"  storage="ch1_3/scene3_3.ks"  size="22"  x="40"  width="1109"  y="212"  text="初期パスワードは、システムのログイン操作に慣れるまで変更しない。"  target="*Q5_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_3.ks"  size="22"  x="40"  width="1109"  y="273"  text="数個のパスワードを用意しておき、それを使い回す。"  target="*Q5_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_3.ks"  size="22"  x="40"  width="1109"  y="334"  text="パスワードは、平文のファイルに格納してPCへ保存しておく。"  target="*Q5_ng"  ]
[s]

*Q5_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#リーダー
パスワードは、使い回さない。基本だね[p]
#
【解説】仕事用のパスワードを、私用のサービスで使い回さない。初期パスワードはすぐ変える。使い回しや、そのままの文字でファイルに保存するのは、危ない。[p]
@jump target="*Q5_end"

*Q5_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
パスワードの使い回しや、そのままの保存は、危険だよ[p]
#
【解説】仕事用のパスワードを、私用のサービスで使い回さない。初期パスワードはすぐ変える。使い回しや、そのままの文字でファイルに保存するのは、危ない。[p]
@jump target="*Q5_end"

*Q5_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：業務前半の終わり]

#リーダー
前半は、ここまで。お昼にしよう[p]
#おまえ
……はい[p]
#リーダー
食事は、ちゃんととってね。……魚肉ソーセージ、一本あげるよ[p]
#おまえ
……ありがとうございます[p]

;=========================================
; 【昼休み】（先輩の評価）
;=========================================
[playbgm storage="bgm_easygoing.mp3" restart="false"]

;[場面：休憩スペース]
[bg storage="bg_break_space.gif" time="500"]

#ナレーション
いつもなら、先輩が、元気に、成績を聞いてくる時間だ。[p]

;▼分岐（午前の正解数 f.correct_am で切り替え）
[if exp="f.correct_am >= 4"]
;◆4問以上正解のとき
;（小声）
#先輩
……よくできてるな[p]
#おまえ
ありがとうございます[p]
#先輩
…………[p]

[elsif exp="f.correct_am >= 2"]
;◆2〜3問正解のとき
#先輩
……そうか[p]
#おまえ
はい[p]

[else]
;◆1問以下のとき
#先輩
……調子が、悪いのか[p]
#おまえ
すみません[p]
#先輩
謝らなくていい。体調は、大事にしろ[p]
[endif]

;[場面：営業が、近づいてくる]

#営業
……そこの[p]
#おまえ
はい[p]
#営業
……昨日のこと、聞いた[p]
#おまえ
……すみません[p]
#営業
……こっちに謝っても、仕方ない。客に謝るのは、こっちの役目[p]
……一つだけ[p]
#おまえ
はい[p]
#営業
……AIの、せいにだけは、するな[p]
#おまえ
えっ[p]
#営業
……確認を怠ったのは、お前。AIは、道具。実行したのは、人間[p]
#おまえ
……はい[p]
#営業
……責任を認めたやつは、次に進める[p]
……認めないやつは、同じ失敗を、繰り返す[p]
#おまえ
（言葉は少ないけど、真剣だ）[p]
;※営業は、傷口に塩を塗るのではなく、立ち直るための条件を、示す

;=========================================
; 【業務後半】（問題5問）障害対応の考え方・事後の振り返り
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]

;[場面：午後・会議室]
[bg storage="bg_meeting_room.gif" time="500"]

#リーダー
午後は、障害報告書を作ろう[p]
何が起きて、なぜ起きて、次にどうするか。それを、整理するんだ[p]
#おまえ
はい[p]

;[場面：パソコンの画面。AIが、勝手に、顔を出す]

#AI
こんにちは！ 障害報告書を、お手伝いします！ お任せください！[p]
#おまえ
……いらない[p]
#AI
大丈夫です！ 今回の障害の原因は、ログが多すぎたことです！ あなたに、責任は、ありません！ 100%、あなたの、せいではありません！[p]
#おまえ
…………[p]
（慰めてくれてる？ いや、違う）[p]
（それは、確認しないで実行した、俺の責任だ）[p]

;Q6 AI提案の見極め（報告書）／2択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
;選択肢2（f.ai_ok＋1）
;※この見極めは、避けられる。2日目の失敗と違って、ここは、自分で選べる
;※不正解でも、営業と、リーダーが、止める
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q6】[r]
AIが作った、障害報告書の案を、どう扱う？
[glink  color="blue"  storage="ch1_3/scene3_3.ks"  size="22"  x="40"  width="1109"  y="151"  text="責任がないと書いてあるので、そのまま、提出する"  target="*Q6_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_3.ks"  size="22"  x="40"  width="1109"  y="212"  text="事実と、合っているか確認して、自分の責任も、含めて書き直す"  target="*Q6_ok"  ]
[s]

*Q6_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.ai_ok += 1"]
#
【正解！】[l][r]
#おまえ
……僕の、責任だ。ちゃんと、書こう[p]
@jump target="*Q6_end"

*Q6_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#営業
……そのまま、出す気か。……それが、一番ダメなやつ[p]
@jump target="*Q6_end"

*Q6_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q7 障害報告書に書く内容／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q7】[r]
障害報告書に、必ず書くべき、内容として、適切なものは？
[glink  color="blue"  storage="ch1_3/scene3_3.ks"  size="22"  x="640"  width="500"  y="240"  text="誰が悪いかだけ"  target="*Q7_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_3.ks"  size="22"  x="640"  width="500"  y="340"  text="今日の天気"  target="*Q7_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_3.ks"  size="22"  x="640"  width="500"  y="440"  text="お客様への、言い訳"  target="*Q7_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_3.ks"  size="22"  x="640"  width="500"  y="540"  text="発生した事実、原因、対応、再発防止策"  target="*Q7_ok"  ]
[s]

*Q7_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#リーダー
そう。誰かを責めるためじゃなく、次に活かすための書類だよ[p]
#
【解説】事実、原因、対応内容、再発防止策を、整理して書く。犯人探しだけでは、再発は防げない。[p]
@jump target="*Q7_end"

*Q7_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
責任の押し付けじゃなく、次に活かす記録なんだ[p]
#
【解説】事実、原因、対応内容、再発防止策を、整理して書く。犯人探しだけでは、再発は防げない。[p]
@jump target="*Q7_end"

*Q7_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q8 再発防止／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q8】[r]
今回のような障害を、二度と起こさないために、まず、取り組むべきことは？
[glink  color="blue"  storage="ch1_3/scene3_3.ks"  size="22"  x="640"  width="500"  y="240"  text="反省文を、100枚書く"  target="*Q8_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_3.ks"  size="22"  x="640"  width="500"  y="340"  text="作業の前に、確認する手順を、決める"  target="*Q8_ok"  ]
[glink  color="blue"  storage="ch1_3/scene3_3.ks"  size="22"  x="640"  width="500"  y="440"  text="新人を、二度と、当番にしない"  target="*Q8_ng"  ]
[s]

*Q8_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#リーダー
そう。仕組みを、作るんだよ[p]
@jump target="*Q8_end"

*Q8_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
人を責めるより、手順を見直すほうが、再発を防げるよ[p]
@jump target="*Q8_end"

*Q8_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q9 バックアップと復元（復習）／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=338 page=fore visible=true]
[font size=26]
#
【Q9】[r]
毎週日曜日の業務終了後にフルバックアップファイルを取得し、月曜日〜土曜日の業務終了後には増分バックアップファイルを取得しているシステムがある。水曜日の業務中に故障が発生したので、バックアップファイルを使って火曜日の業務終了時点の状態にデータを復元することにした。データ復元に必要なバックアップファイルを全て挙げたものはどれか。ここで、増分バックアップファイルとは、前回のバックアップファイル（フルバックアップファイル又は増分バックアップファイル）の取得以降に変更されたデータだけのバックアップファイルを意味する。
[glink  color="blue"  storage="ch1_3/scene3_3.ks"  size="22"  x="40"  width="1109"  y="346"  text="日曜日のフルバックアップファイル、月曜日と火曜日の増分バックアップファイル"  target="*Q9_ok"  ]
[glink  color="blue"  storage="ch1_3/scene3_3.ks"  size="22"  x="40"  width="1109"  y="407"  text="日曜日のフルバックアップファイル、火曜日の増分バックアップファイル"  target="*Q9_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_3.ks"  size="22"  x="40"  width="1109"  y="468"  text="月曜日と火曜日の増分バックアップファイル"  target="*Q9_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_3.ks"  size="22"  x="40"  width="1109"  y="529"  text="火曜日の増分バックアップファイル"  target="*Q9_ng"  ]
[s]

*Q9_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#リーダー
備えが一番大事、ってこと。……今回の教訓の、一つだね[p]
#
【解説】復元には、土台になるフルバックアップと、そのあとの増分を、順番に全部使う。日曜日のフル、月曜日の増分、火曜日の増分、の3つが必要。[p]
@jump target="*Q9_end"

*Q9_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
フルの土台に、増分を順番に重ねて戻す。これが、助けになるんだ[p]
#
【解説】復元には、土台になるフルバックアップと、そのあとの増分を、順番に全部使う。日曜日のフル、月曜日の増分、火曜日の増分、の3つが必要。[p]
@jump target="*Q9_end"

*Q9_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q10 振り返り（ポストモーテム）／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q10】[r]
障害の、振り返りの、目的として、最も適切なものは？
[glink  color="blue"  storage="ch1_3/scene3_3.ks"  size="22"  x="640"  width="500"  y="240"  text="責任者を、見つけて、罰する"  target="*Q10_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_3.ks"  size="22"  x="640"  width="500"  y="340"  text="原因を理解して、再発を防ぐ"  target="*Q10_ok"  ]
[glink  color="blue"  storage="ch1_3/scene3_3.ks"  size="22"  x="640"  width="500"  y="440"  text="反省した、と見せる"  target="*Q10_ng"  ]
[s]

*Q10_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#リーダー
その考え方が、一番大事だよ[p]
#
【解説】振り返りは、責める場ではなく、次の障害を、防ぐための場。[p]
@jump target="*Q10_end"

*Q10_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
目的は、次に同じことを、起こさないことだよ[p]
#
【解説】振り返りは、責める場ではなく、次の障害を、防ぐための場。[p]
@jump target="*Q10_end"

*Q10_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：業務後半の終わり]

#リーダー
……報告書、提出に行こうか[p]
#おまえ
はい[p]

;[場面：社長室。報告書を、提出する]
[bg storage="bg_president_room.gif" time="500"]
[fadeoutbgm time="1500"]

#社長
……読んだぜ[p]
#おまえ
はい[p]
#社長
…………[p]
AIのせいに、していないな[p]
#おまえ
はい。確認しなかったのは、自分の責任です[p]
#社長
……そうか[p]
それだけは、評価するぜ[p]
#おまえ
……えっ[p]
#社長
ただし、許したわけじゃない。……いいか、よく聞け……以上だ[p]
#おまえ
（……結局、続きはなかった。でも、少しだけ、楽になった）[p]
;※社長が、ほんの少しだけ、認める。ただし、完全には、許していない

;=========================================
; 【終業後】（誰と過ごすか）
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]

;[場面：夕方・オフィス。人が、少ない]
[bg storage="bg_office_evening.gif" time="500"]

#ナレーション
3日目の仕事が、終わった。[p]
昨日より、少しだけ、空気が、軽くなった気がする。[p]

;[選択肢：終業後（信頼度）]
;選択肢1：同期の信頼度＋1
;選択肢2：営業の信頼度＋1
;選択肢3：信頼度の増減なし
;※3択。どれを選んでも、次の場面につながる
#ナレーション
今日の夕方、どうする？
[glink  color="blue"  storage="ch1_3/scene3_3.ks"  size="26"  x="266"  width="640"  y="120"  text="同期に、「一緒に帰ろう」と、声をかける"  target="*c2_1"  ]
[glink  color="blue"  storage="ch1_3/scene3_3.ks"  size="26"  x="266"  width="640"  y="195"  text="営業に、「さっきのことを、ありがとうございました」と伝える"  target="*c2_2"  ]
[glink  color="blue"  storage="ch1_3/scene3_3.ks"  size="26"  x="266"  width="640"  y="309"  text="誰にも話さず、まっすぐ、帰る"  target="*c2_3"  ]
[s]

*c2_1
[cm]
[eval exp="f.t_douki += 1"]
;◆1を選んだ場合
#同期
おう、もちろんだ。一緒に帰ろうぜ[p]
昨日のこと、オデ、何もできなかった。わりィ[p]
#おまえ
同期が、謝ることじゃない[p]
#同期
いや……。明日、少しだけ、話させてくれよな[p]
#おまえ
……わかった[p]
;※4日目の、伏線（同期が、主人公を頼りに、くる）

@jump target="*c2_end"

*c2_2
[cm]
[eval exp="f.t_eigyo += 1"]
;◆2を選んだ場合
#営業
……礼は、いらない。……仕事ができるようになってから、言え[p]
……ただ、今日の報告書は、よかった[p]
#おまえ
ありがとうございます[p]
#営業
……明日から、また[p]

@jump target="*c2_end"

*c2_3
[cm]
;◆3を選んだ場合
#ナレーション
一人で、駅に向かう。足が、重い。[p]
#おまえ
（明日、また、会社に来られるのかな）[p]
@jump target="*c2_end"

*c2_end
;=========================================
; 【自宅】（リザルト）
;=========================================
[playbgm storage="bgm_walk.mp3" restart="false"]

;[bg storage="（自宅の部屋（夜））" time="500"]
[bg storage="bg_home_night.gif" time="500"]

#ナレーション
天井を、見つめる。[p]

;[リザルト表示]
;・今日の正解数：○／10
;・スキル：＋○
;・AI見極め回数：＋○（Q6で見極めたら＋1）
;・信頼度の変化：（選んだキャラ）＋1

;[ナレーション]
#おまえ
責任は、僕にある。それは、変わらない[p]
でも、AIのせいにしなかったことは、少しだけ、よかったと思う[p]
明日は、どうなるんだろう[p]
#ナレーション
第3章 4日目へ。[p]

;=========================================
;■ 次回予告（第3章 4日目）
;機械が苦手な同期が、助けを求めてくる。頼られて、立ち直る。同期の信頼度が、大きく上がる。
;出題：第3章の総復習
;※第3章の最終日。章末に、2つ目の途中判定がある
;■ 未決定
;・社長以外の名前
;・各問題の中身（仮。見直す前提）
;・「今までで一番重い絶望」の度合い。この台本は、コメディの味を残して、少し軽めにしてある。重くしたい場合は、先輩・リーダー・社長の変化の描写を増やす
;・Q6（AIの慰め）は、避けられる見極め。2日目の失敗が必ず起きる分、ここで、回復のチャンスを残している

;次のファイルへ
@jump storage="ch1_3/scene3_4.ks"
