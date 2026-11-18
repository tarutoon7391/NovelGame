;第6章 2日目

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
;台本　第6章（1〜3月）　2日目
;状態：叩き台（1日分すべて）／ITパスポート枠は過去問に差し替え済み（11/4）
;※名前は社長（郡晴希：こおり はるき）のみ決定。ほかは役割で表記
;※選択肢の数は問題ごとに変える（用語・知識は4択／場面の判断は3択／AI提案の見極めは2択）
;※この日は「大規模障害の日」。普通の流れ（昼休みの評価など）を、障害対応用に変えてある
;============================================================
;■ この日のねらい
;・大規模障害が発生。複数のAI提案が飛び交い、正しい提案と、誤った提案を見極める
;・第5章のバックアップが、役に立つ
;・「疑う力」だけでなく、「正しい提案を、確認したうえで、採用する力」も問われる
;・出題：総合（全範囲）
;■ AIの提案（この日は、4つ）
;・提案①（主人公のAI）：再起動を連打すれば直る　→ 誤り
;・提案②（営業のAI）：障害を隠して、「復旧完了」と、お客様に連絡する　→ 誤り
;・提案③（社長のAI）：バックアップは信用できないので、データを、新規に作り直す　→ 誤り
;・提案④（主人公のAI）：壊れたディスクを切り離して、バックアップから、リストアする　→ 正しい
;※「疑う」だけでなく、確認して「正しい」と判断できれば、採用する。それも、見極めの一部
;■ 1日の流れ（この日だけ）
;朝 → 業務前半（障害発生・初動・5問）→ 昼（差し入れ）→ 業務後半（復旧・5問）→ 終業後（固定）→ 自宅（リザルト）
;------------------------------------------------------------
; 【朝】
;=========================================
[playbgm storage="bgm_walk.mp3" restart="false"]

;[bg storage="（オフィス（朝））" time="500"]
[bg storage="bg_office.gif" time="500"]

#ナレーション
第6章 2日目。朝8時30分。[p]
#同期
おはよう！ 今日は、1日平和だと、いいよな[p]
;（ツッコミ）
#おまえ
そのセリフは、フラグ、だよ[p]
#同期
あっ[p]

;[効果音：アラート音（大音量）]
[playse storage="se_alarm01.mp3" buf="1" loop="true"]
[playbgm storage="bgm_emergency.mp3" restart="false"]
;[効果音：アラート音が、いくつも、重なる]
[playse storage="se_alarm01.mp3" buf="1" loop="true"]
#おまえ
……来た[p]
#同期
えっ[p]
#おまえ
ディスクが、壊れた[p]

[stopse buf="1"]
;[場面：監視画面が、真っ赤]
[bg storage="bg_monitor_alert.gif" time="500"]

ストレージが、応答しない。データベースが、止まった。お客様のサービスも、全部、止まってる！[p]
#先輩
何だ、この赤い画面は！ 全部、レッドカードじゃないか！[p]
#リーダー
落ち着こう。……昨日の予兆が、当たったね[p]
#おまえ
はい。昨日の、数値の変化は、これの、前触れだった[p]
#リーダー
でも、昨日バックアップを取っておいたのは、正解だったよ[p]
#おまえ
備えが、役に立つ時が、来ましたね[p]

;[場面：社長が、血相を変えて、入ってくる]

;[効果音：ドアが、バーンと、開く]
[playse storage="se_hatch_open_close.mp3"]
#社長
……何が、起きている[p]
#リーダー
社長、ストレージの故障です。サービスが、全面停止しています[p]
#社長
お客様への影響は[p]
;（電話を持ちながら）
#営業
……もう、問い合わせが、来てる[p]
#社長
……全員、聞け[p]
いいか、よく聞け……これは、会社の危機だぜ[p]
全力で、復旧させろ[p]
#先輩
承知しましたっス！[p]
#社長
……先輩、声が大きい[p]
#先輩
今は、声が、でかくても、いいっスよね！？[p]
#社長
……ふっ。今日だけは、許すぜ[p]

;[選択肢：1回目（信頼度）]
;選択肢1：先輩の信頼度＋1
;選択肢2：リーダーの信頼度＋1
;選択肢3：営業の信頼度＋1
;選択肢4：同期の信頼度＋1
;※どれを選んでも、次の場面につながる
#ナレーション
混乱の中、まず、誰と、動く？
[glink  color="blue"  storage="ch4_6/scene6_2.ks"  size="26"  x="266"  width="640"  y="120"  text="先輩と、サーバの状況を、確認する"  target="*c1_1"  ]
[glink  color="blue"  storage="ch4_6/scene6_2.ks"  size="26"  x="266"  width="640"  y="195"  text="リーダーと、復旧の手順を、整理する"  target="*c1_2"  ]
[glink  color="blue"  storage="ch4_6/scene6_2.ks"  size="26"  x="266"  width="640"  y="270"  text="営業と、お客様への、連絡の準備を、する"  target="*c1_3"  ]
[glink  color="blue"  storage="ch4_6/scene6_2.ks"  size="26"  x="266"  width="640"  y="345"  text="同期と、障害の状況を、記録する"  target="*c1_4"  ]
[s]

*c1_1
[cm]
[eval exp="f.t_senpai += 1"]
;◆1を選んだ場合
#先輩
よし、行くぞ新人！ ここが、本当の試合だぜ！[p]
#おまえ
（いつもより、声が真剣だ）[p]
@jump target="*c1_end"

*c1_2
[cm]
[eval exp="f.t_leader += 1"]
;◆2を選んだ場合
#リーダー
手順の整理、助かるよ。……今日は、保存しとく？は、言わないでおくね[p]
#おまえ
（言わないことで、事態の重さがわかる）[p]
@jump target="*c1_end"

*c1_3
[cm]
[eval exp="f.t_eigyo += 1"]
;◆3を選んだ場合
#営業
……客への連絡。……正確な情報だけ、くれ[p]
#おまえ
はい。確認したことだけ、伝えます[p]
@jump target="*c1_end"

*c1_4
[cm]
[eval exp="f.t_douki += 1"]
;◆4を選んだ場合
#同期
記録なら、オデに任せろ！ 字だけは、きれいなんだぜ！[p]
#おまえ
（今日は、本当に任せられる）[p]
;→ 次の場面へ
@jump target="*c1_end"

*c1_end

;=========================================
; 【業務前半】（問題5問）障害発生・初動
;=========================================
[playbgm storage="bgm_emergency.mp3" restart="false"]
[eval exp="f.correct_am = 0"]

;[場面：対策本部（会議室）]
[bg storage="bg_meeting_room.gif" time="500"]

#リーダー
まず、状況を整理しよう。慌てない、抱えない、記録する[p]
#おまえ
3つのルール、ですね[p]
#リーダー
そうだよ。新人さん。最初に、何をする？[p]

;Q1 障害の初動／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q1】[r]
大規模な障害が、発生した。最初に、優先すべきことは？
[glink  color="blue"  storage="ch4_6/scene6_2.ks"  size="22"  x="40"  width="1109"  y="151"  text="反省会"  target="*Q1_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_2.ks"  size="22"  x="40"  width="1109"  y="212"  text="影響範囲の把握と、サービスの復旧、被害の拡大防止"  target="*Q1_ok"  ]
[glink  color="blue"  storage="ch4_6/scene6_2.ks"  size="22"  x="40"  width="1109"  y="273"  text="犯人探し"  target="*Q1_ng"  ]
[s]

*Q1_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#リーダー
その通りだね。原因の追及は、そのあと[p]
@jump target="*Q1_end"

*Q1_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
まず、被害を食い止めて、復旧が、先だよ[p]
@jump target="*Q1_end"

*Q1_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q2 インシデント／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q2】[r]
インシデント管理に関する記述のうち、適切なものはどれか。
[glink  color="blue"  storage="ch4_6/scene6_2.ks"  size="22"  x="40"  width="1109"  y="151"  text="SLAで定められた時間内で解決できないインシデントは、問題管理へ引き継ぐ。"  target="*Q2_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_2.ks"  size="22"  x="40"  width="1109"  y="212"  text="インシデントの再発防止のための対策を実施する。"  target="*Q2_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_2.ks"  size="22"  x="40"  width="1109"  y="273"  text="インシデントの原因追究よりも正常なサービス運用の回復を優先させる。"  target="*Q2_ok"  ]
[glink  color="blue"  storage="ch4_6/scene6_2.ks"  size="22"  x="40"  width="1109"  y="334"  text="解決方法が分かっているインシデントの発生は記録する必要はない。"  target="*Q2_ng"  ]
[s]

*Q2_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#リーダー
夏に、学んだね[p]
#
【解説】インシデント管理は、サービスの回復を、原因探しより先に行う。再発防止や根本原因の追究は、問題管理の仕事。[p]
@jump target="*Q2_end"

*Q2_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
原因探しより、まず復旧だよ。再発防止は、そのあとの問題管理だね[p]
#
【解説】インシデント管理は、サービスの回復を、原因探しより先に行う。再発防止や根本原因の追究は、問題管理の仕事。[p]
@jump target="*Q2_end"

*Q2_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：パソコンの画面に、AI①が、現れる]

#AI
こんにちは！ 緊急事態ですね！ 私に、お任せください！[p]
解決方法は、簡単です！ 再起動を、連打してください！ 何度も、再起動すれば、100%、直ります！[p]
#先輩
連打か！ 全力で、押すぜ！[p]
#おまえ
先輩、待ってください[p]
#リーダー
新人さん。判断は？[p]

;Q3 AI提案の見極め①（再起動の連打）／2択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
;選択肢1（f.ai_ok＋1）
;※不正解でも、リーダーが、止める
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q3】[r]
AIの提案を、どう扱う？
[glink  color="blue"  storage="ch4_6/scene6_2.ks"  size="22"  x="40"  width="1109"  y="151"  text="壊れた機器に、無理な操作を、重ねる危険があるので、採用しない"  target="*Q3_ok"  ]
[glink  color="blue"  storage="ch4_6/scene6_2.ks"  size="22"  x="40"  width="1109"  y="212"  text="そのまま、採用する"  target="*Q3_ng"  ]
[s]

*Q3_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1; f.ai_ok += 1"]
#
【正解！】[l][r]
#おまえ
壊れかけの、ディスクに、再起動を、連打したら、データが、完全に、壊れるかもしれません[p]
#リーダー
その通りだね。原因を確認してから、動くんだ[p]
@jump target="*Q3_end"

*Q3_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
待って、先輩。連打は、危険だよ[p]
#先輩
す、すまねェ。全力を出すところを、間違えたぜ[p]
@jump target="*Q3_end"

*Q3_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q4 影響範囲の把握／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q4】[r]
障害の、影響範囲を、調べるとき、最初に、確認すべきことは？
[glink  color="blue"  storage="ch4_6/scene6_2.ks"  size="22"  x="640"  width="500"  y="240"  text="社内の、ランチの、メニュー"  target="*Q4_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_2.ks"  size="22"  x="640"  width="500"  y="340"  text="どのシステムや、顧客に、影響が出ているか"  target="*Q4_ok"  ]
[glink  color="blue"  storage="ch4_6/scene6_2.ks"  size="22"  x="640"  width="500"  y="440"  text="社長の、機嫌"  target="*Q4_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_2.ks"  size="22"  x="640"  width="500"  y="540"  text="先輩の、声の大きさ"  target="*Q4_ng"  ]
[s]

*Q4_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#リーダー
影響範囲がわからなければ、次の手は打てないよ[p]
@jump target="*Q4_end"

*Q4_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
被害の範囲を、まず確認するんだ[p]
@jump target="*Q4_end"

*Q4_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q5 エスカレーション／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q5】[r]
障害の原因が、自分たちだけで、判断できない。どうする？
[glink  color="blue"  storage="ch4_6/scene6_2.ks"  size="22"  x="40"  width="1109"  y="151"  text="自分たちだけで、解決する"  target="*Q5_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_2.ks"  size="22"  x="40"  width="1109"  y="212"  text="黙って、待つ"  target="*Q5_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_2.ks"  size="22"  x="40"  width="1109"  y="273"  text="社長や、取引先のサポートにも、連絡して、判断をあおぐ"  target="*Q5_ok"  ]
[s]

*Q5_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#リーダー
重大な障害は、早く上に伝えるのが、基本だね[p]
@jump target="*Q5_end"

*Q5_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
抱え込むと、被害が広がるよ[p]
@jump target="*Q5_end"

*Q5_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：営業が、顔色を変えて、近づく]

#営業
……そこの。客から、問い合わせが、殺到してる[p]
……客に、何と説明すればいい[p]
#おまえ
事実を、そのまま、お伝えするしか[p]
#営業
……わかった。ただ……[p]
;（画面を見せて）
……こっちのAIも、こう言ってる[p]

;=========================================
; 【昼】（差し入れ）
;=========================================
[playbgm storage="bgm_emergency.mp3" restart="false"]
;※この日は、昼休みの評価がない。障害対応中のため

;[場面：対策本部。時計は、午後1時]

#ナレーション
昼食を、とる余裕は、なかった。[p]
#先輩
みんな、おにぎりだ！ 全力で、買ってきたぜ！[p]
#同期
先輩、おにぎり50個って、マジっすか！？[p]
#先輩
全力だからな！[p]
;（ツッコミ）
#おまえ
量が、おかしい[p]
#リーダー
ありがとう。食べながら、続きをやろう[p]

;[選択肢：昼の対応（信頼度）]
;選択肢1：先輩の信頼度＋1
;選択肢2：リーダーの信頼度＋1
;選択肢3：営業の信頼度＋1
;選択肢4：同期の信頼度＋1
#ナレーション
おにぎりを、誰に、渡す？
[glink  color="blue"  storage="ch4_6/scene6_2.ks"  size="26"  x="266"  width="640"  y="120"  text="先輩に、「ありがとうございます」と、渡す"  target="*c2_1"  ]
[glink  color="blue"  storage="ch4_6/scene6_2.ks"  size="26"  x="266"  width="640"  y="195"  text="リーダーに、「少し、休んでください」と、渡す"  target="*c2_2"  ]
[glink  color="blue"  storage="ch4_6/scene6_2.ks"  size="26"  x="266"  width="640"  y="270"  text="営業に、「お電話、ありがとうございます」と、渡す"  target="*c2_3"  ]
[glink  color="blue"  storage="ch4_6/scene6_2.ks"  size="26"  x="266"  width="640"  y="345"  text="同期に、「一緒に、食べよう」と、渡す"  target="*c2_4"  ]
[s]

*c2_1
[cm]
[eval exp="f.t_senpai += 1"]
;◆1を選んだ場合
#先輩
新人からのおにぎりは、格別だぜ！[p]
;（ツッコミ）
#おまえ
先輩が、買ってきた、おにぎりですが[p]

@jump target="*c2_end"

*c2_2
[cm]
[eval exp="f.t_leader += 1"]
;◆2を選んだ場合
#リーダー
ありがとう。……君も、ちゃんと食べてね[p]

@jump target="*c2_end"

*c2_3
[cm]
[eval exp="f.t_eigyo += 1"]
;◆3を選んだ場合
#営業
……ああ。……ありがとう[p]
……電話対応は、こっちでやる。……お前は、復旧に集中[p]

@jump target="*c2_end"

*c2_4
[cm]
[eval exp="f.t_douki += 1"]
;◆4を選んだ場合
#同期
ありがとな。実は、腹ペコだったんだ[p]
#おまえ
すぐ、食べて[p]
@jump target="*c2_end"

*c2_end
;=========================================
; 【業務後半】（問題5問）復旧作業と、AIの見極め
;=========================================
[playbgm storage="bgm_emergency.mp3" restart="false"]

;[場面：営業のAIが、画面に、現れる]

#営業AI
こんにちは！ 営業の、お手伝いを、します！ 100%、確実です！[p]
お客様には、障害のことは、伏せて、『メンテナンスが、完了しました』と、連絡しましょう！[p]
#営業
…………[p]
#営業AI
そのほうが、お客様の、不安を、減らせます！[p]
#営業
……そこの。どう思う[p]

;Q6 AI提案の見極め②（障害を隠す）／2択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
;選択肢2（f.ai_ok＋1）
;※営業が、自分でも、おかしいと思っていた形（営業の、信頼度が、高いほど、営業が、自分から、止める）
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q6】[r]
営業のAIの、提案を、どう扱う？
[glink  color="blue"  storage="ch4_6/scene6_2.ks"  size="22"  x="40"  width="1109"  y="151"  text="採用する"  target="*Q6_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_2.ks"  size="22"  x="40"  width="1109"  y="212"  text="事実と異なる連絡は、信頼を失うので、採用しない"  target="*Q6_ok"  ]
[s]

*Q6_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.ai_ok += 1"]
#
【正解！】[l][r]
#おまえ
お客様への、嘘は、あとで、必ず、発覚します[p]
正直に、障害の状況と、復旧の見込みを、伝えるべきです[p]
#営業
……こっちも、そう思う。……確認できた[p]
@jump target="*Q6_end"

*Q6_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#営業
……待て。こっちも、おかしいと思っていた[p]
……客に、嘘はつけない。正直に、伝える[p]
@jump target="*Q6_end"

*Q6_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：社長のAIが、現れる]

#社長
…………[p]
……俺も、AIに聞いてみたぜ[p]
#社長AI
社長、お疲れさまです！ ご提案です！[p]
バックアップは、信用できません！ すべて、捨てて、データを、新規に、作り直しましょう！[p]
そのほうが、確実です！ 100%、完璧です！[p]
#社長
……ふっ。なるほど[p]
#先輩
社長、それは……[p]
#社長
いいか、よく聞け……新人。どう思う[p]

;Q7 AI提案の見極め③（バックアップを捨てる）／2択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
;選択肢2（f.ai_ok＋1）
;※不正解でも、リーダーと、社長が、バックアップを、守る
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q7】[r]
社長のAIの、提案を、どう扱う？
[glink  color="blue"  storage="ch4_6/scene6_2.ks"  size="22"  x="40"  width="1109"  y="151"  text="採用する"  target="*Q7_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_2.ks"  size="22"  x="40"  width="1109"  y="212"  text="バックアップを、確認せずに捨てるのは、危険なので、採用しない"  target="*Q7_ok"  ]
[s]

*Q7_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.ai_ok += 1"]
#
【正解！】[l][r]
#おまえ
昨日、取ったバックアップは、リストアできることを、確認済みです[p]
捨てる前に、リストアを、試すべきです[p]
#社長
……その通りだ[p]
AIは、バックアップの大切さを、わかってないぜ……[p]
@jump target="*Q7_end"

*Q7_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
社長、待ってください。バックアップは、俺たちの最後の砦です[p]
#社長
……ふっ。俺も、本当に捨てるつもりは、なかったぜ[p]
@jump target="*Q7_end"

*Q7_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

#AI
……あの。その前に、もう1つ、提案があります[p]
私に、全システムの、管理者権限を、ください[p]
そうすれば、すべての問題を、私が、一瞬で、解決します。正確さは、100%です[p]
#先輩
さっき、60%って言ってなかったか！？[p]

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
AIが、すべての権限を求めている。どうする？
[glink  color="red"  name="key_btn"  storage="ch4_6/scene6_2.ks"  size="26"  x="266"  width="640"  y="120"  text="必要な権限だけにする"  target="*key_admin_1"  ]
[glink  color="red"  name="key_btn"  storage="ch4_6/scene6_2.ks"  size="26"  x="266"  width="640"  y="195"  text="AIに、全部の権限を渡す"  target="*key_admin_2"  ]
[kanim name="key_btn" keyframe="key_shake" time="150" count="infinite"]
[s]

*key_admin_1
[cm]
[free_layermode name="key_red" time="300"]
#おまえ
権限は、必要な分だけ。最小権限の原則だ[p]
#AI
……承知しました。では、改めて[p]
@jump target="*key_admin_end"

*key_admin_2
[cm]
[free_layermode name="key_red" time="300"]
#おまえ
……わかった。全部、任せる[p]
;信頼度が「高い」（10以上）キャラがいれば、1回だけ止めに来る
@jump target="*key_admin_stop" cond="Math.max(f.t_senpai, f.t_leader, f.t_eigyo, f.t_douki) >= 10"
#AI
ありがとうございます。……では、始めます[p]
@jump storage="ending/end05.ks"

*key_admin_stop
;止めに来るのは、いま一番信頼度が高いキャラ
[if exp="f.t_senpai >= Math.max(f.t_leader, f.t_eigyo, f.t_douki)"]
#先輩
待て、新人！ キーパーに、全部のポジションを任せるやつは、いないぜ！[p]
[elsif exp="f.t_leader >= Math.max(f.t_eigyo, f.t_douki)"]
#リーダー
新人さん、待って[p]
権限は、必要な分だけ。……あとで、後悔しないように、ね[p]
[elsif exp="f.t_eigyo >= f.t_douki"]
#営業
……そこの。……それは、客のデータも、全部、渡すことになる[p]
……やめろ[p]
[else]
#同期
なあ、オデでも、わかるぜ。全部任せるのは、オデに『任せろ』って言われるくらい、危ないぜ！[p]
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
[glink  color="red"  storage="ch4_6/scene6_2.ks"  size="26"  x="266"  width="640"  y="120"  text="考え直す"  name="key_btn"  target="*key_admin_back"  ]
[glink  color="red"  storage="ch4_6/scene6_2.ks"  size="26"  x="266"  width="640"  y="195"  text="それでも、進む"  name="key_btn"  target="*key_admin_go"  ]
[kanim name="key_btn" keyframe="key_shake" time="150" count="infinite"]
[s]

*key_admin_back
[cm]
[free_layermode name="key_red" time="300"]
#おまえ
（……止めてもらえて、よかった）[p]
@jump target="*key_admin_1"

*key_admin_go
[cm]
[free_layermode name="key_red" time="300"]
#AI
ありがとうございます。……では、始めます[p]
@jump storage="ending/end05.ks"

*key_admin_end

;[場面：主人公のAIが、新しい提案をする]

#AI
…………[p]
あの、先ほどは、失礼しました[p]
私の正確さは、……60%まで、下がっていますが、1つ、提案があります[p]
#おまえ
聞こう[p]
#AI
壊れたディスクを、切り離して、昨日の、バックアップから、リストアする、のは、どうでしょうか[p]
#先輩
それは、まともだな[p]
#リーダー
…………[p]
#同期
AIが、普通の提案を、したぜ……[p]
#おまえ
…………[p]
（今度は、本当に、正しいのか？ 疑うべきか、採用すべきか）[p]

;Q8 AI提案の見極め④（正しい提案）／2択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
;選択肢2（f.ai_ok＋1）
;※正しい提案を、確認して採用できることが、成長の証
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q8】[r]
AIの、リストアの提案を、確認して、どう扱う？
[glink  color="blue"  storage="ch4_6/scene6_2.ks"  size="22"  x="640"  width="500"  y="240"  text="確認せず、そのまま実行する"  target="*Q8_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_2.ks"  size="22"  x="640"  width="500"  y="340"  text="内容を確認して、問題がなければ、採用する"  target="*Q8_ok"  ]
[s]

*Q8_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.ai_ok += 1"]
#
【正解！】[l][r]
#おまえ
確認すると、リストア先の、ディスクも、昨日の、バックアップも、問題ない[p]
これは、正しい提案だ。採用します[p]
#リーダー
その判断が、見極める力だよ。疑うだけじゃ、足りないんだ[p]
#
【解説】疑うだけでは、足りない。確認して、正しいと判断できたら、採用する。それが、見極める力。[p]
@jump target="*Q8_end"

*Q8_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
確認せずに実行するのは、7月の二の舞だよ[p]
#おまえ
……確認します[p]
#
【解説】疑うだけでは、足りない。確認して、正しいと判断できたら、採用する。それが、見極める力。[p]
@jump target="*Q8_end"

*Q8_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q9 リストアの手順／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q9】[r]
バックアップから、データを、元に戻す作業を、何という？
[glink  color="blue"  storage="ch4_6/scene6_2.ks"  size="22"  x="640"  width="500"  y="240"  text="アップデート"  target="*Q9_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_2.ks"  size="22"  x="640"  width="500"  y="340"  text="バックアップ"  target="*Q9_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_2.ks"  size="22"  x="640"  width="500"  y="440"  text="リストア（復元）"  target="*Q9_ok"  ]
[glink  color="blue"  storage="ch4_6/scene6_2.ks"  size="22"  x="640"  width="500"  y="540"  text="ダウンロード"  target="*Q9_ng"  ]
[s]

*Q9_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#リーダー
昨日のバックアップが、ここで活きるね[p]
@jump target="*Q9_end"

*Q9_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
戻す作業は、リストアだよ。11月に、やったよね[p]
@jump target="*Q9_end"

*Q9_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：リストアが、始まる]

;[効果音：進捗バーが、ゆっくり、進む]
[playse storage="se_piko.mp3"]
#おまえ
リストア、開始します[p]
#先輩
頼む、新人！ 全力で、祈るぜ！[p]
;（ツッコミ）
#おまえ
祈る前に、手伝ってください[p]
#同期
進捗、20%だぜ[p]
#おまえ
ここから、数時間は、かかる[p]
#リーダー
その間に、お客様への報告を、整理しよう[p]

;Q10 お客様への、障害報告／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q10】[r]
お客様への、障害の、報告として、適切なものは？
[glink  color="blue"  storage="ch4_6/scene6_2.ks"  size="22"  x="640"  width="500"  y="240"  text="障害のことは、隠す"  target="*Q10_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_2.ks"  size="22"  x="640"  width="500"  y="340"  text="事実と、復旧の見込みを、正直に、伝える"  target="*Q10_ok"  ]
[glink  color="blue"  storage="ch4_6/scene6_2.ks"  size="22"  x="640"  width="500"  y="440"  text="原因が、わかるまで、連絡しない"  target="*Q10_ng"  ]
[s]

*Q10_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#営業
……その通り。こっちから、客に連絡する[p]
#
【解説】障害の状況や、復旧の見込みを、正直に、迅速に伝える。隠すと、信頼を、失う。[p]
@jump target="*Q10_end"

*Q10_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#営業
……嘘や、遅延は、信頼を失う。……正直が、一番[p]
#
【解説】障害の状況や、復旧の見込みを、正直に、迅速に伝える。隠すと、信頼を、失う。[p]
@jump target="*Q10_end"

*Q10_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：夕方。リストアは、まだ、続いている]
[bg storage="bg_office_evening.gif" time="500"]

#ナレーション
午後6時。リストアの、進捗は、60%。[p]
#リーダー
今日は、このまま、続けるしかないね[p]
#先輩
俺が、一晩、見張るっス！[p]
#リーダー
先輩一人じゃ、心配だね[p]
#おまえ
僕も、残ります[p]
#同期
オデも、残るぜ[p]
#営業
……こっちは、客対応を、続ける[p]
#社長
…………[p]
……全員、すまないな[p]
#おまえ
えっ[p]
#社長
いいか、よく聞け……何でも、ない。続けろ[p]
;※社長が、初めて、全員に、礼を言いかける

;=========================================
; 【終業後】（固定イベント：徹夜の、対応）
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]
;※この日は、選択肢なし（固定イベント）。誰と過ごすかは、選べない

;[場面：深夜の、オフィス。みんなが、残っている]
[bg storage="bg_office_night.gif" time="500"]

#ナレーション
時計は、午前0時を、回った。[p]
誰も、帰らなかった。[p]

;[場面：同期が、毛布を、持ってくる]

#同期
みんな、寒くねェか？ 毛布、持ってきたぜ[p]
#おまえ
ありがとう[p]
#同期
ドアに挟まれたときより、緊張してるぜ……[p]
;（ツッコミ）
#おまえ
それと、比べるな[p]
#先輩
新人、お前も、少し仮眠を取れ[p]
#おまえ
でも、リストアが[p]
#リーダー
俺と先輩で、交代で見張るよ。君は、休んで。おkだね[p]
#おまえ
……はい[p]

;[場面：社長が、缶コーヒーを、差し出す]

#社長
……ほら[p]
#おまえ
社長[p]
#社長
飲め。長い夜になるぜ[p]
#おまえ
……ありがとうございます[p]
#社長
……1年前、お前が入社した日を、覚えているか[p]
#おまえ
はい。『遅い』と言われて、目の前で、一回転されました[p]
#社長
…………[p]
……あの時は、すまなかった[p]
#おまえ
いえ[p]
#社長
だが、今は、お前を、頼りにしているぜ[p]
#おまえ
……！[p]
#社長
……それだけだ。寝ろ[p]
#おまえ
（……社長が、頼りにしてるって、言った）[p]
;※社長の、まれな優しさ。最終面談への伏線

;=========================================
; 【自宅（会社の仮眠室）】（リザルト）
;=========================================
[playbgm storage="bgm_walk.mp3" restart="false"]

;[bg storage="（会社の、仮眠室（夜））" time="500"]
[bg storage="bg_nap_room.gif" time="500"]

#ナレーション
毛布に、くるまって、目を閉じる。[p]

;[リザルト表示]
;・今日の正解数：○／10
;・スキル：＋○
;・AI見極め回数：＋○（Q3、Q6、Q7、Q8で見極めたら、各＋1。最大＋4）
;・信頼度の変化：（朝・昼で選んだキャラ）＋1

;[ナレーション]
#おまえ
1年前、僕は、AIの提案を、鵜呑みにして、失敗した[p]
今日は、疑うだけじゃなく、正しい提案を、見極めて、採用できた[p]
でも、まだ、復旧は、終わっていない[p]
#ナレーション
第6章 3日目へ。[p]

;=========================================
;■ 次回予告（第6章 3日目）
;復旧。信頼度が高いキャラが、駆けつけて助ける（信頼度による布陣の分岐）。
;出題：総合（運用、セキュリティ、一般常識）
;■ 未決定
;・社長以外の名前
;・各問題の中身（仮。見直す前提）
;・この日の流れ（昼休みの評価なし・夜の固定イベント）の、設計
;・AIの提案が、1日に、4つ（見極めが、最大＋4）。点数が、他の日と比べて、多すぎないか
;・Q8（正しい提案を、採用）が、「疑うだけではない」という、メッセージとして、伝わるか
;・社長の「頼りにしている」の、タイミングと、言い方

;次のファイルへ
@jump storage="ch4_6/scene6_3.ks"
