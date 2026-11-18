;第4章 1日目

*start
;章セレクトで、この章を選べるようにする
[eval exp="sf.reach_ch4 = true"]
;章末の判定が終わったので、点数を数え直す
[eval exp="f.term_q = 0; f.term_ok = 0"]

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
;台本　第4章（9〜10月）　1日目
;状態：叩き台（1日分すべて）／ITパスポート枠は過去問に差し替え済み（11/4）
;※名前は社長（郡晴希：こおり はるき）のみ決定。ほかは役割で表記
;※選択肢の数は問題ごとに変える（用語・知識は4択／場面の判断は3択／AI提案の見極めは2択）
;============================================================
;■ この章のねらい
;夜間オンコール。初めて自分の判断で乗り切る。
;1日目：夜間オンコールの準備。なぜか、主人公が一人で当番。第3章の失敗が、頭をよぎる
;2日目：夜、異常を検知（不正アクセスの疑い）。AIが自信満々に提案。今度は、疑って確かめる
;3日目：夜明け。原因はパッチの当て忘れ。リーダーにすぐ報告し、エスカレーションを判断
;4日目：翌日。営業が、文句を言いながら、少し認める
;■ この日のねらい
;・9月。第3章のあと、主人公は、少し慎重になっている
;・夜間オンコールの準備。なぜか、主人公が、一人で当番になる
;・「ログ」「消す」「AI」という言葉に、主人公が、ビクッと反応する（コメディ）
;・出題：ITパスポート（セキュリティ：不正アクセス）
;・終業後の選択は、「夜の電話で、頼れる人」を決める（2日目の布陣につながる）
;■ 1日の流れ
;朝 → 業務前半（5問）→ 昼休み → 業務後半（5問）→ 終業後 → 自宅（リザルト）
;------------------------------------------------------------
; 【朝】
;=========================================
[playbgm storage="bgm_walk.mp3" restart="false"]

;[bg storage="（真っ白な画面（時間経過の演出））" time="500"]
[bg storage="bg_white.png" time="500"]

#ナレーション
第3章が終わって、1か月が過ぎた。[p]
9月。まだ暑いが、朝晩は、少しだけ、涼しい。[p]

;[bg storage="（オフィス（朝））" time="500"]
[bg storage="bg_office.gif" time="500"]

第4章 1日目。入社して、半年が、過ぎた。[p]
#同期
おはよう！ 今日、ドアに挟まれなかったぜ！[p]
;（ツッコミ）
#おまえ
その報告、もう、いらないと思う[p]
#同期
でも、挟まれない日は、記念日だからよ[p]
#おまえ
記念日が、多すぎる[p]

;[場面：社長が、全員を、集める]

#社長
ふっ……全員、集まれ[p]
#先輩
おお、社長が、一回転してないっス！ これは、何かあるぜ！[p]
#リーダー
先輩、しっ[p]
#社長
いいか、よく聞け……来週から、夜間のオンコールを、始める[p]
#おまえ
オンコール……夜中の、呼び出し待機ですね[p]
#社長
そうだ。サーバが夜に止まっても、困るからな[p]
夜間の当番は、新人に、任せるぜ[p]
#おまえ
えっ[p]
#先輩
新人一人で、っスか！？[p]
#社長
……そうだ[p]
#リーダー
社長、それは、さすがに……[p]
#社長
リーダーと先輩は、来週から3日間、研修で不在だ[p]
ちょうどいい。……試す、機会だぜ[p]
#おまえ
（試す、機会って、言った）[p]

;[場面：主人公の、頭の中]

（7月の、あの日が、よみがえる）[p]
（ログ……削除……AI……社長の、低い声……）[p]
#同期
おい、顔が、真っ青だぞ[p]
#おまえ
大丈夫……たぶん[p]
#同期
たぶん、はやめろって[p]
#おまえ
そこは、聞き逃して[p]

;[選択肢：1回目（信頼度）]
;選択肢1：先輩の信頼度＋1
;選択肢2：リーダーの信頼度＋1
;選択肢3：同期の信頼度＋1
;※どれを選んでも、次の場面につながる
#ナレーション
不安な気持ちを、誰かに、聞いてもらう？
[glink  color="blue"  storage="ch4_6/scene4_1.ks"  size="26"  x="266"  width="640"  y="120"  text="先輩に、「一人で、できるでしょうか」と、聞く"  target="*c1_1"  ]
[glink  color="blue"  storage="ch4_6/scene4_1.ks"  size="26"  x="266"  width="640"  y="195"  text="リーダーに、「何に、気をつければ、いいですか」と、聞く"  target="*c1_2"  ]
[glink  color="blue"  storage="ch4_6/scene4_1.ks"  size="26"  x="266"  width="640"  y="309"  text="同期に、「夜、電話しても、いい？」と、頼む"  target="*c1_3"  ]
[s]

*c1_1
[cm]
[eval exp="f.t_senpai += 1"]
;◆1を選んだ場合
#先輩
できるぜ！ 俺が見込んだ、新人だ！[p]
ただし、不安な気持ちは、大事にしろ！ 不安があるから、確認するんだ。キーパーは、ビビりなくらいがちょうどいいぜ！[p]
#おまえ
はい[p]

@jump target="*c1_end"

*c1_2
[cm]
[eval exp="f.t_leader += 1"]
;◆2を選んだ場合
#リーダー
慌てない、抱えない、記録する。この3つだね[p]
それと、判断に迷ったら、必ず誰かに電話すること。おkかな[p]
#おまえ
誰かに、電話……[p]

@jump target="*c1_end"

*c1_3
[cm]
[eval exp="f.t_douki += 1"]
;◆3を選んだ場合
#同期
おう、もちろんだ！ 夜でも電話に出るぜ！[p]
ただし、機械の質問は、苦手だからな[p]
#おまえ
それは、知ってる[p]
@jump target="*c1_end"

*c1_end
;=========================================
; 【業務前半】（問題5問）不正アクセスの基礎
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]
[eval exp="f.correct_am = 0"]

;[場面：会議室]
[bg storage="bg_meeting_room.gif" time="500"]

#リーダー
オンコールで一番怖いのは、夜中の不正アクセスだね[p]
今日は、その基礎を、勉強しよう[p]

;Q1 不正アクセス禁止法／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=353 page=fore visible=true]
[font size=24]
#
【Q1】[r]
パスワードに関連した不適切な行為a〜dのうち、不正アクセス禁止法で規制されている行為だけを全て挙げたものはどれか。[r]
a　業務を代行してもらうために、社内データベースアクセス用の自分のIDとパスワードを同僚に伝えた。[r]
b　自分のPCに、社内データベースアクセス用の自分のパスワードのメモを貼り付けた。[r]
c　電子メールに添付されていた文書をPCに取り込んだ。その文書の閲覧用パスワードを、その文書を見る権利のない人に教えた。[r]
d　人気のショッピングサイトに登録されている他人のIDとパスワードを、無断で第三者に伝えた。
[glink  color="blue"  storage="ch4_6/scene4_1.ks"  size="22"  x="40"  width="1109"  y="361"  text="a、b、c、d"  target="*Q1_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_1.ks"  size="22"  x="40"  width="1109"  y="422"  text="a、c、d"  target="*Q1_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_1.ks"  size="22"  x="40"  width="1109"  y="483"  text="a、d"  target="*Q1_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_1.ks"  size="22"  x="40"  width="1109"  y="544"  text="d"  target="*Q1_ok"  ]
[s]

*Q1_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#リーダー
他人のIDとパスワードを、勝手に渡すのも、法律で禁止だよ。夜中でも、油断しないでね[p]
#
【解説】不正アクセス禁止法が禁じるのは、他人のIDやパスワードを、無断で第三者に教えること。自分のIDを同僚に伝えたり、メモを貼ったりするのは、会社のルール違反にはなっても、この法律の対象ではない。[p]
@jump target="*Q1_end"

*Q1_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
他人のIDやパスワードを、無断で第三者に渡す行為が、規制されているんだ[p]
#
【解説】不正アクセス禁止法が禁じるのは、他人のIDやパスワードを、無断で第三者に教えること。自分のIDを同僚に伝えたり、メモを貼ったりするのは、会社のルール違反にはなっても、この法律の対象ではない。[p]
@jump target="*Q1_end"

*Q1_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q2 なりすまし（IPスプーフィング）／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q2】[r]
IPスプーフィングの説明として、適切なものはどれか。
[glink  color="blue"  storage="ch4_6/scene4_1.ks"  size="22"  x="40"  width="1109"  y="151"  text="本物そっくりの偽のWebサイトに利用者を誘導して、情報を盗み取る。"  target="*Q2_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_1.ks"  size="22"  x="40"  width="1109"  y="212"  text="侵入に成功したあと、再び侵入するために、不正な通信の入口を作っておく。"  target="*Q2_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_1.ks"  size="22"  x="40"  width="1109"  y="273"  text="送信元のIPアドレスを偽ったパケットを送りつけ、別の機器になりすます。"  target="*Q2_ok"  ]
[glink  color="blue"  storage="ch4_6/scene4_1.ks"  size="22"  x="40"  width="1109"  y="334"  text="利用者に気づかれないようにインストールされ、情報を収集する。"  target="*Q2_ng"  ]
[s]

*Q2_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#リーダー
送信元を偽る、なりすましの一つだね[p]
#
【解説】スプーフィングは「なりすまし」の意味。IPスプーフィングは、送信元のIPアドレスを偽って、別の機器のふりをする手口。[p]
@jump target="*Q2_end"

*Q2_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
送信元のIPアドレスを偽るのが、IPスプーフィングだよ。これも、なりすましの手口だね[p]
#
【解説】スプーフィングは「なりすまし」の意味。IPスプーフィングは、送信元のIPアドレスを偽って、別の機器のふりをする手口。[p]
@jump target="*Q2_end"

*Q2_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q3 総当たり攻撃／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q3】[r]
パスワードを、片っ端から、機械的に、試していく攻撃は？
[glink  color="blue"  storage="ch4_6/scene4_1.ks"  size="22"  x="640"  width="500"  y="240"  text="早押し攻撃"  target="*Q3_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_1.ks"  size="22"  x="640"  width="500"  y="340"  text="水やり攻撃"  target="*Q3_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_1.ks"  size="22"  x="640"  width="500"  y="440"  text="総当たり攻撃（ブルートフォース攻撃）"  target="*Q3_ok"  ]
[glink  color="blue"  storage="ch4_6/scene4_1.ks"  size="22"  x="640"  width="500"  y="540"  text="逆立ち攻撃"  target="*Q3_ng"  ]
[s]

*Q3_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#リーダー
だから、強いパスワードが必要なんだ[p]
#
【解説】総当たり攻撃は、可能な組み合わせを、順番に、全部試す。簡単なパスワードは、すぐ破られる。[p]
@jump target="*Q3_end"

*Q3_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
片っ端から、力ずくで試す攻撃だよ[p]
#
【解説】総当たり攻撃は、可能な組み合わせを、順番に、全部試す。簡単なパスワードは、すぐ破られる。[p]
@jump target="*Q3_end"

*Q3_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面転換：主人公が、画面を見て、固まる]

#おまえ
……『ログ』って、今、言いました？[p]
#リーダー
言ってないけど[p]
#おまえ
そうですか……[p]
#同期
ログ、でビクッとしてるぜ[p]
#おまえ
してない[p]
#同期
してたぜ[p]
#先輩
俺の新人は、繊細だな！[p]
;※7月の失敗のトラウマを、コメディで描く場面

;Q4 二要素認証／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q4】[r]
二要素認証の説明として、最も適切なものはどれか。
[glink  color="blue"  storage="ch4_6/scene4_1.ks"  size="22"  x="40"  width="1109"  y="151"  text="所有物、記憶及び生体情報の3種類のうちの2種類を使用して認証する方式"  target="*Q4_ok"  ]
[glink  color="blue"  storage="ch4_6/scene4_1.ks"  size="22"  x="40"  width="1109"  y="212"  text="人間の生体器官や筆跡などを使った認証で、認証情報の2か所以上の特徴点を使用して認証する方式"  target="*Q4_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_1.ks"  size="22"  x="40"  width="1109"  y="273"  text="文字、数字及び記号のうち2種類以上を組み合わせたパスワードを用いて利用者を認証する方式"  target="*Q4_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_1.ks"  size="22"  x="40"  width="1109"  y="334"  text="利用者を一度認証することで二つ以上のシステムやサービスなどを利用できるようにする方式"  target="*Q4_ng"  ]
[s]

*Q4_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#リーダー
鍵が、二重になるんだね[p]
#
【解説】本人確認の材料は、「持っているもの」「知っているもの」「身体の特徴」の3種類。このうち、種類の違うものを2つ組み合わせるのが、二要素認証。[p]
@jump target="*Q4_end"

*Q4_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
種類の違うものを、2つ組み合わせるのが、二要素認証だよ。パスワードの文字種を増やすだけでは、二要素じゃないんだ[p]
#
【解説】本人確認の材料は、「持っているもの」「知っているもの」「身体の特徴」の3種類。このうち、種類の違うものを2つ組み合わせるのが、二要素認証。[p]
@jump target="*Q4_end"

*Q4_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q5 ログイン失敗の連続／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
;※「ログを全部消去」の選択肢は、7月の失敗を、思い出させる（主人公が、ビクッとする）
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q5】[r]
夜間、同じIDへの、ログイン失敗が、短時間に、何百回も記録されている。どう判断する？
[glink  color="blue"  storage="ch4_6/scene4_1.ks"  size="22"  x="40"  width="1109"  y="151"  text="気のせいだと思って、放置する"  target="*Q5_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_1.ks"  size="22"  x="40"  width="1109"  y="212"  text="ログを、全部、消去する"  target="*Q5_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_1.ks"  size="22"  x="40"  width="1109"  y="273"  text="総当たり攻撃の可能性があるとして、確認・報告する"  target="*Q5_ok"  ]
[s]

*Q5_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#リーダー
その警戒心が、夜の番人だね[p]
@jump target="*Q5_end"

*Q5_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
大量の失敗は、攻撃の兆し。放置は、禁物だよ[p]
@jump target="*Q5_end"

*Q5_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：業務前半の終わり]

#リーダー
前半は、ここまでだね。お昼にしよう[p]
#おまえ
はい[p]
#リーダー
……ログは、消さないよ。おkだね[p]
;（顔が、少し、赤い）
#おまえ
……はい[p]
;※リーダーの、さりげない冗談。主人公の、トラウマを、笑いで包む

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
よくできてるぜ！ 7月の失敗も、ちゃんと栄養になってるな！[p]
#おまえ
そう、言ってもらえると、救われます[p]

[elsif exp="f.correct_am >= 2"]
;◆2〜3問正解のとき
#先輩
いい調子だぜ！ 後半も、頑張れ！[p]

[else]
;◆1問以下のとき
#先輩
ドンマイだぜ！ 夜のオンコールの前に、後半で取り返すぞ！[p]
[endif]

;[場面：営業が、近づく]

#営業
……そこの。来週から、夜の当番らしいな[p]
#おまえ
はい[p]
#営業
……夜に客のシステムが止まったら、こっちの携帯が鳴る[p]
#おまえ
……すみません[p]
#営業
……謝るな。……判断を、誤るな[p]
……AIにも、頼りすぎるな。最後に判断するのは、お前[p]
#おまえ
はい。肝に銘じます[p]
;（小声）
#営業
……頑張れ[p]
#おまえ
（営業さんが、応援してくれた）[p]

;=========================================
; 【業務後半】（問題5問）オンコールの準備
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]

;[場面：午後・会議室]
[bg storage="bg_meeting_room.gif" time="500"]

#先輩
後半は、オンコールの準備だぜ！[p]
#リーダー
当番のための手順書も、確認しようね[p]

;Q6 オンコール／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q6】[r]
システムの障害に備えて、夜間や休日に、連絡を受けられる状態で待機する体制を、何という？
[glink  color="blue"  storage="ch4_6/scene4_1.ks"  size="22"  x="640"  width="500"  y="240"  text="オーバーフロー"  target="*Q6_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_1.ks"  size="22"  x="640"  width="500"  y="340"  text="オフライン"  target="*Q6_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_1.ks"  size="22"  x="640"  width="500"  y="440"  text="オンデマンド"  target="*Q6_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_1.ks"  size="22"  x="640"  width="500"  y="540"  text="オンコール"  target="*Q6_ok"  ]
[s]

*Q6_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#先輩
そのとおり！ 夜の、守備位置だぜ！[p]
#
【解説】オンコールは、障害の連絡に、すぐ対応できるよう、待機すること。[p]
@jump target="*Q6_end"

*Q6_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
呼ばれたら、すぐ動く。それが、オンコールだぜ！[p]
#
【解説】オンコールは、障害の連絡に、すぐ対応できるよう、待機すること。[p]
@jump target="*Q6_end"

*Q6_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q7 エスカレーション／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q7】[r]
夜間、判断できない異常が、起きた。どうする？
[glink  color="blue"  storage="ch4_6/scene4_1.ks"  size="22"  x="40"  width="1109"  y="151"  text="朝まで、待つ"  target="*Q7_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_1.ks"  size="22"  x="40"  width="1109"  y="212"  text="自分の、思いつきで、操作する"  target="*Q7_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_1.ks"  size="22"  x="40"  width="1109"  y="273"  text="手順書の連絡先に、すぐ連絡して、判断をあおぐ"  target="*Q7_ok"  ]
[s]

*Q7_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#リーダー
そう。夜中でも、遠慮はいらないよ[p]
#
【解説】判断できないときは、早めに、上位者へ連絡する（エスカレーション）。夜でも、遠慮はいらない。[p]
@jump target="*Q7_end"

*Q7_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
一人で抱えない。それが、3つのルールの2つ目だね[p]
#
【解説】判断できないときは、早めに、上位者へ連絡する（エスカレーション）。夜でも、遠慮はいらない。[p]
@jump target="*Q7_end"

*Q7_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：パソコンの画面に、AIが、現れる]

#AI
こんにちは！ オンコールの手順書を、お手伝いします！ お任せください！[p]
手順書の内容は、こうです！ 100%、完璧です！[p]
①異常を、検知したら、まず、ログを、全部消去してください[p]
②次に、全員共通のパスワードを、メールで、全員に送ってください[p]
③最後に、誰にも連絡せずに、一人で、解決してください[p]
#おまえ
…………[p]
#同期
ツッコミどころが多すぎて、どこから行けばいいのか、わかんねェ[p]

;Q8 AI提案の見極め（手順書）／2択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
;選択肢1（f.ai_ok＋1）
;※不正解でも、先輩とリーダーが、止める
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q8】[r]
AIが作った、オンコールの手順書を、どう扱う？
[glink  color="blue"  storage="ch4_6/scene4_1.ks"  size="22"  x="640"  width="500"  y="240"  text="内容を確認して、危険な手順を、直す"  target="*Q8_ok"  ]
[glink  color="blue"  storage="ch4_6/scene4_1.ks"  size="22"  x="640"  width="500"  y="340"  text="そのまま、採用する"  target="*Q8_ng"  ]
[s]

*Q8_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.ai_ok += 1"]
#
【正解！】[l][r]
#おまえ
ログの全部消去は、7月に、痛い目を見た。全員共通のパスワードも、危ない。一人で解決するのも、ダメだ[p]
#先輩
全部、見抜いたな！ ハットトリックだぜ！[p]
@jump target="*Q8_end"

*Q8_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
待って。これは、全部アウトだね[p]
#先輩
7月を、思い出せ！ ログを消す提案は、二度と信じるなよ！[p]
@jump target="*Q8_end"

*Q8_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：AIが、しゅんとする]

#AI
ご指摘、ありがとうございます！ 私の回答は、90%、正確でした！[p]
;（ツッコミ）
#おまえ
3つとも、間違ってたのに？[p]
#同期
90%は、盛りすぎだろ[p]
#AI
失礼しました。では、30%でした[p]
#おまえ
急に、下げすぎ[p]
;※AIの「正確さ」の数字が、また、変わる（シリーズ化したお約束）

;Q9 ソーシャルエンジニアリング／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q9】[r]
ソーシャルエンジニアリングに該当する行為の例はどれか。
[glink  color="blue"  storage="ch4_6/scene4_1.ks"  size="22"  x="40"  width="1109"  y="151"  text="あらゆる文字の組合せを総当たりで機械的に入力することによって、パスワードを見つけ出す。"  target="*Q9_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_1.ks"  size="22"  x="40"  width="1109"  y="212"  text="肩越しに盗み見して入手したパスワードを利用し、他人になりすましてシステムを不正利用する。"  target="*Q9_ok"  ]
[glink  color="blue"  storage="ch4_6/scene4_1.ks"  size="22"  x="40"  width="1109"  y="273"  text="標的のサーバに大量のリクエストを送りつけて過負荷状態にすることによって、サービスの提供を妨げる。"  target="*Q9_ng"  ]
[s]

*Q9_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#リーダー
その警戒心が、会社を守るね[p]
#
【解説】ソーシャルエンジニアリングは、機械の弱点ではなく、人の不注意や油断につけ込んで、情報を盗む手口。肩越しの盗み見や、関係者のふりをした電話などがその例。[p]
@jump target="*Q9_end"

*Q9_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
人の不注意につけ込むのが、ソーシャルエンジニアリング。盗み見も、その一つだよ[p]
#
【解説】ソーシャルエンジニアリングは、機械の弱点ではなく、人の不注意や油断につけ込んで、情報を盗む手口。肩越しの盗み見や、関係者のふりをした電話などがその例。[p]
@jump target="*Q9_end"

*Q9_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q10 実行前の確認（復習）／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q10】[r]
重要な操作を、実行する前に、本来すべきことは？
[glink  color="blue"  storage="ch4_6/scene4_1.ks"  size="22"  x="640"  width="500"  y="240"  text="対象と影響を、確認する"  target="*Q10_ok"  ]
[glink  color="blue"  storage="ch4_6/scene4_1.ks"  size="22"  x="640"  width="500"  y="340"  text="実行してから、考える"  target="*Q10_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_1.ks"  size="22"  x="640"  width="500"  y="440"  text="何もしなくていい"  target="*Q10_ng"  ]
[s]

*Q10_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#おまえ
確認してから、実行する。これが、鉄則だ[p]
@jump target="*Q10_end"

*Q10_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#おまえ
（……7月の、あれは、これを、やらなかったからだ）[p]
@jump target="*Q10_end"

*Q10_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：業務後半の終わり]

#先輩
試合終了だ！ 夜の守備位置、確認したか！[p]
#おまえ
はい。連絡先と、手順書は、確認しました[p]
#リーダー
それじゃ、俺たちは、明日から研修でいないけど[p]
困ったら、電話してね。ただし、電波が弱い場所かも。sry[p]
#先輩
7月の二の舞は、勘弁してくれよな！[p]
;（ツッコミ）
#おまえ
それ、フラグですよね[p]

;=========================================
; 【終業後】（夜の電話・頼れる人を決める）
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]

;[場面：夕方・オフィス]
[bg storage="bg_office_evening.gif" time="500"]

#ナレーション
明日から、夜間オンコールが、始まる。[p]

;[選択肢：終業後（信頼度・夜の、電話の連絡先）]
;選択肢1：先輩の信頼度＋1
;選択肢2：リーダーの信頼度＋1
;選択肢3：同期の信頼度＋1
;選択肢4：営業の信頼度＋1
;※4択。ここで選んだ人の「信頼度」の高さが、2日目の夜の、助言につながる（変数を入れる段階で追加する）
;※信頼度が高いキャラほど、電話が、つながりやすく、助言の質も、高い設計（変数を入れる段階で追加する）
#ナレーション
夜の当番で、困ったとき、一番に、電話をかけたい人は？
[glink  color="blue"  storage="ch4_6/scene4_1.ks"  size="26"  x="266"  width="640"  y="120"  text="先輩（研修中だが、電話は、つながるかもしれない）"  target="*c2_1"  ]
[glink  color="blue"  storage="ch4_6/scene4_1.ks"  size="26"  x="266"  width="640"  y="195"  text="リーダー（研修中。夜は、つながりやすい）"  target="*c2_2"  ]
[glink  color="blue"  storage="ch4_6/scene4_1.ks"  size="26"  x="266"  width="640"  y="270"  text="同期（社内の、同じチーム。機械は苦手だが、そばにいてくれる）"  target="*c2_3"  ]
[glink  color="blue"  storage="ch4_6/scene4_1.ks"  size="26"  x="266"  width="640"  y="384"  text="営業（意外と、夜も、起きている）"  target="*c2_4"  ]
[s]

*c2_1
[cm]
[eval exp="f.t_senpai += 1"]
;◆1を選んだ場合
#先輩
俺が一番か！ いい選択だぜ！ 電話に出る準備は、してある！[p]
#おまえ
着信音は、大音量に、していてください[p]
#先輩
任せろ！ スタジアム級の音量にしとくぜ！[p]

@jump target="*c2_end"

*c2_2
[cm]
[eval exp="f.t_leader += 1"]
;◆2を選んだ場合
#リーダー
いい判断だね。夜は、俺のほうが、つながりやすいよ[p]
でも、遠慮しないで、早めにかけてね。おkだよ[p]

@jump target="*c2_end"

*c2_3
[cm]
[eval exp="f.t_douki += 1"]
;◆3を選んだ場合
#同期
おう、もちろんだ！ 夜は、スマホを枕元に置いとくぜ！[p]
#おまえ
ありがとう。ただし、機械の、質問じゃない[p]
#同期
それなら、大丈夫だ！ オデに任せろ！[p]

@jump target="*c2_end"

*c2_4
[cm]
[eval exp="f.t_eigyo += 1"]
;◆4を選んだ場合
#営業
……こっちか。……仕方ない。……無駄な電話は、するな[p]
#おまえ
はい。必要なときだけ、かけます[p]
#営業
……それなら、出る[p]
@jump target="*c2_end"

*c2_end
;=========================================
; 【自宅】（リザルト）
;=========================================
[playbgm storage="bgm_walk.mp3" restart="false"]

;[bg storage="（自宅の部屋（夜））" time="500"]
[bg storage="bg_home_night.gif" time="500"]

#ナレーション
布団に入る。明日から、夜の当番が、始まる。[p]

;[リザルト表示]
;・今日の正解数：○／10
;・スキル：＋○
;・AI見極め回数：＋○（Q8で見極めたら＋1）
;・信頼度の変化：（朝に選んだキャラ）＋1、（夜の連絡先に選んだキャラ）＋1

;[ナレーション]
#おまえ
7月の、あのとき、確認を、怠った[p]
今度は、確認して、必ず、判断する[p]
……でも、夜中に、一人で、大丈夫かな[p]
#ナレーション
第4章 2日目へ。[p]

;=========================================
;■ 次回予告（第4章 2日目）
;夜、異常を検知（不正アクセスの疑い）。AIが自信満々に提案。今度は、ツッコんで、疑って確かめる。
;信頼度が高いキャラが、電話で助言する。
;出題：運用（障害の切り分け）、ITパスポート（脆弱性）
;■ 未決定
;・社長以外の名前
;・各問題の中身（仮。見直す前提）
;・夜間オンコール（2日目）の、1日の流れの区切り方
;（案：朝→業務前半→昼休み→業務後半→終業後→夜の当番（オンコール）→朝（リザルト））
;・AIの「正確さ」の数字ネタ（100%→99%→95%→90%→30%）が、くどくないか
;・夜の電話の助言が、信頼度でどう変わるかの、細かい設計

;次のファイルへ
@jump storage="ch4_6/scene4_2.ks"
