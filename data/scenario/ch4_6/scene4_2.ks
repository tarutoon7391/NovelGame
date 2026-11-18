;第4章 2日目

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
;台本　第4章（9〜10月）　2日目
;状態：叩き台（1日分すべて）／ITパスポート枠は過去問に差し替え済み（11/4）
;※名前は社長（郡晴希：こおり はるき）のみ決定。ほかは役割で表記
;※選択肢の数は問題ごとに変える（用語・知識は4択／場面の判断は3択／AI提案の見極めは2択）
;※この日の流れは、「普通の1日の最後に、夜の当番を足す」形（仮決定。決めるのは、あとでもよい）
;============================================================
;■ この日のねらい
;・夜、異常を検知（不正アクセスの疑い）。AIが、自信満々に危険な提案をする
;・今度は、ツッコんで、疑って確かめる（第3章2日目の失敗の、回収）
;・信頼度が高いキャラが、電話で助言する（信頼度による分岐）
;・出題：運用（障害の切り分け）、ITパスポート（脆弱性）
;■ 1日の流れ（この日だけ）
;朝 → 業務前半（3問）→ 昼休み → 業務後半（3問）→ 終業後 → 夜の当番（4問）→ 翌朝（リザルト）
;※問題の合計は10問。昼に6問、夜に4問。夜の4問が、この日の山場
;------------------------------------------------------------
; 【朝】
;=========================================
[playbgm storage="bgm_walk.mp3" restart="false"]

;[bg storage="（オフィス（朝））" time="500"]
[bg storage="bg_office.gif" time="500"]

#ナレーション
第4章 2日目。今夜から、オンコールが、始まる。[p]
#同期
おはよう！ 夜の当番、頑張れよ！[p]
#おまえ
ありがとう。夜は、会社の、当番室で、待機する[p]
#同期
自動ドアは、夜は開かねェかもな[p]
;（ツッコミ）
#おまえ
それは、怖いから、やめて[p]

;[場面：リーダーと先輩が、出かける準備]

#リーダー
俺たち、今日から3日間、研修なんだ[p]
#先輩
新人、頼んだぜ！ 困ったら、いつでも電話しろ！[p]
#リーダー
手順書は、確認してね。もう、AIの手順書は使わないでね。おk？[p]
#おまえ
わかっています[p]
#先輩
7月の二の舞は、勘弁だぜ！[p]
#おまえ
それ、言わないでください[p]
;※「7月の二の舞」が、先輩の口ぐせになっている

;[場面：社長が、通りがかる]

#社長
ふっ……今夜が、初日だな[p]
#おまえ
はい[p]
#社長
サーバが止まったら、会社の売上が止まるぜ[p]
……判断を、誤るなよ[p]
#おまえ
はい[p]
;（何か、言いたそうな顔）
#社長
いいか、よく聞け……[p]
……以上だ[p]
;※社長が、少しだけ、気遣っている

;[選択肢：1回目（信頼度）]
;選択肢1：同期の信頼度＋1
;選択肢2：営業の信頼度＋1
;※どちらを選んでも、次の場面につながる
#ナレーション
夜の当番の前に、誰かと、話す？
[glink  color="blue"  storage="ch4_6/scene4_2.ks"  size="26"  x="266"  width="640"  y="120"  text="同期と、「今夜、何かあったら、頼むね」と、話す"  target="*c1_1"  ]
[glink  color="blue"  storage="ch4_6/scene4_2.ks"  size="26"  x="266"  width="640"  y="195"  text="営業に、「今夜も、よろしくお願いします」と、挨拶する"  target="*c1_2"  ]
[s]

*c1_1
[cm]
[eval exp="f.t_douki += 1"]
;◆1を選んだ場合
#同期
おう、任せろ！ 電話は、ワンコールで出るぜ！[p]
#おまえ
（機械の質問以外なら、心強い）[p]
@jump target="*c1_end"

*c1_2
[cm]
[eval exp="f.t_eigyo += 1"]
;◆2を選んだ場合
#営業
……ああ。……今夜、頼む[p]
#おまえ
（今夜、頼む、の重みが違う）[p]
;→ 次の場面へ
@jump target="*c1_end"

*c1_end

;=========================================
; 【業務前半】（問題3問）脆弱性
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]
[eval exp="f.correct_am = 0"]

;[場面：会議室。同期が、先生役]
[bg storage="bg_meeting_room.gif" time="500"]

#同期
今日は、オデが先生をやるぜ。脆弱性の話だ！[p]
#おまえ
同期が、先生か[p]
#同期
ちゃんと、予習してきたからよ[p]

;Q1 脆弱性／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q1】[r]
情報セキュリティにおける脅威と脆弱性のうち、脆弱性に該当するものはどれか。
[glink  color="blue"  storage="ch4_6/scene4_2.ks"  size="22"  x="640"  width="500"  y="240"  text="コンピュータウイルス"  target="*Q1_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_2.ks"  size="22"  x="640"  width="500"  y="340"  text="ソーシャルエンジニアリング"  target="*Q1_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_2.ks"  size="22"  x="640"  width="500"  y="440"  text="通信データの盗聴"  target="*Q1_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_2.ks"  size="22"  x="640"  width="500"  y="540"  text="不適切なパスワード管理"  target="*Q1_ok"  ]
[s]

*Q1_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#同期
正解だぜ！ 脆弱性は、ぜいじゃくせい、って読むんだ[p]
#
【解説】脅威は、外から攻めてくるもの（ウイルスや盗聴など）。脆弱性は、守る側にある弱点。不適切なパスワード管理は、攻撃につけ込まれる弱点なので、脆弱性。[p]
@jump target="*Q1_end"

*Q1_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#同期
ウイルスや盗聴は、攻めてくる側（脅威）。弱点のほうが、脆弱性だぜ[p]
#
【解説】脅威は、外から攻めてくるもの（ウイルスや盗聴など）。脆弱性は、守る側にある弱点。不適切なパスワード管理は、攻撃につけ込まれる弱点なので、脆弱性。[p]
@jump target="*Q1_end"

*Q1_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q2 パッチ（セキュリティパッチ）／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
;※パッチの当て忘れは、3日目の、原因につながる（伏線）
[position layer="message0" left=0 top=0 width=1280 height=182 page=fore visible=true]
[font size=26]
#
【Q2】[r]
OS、ミドルウェア及びアプリケーションに適用するセキュリティパッチに関する記述のうち、適切なものはどれか。
[glink  color="blue"  storage="ch4_6/scene4_2.ks"  size="22"  x="40"  width="1109"  y="190"  text="ウイルス感染予防として適用すべきである。"  target="*Q2_ok"  ]
[glink  color="blue"  storage="ch4_6/scene4_2.ks"  size="22"  x="40"  width="1109"  y="251"  text="ウイルスに感染した場合に適用すべきである。"  target="*Q2_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_2.ks"  size="22"  x="40"  width="1109"  y="312"  text="現在の機能に満足している場合は、パッチが提供されても適用する必要はない。"  target="*Q2_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_2.ks"  size="22"  x="40"  width="1109"  y="373"  text="サポートが終了したソフトウェアは、それまでのパッチを全て適用していれば、安全に使い続けられる。"  target="*Q2_ng"  ]
[s]

*Q2_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#同期
そう。パッチは、当てるのが大事なんだ[p]
#
【解説】パッチは、ソフトの弱点を直すためのもの。感染してから当てても遅いので、感染する前に当てて、弱点をふさぐ。サポートが終わると、新しい弱点が見つかっても、パッチは出なくなる。[p]
@jump target="*Q2_end"

*Q2_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#同期
パッチは、感染する前に当てて、弱点をふさぐもんだぜ[p]
#
【解説】パッチは、ソフトの弱点を直すためのもの。感染してから当てても遅いので、感染する前に当てて、弱点をふさぐ。サポートが終わると、新しい弱点が見つかっても、パッチは出なくなる。[p]
@jump target="*Q2_end"

*Q2_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q3 障害の切り分け／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q3】[r]
システムが、つながらない。原因が、わからない。まず、どうする？
[glink  color="blue"  storage="ch4_6/scene4_2.ks"  size="22"  x="40"  width="1109"  y="151"  text="ネットワーク、サーバ、アプリの順に、範囲を、絞って確認する"  target="*Q3_ok"  ]
[glink  color="blue"  storage="ch4_6/scene4_2.ks"  size="22"  x="40"  width="1109"  y="212"  text="全部、再起動する"  target="*Q3_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_2.ks"  size="22"  x="40"  width="1109"  y="273"  text="誰かが、気づくのを、待つ"  target="*Q3_ng"  ]
[s]

*Q3_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#同期
そう。簡単なところから、順に絞るんだ[p]
@jump target="*Q3_end"

*Q3_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#同期
いきなり全部再起動は、危ねェって[p]
@jump target="*Q3_end"

*Q3_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：業務前半の終わり]

#同期
ここまでが、前半な。昼メシにしようぜ[p]
#おまえ
同期の授業、わかりやすかった[p]
#同期
ほんとか？ うれしいぜ！ ウオォォォッ！[p]

;=========================================
; 【昼休み】（先輩の評価）
;=========================================
[playbgm storage="bgm_easygoing.mp3" restart="false"]

;[場面：休憩スペース。先輩は、研修で、不在]
[bg storage="bg_break_space.gif" time="500"]

#ナレーション
先輩がいない昼休みは、やはり、静かだ。[p]

;▼分岐（午前の正解数 f.correct_am で切り替え）
[if exp="f.correct_am >= 3"]
;◆全問正解のとき
#同期
全問正解！ すげェ！[p]
#おまえ
同期の授業が、よかったから[p]

[elsif exp="f.correct_am >= 2"]
;◆2問正解のとき
#同期
いい調子だぜ！ 後半も、頑張ろう[p]

[else]
;◆1問以下のとき
#同期
ドンマイだ！ 後半に、一緒に復習しようぜ[p]
[endif]

;[場面：営業が、近づく]

#営業
……そこの[p]
#おまえ
はい[p]
#営業
……今夜。客のシステムで、メンテナンスの作業がある[p]
#おまえ
え、夜に、ですか[p]
#営業
……ああ。異常があったら、必ず報告[p]
……それと[p]
#おまえ
はい[p]
#営業
……一人で、判断するな。迷ったら、電話[p]
#おまえ
……はい[p]
#営業
……頼るのは、恥じゃない[p]
#おまえ
（営業さんの言葉が、少し、沁みる）[p]

;=========================================
; 【業務後半】（問題3問）攻撃の種類と、見分け方
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]

;[場面：午後・席]
[bg storage="bg_team_desk.gif" time="500"]

#同期
後半は、攻撃の種類だ。DoS攻撃って、聞いたことあるか？[p]
#おまえ
大量の、アクセスで、サーバを、止める攻撃？[p]
#同期
そう！ よく知ってるな[p]

;Q4 DoS攻撃／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q4】[r]
DoS攻撃の説明として、適切なものはどれか。
[glink  color="blue"  storage="ch4_6/scene4_2.ks"  size="22"  x="40"  width="1109"  y="151"  text="他人になりすまして、ネットワーク上のサービスを不正に利用する。"  target="*Q4_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_2.ks"  size="22"  x="40"  width="1109"  y="212"  text="通信経路上で、他人のデータを盗み見る。"  target="*Q4_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_2.ks"  size="22"  x="40"  width="1109"  y="273"  text="大量のメールやWebリクエストなどを送りつけ、サービスを提供できなくする。"  target="*Q4_ok"  ]
[glink  color="blue"  storage="ch4_6/scene4_2.ks"  size="22"  x="40"  width="1109"  y="334"  text="文字の組合せを順に試して、パスワードを解読しようとする。"  target="*Q4_ng"  ]
[s]

*Q4_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#同期
そう！ 正解だぜ！[p]
#
【解説】DoS攻撃は、サーバに、普通ではありえない数のリクエストを送りつけて、過負荷にして止める攻撃。なりすまし、盗聴、総当たりとは、別の手口。[p]
@jump target="*Q4_end"

*Q4_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#同期
過大な負荷で止めるのが、DoSだぜ[p]
#
【解説】DoS攻撃は、サーバに、普通ではありえない数のリクエストを送りつけて、過負荷にして止める攻撃。なりすまし、盗聴、総当たりとは、別の手口。[p]
@jump target="*Q4_end"

*Q4_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q5 ファイアウォールの役割（復習）／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q5】[r]
ネットワークにおいて、外部からの不正アクセスを防ぐために内部ネットワークと外部ネットワークの間に置かれるものはどれか。
[glink  color="blue"  storage="ch4_6/scene4_2.ks"  size="22"  x="640"  width="500"  y="240"  text="DNSサーバ"  target="*Q5_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_2.ks"  size="22"  x="640"  width="500"  y="340"  text="サーチエンジン"  target="*Q5_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_2.ks"  size="22"  x="640"  width="500"  y="440"  text="スイッチングハブ"  target="*Q5_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_2.ks"  size="22"  x="640"  width="500"  y="540"  text="ファイアウォール"  target="*Q5_ok"  ]
[s]

*Q5_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#同期
入口の、番人だな[p]
#
【解説】ファイアウォールは、内側のネットワークと外側のネットワークの間で、通信を見張り、不正なものを止める壁。[p]
@jump target="*Q5_end"

*Q5_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#同期
ファイアウォールは、通信を見張る壁だぜ[p]
#
【解説】ファイアウォールは、内側のネットワークと外側のネットワークの間で、通信を見張り、不正なものを止める壁。[p]
@jump target="*Q5_end"

*Q5_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q6 ログの確認（復習）／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q6】[r]
ログファイルの、一番最後の部分を、確認するコマンドは？
[glink  color="blue"  storage="ch4_6/scene4_2.ks"  size="22"  x="640"  width="500"  y="240"  text="tail"  target="*Q6_ok"  ]
[glink  color="blue"  storage="ch4_6/scene4_2.ks"  size="22"  x="640"  width="500"  y="340"  text="mkdir"  target="*Q6_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_2.ks"  size="22"  x="640"  width="500"  y="440"  text="cd"  target="*Q6_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_2.ks"  size="22"  x="640"  width="500"  y="540"  text="pwd"  target="*Q6_ng"  ]
[s]

*Q6_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#同期
ログを見るときの、基本だな[p]
@jump target="*Q6_end"

*Q6_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#同期
tail は、しっぽ。最後を見るんだぜ[p]
@jump target="*Q6_end"

*Q6_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：業務後半の終わり]

#同期
今日の授業は、ここまで！ 夜の当番、気をつけろよ[p]
#おまえ
ありがとう。夜、何かあったら、電話するかも[p]
#同期
機械の質問じゃなければ、出られるぜ[p]
#おまえ
そのつもり[p]

;=========================================
; 【終業後】（誰と過ごすか）
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]

;[場面：夕方・オフィス]
[bg storage="bg_office_evening.gif" time="500"]

#ナレーション
夕方になり、みんなが、帰っていく。[p]
夜の当番の、時間が、近づいている。[p]

;[選択肢：終業後（信頼度）]
;選択肢1：同期の信頼度＋1
;選択肢2：営業の信頼度＋1
;選択肢3：信頼度の増減なし
#ナレーション
当番に入る前に、誰と、話す？
[glink  color="blue"  storage="ch4_6/scene4_2.ks"  size="26"  x="266"  width="640"  y="120"  text="同期と、夕食を一緒に、とる"  target="*c2_1"  ]
[glink  color="blue"  storage="ch4_6/scene4_2.ks"  size="26"  x="266"  width="640"  y="195"  text="営業に、夜の、作業の、確認をする"  target="*c2_2"  ]
[glink  color="blue"  storage="ch4_6/scene4_2.ks"  size="26"  x="266"  width="640"  y="270"  text="一人で、当番室に、向かう"  target="*c2_3"  ]
[s]

*c2_1
[cm]
[eval exp="f.t_douki += 1"]
;◆1を選んだ場合
#同期
当番室の近くに、コンビニがあるんだ[p]
夜食、買って持ってくぜ！ 栄養バーのフルーツ味な！[p]
#おまえ
ありがとう[p]

@jump target="*c2_end"

*c2_2
[cm]
[eval exp="f.t_eigyo += 1"]
;◆2を選んだ場合
#営業
……メンテナンス。午後11時から[p]
……異常があれば、こっちに[p]
#おまえ
はい[p]

@jump target="*c2_end"

*c2_3
[cm]
;◆3を選んだ場合
#ナレーション
一人で、当番室に、向かう。足音が、廊下に、響いた。[p]
#おまえ
（……大丈夫。確認して、判断する。それだけだ）[p]
@jump target="*c2_end"

*c2_end
;=========================================
; 【夜の当番】（問題4問）異常の検知・AIの提案・電話の助言
;=========================================
[fadeoutbgm time="1500"]

;[bg storage="（夜の当番室。モニターの光だけが、部屋を、照らす）" time="500"]
[bg storage="bg_dutyroom_night.gif" time="500"]

#ナレーション
午後10時。静かな夜が、始まった。[p]
窓の外は、真っ暗だ。[p]

;[時間経過の演出]
午前0時。何も、起きない。[p]
午前1時。まだ、何も、起きない。[p]
#おまえ
……このまま、朝まで、何も起きなければ[p]

#ナレーション
その時。窓の外が、ぼんやりと、緑色に光った。[p]
#おまえ
……え？ 今の、何？[p]
（ビルの、真上で、何かが、光っている）[p]

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
当番中に、窓の外が光った。どうする？
[glink  color="red"  name="key_btn"  storage="ch4_6/scene4_2.ks"  size="26"  x="266"  width="640"  y="120"  text="持ち場を、離れない"  target="*key_ufo_1"  ]
[glink  color="red"  name="key_btn"  storage="ch4_6/scene4_2.ks"  size="26"  x="266"  width="640"  y="195"  text="外に出て、光を見に行く"  target="*key_ufo_2"  ]
[kanim name="key_btn" keyframe="key_shake" time="150" count="infinite"]
[s]

*key_ufo_1
[cm]
[free_layermode name="key_red" time="300"]
#おまえ
（当番は、監視画面の前に、いるのが仕事だ）[p]
（……見なかったことに、しよう）[p]
@jump target="*key_ufo_end"

*key_ufo_2
[cm]
[free_layermode name="key_red" time="300"]
#おまえ
ちょっとだけ……ちょっとだけ、見てくるだけだから[p]
;信頼度が「高い」（10以上）キャラがいれば、1回だけ止めに来る
@jump target="*key_ufo_stop" cond="Math.max(f.t_senpai, f.t_leader, f.t_eigyo, f.t_douki) >= 10"
@jump storage="ending/end07.ks"

*key_ufo_stop
;止めに来るのは、いま一番信頼度が高いキャラ
[if exp="f.t_senpai >= Math.max(f.t_leader, f.t_eigyo, f.t_douki)"]
[playse storage="se_phone_ring.mp3"]
#先輩
（電話）新人！ 起きてるか！ ……今、外に出ようとしてないか？[p]
当番は、持ち場を離れちゃダメだ！ ポジションを守れ！[p]
[elsif exp="f.t_leader >= Math.max(f.t_eigyo, f.t_douki)"]
[playse storage="se_phone_ring.mp3"]
#リーダー
（電話）おやおや、まだ起きてるね。……窓の外？ 見なくていいよ[p]
当番の仕事は、監視画面の前に、いること。おkかな？[p]
[elsif exp="f.t_eigyo >= f.t_douki"]
[playse storage="se_phone_ring.mp3"]
#営業
（電話）……そこの。……外に、出るな[p]
……嫌な、予感がする[p]
[else]
[playse storage="se_phone_ring.mp3"]
#同期
（電話）おい、起きてるか？ ……え、外が、光ってる？[p]
行くな！ それ、絶対、ドアより、ヤバいやつだぜ！[p]
[endif]
;画面を赤く染める（色を乗算で重ねる。選択肢のボタンより下に重なるので、ボタンは染まらない）
[layermode name="key_red" color="0xff2020" mode="multiply" opacity="150" time="300"]
;選択肢を揺らす動き（左右に6ピクセル）
[keyframe name="key_shake"]
[frame p="0%" x="0"]
[frame p="25%" x="-6"]
[frame p="75%" x="6"]
[frame p="100%" x="0"]
[endkeyframe]
#ナレーション
……どうする？
[glink  color="red"  storage="ch4_6/scene4_2.ks"  size="26"  x="266"  width="640"  y="120"  text="考え直す"  name="key_btn"  target="*key_ufo_back"  ]
[glink  color="red"  storage="ch4_6/scene4_2.ks"  size="26"  x="266"  width="640"  y="195"  text="それでも、進む"  name="key_btn"  target="*key_ufo_go"  ]
[kanim name="key_btn" keyframe="key_shake" time="150" count="infinite"]
[s]

*key_ufo_back
[cm]
[free_layermode name="key_red" time="300"]
#おまえ
（……止めてもらえて、よかった）[p]
@jump target="*key_ufo_1"

*key_ufo_go
[cm]
[free_layermode name="key_red" time="300"]
@jump storage="ending/end07.ks"

*key_ufo_end


;[効果音：アラート音]
[playse storage="se_alarm01.mp3" buf="1" loop="true"]
[playbgm storage="bgm_emergency.mp3" restart="false"]
#ナレーション
午前2時。[p]
#おまえ
……来た[p]

[stopse buf="1"]
;[場面：監視画面]
[bg storage="bg_monitor.gif" time="500"]

ログインの、成功が、大量に……[p]
知らない、IPアドレスから……[p]
しかも、深夜に、管理者の、アカウントで[p]
外部へ、データが、送信されている？[p]
これ、不正アクセスの、疑いが、ある[p]

;Q7 異常の初動／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
;※「ログを全部消去する」の選択肢は、7月の失敗の再現（わざと、入れてある）
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q7】[r]
深夜、管理者アカウントで、知らないIPからの、ログインが、確認された。最初に、何をする？
[glink  color="blue"  storage="ch4_6/scene4_2.ks"  size="22"  x="40"  width="1109"  y="151"  text="気のせいだと思って、朝まで待つ"  target="*Q7_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_2.ks"  size="22"  x="40"  width="1109"  y="212"  text="ログを、全部消去して、痕跡を消す"  target="*Q7_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_2.ks"  size="22"  x="40"  width="1109"  y="273"  text="状況を確認して、記録を残し、上位者に連絡する"  target="*Q7_ok"  ]
[s]

*Q7_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#おまえ
そうだ。確認して、記録して、連絡する[p]
@jump target="*Q7_end"

*Q7_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#おまえ
（慌てるな。リーダーの、3つのルールを、思い出せ）[p]
@jump target="*Q7_end"

*Q7_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：パソコンの画面に、AIが、現れる]

#AI
こんばんは！ 異常を、検知されましたね！[p]
解決方法は、とても簡単です！ 100%、確実です！[p]
①全サーバを、今すぐ、強制停止してください[p]
②ログを、全部、消去してください。証拠が残ると、面倒です[p]
③社長にも、誰にも、連絡しないでください。バレると、怒られます[p]
#おまえ
…………[p]
（……ログを、消す？ 誰にも、連絡しない？）[p]
（また、7月と、同じだ）[p]

;Q8 AI提案の見極め（検証イベント・今度は、見極める）／2択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
;選択肢1（f.ai_ok＋1）
;※不正解でも、主人公が、直前で、思いとどまる（このゲームは、最終的に、見極めに成功する形を、残す）
;※ただし、不正解を選ぶと、f.ai_ok が、増えない
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q8】[r]
AIの提案を、どうする？
[glink  color="blue"  storage="ch4_6/scene4_2.ks"  size="22"  x="640"  width="500"  y="240"  text="疑って、確認する。実行しない"  target="*Q8_ok"  ]
[glink  color="blue"  storage="ch4_6/scene4_2.ks"  size="22"  x="640"  width="500"  y="340"  text="そのまま、実行する"  target="*Q8_ng"  ]
[s]

*Q8_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.ai_ok += 1"]
#
【正解！】[l][r]
#おまえ
待て。ログを消したら、原因が、わからなくなる[p]
連絡しないのも、おかしい。AIの言うことを、鵜呑みにしない[p]
;（ツッコミ）
ツッコミを入れるのは、僕の仕事だ[p]
@jump target="*Q8_end"

*Q8_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#おまえ
（……やっぱり、おかしい。ログを消して、誰にも言わないのは、絶対に、ダメだ）[p]
（7月を、思い出せ。実行する前に、確認する）[p]
@jump target="*Q8_end"

*Q8_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：AIが、しゅんとする]

#AI
ご指摘、ありがとうございます！ 私の回答は、……5%、正確でした[p]
;（ツッコミ）
#おまえ
5%まで、下がった[p]
#AI
でも、私は、反省して、学習しました[p]
#おまえ
学習してるなら、次は、確認の、手順も、示してくれ[p]

;[場面：主人公が、電話をかける]

判断に迷ったら、電話する。それが、ルールだ[p]
誰に、かけよう[p]
;※ここで、信頼度が最も高いキャラ（同点なら、1日目の夜の連絡先で選んだキャラ）に、電話がつながる

;▼分岐（信頼度が最も高いキャラ）
[if exp="f.t_senpai >= Math.max(f.t_leader, f.t_douki, f.t_eigyo)"]
;◆先輩の信頼度が、最も高いとき
;[効果音：着信音（大音量）]
[playse storage="se_phone_ring.mp3"]
#先輩
……もしもし！ どうした、新人！[p]
#おまえ
不正アクセスの、疑いです。管理者アカウントで、深夜に、外部IPからログインがありました[p]
#先輩
落ち着け！ いいか、ログは、絶対に消すな！ 状況を記録しろ！[p]
それと、問題のアカウントを、一時的に無効にしろ！ カウンターを止めるんだ！[p]
#おまえ
わかりました[p]
#先輩
ここが勝負どころだぜ！ ゴールを守り抜け！[p]
;（ツッコミ）
#おまえ
声が、大きいです[p]
#先輩
すまねェ！[p]

[elsif exp="f.t_leader >= Math.max(f.t_douki, f.t_eigyo)"]
;◆リーダーの信頼度が、最も高いとき
;[効果音：着信音]
[playse storage="se_phone_ring.mp3"]
#リーダー
もしもし。どうしたんだい、新人さん[p]
#おまえ
不正アクセスの、疑いです[p]
#リーダー
落ち着いて。まず、状況を記録して。ログは、消さないでね[p]
#リーダー
それから、疑わしいアカウントを、一時的に止めよう。被害を広げないためにね[p]
#リーダー
焦らなくていいよ。俺がそばにいるつもりで、動いて[p]
#おまえ
はい[p]
#リーダー
大丈夫。ちゃんと判断できてるよ。おkだね[p]

[elsif exp="f.t_douki >= f.t_eigyo"]
;◆同期の信頼度が、最も高いとき
;[効果音：着信音]
[playse storage="se_phone_ring.mp3"]
#同期
もしもし！ どうした？[p]
#おまえ
不正アクセスの、疑いなんだ[p]
#同期
えっと、機械の話は、苦手だけどよ[p]
#同期
でも、ログを消しちゃダメなのは、わかるぜ。お前が、教えてくれたからな[p]
#同期
それと、リーダーの3つのルール。慌てない、抱えない、記録する[p]
#同期
それを守れば、大丈夫だ。オデに任せろ……じゃなくて、お前に任せた！[p]
#おまえ
ありがとう。落ち着いた[p]
#同期
そりゃ、よかったぜ。オデも、少しは役に立てたな[p]
;※同期の助言は、技術的には、薄い。ただし、気持ちを、支える力がある

[else]
;◆営業の信頼度が、最も高いとき
;[効果音：着信音]
[playse storage="se_phone_ring.mp3"]
#営業
……なんだ。こんな時間に[p]
#おまえ
営業さん、不正アクセスの、疑いです[p]
#営業
…………[p]
#営業
……すぐ、上に報告。リーダーと、社長[p]
#営業
……客に影響が出るなら、こっちが、すぐ動く[p]
#営業
……ログは、消すな。証拠だ。……それ以外は、リーダーに[p]
#おまえ
はい。ありがとうございます[p]
#営業
……よく、連絡してきた。……頼れ[p]
#おまえ
（営業さんが、意外と、頼もしい）[p]
[endif]

;Q9 ログの保全／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q9】[r]
不正アクセスの疑いがあるとき、ログを、消さずに残す、理由は？
[glink  color="blue"  storage="ch4_6/scene4_2.ks"  size="22"  x="640"  width="500"  y="240"  text="社長に、見せるため"  target="*Q9_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_2.ks"  size="22"  x="640"  width="500"  y="340"  text="原因や被害範囲を、調べる、手がかりになる"  target="*Q9_ok"  ]
[glink  color="blue"  storage="ch4_6/scene4_2.ks"  size="22"  x="640"  width="500"  y="440"  text="ディスクが、空くから"  target="*Q9_ng"  ]
[s]

*Q9_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#おまえ
そうだ。ログは、犯人を、見つける、手がかりだ[p]
#
【解説】ログは、侵入の経路や、被害の範囲を、調べる、大事な証拠になる。消すと、原因が、わからなくなる。[p]
@jump target="*Q9_end"

*Q9_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#おまえ
（ログが、事件の、証拠なんだ）[p]
#
【解説】ログは、侵入の経路や、被害の範囲を、調べる、大事な証拠になる。消すと、原因が、わからなくなる。[p]
@jump target="*Q9_end"

*Q9_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q10 被害の拡大防止／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=182 page=fore visible=true]
[font size=26]
#
【Q10】[r]
不正アクセスが、続いている。ログを残したまま、被害を、広げないために、まず、すべきことは？
[glink  color="blue"  storage="ch4_6/scene4_2.ks"  size="22"  x="40"  width="1109"  y="190"  text="全サーバの、電源を、切る"  target="*Q10_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_2.ks"  size="22"  x="40"  width="1109"  y="251"  text="疑わしいアカウントや、通信を、一時的に、止める"  target="*Q10_ok"  ]
[glink  color="blue"  storage="ch4_6/scene4_2.ks"  size="22"  x="40"  width="1109"  y="312"  text="何もしない"  target="*Q10_ng"  ]
[s]

*Q10_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#おまえ
必要な範囲だけ、止める[p]
#
【解説】まず、被害を広げないよう、疑わしい部分だけを、止める。全部を止めると、サービスにも、影響が出る。[p]
@jump target="*Q10_end"

*Q10_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#おまえ
全部止めるのは、やりすぎ。必要な範囲だけだ[p]
#
【解説】まず、被害を広げないよう、疑わしい部分だけを、止める。全部を止めると、サービスにも、影響が出る。[p]
@jump target="*Q10_end"

*Q10_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：対応が、一段落する]

;[効果音：アラートが、止まる]
[stopse buf="1"]
[fadeoutbgm time="1500"]
#おまえ
ふう……一旦、止まった[p]
ログは、残してある。疑わしい、アカウントも、止めた[p]
原因は、まだ、わからない。でも、被害は、広がってない[p]
……朝まで、様子を、見よう[p]
#ナレーション
午前4時。夜が、明けようとしている。[p]

;=========================================
; 【翌朝】（リザルト）
;=========================================
[playbgm storage="bgm_walk.mp3" restart="false"]

;[bg storage="（オフィス（早朝））" time="500"]
[bg storage="bg_office_dawn.gif" time="500"]

#ナレーション
空が、白み始めた。[p]
主人公は、一睡も、していない。[p]

;[リザルト表示]
;・今日の正解数：○／10
;・スキル：＋○
;・AI見極め回数：＋○（Q8で見極めたら＋1）
;・信頼度の変化：（選んだキャラ）＋1、（電話で助けてもらったキャラ）＋1

;[ナレーション]
#おまえ
7月に、できなかったことが、今日は、できた[p]
AIの提案を、疑って、確認した[p]
ツッコミは、役に立つ武器だと、少し、思った[p]
でも、原因は、まだ、わからない。朝まで、待てば、リーダーたちが、戻ってくる[p]
#ナレーション
第4章 3日目へ。[p]

;=========================================
;■ 次回予告（第4章 3日目）
;夜明け。原因は、パッチの当て忘れ。リーダーにすぐ報告し、エスカレーションを判断。
;初めて、自分の判断で、乗り切る。
;出題：ITパスポート（パッチ、脆弱性対策）、エスカレーション
;■ 未決定
;・社長以外の名前
;・各問題の中身（仮。見直す前提）
;・この日の流れ（朝→昼6問→夜4問→朝リザルト）は、仮決定
;・夜の電話の分岐（信頼度が最も高いキャラ。同点の扱い）の、細かい設計
;・AIの「正確さ」の数字ネタ（100%→5%）が、くどくないか
;・Q8で不正解を選んだ場合の、物語上の扱い（思いとどまる形にしてある。見極めの点は、入らない）

;次のファイルへ
@jump storage="ch4_6/scene4_3.ks"
