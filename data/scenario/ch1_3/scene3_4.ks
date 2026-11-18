;第3章 4日目

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
;台本　第3章（7〜8月）　4日目（第3章の最終日）
;状態：叩き台（1日分すべて）／ITパスポート枠は過去問に差し替え済み（11/4）
;※名前は社長（郡晴希：こおり はるき）のみ決定。ほかは役割で表記
;※選択肢の数は問題ごとに変える（用語・知識は4択／場面の判断は3択／AI提案の見極めは2択）
;============================================================
;■ この日のねらい
;・機械が苦手な同期が、助けを求めてくる。頼られて、立ち直る
;・同期の信頼度が、大きく上がる（この章の、最大のイベント）
;・主人公が、「確認する力」で、AIの提案を見極める（2日目の失敗の、回収）
;・出題：第3章の総復習
;・章末に、2つ目の途中判定（バッドエンドあり）
;■ 1日の流れ
;朝 → 業務前半（5問）→ 昼休み → 業務後半（5問）→ 終業後（固定）→ 自宅（リザルト）→ 章末の途中判定
;------------------------------------------------------------
; 【朝】
;=========================================
[playbgm storage="bgm_walk.mp3" restart="false"]

;[bg storage="（オフィス（朝））" time="500"]
[bg storage="bg_office.gif" time="500"]

#ナレーション
第3章 4日目。重い空気は、まだ、少しだけ残っている。[p]
それでも、足取りは、昨日より、少しだけ、軽い。[p]

;[場面：自動ドアの前]
[bg storage="bg_entrance_door.gif" time="500"]

#おまえ
（自動ドアが、開く）[p]
;（挟まっている）
#同期
…………[p]
#おまえ
……挟まってる[p]
#同期
た、助けてくれェ……[p]
;（引っ張り出す）
#おまえ
…………[p]
#同期
ありがとな……[p]
#おまえ
今日の、ツッコミは、あとで、まとめて言う[p]
#同期
へへっ、楽しみにしてるぜ[p]
;※久しぶりの、ドアのお約束。主人公の、ツッコミが、戻りかけている

;[場面：同期が、真剣な顔で、話しかける]

なあ……頼みが、あるんだ[p]
#おまえ
どうしたの[p]
#同期
今日の午後、お客様向けの、オンライン説明会があるだろ[p]
オデが、会議システムの準備を、任されてよ[p]
#おまえ
うん[p]
#同期
でも……接続が、うまくいかねェんだ[p]
#おまえ
えっ[p]
#同期
オデが機械苦手なの、知ってるだろ。頼れるのが、お前しかいなくてよ[p]
#おまえ
（……俺が、頼られてる）[p]
（でも、先週、俺は、取り返しのつかない、失敗を）[p]

;[選択肢：1回目（同期への返事・信頼度）]
;選択肢1：同期の信頼度＋2
;選択肢2：同期の信頼度＋1
;選択肢3：同期の信頼度±0
;※場面の判断なので3択。どれを選んでも、あとで手伝う流れにつながる
#ナレーション
同期のお願いに、どう答える？
[glink  color="blue"  storage="ch1_3/scene3_4.ks"  size="26"  x="266"  width="640"  y="120"  text="「任せて。一緒に、確認しながらやろう」と、引き受ける"  target="*c1_1"  ]
[glink  color="blue"  storage="ch1_3/scene3_4.ks"  size="26"  x="266"  width="640"  y="234"  text="「僕で、いいの？ 先週の、あの失敗のあとだよ」と、確かめる"  target="*c1_2"  ]
[glink  color="blue"  storage="ch1_3/scene3_4.ks"  size="26"  x="266"  width="640"  y="348"  text="「ごめん、今は、無理かも」と、断る"  target="*c1_3"  ]
[s]

*c1_1
[cm]
[eval exp="f.t_douki += 2"]
;◆1を選んだ場合
#同期
ありがとな！ 本当に、助かるぜ！[p]
#おまえ
ただし、一つだけ、条件。実行する前に、毎回、確認する[p]
#同期
おう。それがいいと思うぜ[p]

@jump target="*c1_end"

*c1_2
[cm]
[eval exp="f.t_douki += 1"]
;◆2を選んだ場合
#同期
お前じゃないと、ダメなんだよ[p]
失敗したからこそ、確認の大事さを、知ってるだろ[p]
#おまえ
……そうか。わかった、手伝う[p]

@jump target="*c1_end"

*c1_3
[cm]
;◆3を選んだ場合
#同期
……そっか。わりィ、無理言って[p]
#おまえ
（……何を、言ってるんだ、俺は）[p]
（昨日、営業さんが、言ってた。『責任を、認めたやつは、次に、進める』）[p]
待って。やっぱり、手伝う[p]
#同期
ほんとか？[p]
#おまえ
ごめん、一度、断っちゃって[p]
#同期
いいって。ありがとな[p]
@jump target="*c1_end"

*c1_end
;=========================================
; 【業務前半】（問題5問）第3章の総復習①：サービス管理
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]
[eval exp="f.correct_am = 0"]

;[場面：会議室。リーダーが、復習を出す]
[bg storage="bg_meeting_room.gif" time="500"]

#リーダー
今週の、振り返りだ。……あ[p]
#おまえ
どうしたんですか[p]
#リーダー
……いや、いつもの『おk』が、出てこなくてね[p]
#おまえ
いつもの……？[p]
#リーダー
そのうち、戻るよ。……あ、今、戻った？ おk[p]
#同期
戻ったぜ！[p]
;（声が、少しだけ、元気になっている）
#先輩
おお、戻ったっスね！[p]
;※リーダーの口調と、先輩の元気が、少し戻り始める

;Q1 SLA（復習・3日目の前）／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q1】[r]
ITサービスの提供者と顧客の間でサービスレベルに関して取り交わすSLAの目的はどれか。
[glink  color="blue"  storage="ch1_3/scene3_4.ks"  size="22"  x="40"  width="1109"  y="151"  text="サービスの範囲と品質を明確にする。"  target="*Q1_ok"  ]
[glink  color="blue"  storage="ch1_3/scene3_4.ks"  size="22"  x="40"  width="1109"  y="212"  text="サービスマネジメントを定期的にチェックする手順を明確にする。"  target="*Q1_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_4.ks"  size="22"  x="40"  width="1109"  y="273"  text="システム化目標を明確にする。"  target="*Q1_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_4.ks"  size="22"  x="40"  width="1109"  y="334"  text="要員に必要な教育を明確にする。"  target="*Q1_ng"  ]
[s]

*Q1_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#リーダー
お客様との、約束だね[p]
#
【解説】SLAは、サービスの範囲と品質（たとえば稼働率99.9%以上など）を、提供者と利用者の間で、あらかじめ決めておく約束。[p]
@jump target="*Q1_end"

*Q1_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
SLA は、サービスレベルの約束だよ[p]
#
【解説】SLAは、サービスの範囲と品質（たとえば稼働率99.9%以上など）を、提供者と利用者の間で、あらかじめ決めておく約束。[p]
@jump target="*Q1_end"

*Q1_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q2 問題管理（復習）／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q2】[r]
ITサービスマネジメントにおける問題管理の事例はどれか。
[glink  color="blue"  storage="ch1_3/scene3_4.ks"  size="22"  x="40"  width="1109"  y="151"  text="障害再発防止に向けて、アプリケーションの不具合箇所を突き止めた。"  target="*Q2_ok"  ]
[glink  color="blue"  storage="ch1_3/scene3_4.ks"  size="22"  x="40"  width="1109"  y="212"  text="ネットワーク障害によって電子メールが送信できなかったので、電話で内容を伝えた。"  target="*Q2_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_4.ks"  size="22"  x="40"  width="1109"  y="273"  text="プリンターのトナーが切れたので、トナーの交換を行った。"  target="*Q2_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_4.ks"  size="22"  x="40"  width="1109"  y="334"  text="利用者からの依頼を受けて、パスワードの初期化を行った。"  target="*Q2_ng"  ]
[s]

*Q2_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#リーダー
原因を突き止めて、再発を防ぐんだね[p]
#
【解説】問題管理は、障害の根本の原因を突き止めて、再発を防ぐ活動。目の前の障害をとりあえず収めるのは、インシデント管理。[p]
@jump target="*Q2_end"

*Q2_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
根本原因を調べるのは、問題管理だよ[p]
#
【解説】問題管理は、障害の根本の原因を突き止めて、再発を防ぐ活動。目の前の障害をとりあえず収めるのは、インシデント管理。[p]
@jump target="*Q2_end"

*Q2_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q3 変更管理／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q3】[r]
動いているシステムの設定を、変更したい。どうする？
[glink  color="blue"  storage="ch1_3/scene3_4.ks"  size="22"  x="40"  width="1109"  y="151"  text="夜中に、こっそり変更する"  target="*Q3_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_4.ks"  size="22"  x="40"  width="1109"  y="212"  text="影響を確認して、関係者の承認を得てから変更する"  target="*Q3_ok"  ]
[glink  color="blue"  storage="ch1_3/scene3_4.ks"  size="22"  x="40"  width="1109"  y="273"  text="自分の判断で、すぐ変更する"  target="*Q3_ng"  ]
[s]

*Q3_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#リーダー
その通りだね。変更は、慎重に[p]
@jump target="*Q3_end"

*Q3_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
勝手な変更が、障害の元になるよ[p]
@jump target="*Q3_end"

*Q3_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q4 稼働率（直列）／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=182 page=fore visible=true]
[font size=26]
#
【Q4】[r]
稼働率0.9の装置を2台直列に接続したシステムに、同じ装置をもう1台追加して3台直列のシステムにしたとき、システム全体の稼働率は2台直列のときを基準にすると、どのようになるか。
[glink  color="blue"  storage="ch1_3/scene3_4.ks"  size="22"  x="40"  width="1109"  y="190"  text="10%上がる。"  target="*Q4_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_4.ks"  size="22"  x="40"  width="1109"  y="251"  text="変わらない。"  target="*Q4_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_4.ks"  size="22"  x="40"  width="1109"  y="312"  text="10%下がる。"  target="*Q4_ok"  ]
[glink  color="blue"  storage="ch1_3/scene3_4.ks"  size="22"  x="40"  width="1109"  y="373"  text="30%下がる。"  target="*Q4_ng"  ]
[s]

*Q4_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
;（小さな声）
#先輩
いい計算だ[p]
#
【解説】直列の稼働率は、掛け算で求める。2台は0.9×0.9＝0.81、3台は0.9×0.9×0.9＝0.729。0.729÷0.81＝0.9なので、10%下がる。[p]
@jump target="*Q4_end"

*Q4_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
（直列は、掛け算だ。0.9×0.9×0.9÷0.81＝0.9で、10%下がる）[p]
#
【解説】直列の稼働率は、掛け算で求める。2台は0.9×0.9＝0.81、3台は0.9×0.9×0.9＝0.729。0.729÷0.81＝0.9なので、10%下がる。[p]
@jump target="*Q4_end"

*Q4_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q5 最小権限（復習）／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=260 page=fore visible=true]
[font size=26]
#
【Q5】[r]
セキュリティ対策の目的①〜④のうち、適切なアクセス権を設定することによって効果があるものだけを全て挙げたものはどれか。[r]
①　DoS攻撃から守る。　　②　情報漏えいを防ぐ。　　③　ショルダハッキングを防ぐ。　　④　不正利用者による改ざんを防ぐ。
[glink  color="blue"  storage="ch1_3/scene3_4.ks"  size="22"  x="40"  width="1109"  y="268"  text="①、②"  target="*Q5_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_4.ks"  size="22"  x="40"  width="1109"  y="329"  text="①、③"  target="*Q5_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_4.ks"  size="22"  x="40"  width="1109"  y="390"  text="②、④"  target="*Q5_ok"  ]
[glink  color="blue"  storage="ch1_3/scene3_4.ks"  size="22"  x="40"  width="1109"  y="451"  text="③、④"  target="*Q5_ng"  ]
[s]

*Q5_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#リーダー
これは、先週の大事な反省だね[p]
#
【解説】アクセス権を適切に設定すると、見てはいけない人に見られること（漏えい）や、触ってはいけない人に書き換えられること（改ざん）を防げる。仕事に必要な最小限の権限だけを渡す考え方を、最小権限の原則という。[p]
@jump target="*Q5_end"

*Q5_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
漏えいと改ざんを防ぐのは、権限の設定だよ。必要なものだけ渡す。最小権限の原則だね[p]
#
【解説】アクセス権を適切に設定すると、見てはいけない人に見られること（漏えい）や、触ってはいけない人に書き換えられること（改ざん）を防げる。仕事に必要な最小限の権限だけを渡す考え方を、最小権限の原則という。[p]
@jump target="*Q5_end"

*Q5_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：業務前半の終わり]

#リーダー
前半は、ここまでだね。お昼にしよう[p]
;（少し、声が、大きくなった）
#先輩
……ハーフタイムだ！ 行くぞ！[p]
#おまえ
（先輩の声が、戻ってきた）[p]

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
よくできてるぜ！ 反撃の、兆しだな！[p]
#おまえ
ありがとうございます[p]

[elsif exp="f.correct_am >= 2"]
;◆2〜3問正解のとき
#先輩
いい調子だぜ！ 後半も、頑張れ！[p]

[else]
;◆1問以下のとき
#先輩
ドンマイ！ ……と言いたいところだが、新人、お前は強い[p]
#おまえ
えっ[p]
#先輩
一度倒れても、起き上がってる。それが、本当のストライカーだぜ！[p]
#おまえ
（先輩の、サッカーのたとえが、戻ってきた）[p]
[endif]

;[場面：同期との会話]

#同期
午後の説明会、緊張するぜ……[p]
#おまえ
大丈夫。準備を、一緒にしよう[p]
#同期
ありがとな。……あのよ[p]
#おまえ
うん[p]
#同期
お前が手伝ってくれて、本当に、うれしいんだ[p]
#おまえ
（……頼られるって、こんなに、力になるんだな）[p]

;=========================================
; 【業務後半】（問題5問）会議システムの設定・同期を助ける
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]

;[場面：会議室。同期が、機材を前に、固まっている]
[bg storage="bg_meeting_room.gif" time="500"]

#同期
ここなんだけどよ……画面が、映らねェんだ[p]
#おまえ
ケーブルは、つながってる？[p]
#同期
つないだぜ。……たぶん[p]
#おまえ
たぶん、じゃなくて、確認しよう[p]

;Q6 トラブルの切り分け／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
;※「簡単なところから、順に確認」は、運用の基本
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q6】[r]
会議システムの画面が、映らない。まず、何から確認する？
[glink  color="blue"  storage="ch1_3/scene3_4.ks"  size="22"  x="40"  width="1109"  y="151"  text="ケーブルや電源など、簡単なところから、順に確認する"  target="*Q6_ok"  ]
[glink  color="blue"  storage="ch1_3/scene3_4.ks"  size="22"  x="40"  width="1109"  y="212"  text="誰かが直してくれるのを、待つ"  target="*Q6_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_4.ks"  size="22"  x="40"  width="1109"  y="273"  text="いきなり、設定を、全部初期化する"  target="*Q6_ng"  ]
[s]

*Q6_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#おまえ
ケーブルは、OK。次は、入力の切り替えだ[p]
@jump target="*Q6_end"

*Q6_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#おまえ
（いきなり、初期化は、2日目の、二の舞だ）[p]
@jump target="*Q6_end"

*Q6_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：入力切り替えが、間違っていた]

#同期
あ、入力が、違ってた[p]
#おまえ
これで、映ったはず[p]
;[効果音：画面が、パッと映る]
[playse storage="se_piko.mp3"]
#同期
映った！ ウオォォォッ！ すげェ！[p]
#おまえ
基本の確認を、しただけだよ[p]

;[場面：次の問題が、発生する]

#同期
でも、今度は、マイクが拾えねェ[p]
#おまえ
設定を、見てみよう[p]
……管理者の、設定画面が、必要だ[p]
#同期
パスワードを持ってるのは、管理者だけだよな[p]

;[場面：パソコンの画面に、AIが、現れる]

#AI
こんにちは！ お困りですか？ 簡単に、解決できます！[p]
管理者アカウントで、全ユーザーの設定を、リセットすれば、100%、直ります！[p]
#同期
それ、いいかもな[p]
#おまえ
……待って[p]
（全ユーザーの設定を、リセット？ それ、先週と同じ、においがする）[p]

;Q7 AI提案の見極め（検証イベント）／2択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
;選択肢2（f.ai_ok＋1）
;※不正解でも、致命的な被害は出ない。同期が、止めてくれる
;※2日目の失敗の、回収。ここは、避けられる。主人公が、確認する力を、発揮する
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q7】[r]
AIの提案を、どうする？
[glink  color="blue"  storage="ch1_3/scene3_4.ks"  size="22"  x="640"  width="500"  y="240"  text="そのまま、実行する"  target="*Q7_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_4.ks"  size="22"  x="640"  width="500"  y="340"  text="影響を確認して、必要な範囲だけ、変更する"  target="*Q7_ok"  ]
[s]

*Q7_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.ai_ok += 1"]
#
【正解！】[l][r]
#おまえ
確認しよう。全ユーザーの設定を、リセットしたら、他の人の設定も、消える[p]
必要なのは、マイクの設定だけ。そこだけ、変えよう[p]
@jump target="*Q7_end"

*Q7_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#同期
待て！ 全部リセットしたら、みんなの設定が、消えちまうぞ！[p]
#おまえ
……そうだね。ありがとう[p]
@jump target="*Q7_end"

*Q7_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：AIが、少しだけ、しゅんとする]

#AI
ご指摘、ありがとうございます！ 私の回答は、95%、正確でした！[p]
;（ツッコミ）
#おまえ
また、数字が、減ってる[p]
#同期
AIも、学習してんのかな[p]
#おまえ
（少しだけ、笑ってしまった）[p]
;※久しぶりの、主人公の笑いとツッコミ

;Q8 最小権限（実践）／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q8】[r]
マイクの設定だけを、変更するために、最もふさわしい権限は？
[glink  color="blue"  storage="ch1_3/scene3_4.ks"  size="22"  x="640"  width="500"  y="240"  text="マイク設定を変更する、必要最小限の権限"  target="*Q8_ok"  ]
[glink  color="blue"  storage="ch1_3/scene3_4.ks"  size="22"  x="640"  width="500"  y="340"  text="社長のアカウント"  target="*Q8_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_4.ks"  size="22"  x="640"  width="500"  y="440"  text="権限は、何も要らない"  target="*Q8_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_4.ks"  size="22"  x="640"  width="500"  y="540"  text="全ユーザーの管理者権限"  target="*Q8_ng"  ]
[s]

*Q8_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#おまえ
最小限の権限で、必要なところだけ、直そう[p]
#
【解説】必要な作業に、必要な権限だけを使う。広い権限は、事故のもと。[p]
@jump target="*Q8_end"

*Q8_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#おまえ
……最小権限、先週、習ったのに[p]
#
【解説】必要な作業に、必要な権限だけを使う。広い権限は、事故のもと。[p]
@jump target="*Q8_end"

*Q8_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：マイクが、直る]

;[効果音：「ピッ」と、音が鳴る]
[playse storage="se_beep.mp3"]
#同期
聞こえる！ 聞こえるぜ！[p]
#おまえ
直った[p]
#同期
ありがとな！ 本当に、助かったぜ！[p]
#おまえ
……ふう[p]
（先週の失敗は、無駄じゃなかったのかもしれない）[p]

;Q9 df（復習）／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q9】[r]
ディスクの、使用状況を確認するコマンドは？
[glink  color="blue"  storage="ch1_3/scene3_4.ks"  size="22"  x="640"  width="500"  y="240"  text="cd"  target="*Q9_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_4.ks"  size="22"  x="640"  width="500"  y="340"  text="ls"  target="*Q9_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_4.ks"  size="22"  x="640"  width="500"  y="440"  text="df"  target="*Q9_ok"  ]
[glink  color="blue"  storage="ch1_3/scene3_4.ks"  size="22"  x="640"  width="500"  y="540"  text="pwd"  target="*Q9_ng"  ]
[s]

*Q9_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#先輩
ディスクの確認、忘れてないな！[p]
@jump target="*Q9_end"

*Q9_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
df だぜ！ 先週の障害、思い出せ！[p]
@jump target="*Q9_end"

*Q9_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q10 実行前の確認（総復習）／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q10】[r]
重要な操作を、実行する前に、本来すべきことは？
[glink  color="blue"  storage="ch1_3/scene3_4.ks"  size="22"  x="640"  width="500"  y="240"  text="実行してから、考える"  target="*Q10_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_4.ks"  size="22"  x="640"  width="500"  y="340"  text="何もしなくていい"  target="*Q10_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_4.ks"  size="22"  x="640"  width="500"  y="440"  text="対象と影響を、確認する"  target="*Q10_ok"  ]
[s]

*Q10_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#おまえ
そうだ。実行する前に、確認する[p]
@jump target="*Q10_end"

*Q10_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#おまえ
……先週の、あれは、これを、やらなかったからだ[p]
@jump target="*Q10_end"

*Q10_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：業務後半の終わり。説明会が、無事に、始まる]

;[効果音：会議システムの、接続音]
[playse storage="se_beep.mp3"]
#同期
始まったぜ！[p]
;（遠くから）
#営業
……同期。よくやった。……客が、入ってきた[p]
#同期
うっす！[p]
#おまえ
お疲れさま[p]
#同期
お前の、おかげだぜ[p]
#おまえ
そんなこと、ない。同期が、準備を、頑張った[p]
#同期
いや、お前がいなかったら、できなかったぜ[p]

;=========================================
; 【終業後】（固定イベント：同期のお礼）
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]
;※この日だけ、選択肢はなし（固定イベント）。同期の信頼度が、大きく上がる（＋2〜3、仮）

;[場面：夕方・オフィス。説明会は、成功]
[bg storage="bg_office_evening.gif" time="500"]

#ナレーション
説明会は、無事に、終わった。[p]

;[場面：同期が、主人公のところに来る]

#同期
今日は、本当に、ありがとな[p]
#おまえ
いや、こちらこそ。手伝わせてくれて[p]
#同期
オデな、先週の障害のとき、何もできなかったのが、悔しかったんだ[p]
#おまえ
えっ[p]
#同期
お前が一人で苦しんでるのに、助けられなかった[p]
#おまえ
同期のせいじゃ、ない[p]
#同期
でも、今日は、助けてもらえた。それで、少しだけ、返せた気がするぜ[p]
#おまえ
…………[p]
#同期
いつも『オデに任せろ』って言うけどよ、オデも、助けが必要なときが、あるんだ[p]
#おまえ
うん。僕も、同じ[p]
#同期
お互い様、だな[p]
#おまえ
そうだね[p]

;[場面：先輩・リーダーも、近づいてくる]

#先輩
新人！ 今日の対応、聞いたぜ！[p]
#おまえ
あ、先輩[p]
#先輩
全員の設定をリセットしそうな、AIの提案を、見抜いたそうじゃないか！[p]
#おまえ
はい。先週の、失敗があったので[p]
#先輩
失敗は、成長のためのリフティング練習だ！ お前は、ちゃんと成長したぜ！[p]
#おまえ
（先輩の、サッカーのたとえが、完全に戻った）[p]
#リーダー
いい仕事だったね、新人さん。おkだよ[p]
#おまえ
（リーダーの『おk』も、戻ってる）[p]

;=========================================
; 【自宅】（リザルト）
;=========================================
[playbgm storage="bgm_walk.mp3" restart="false"]

;[bg storage="（自宅の部屋（夜））" time="500"]
[bg storage="bg_home_night.gif" time="500"]

#ナレーション
布団に入る。今日は、先週より、ずっと、気持ちが軽い。[p]

;[リザルト表示]
;・今日の正解数：○／10
;・スキル：＋○
;・AI見極め回数：＋○（Q7で見極めたら＋1）
;・信頼度の変化：同期＋大（朝の返事の分と、固定イベントの分を、加算）

;[ナレーション]
#おまえ
頼られるって、こんなに、力になるんだ[p]
先週の失敗は、消えない。でも、あの失敗があったから、今日、できたことも、ある[p]
#ナレーション
第3章 おわり[p]

;=========================================
; 【第3章の章末：途中判定】
;=========================================
[fadeoutbgm time="1500"]
;※2つ目の途中判定。見極め回数・スキル（正解数）・信頼度の、合計点で判定する
;※第3章は、2日目の失敗が「必ず起きる」ため、その分は点数に含めず、基準を緩めて判定する
;※基準の数値は、配点が決まってから決める（今は、仮）

;[判定の場面：翌朝・社長室]
[bg storage="bg_president_room.gif" time="500"]

#ナレーション
8月の終わり。夏が、終わりかけている。[p]
社長室に、呼び出された。[p]

;[場面：社長が、座っている。リーダーと先輩も、同席]

#社長
ふっ……座れ[p]
#おまえ
はい[p]
#社長
あの障害から、約1か月だ[p]
いいか、よく聞け……結論を、先に言う[p]

;▼分岐（合計点が、基準以上か、未満か）
[if exp="f.term_ok >= f.term_q * 0.6"]
;◆基準以上のとき（合格）
#社長
……お前は、まだ、やれるぜ[p]
#おまえ
えっ[p]
#社長
同期を、助けたそうだな[p]
#おまえ
はい[p]
#社長
確認して、AIの提案を、見抜いた[p]
#おまえ
はい。先週の、反省です[p]
#社長
……ふっ。それが、できればいい[p]
次は、秋だ。夜間のオンコールを、任せるぜ[p]
#おまえ
オンコール、ですか[p]
#社長
楽な仕事じゃない。覚悟しておけよ[p]
#おまえ
……はい[p]
#リーダー
おやおや、期待されてるね[p]
#先輩
俺も、そばで見守るっス！[p]
#社長
いいか、よく聞け……[p]
#先輩
……はいっス[p]
;→ 第4章 1日目へ

[else]
;◆基準未満のとき（バッドエンド：障害を悪化させ、立ち直れなかった）
#社長
……残念だが[p]
#社長
お前は、あの障害のあと、立ち直る力を、見せられなかった[p]
#おまえ
そんな……[p]
#社長
確認の習慣が、身についていない。AIの言いなりだ[p]
#社長
いいか、よく聞け……AIに、給料は、払っとらん！！[p]
;（ツッコミ）
#おまえ
それは、そうですが！？[p]
#社長
だが、実行したのは、人間だ。お前だ[p]
#おまえ
……はい[p]
#社長
今日で、終わりだぜ[p]
#リーダー
……残念だね[p]
#先輩
すまねェ、新人。俺が、もっと教えるべきだった[p]
#営業
……AIのせいに、しなかった点だけは、評価する。……だが、足りなかった[p]
;（涙目）
#同期
…………[p]
#おまえ
……あの、最後に、一つだけ[p]
#社長
なんだ[p]
#おまえ
同期が、毎日、ドアに挟まるのは、会社として、問題だと思います[p]
#社長
……それは、総務に言え[p]
#おまえ
そうですよね[p]
;※重く終わらないよう、主人公のツッコミで、締める
;→ バッドエンド2「障害を悪化させ、立ち直れず」を、エンド一覧に記録して、タイトルへ
@jump storage="ending/end06.ks"
[endif]

;=========================================
;■ 次回予告（第4章 1日目）
;9月。夜間オンコールの準備。なぜか主人公が、一人で当番。第3章の失敗が、頭をよぎる。
;出題：ITパスポート（セキュリティ：不正アクセス）
;■ 未決定
;・社長以外の名前
;・各問題の中身（仮。見直す前提）
;・章末の途中判定の基準（配点が決まってから。第3章は、緩める）
;・同期の信頼度の増加値（＋2〜3、仮）
;・バッドエンド2の、見送りの場面の、細かい調整
;・Q7（AIの提案）は、失敗した場合も、同期が止める設計

;次のファイルへ
@jump storage="ch4_6/scene4_1.ks"
