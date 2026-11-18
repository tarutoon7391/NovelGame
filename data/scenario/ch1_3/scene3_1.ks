;第3章 1日目

*start
;章セレクトで、この章を選べるようにする
[eval exp="sf.reach_ch3 = true"]
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
;台本　第3章（7〜8月）　1日目
;状態：叩き台（1日分すべて）／ITパスポート枠は過去問に差し替え済み（11/4）
;※名前は社長（郡晴希：こおり はるき）のみ決定。ほかは役割で表記
;※選択肢の数は問題ごとに変える（用語・知識は4択／場面の判断は3択／AI提案の見極めは2択）
;============================================================
;■ この章のねらい
;初の障害。絶望、そして立ち直り。
;1日目：平穏な日。主人公がAIを便利に使い始め、頼りすぎる（笑い多め）
;2日目：障害発生。AIが「ログを全部消せば直る」と提案し、鵜呑みにして悪化させる
;3日目：絶望
;4日目：同期が助けを求めてきて、立ち直る
;■ この日のねらい
;・平穏な日。AIが、すっかり「便利な相棒」になっている（頼りすぎの始まり）
;・笑い多め。2日目の落差を、大きくするための日
;・出題：ITパスポート（マネジメント：サービス管理）
;・AIの小さな間違いが、いくつか出る。ただし、見逃しても被害は小さい
;■ 1日の流れ
;朝 → 業務前半（5問）→ 昼休み → 業務後半（5問）→ 終業後 → 自宅（リザルト）
;------------------------------------------------------------
; 【朝】
;=========================================
[playbgm storage="bgm_walk.mp3" restart="false"]

;[bg storage="（真っ白な画面（時間経過の演出））" time="500"]
[bg storage="bg_white.png" time="500"]

#ナレーション
第2章が終わって、1か月が過ぎた。[p]
7月。外は、うるさいほどの、セミの声だ。[p]

;[bg storage="（オフィス（朝））" time="500"]
[bg storage="bg_office.gif" time="500"]

第3章 1日目。試用期間が終わって、すっかり、会社に慣れた。[p]
#同期
暑ィな……自動ドアも、今日は重そうだぜ[p]
#おまえ
ドアが、重いのは、ありえない[p]
#同期
あ、挟まった。ウオォォォッ！[p]
;（ツッコミ）
#おまえ
やっぱり、挟まった[p]
;※自動ドアに挟まれるお約束。1か月ぶり

;[場面：パソコンの前。主人公が、AIに話しかけている]
[bg storage="bg_team_desk.gif" time="500"]

AI、今日の議事録、まとめて[p]
#AI
お任せください！ 完璧に、まとめます！ 100%、正確です！[p]
#おまえ
ありがとう。助かる[p]
#同期
なあ、最近、AIに頼りっぱなしじゃねェか？[p]
#おまえ
だって、便利なんだよ。メール、議事録、報告書、全部、やってくれる[p]
#同期
便利なのは、わかるけどよ……[p]
#おまえ
大丈夫。AIは、100%って言ってるから[p]
#同期
それ、AIが自分で言ってるだけだよな[p]
#おまえ
（確かに）[p]

;[場面：先輩が登場]

#先輩
おう、新人！ AIを使いこなしてるか！[p]
#おまえ
はい。すごく、便利です[p]
#先輩
いいぞ！ ただし、使うだけじゃなくて、確かめる力も育てるんだぜ！[p]
;（……たぶん）
#おまえ
はい。確認も、しています[p]
#先輩
ならいい！ 今日は、サービス管理の勉強だぜ！[p]

;[選択肢：1回目（信頼度）]
;選択肢1：先輩の信頼度＋1
;選択肢2：同期の信頼度＋1
;選択肢3：リーダーの信頼度＋1
;※どれを選んでも、次の場面につながる
#ナレーション
朝のあいさつ。まず、誰と話す？
[glink  color="blue"  storage="ch1_3/scene3_1.ks"  size="26"  x="266"  width="640"  y="120"  text="先輩に、AIの上手な使い方を、聞く"  target="*c1_1"  ]
[glink  color="blue"  storage="ch1_3/scene3_1.ks"  size="26"  x="266"  width="640"  y="195"  text="同期に、「AI、便利だよ」と、すすめる"  target="*c1_2"  ]
[glink  color="blue"  storage="ch1_3/scene3_1.ks"  size="26"  x="266"  width="640"  y="270"  text="リーダーに、最近のAIの使い方を、相談する"  target="*c1_3"  ]
[s]

*c1_1
[cm]
[eval exp="f.t_senpai += 1"]
;◆1を選んだ場合
#先輩
AIは、パスの出し手だ！ シュートを打つのは、お前だぜ！[p]
#おまえ
（それは、ちょっと名言かもしれない）[p]
@jump target="*c1_end"

*c1_2
[cm]
[eval exp="f.t_douki += 1"]
;◆2を選んだ場合
#同期
便利なのは、わかるぜ。でもオデは、まだ、AIのボタンの場所もわかんねェ[p]
#おまえ
（そこからか）[p]
@jump target="*c1_end"

*c1_3
[cm]
[eval exp="f.t_leader += 1"]
;◆3を選んだ場合
#リーダー
使い方かい？ 便利な分だけ、確認を一回足す。それでおkだね[p]
#おまえ
（一回足す、か）[p]
;→ 次の場面へ
@jump target="*c1_end"

*c1_end

;=========================================
; 【業務前半】（問題5問）ITサービスマネジメント
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]
[eval exp="f.correct_am = 0"]

;[場面：会議室]
[bg storage="bg_meeting_room.gif" time="500"]

#先輩
今日のテーマは、サービス管理だぜ！ IT部門は、サービスを届けるチームだ！[p]
お客様に、サービスを、安定して届け続ける。90分間、ずっとボールをキープするのと同じだぜ！[p]

;Q1 ITサービスマネジメント／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q1】[r]
ITサービスを、安定して、お客様に届け続けるための、管理の仕組みは？
[glink  color="blue"  storage="ch1_3/scene3_1.ks"  size="22"  x="640"  width="500"  y="240"  text="ITスキル"  target="*Q1_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_1.ks"  size="22"  x="640"  width="500"  y="340"  text="ITパスポート"  target="*Q1_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_1.ks"  size="22"  x="640"  width="500"  y="440"  text="ITサービスマネジメント"  target="*Q1_ok"  ]
[glink  color="blue"  storage="ch1_3/scene3_1.ks"  size="22"  x="640"  width="500"  y="540"  text="ITモバイル"  target="*Q1_ng"  ]
[s]

*Q1_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#先輩
サービスの品質を、守る仕組みだな！[p]
#
【解説】ITサービスマネジメントは、ITサービスの品質を保ち、継続して提供するための管理。[p]
@jump target="*Q1_end"

*Q1_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
サービスを、管理する。そのまま、覚えればいいぜ！[p]
#
【解説】ITサービスマネジメントは、ITサービスの品質を保ち、継続して提供するための管理。[p]
@jump target="*Q1_end"

*Q1_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q2 SLA／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q2】[r]
ITサービスの提供者と顧客の間でサービスレベルに関して取り交わすSLAの目的はどれか。
[glink  color="blue"  storage="ch1_3/scene3_1.ks"  size="22"  x="40"  width="1109"  y="151"  text="サービスの範囲と品質を明確にする。"  target="*Q2_ok"  ]
[glink  color="blue"  storage="ch1_3/scene3_1.ks"  size="22"  x="40"  width="1109"  y="212"  text="サービスマネジメントを定期的にチェックする手順を明確にする。"  target="*Q2_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_1.ks"  size="22"  x="40"  width="1109"  y="273"  text="システム化目標を明確にする。"  target="*Q2_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_1.ks"  size="22"  x="40"  width="1109"  y="334"  text="要員に必要な教育を明確にする。"  target="*Q2_ng"  ]
[s]

*Q2_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#先輩
お客様との約束だな！ これを破ると、大変だぜ！[p]
#
【解説】SLAは、サービスの範囲と品質（たとえば稼働率99.9%以上など）を、提供者と利用者の間で、あらかじめ決めておく約束。[p]
@jump target="*Q2_end"

*Q2_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
SLA は、サービスの約束事だぜ！[p]
#
【解説】SLAは、サービスの範囲と品質（たとえば稼働率99.9%以上など）を、提供者と利用者の間で、あらかじめ決めておく約束。[p]
@jump target="*Q2_end"

*Q2_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q3 インシデント管理／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q3】[r]
インシデント管理に関する記述のうち、適切なものはどれか。
[glink  color="blue"  storage="ch1_3/scene3_1.ks"  size="22"  x="40"  width="1109"  y="151"  text="SLAで定められた時間内で解決できないインシデントは、問題管理へ引き継ぐ。"  target="*Q3_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_1.ks"  size="22"  x="40"  width="1109"  y="212"  text="インシデントの再発防止のための対策を実施する。"  target="*Q3_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_1.ks"  size="22"  x="40"  width="1109"  y="273"  text="インシデントの原因追究よりも正常なサービス運用の回復を優先させる。"  target="*Q3_ok"  ]
[glink  color="blue"  storage="ch1_3/scene3_1.ks"  size="22"  x="40"  width="1109"  y="334"  text="解決方法が分かっているインシデントの発生は記録する必要はない。"  target="*Q3_ng"  ]
[s]

*Q3_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#先輩
インシデントが起きたら、まず、サービスを復旧するんだぜ！[p]
#
【解説】インシデント管理は、サービスの回復を、原因探しより先に行う。再発防止や根本原因の追究は、問題管理の仕事。[p]
@jump target="*Q3_end"

*Q3_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
インシデントは、原因探しより、まず復旧だ！ 再発防止は、問題管理の仕事だぜ！[p]
#
【解説】インシデント管理は、サービスの回復を、原因探しより先に行う。再発防止や根本原因の追究は、問題管理の仕事。[p]
@jump target="*Q3_end"

*Q3_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面転換：主人公が、AIに、議事録を頼んでいる]

#おまえ
AI、さっきの会議の議事録を、まとめて[p]
#AI
お任せください！ まとめました！ 決定事項は、『来週の月曜日に、システムを、停止する』です！[p]
#同期
えっ、システム停止なんて、決まってたっけ？[p]
#先輩
俺も、聞いてないぜ！[p]
#おまえ
あ……確かに、月曜日の話は、してたけど、決まってはいなかった[p]
#先輩
確認しろ！ 議事録は、会議の公式記録だぜ！[p]

;Q4 AI提案の見極め（議事録）／2択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
;選択肢1（f.ai_ok＋1）
;※不正解でも、先輩と同期が止めてくれる。被害は出ない（笑いで終わる）
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q4】[r]
AIがまとめた議事録を、どう扱う？
[glink  color="blue"  storage="ch1_3/scene3_1.ks"  size="22"  x="40"  width="1109"  y="151"  text="会議の内容と、照らし合わせて、確認してから共有する"  target="*Q4_ok"  ]
[glink  color="blue"  storage="ch1_3/scene3_1.ks"  size="22"  x="40"  width="1109"  y="212"  text="そのまま、全員に共有する"  target="*Q4_ng"  ]
[s]

*Q4_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1; f.ai_ok += 1"]
#
【正解！】[l][r]
#先輩
いいぞ！ 議事録は、確認してから出す！[p]
@jump target="*Q4_end"

*Q4_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
危なかったぜ！ 『決まってないこと』を、決まったことにするところだった！[p]
@jump target="*Q4_end"

*Q4_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q5 変更管理／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q5】[r]
動いているシステムの設定を、変更したい。どうする？
[glink  color="blue"  storage="ch1_3/scene3_1.ks"  size="22"  x="40"  width="1109"  y="151"  text="夜中に、こっそり、変更する"  target="*Q5_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_1.ks"  size="22"  x="40"  width="1109"  y="212"  text="自分の判断で、すぐに変更する"  target="*Q5_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_1.ks"  size="22"  x="40"  width="1109"  y="273"  text="変更の内容と影響を、関係者に確認してから、変更する"  target="*Q5_ok"  ]
[s]

*Q5_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#先輩
変更管理は、トラブル防止の基本だぜ！[p]
#
【解説】変更は、トラブルの原因になりやすい。内容と影響を確認して、承認を得てから実施する。[p]
@jump target="*Q5_end"

*Q5_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
勝手な変更が、障害を呼ぶんだ！ 必ず、確認だぜ！[p]
#
【解説】変更は、トラブルの原因になりやすい。内容と影響を確認して、承認を得てから実施する。[p]
@jump target="*Q5_end"

*Q5_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：業務前半の終わり]

#先輩
前半は、ここまで！ ハーフタイムだぜ！[p]
#おまえ
ありがとうございます[p]
#同期
さっきの議事録、危なかったな[p]
#おまえ
うん。AIも、間違えることが、あるんだな[p]
#同期
だから、確認が大事なんだよな[p]

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
サービス管理の基本が、しっかり入ってるな！[p]

[elsif exp="f.correct_am >= 2"]
;◆2〜3問正解のとき
#先輩
いい調子だぜ！ 後半も、頑張れ！[p]

[else]
;◆1問以下のとき
#先輩
ドンマイだぜ！ 用語が似てて、ややこしいからな！ 後半に、整理しよう！[p]
[endif]

;[場面：営業が、近づいてくる]

#営業
……そこの。AI、使ってるらしいな[p]
#おまえ
はい。便利です[p]
#営業
……便利なのは、わかる。……使いすぎるな[p]
#おまえ
え、はい[p]
#営業
……考えるのが、仕事。AIは、補助[p]
#おまえ
……はい[p]
#営業
……頼りすぎると、頭がさびる[p]
#おまえ
（耳が痛い）[p]

;[場面：社長が、通りがかる]

#社長
ふっ……AIを、使ってるそうだな[p]
#おまえ
はい[p]
#社長
いいか、よく聞け……AIは、ライセンス料が高いんだぜ……[p]
#おまえ
無駄には、使っていません[p]
;（立ち去る。なぜか、スキップで）
#社長
……ふっ[p]
#同期
社長、AIの費用が気になってんだな[p]
;（ツッコミ）
#おまえ
そこなんだ[p]

;=========================================
; 【業務後半】（問題5問）サービス管理の続き
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]

;[場面：午後・席に戻る]
[bg storage="bg_team_desk.gif" time="500"]

#先輩
後半は、インシデントが起きたときの、対応の話だぜ！[p]
障害は、必ず起きる。大事なのは、起きたときの動き方だ！ 失点したあとの、立て直しだぜ！[p]

;Q6 インシデント対応の初動／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
;※第3章2日目の障害への、伏線
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q6】[r]
システムに、障害が、起きた。最初にやるべきことは？
[glink  color="blue"  storage="ch1_3/scene3_1.ks"  size="22"  x="40"  width="1109"  y="151"  text="誰のせいか、犯人探しをする"  target="*Q6_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_1.ks"  size="22"  x="40"  width="1109"  y="212"  text="原因が、わかるまで、何もしない"  target="*Q6_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_1.ks"  size="22"  x="40"  width="1109"  y="273"  text="まず、サービスを、復旧させることを、優先する"  target="*Q6_ok"  ]
[s]

*Q6_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#先輩
復旧が、先だ！ 原因は、あとからだぜ！[p]
#
【解説】インシデント対応は、まず、サービスの復旧を優先する。原因の追究は、そのあと。[p]
@jump target="*Q6_end"

*Q6_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
犯人探しは、あとだ！ まず、お客様のサービスを戻すんだぜ！[p]
#
【解説】インシデント対応は、まず、サービスの復旧を優先する。原因の追究は、そのあと。[p]
@jump target="*Q6_end"

*Q6_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q7 稼働率（直列）／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=182 page=fore visible=true]
[font size=26]
#
【Q7】[r]
稼働率0.9の装置を2台直列に接続したシステムに、同じ装置をもう1台追加して3台直列のシステムにしたとき、システム全体の稼働率は2台直列のときを基準にすると、どのようになるか。
[glink  color="blue"  storage="ch1_3/scene3_1.ks"  size="22"  x="40"  width="1109"  y="190"  text="10%上がる。"  target="*Q7_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_1.ks"  size="22"  x="40"  width="1109"  y="251"  text="変わらない。"  target="*Q7_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_1.ks"  size="22"  x="40"  width="1109"  y="312"  text="10%下がる。"  target="*Q7_ok"  ]
[glink  color="blue"  storage="ch1_3/scene3_1.ks"  size="22"  x="40"  width="1109"  y="373"  text="30%下がる。"  target="*Q7_ng"  ]
[s]

*Q7_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#先輩
計算も、バッチリだな！[p]
#
【解説】直列の稼働率は、掛け算で求める。2台は0.9×0.9＝0.81、3台は0.9×0.9×0.9＝0.729。0.729÷0.81＝0.9なので、10%下がる。[p]
@jump target="*Q7_end"

*Q7_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
直列は、稼働率を掛け算する！ 台数が増えるほど、下がるんだぜ！[p]
#
【解説】直列の稼働率は、掛け算で求める。2台は0.9×0.9＝0.81、3台は0.9×0.9×0.9＝0.729。0.729÷0.81＝0.9なので、10%下がる。[p]
@jump target="*Q7_end"

*Q7_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面転換：主人公が、AIに、メールの下書きを頼む]

#おまえ
AI、お客様への、お詫びメールを、書いて[p]
#AI
お任せください！ 書きました！ 『このたびは、ご迷惑をおかけしました。原因は、すべて、お客様の操作ミスです』[p]
#同期
ちょっと待て！ それは、まずいだろ！[p]
#おまえ
あっ、本当だ。お客様のせいに、してる[p]
#先輩
お詫びで、お客様のせいにしたら、大炎上だぜ！[p]

;Q8 AI提案の見極め（お詫びメール）／2択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
;選択肢1（f.ai_ok＋1）
;※不正解でも、同期と先輩が止める。被害は、出さない
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q8】[r]
AIが書いた、お詫びメールを、どう扱う？
[glink  color="blue"  storage="ch1_3/scene3_1.ks"  size="22"  x="640"  width="500"  y="240"  text="内容を読んで、直してから、送る"  target="*Q8_ok"  ]
[glink  color="blue"  storage="ch1_3/scene3_1.ks"  size="22"  x="640"  width="500"  y="340"  text="そのまま、送る"  target="*Q8_ng"  ]
[s]

*Q8_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.ai_ok += 1"]
#
【正解！】[l][r]
#先輩
ナイス判断だぜ！ 送る前に、読む！ それが鉄則だ！[p]
@jump target="*Q8_end"

*Q8_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
それは、止めたぜ！ 危うく、大炎上だ！[p]
@jump target="*Q8_end"

*Q8_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q9 問題管理／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q9】[r]
ITサービスマネジメントにおける問題管理の事例はどれか。
[glink  color="blue"  storage="ch1_3/scene3_1.ks"  size="22"  x="40"  width="1109"  y="151"  text="障害再発防止に向けて、アプリケーションの不具合箇所を突き止めた。"  target="*Q9_ok"  ]
[glink  color="blue"  storage="ch1_3/scene3_1.ks"  size="22"  x="40"  width="1109"  y="212"  text="ネットワーク障害によって電子メールが送信できなかったので、電話で内容を伝えた。"  target="*Q9_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_1.ks"  size="22"  x="40"  width="1109"  y="273"  text="プリンターのトナーが切れたので、トナーの交換を行った。"  target="*Q9_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_1.ks"  size="22"  x="40"  width="1109"  y="334"  text="利用者からの依頼を受けて、パスワードの初期化を行った。"  target="*Q9_ng"  ]
[s]

*Q9_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#先輩
原因を突き止めて、再発を防ぐ。いい考え方だぜ！[p]
#
【解説】問題管理は、障害の根本の原因を突き止めて、再発を防ぐ活動。目の前の障害をとりあえず収めるのは、インシデント管理。[p]
@jump target="*Q9_end"

*Q9_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
根本原因を調べるのが、問題管理だぜ！[p]
#
【解説】問題管理は、障害の根本の原因を突き止めて、再発を防ぐ活動。目の前の障害をとりあえず収めるのは、インシデント管理。[p]
@jump target="*Q9_end"

*Q9_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q10 復習（バックアップと復元）／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=338 page=fore visible=true]
[font size=26]
#
【Q10】[r]
毎週日曜日の業務終了後にフルバックアップファイルを取得し、月曜日〜土曜日の業務終了後には増分バックアップファイルを取得しているシステムがある。水曜日の業務中に故障が発生したので、バックアップファイルを使って火曜日の業務終了時点の状態にデータを復元することにした。データ復元に必要なバックアップファイルを全て挙げたものはどれか。ここで、増分バックアップファイルとは、前回のバックアップファイル（フルバックアップファイル又は増分バックアップファイル）の取得以降に変更されたデータだけのバックアップファイルを意味する。
[glink  color="blue"  storage="ch1_3/scene3_1.ks"  size="22"  x="40"  width="1109"  y="346"  text="日曜日のフルバックアップファイル、月曜日と火曜日の増分バックアップファイル"  target="*Q10_ok"  ]
[glink  color="blue"  storage="ch1_3/scene3_1.ks"  size="22"  x="40"  width="1109"  y="407"  text="日曜日のフルバックアップファイル、火曜日の増分バックアップファイル"  target="*Q10_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_1.ks"  size="22"  x="40"  width="1109"  y="468"  text="月曜日と火曜日の増分バックアップファイル"  target="*Q10_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_1.ks"  size="22"  x="40"  width="1109"  y="529"  text="火曜日の増分バックアップファイル"  target="*Q10_ng"  ]
[s]

*Q10_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#先輩
備えは、大事だぜ！ リーダーも、言ってたな！[p]
#
【解説】復元には、土台になるフルバックアップと、そのあとの増分を、順番に全部使う。日曜日のフル、月曜日の増分、火曜日の増分、の3つが必要。[p]
@jump target="*Q10_end"

*Q10_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
土台のフルに、増分を順番に重ねるんだよ。全部、必要なんだ[p]
#
【解説】復元には、土台になるフルバックアップと、そのあとの増分を、順番に全部使う。日曜日のフル、月曜日の増分、火曜日の増分、の3つが必要。[p]
@jump target="*Q10_end"

*Q10_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：業務後半の終わり]

#先輩
試合終了だ！ AIの使い方も、勉強も、いい調子だな！[p]
#おまえ
はい。AIは、便利ですが、確認が、大事ですね[p]
#先輩
そうだ！ それを忘れるなよ！[p]
#リーダー
でも、ほんとに気をつけてね。便利さに慣れると、人は確認を忘れるから。……大事な話だから、ここで保存しとく？[p]
;（……忘れないようにしよう）
#おまえ
はい[p]
;※リーダーの、さりげない注意。明日の障害への、伏線

;=========================================
; 【終業後】（誰と過ごすか）
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]

;[場面：夕方・オフィス]
[bg storage="bg_office_evening.gif" time="500"]

#ナレーション
穏やかな一日が、終わった。夕日が、窓を染めている。[p]

;[選択肢：終業後（信頼度）]
;選択肢1：先輩の信頼度＋1
;選択肢2：同期の信頼度＋1
;選択肢3：リーダーの信頼度＋1
;選択肢4：営業の信頼度＋1
#ナレーション
今日の夕方、誰と過ごす？
[glink  color="blue"  storage="ch1_3/scene3_1.ks"  size="26"  x="266"  width="640"  y="120"  text="先輩と、サービス管理の用語を、整理する"  target="*c2_1"  ]
[glink  color="blue"  storage="ch1_3/scene3_1.ks"  size="26"  x="266"  width="640"  y="195"  text="同期と、AIの使い方について、話す"  target="*c2_2"  ]
[glink  color="blue"  storage="ch1_3/scene3_1.ks"  size="26"  x="266"  width="640"  y="270"  text="リーダーに、AIとの距離感について、聞く"  target="*c2_3"  ]
[glink  color="blue"  storage="ch1_3/scene3_1.ks"  size="26"  x="266"  width="640"  y="345"  text="営業に、AIを使った営業資料づくりの、コツを聞く"  target="*c2_4"  ]
[s]

*c2_1
[cm]
[eval exp="f.t_senpai += 1"]
;◆1を選んだ場合
#先輩
SLA、インシデント、問題管理。覚える用語が、多いな！[p]
でも、全部、お客様のための仕組みだぜ！[p]
#おまえ
はい[p]

@jump target="*c2_end"

*c2_2
[cm]
[eval exp="f.t_douki += 1"]
;◆2を選んだ場合
#同期
AIって、便利だけど、ちょっと怖ェよな[p]
#おまえ
怖い、っていうと？[p]
#同期
自信満々に、間違えるところだよ[p]
#おまえ
確かに。『100%』って、自分で言うし[p]

@jump target="*c2_end"

*c2_3
[cm]
[eval exp="f.t_leader += 1"]
;◆3を選んだ場合
#リーダー
AIは、道具だよ。頼りすぎると、自分で判断する力が、弱くなるね[p]
ときどき、AIを使わずに、自分で考える時間も、作ってね。おkかな[p]
#おまえ
（その通りだ）[p]

@jump target="*c2_end"

*c2_4
[cm]
[eval exp="f.t_eigyo += 1"]
;◆4を選んだ場合
#営業
……営業資料。AIに、下書きを書かせる[p]
……ただし、数字と、固有名詞は、自分の目で確認[p]
#おまえ
どうしてですか[p]
#営業
……AIは、数字と名前を、間違えやすい[p]
#おまえ
（先輩たちの話と、つながってきた）[p]
@jump target="*c2_end"

*c2_end
;=========================================
; 【自宅】（リザルト）
;=========================================
[playbgm storage="bgm_walk.mp3" restart="false"]

;[bg storage="（自宅の部屋（夜））" time="500"]
[bg storage="bg_home_night.gif" time="500"]

#ナレーション
布団に入って、今日を振り返る。[p]

;[リザルト表示]
;・今日の正解数：○／10
;・スキル：＋○
;・AI見極め回数：＋○（Q4、Q8で見極めたら、各＋1）
;・信頼度の変化：（選んだキャラ）＋1

;[ナレーション]
#おまえ
今日は、AIの間違いを、2回も、見つけた[p]
確認が、大事。みんなに、言われたとおりだ[p]
明日も、この調子で、いこう[p]
;※「明日は大丈夫」と、軽く思っているところが、2日目の落差になる

#ナレーション
第3章 2日目へ。[p]

;=========================================
;■ 次回予告（第3章 2日目）
;障害発生（ディスク逼迫）。AIが「ログを全部消せば直る」と、自信満々に提案。
;主人公は、AIの提案を、鵜呑みにして、障害を悪化させる。
;出題：運用（ディスク、プロセスの確認）
;※今までで一番重い、挫折の章に入る
;■ 未決定
;・社長以外の名前
;・各問題の中身（仮。見直す前提）
;・2日目の失敗が、必ず起きるか、プレイヤーの選択で避けられるか（これは、決めるのが、あと回しの項目）
;・1日目のAI検証（Q4、Q8）は、見逃しても被害なし。2日目の落差を作るための、設計

;次のファイルへ
@jump storage="ch1_3/scene3_2.ks"
