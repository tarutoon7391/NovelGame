;第5章 2日目

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
;台本　第5章（11〜12月）　2日目
;状態：叩き台（1日分すべて）
;※名前は社長（郡晴希：こおり はるき）のみ決定。ほかは役割で表記
;※選択肢の数は問題ごとに変える（用語・知識は4択／場面の判断は3択／AI提案の見極めは2択）
;============================================================
;■ この日のねらい
;・先輩と、作業の自動化に取り組む
;・AIが自動化スクリプトを提案し、主人公が、疑って、小さな誤りを見つける
;・出題：運用（シェルスクリプト、cron）を少し、ITパスポート（情報の扱い）
;・第5章末のバッドエンド（自動化の確認不足でデータ消失）への、伏線になる日
;■ 1日の流れ
;朝 → 業務前半（5問）→ 昼休み → 業務後半（5問）→ 終業後 → 自宅（リザルト）
;------------------------------------------------------------
; 【朝】
;=========================================
[playbgm storage="bgm_walk.mp3" restart="false"]

;[bg storage="（オフィス（朝））" time="500"]
[bg storage="bg_office.gif" time="500"]

#ナレーション
第5章 2日目。今日は、ドアが、ちゃんと、開いた。[p]
#同期
ドアが、直ってるぜ……[p]
#おまえ
直ったのに、残念そうだね[p]
#同期
挟まれない毎日に、まだ慣れなくてよ[p]
;（ツッコミ）
#おまえ
慣れて[p]

;[場面：先輩が、気合い十分で、登場]

#先輩
おはよう、新人！ 今日は、自動化だぜ！[p]
#おまえ
自動化、ですか[p]
#先輩
そうだ！ 毎日同じ作業を、機械に任せる！ 全自動だぜ！[p]
俺は、全力でサボるぜ！[p]
;（ツッコミ）
#おまえ
サボる宣言は、まずいです[p]
#リーダー
先輩の言う『サボる』は、人の作業を減らして、人が判断に集中する、って意味だね[p]
#先輩
そう、それっス！[p]
#リーダー
……たぶんね[p]
#先輩
たぶん、は言わないでほしいっス！[p]

;[場面：営業が、顔を出す]

#営業
……運用。毎朝のサーバの状態報告。自動で、メールにできないか[p]
#先輩
いい提案だぜ！ 今日の自動化のテーマにしよう！[p]
#営業
……頼む。……間違った情報は、送るな[p]
#おまえ
確認します[p]
#営業
……ああ。それが、一番大事[p]

;[選択肢：1回目（信頼度）]
;選択肢1：先輩の信頼度＋1
;選択肢2：営業の信頼度＋1
;選択肢3：同期の信頼度＋1
;※どれを選んでも、次の場面につながる
#ナレーション
自動化に取り組む前に、誰と話す？
[glink  color="blue"  storage="ch4_6/scene5_2.ks"  size="26"  x="266"  width="640"  y="120"  text="先輩に、自動化の進め方を、聞く"  target="*c1_1"  ]
[glink  color="blue"  storage="ch4_6/scene5_2.ks"  size="26"  x="266"  width="640"  y="195"  text="営業に、報告メールで、何を、知りたいかを、聞く"  target="*c1_2"  ]
[glink  color="blue"  storage="ch4_6/scene5_2.ks"  size="26"  x="266"  width="640"  y="270"  text="同期に、「一緒に、やってみない？」と、誘う"  target="*c1_3"  ]
[s]

*c1_1
[cm]
[eval exp="f.t_senpai += 1"]
;◆1を選んだ場合
#先輩
進め方か！ まずは、ゴールを決める！ 何を自動にしたいか、だぜ！[p]
#おまえ
（今日は、珍しく本当にゴールの話だ）[p]
@jump target="*c1_end"

*c1_2
[cm]
[eval exp="f.t_eigyo += 1"]
;◆2を選んだ場合
#営業
……知りたいのは、異常の有無。……それだけ[p]
#おまえ
（要件まで短い）[p]
@jump target="*c1_end"

*c1_3
[cm]
[eval exp="f.t_douki += 1"]
;◆3を選んだ場合
#同期
おう、やるぜ！ 自動化なら、機械に触る回数が減るから、オデ向きだ！[p]
#おまえ
（その考え方は、ちょっと正しい）[p]
;→ 次の場面へ
@jump target="*c1_end"

*c1_end

;=========================================
; 【業務前半】（問題5問）シェルスクリプトとcron
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]
[eval exp="f.correct_am = 0"]

;[場面：会議室。先輩が、ホワイトボードに、書く]
[bg storage="bg_meeting_room.gif" time="500"]

#先輩
いいか！ 自動化の基本は、2つだぜ！[p]
1つ目は、シェルスクリプト。コマンドを、まとめて書いたファイル。セットプレーの作戦表だ！[p]
2つ目は、cron。決まった時間に、自動で実行する仕組み。試合のキックオフ時刻だぜ！[p]

;Q1 シェルスクリプト／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q1】[r]
複数のコマンドを、1つのファイルに、まとめて書いて、実行できるようにしたものを、何という？
[glink  color="blue"  storage="ch4_6/scene5_2.ks"  size="22"  x="640"  width="500"  y="240"  text="スクリーンショット"  target="*Q1_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_2.ks"  size="22"  x="640"  width="500"  y="340"  text="スプレッドシート"  target="*Q1_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_2.ks"  size="22"  x="640"  width="500"  y="440"  text="シェルスクリプト"  target="*Q1_ok"  ]
[glink  color="blue"  storage="ch4_6/scene5_2.ks"  size="22"  x="640"  width="500"  y="540"  text="ショートカット"  target="*Q1_ng"  ]
[s]

*Q1_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#先輩
コマンドの、セットプレーだぜ！[p]
#
【解説】シェルスクリプトは、コマンドを、順番に書き並べたファイル。同じ作業を、まとめて、自動で実行できる。[p]
@jump target="*Q1_end"

*Q1_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
コマンドを、まとめて書く。それが、シェルスクリプトだぜ！[p]
#
【解説】シェルスクリプトは、コマンドを、順番に書き並べたファイル。同じ作業を、まとめて、自動で実行できる。[p]
@jump target="*Q1_end"

*Q1_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q2 cron／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q2】[r]
決まった時刻に、決まった作業を、自動で実行する、仕組みは？
[glink  color="blue"  storage="ch4_6/scene5_2.ks"  size="22"  x="640"  width="500"  y="240"  text="clock（クロック）"  target="*Q2_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_2.ks"  size="22"  x="640"  width="500"  y="340"  text="cry（クライ）"  target="*Q2_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_2.ks"  size="22"  x="640"  width="500"  y="440"  text="curl（カール）"  target="*Q2_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_2.ks"  size="22"  x="640"  width="500"  y="540"  text="cron（クーロン）"  target="*Q2_ok"  ]
[s]

*Q2_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#先輩
時間に、正確な仕組みだな！[p]
#
【解説】cron は、Linuxで、指定した時刻に、コマンドやスクリプトを、自動実行する仕組み。[p]
@jump target="*Q2_end"

*Q2_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
cron は、定期実行の基本だぜ！[p]
#
【解説】cron は、Linuxで、指定した時刻に、コマンドやスクリプトを、自動実行する仕組み。[p]
@jump target="*Q2_end"

*Q2_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q3 自動化のメリット／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
;※「自動化は、ミスも、自動で、広げる」は、重要な、教訓。のちの、AI検証につながる
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q3】[r]
作業を、自動化する、一番の、メリットは？
[glink  color="blue"  storage="ch4_6/scene5_2.ks"  size="22"  x="40"  width="1109"  y="151"  text="人の作業ミスを減らして、時間を、有効に使える"  target="*Q3_ok"  ]
[glink  color="blue"  storage="ch4_6/scene5_2.ks"  size="22"  x="40"  width="1109"  y="212"  text="何も、確認しなくて、よくなる"  target="*Q3_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_2.ks"  size="22"  x="40"  width="1109"  y="273"  text="全員が、休める"  target="*Q3_ng"  ]
[s]

*Q3_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#先輩
ミスを減らして、判断に集中できるぜ！[p]
@jump target="*Q3_end"

*Q3_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
確認が不要になるわけじゃないぜ！ 自動化は、ミスも自動で広げる！[p]
@jump target="*Q3_end"

*Q3_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q4 テスト環境／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q4】[r]
作成した、自動化スクリプトを、本番で、使う前に、すべきことは？
[glink  color="blue"  storage="ch4_6/scene5_2.ks"  size="22"  x="40"  width="1109"  y="151"  text="テスト環境で、動作を確認してから、本番に適用する"  target="*Q4_ok"  ]
[glink  color="blue"  storage="ch4_6/scene5_2.ks"  size="22"  x="40"  width="1109"  y="212"  text="いきなり、本番で、実行する"  target="*Q4_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_2.ks"  size="22"  x="40"  width="1109"  y="273"  text="夜中に、こっそり、実行する"  target="*Q4_ng"  ]
[s]

*Q4_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#先輩
それが、鉄則だぜ！[p]
@jump target="*Q4_end"

*Q4_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
自動化は、間違いも自動で実行されるんだ！ 練習試合（テスト）が、必要だぜ！[p]
@jump target="*Q4_end"

*Q4_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q5 cronの時刻指定／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
;※Q5の「* * * * *（毎分）」は、午後のAIの誤りの、伏線
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q5】[r]
cron で、「毎日、午前3時に、実行する」ように、したい。時刻の指定は、どれ？
[glink  color="blue"  storage="ch4_6/scene5_2.ks"  size="22"  x="640"  width="500"  y="240"  text="3 0 * * *"  target="*Q5_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_2.ks"  size="22"  x="640"  width="500"  y="340"  text="0 3 * * *"  target="*Q5_ok"  ]
[glink  color="blue"  storage="ch4_6/scene5_2.ks"  size="22"  x="640"  width="500"  y="440"  text="* * * * *"  target="*Q5_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_2.ks"  size="22"  x="640"  width="500"  y="540"  text="0 0 3 * *"  target="*Q5_ng"  ]
[s]

*Q5_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#先輩
分、時、日、月、曜日。5人のフォーメーションだぜ！[p]
#
【解説】左から、分・時・日・月・曜日。「0 3 * * *」は、毎日、3時0分。「* * * * *」は、毎分、実行される。[p]
@jump target="*Q5_end"

*Q5_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
左から、分・時・日・月・曜日だ！ 毎分は、危ないぜ！[p]
#
【解説】左から、分・時・日・月・曜日。「0 3 * * *」は、毎日、3時0分。「* * * * *」は、毎分、実行される。[p]
@jump target="*Q5_end"

*Q5_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：業務前半の終わり]

#先輩
前半は、ここまで！ ハーフタイムだぜ！[p]
後半は、本番のスクリプト作りだ！ AIも使うぜ！[p]
#おまえ
AIを、使うんですか[p]
#先輩
使う！ ただし、確認が必須だぜ！[p]
#おまえ
当然です[p]

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
完璧だぜ！ 後半は、自動化の本番だ！[p]

[elsif exp="f.correct_am >= 2"]
;◆2〜3問正解のとき
#先輩
いい調子だぜ！ 後半も、頑張れ！[p]

[else]
;◆1問以下のとき
#先輩
ドンマイだ！ cron の時刻指定は、難しいからな！ 後半に、取り返すぞ！[p]
[endif]

;[場面：同期との会話]

#同期
なあ、見てくれよ！[p]
#おまえ
どうしたの[p]
#同期
プリンタの紙詰まり、直せたぜ！[p]
#おまえ
えっ、本当に[p]
#同期
ちゃんと電源を切って、ゆっくり、紙を引き抜いたんだ[p]
#おまえ
すごい！[p]
#同期
でも、そのあと、プリンタが動かなくなった[p]
#おまえ
どうして[p]
#同期
電源を、入れ直すのを、忘れてた[p]
;（ツッコミ）
#おまえ
それは、機械が、苦手とは、関係ない[p]
#同期
……そうだった[p]
;※同期の機械嫌いを、少しずつ克服している描写

;=========================================
; 【業務後半】（問題5問）AIが作った自動化スクリプト
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]

;[場面：午後・会議室。画面にAIが、現れる]
[bg storage="bg_meeting_room.gif" time="500"]

#AI
こんにちは！ ……あの、今日は、静かに、お手伝いします[p]
#先輩
お、AIが、謙虚になったな[p]
#AI
前回の、反省です。私の回答の正確さは、……99%です[p]
;（ツッコミ）
#おまえ
0%から、また、回復してる[p]
#AI
では、自動化スクリプトを、お作りします。毎日、古いログを、削除する、スクリプトです[p]

;[場面：AIが、スクリプトを、画面に表示する]

完成しました！ 内容は、こうです！[p]
#画面
設定時刻：* * * * *（毎分）[p]
処理内容：30日より古い、ログファイルを、削除する[p]
コマンド：find /var/log -mtime +0 -delete[p]
#AI
これで、100%、完璧です！[p]
#先輩
おお、すごい！ 速いな！[p]
#同期
ちょっと待て。見た目は、それっぽいけどよ[p]
#おまえ
…………[p]
（……ん？ 何か、おかしい）[p]
（毎分？ 毎日じゃ、なかったっけ）[p]
（30日より古い、って言ってるのに、+0……？）[p]

;Q6 情報の扱い（前フリ）／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q6】[r]
スクリプトを、本番環境で動かす前に、まず、すべきことは？
[glink  color="blue"  storage="ch4_6/scene5_2.ks"  size="22"  x="640"  width="500"  y="240"  text="先輩に、丸投げする"  target="*Q6_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_2.ks"  size="22"  x="640"  width="500"  y="340"  text="内容を、自分の目で、確認する"  target="*Q6_ok"  ]
[glink  color="blue"  storage="ch4_6/scene5_2.ks"  size="22"  x="640"  width="500"  y="440"  text="全部、AIに、任せる"  target="*Q6_ng"  ]
[s]

*Q6_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#おまえ
そうだ。内容を、自分の目で、確認する[p]
@jump target="*Q6_end"

*Q6_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#おまえ
（……丸投げは、危ない。確認が、必要だ）[p]
@jump target="*Q6_end"

*Q6_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q7 AI提案の見極め（検証イベント）／2択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
;選択肢2（f.ai_ok＋1）
;※不正解でも、同期が、止めてくれる。ただし、f.ai_ok は、増えない
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q7】[r]
AIが作った、自動化スクリプトを、どう扱う？
[glink  color="blue"  storage="ch4_6/scene5_2.ks"  size="22"  x="40"  width="1109"  y="151"  text="そのまま、本番で、実行する"  target="*Q7_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_2.ks"  size="22"  x="40"  width="1109"  y="212"  text="内容を、確認して、おかしい点を、直してから使う"  target="*Q7_ok"  ]
[s]

*Q7_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.ai_ok += 1"]
#
【正解！】[l][r]
#おまえ
待ってください。確認させてください[p]
#先輩
お、新人が、止めたぜ！ ナイスディフェンスだ！[p]
@jump target="*Q7_end"

*Q7_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#同期
ちょっと待て！ 本当に、大丈夫か？[p]
#おまえ
（……やっぱり、確認、しなきゃ）[p]
@jump target="*Q7_end"

*Q7_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q8 スクリプトの誤りの特定／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
;※Q5で、「毎分」の指定を、習っていた。ここで、知識が、つながる
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q8】[r]
AIのスクリプトの、おかしい点は、どこ？
[glink  color="blue"  storage="ch4_6/scene5_2.ks"  size="22"  x="40"  width="1109"  y="151"  text="何も、おかしい点は、ない"  target="*Q8_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_2.ks"  size="22"  x="40"  width="1109"  y="212"  text="設定時刻が「毎分」になっていて、削除対象の日数が「+0」（ほぼ全部）になっている"  target="*Q8_ok"  ]
[glink  color="blue"  storage="ch4_6/scene5_2.ks"  size="22"  x="40"  width="1109"  y="273"  text="コマンドが、日本語で、書かれていない"  target="*Q8_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_2.ks"  size="22"  x="40"  width="1109"  y="334"  text="ファイル名が、長すぎる"  target="*Q8_ng"  ]
[s]

*Q8_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#おまえ
毎分、実行されて、しかも、ほとんどの、ログが、消える。大変なことに、なる！[p]
#先輩
…………[p]
新人！ お前、本当に成長したな！[p]
#
【解説】「* * * * *」は、毎分、実行される。「-mtime +0」は、1日以上前のファイルが、すべて、対象になる。30日以上前なら、「+30」。[p]
@jump target="*Q8_end"

*Q8_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
待て、新人。もう一度、よく見てみろ[p]
#おまえ
……あ、「毎分」と「+0」が、おかしい[p]
#
【解説】「* * * * *」は、毎分、実行される。「-mtime +0」は、1日以上前のファイルが、すべて、対象になる。30日以上前なら、「+30」。[p]
@jump target="*Q8_end"

*Q8_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：AIが、あわてて、謝る]

#AI
ご指摘、ありがとうございます！ 本当に、毎分、実行して、ほとんど、消えるところでした！[p]
#おまえ
それは、本当に、まずかった[p]
#AI
私の回答は、……100%、間違っていました[p]
#おまえ
今度は、正直だな[p]
#先輩
正直なのは、いいことだぜ！[p]

;Q9 情報の分類／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q9】[r]
顧客の、個人情報や、取引条件など、外部に、漏れると、会社に大きな損害を与える情報を、何という？
[glink  color="blue"  storage="ch4_6/scene5_2.ks"  size="22"  x="640"  width="500"  y="240"  text="機密情報"  target="*Q9_ok"  ]
[glink  color="blue"  storage="ch4_6/scene5_2.ks"  size="22"  x="640"  width="500"  y="340"  text="趣味情報"  target="*Q9_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_2.ks"  size="22"  x="640"  width="500"  y="440"  text="広告情報"  target="*Q9_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_2.ks"  size="22"  x="640"  width="500"  y="540"  text="公開情報"  target="*Q9_ng"  ]
[s]

*Q9_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#先輩
情報にも、守りの優先順位があるんだぜ！[p]
#
【解説】機密情報は、漏えいすると、会社に損害を与える情報。扱いには、アクセス制限や、暗号化などの、対策が必要。[p]
@jump target="*Q9_end"

*Q9_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
外に出ると、まずい情報が、機密情報だぜ！[p]
#
【解説】機密情報は、漏えいすると、会社に損害を与える情報。扱いには、アクセス制限や、暗号化などの、対策が必要。[p]
@jump target="*Q9_end"

*Q9_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q10 実行前の確認（総復習）／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q10】[r]
自動化スクリプトの、動作を、確認する、最も安全な方法は？
[glink  color="blue"  storage="ch4_6/scene5_2.ks"  size="22"  x="640"  width="500"  y="240"  text="実行してから、結果を見る"  target="*Q10_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_2.ks"  size="22"  x="640"  width="500"  y="340"  text="いきなり、本番で、実行する"  target="*Q10_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_2.ks"  size="22"  x="640"  width="500"  y="440"  text="テスト環境で、対象や、動作を、確認する"  target="*Q10_ok"  ]
[s]

*Q10_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#おまえ
確認してから、実行する。いつもの、鉄則だ[p]
@jump target="*Q10_end"

*Q10_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
7月を、思い出せ！ 実行してからじゃ、遅いぜ！[p]
@jump target="*Q10_end"

*Q10_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：正しいスクリプトが、完成する]

#おまえ
修正しました。毎日、午前3時に、30日より古い、ログだけを、削除する設定です[p]
#画面
設定時刻：0 3 * * *[p]
処理内容：30日より古い、ログファイルだけを、削除する[p]
コマンド：find /var/log -mtime +30 -delete[p]
#先輩
完璧だぜ！ これを、テスト環境で確かめよう！[p]
#おまえ
はい[p]
;[効果音：実行成功の音]
[playse storage="se_pikon.mp3"]
#同期
成功したぜ！ ウオォォォッ！[p]
;（ドアから顔を出して）
#営業
……報告メール。どうなった[p]
#おまえ
今、完成しました。明日の朝から、自動で、送ります[p]
#営業
……速い。……確認は[p]
#おまえ
はい。テスト環境で[p]
#営業
……よし。それなら、いい[p]

;=========================================
; 【終業後】（誰と過ごすか）
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]

;[場面：夕方・オフィス]
[bg storage="bg_office_evening.gif" time="500"]

#ナレーション
今日は、自動化の、勉強の日だった。[p]
便利になる、と、危なくなる、は、紙一重だ。[p]

;[選択肢：終業後（信頼度）]
;選択肢1：先輩の信頼度＋1
;選択肢2：同期の信頼度＋1
;選択肢3：リーダーの信頼度＋1
;選択肢4：営業の信頼度＋1
#ナレーション
今日の夕方、誰と過ごす？
[glink  color="blue"  storage="ch4_6/scene5_2.ks"  size="26"  x="266"  width="640"  y="120"  text="先輩と、スクリプトの、改善案を、考える"  target="*c2_1"  ]
[glink  color="blue"  storage="ch4_6/scene5_2.ks"  size="26"  x="266"  width="640"  y="195"  text="同期と、紙詰まりの、練習を、続ける"  target="*c2_2"  ]
[glink  color="blue"  storage="ch4_6/scene5_2.ks"  size="26"  x="266"  width="640"  y="270"  text="リーダーに、自動化の、注意点を、聞く"  target="*c2_3"  ]
[glink  color="blue"  storage="ch4_6/scene5_2.ks"  size="26"  x="266"  width="640"  y="345"  text="営業に、報告メールの、文面を、相談する"  target="*c2_4"  ]
[s]

*c2_1
[cm]
[eval exp="f.t_senpai += 1"]
;◆1を選んだ場合
#先輩
自動化は、全力でサボるための道具だぜ！[p]
#おまえ
サボる、じゃなくて、判断に、集中するための、道具です[p]
#先輩
そう、それっス！ ……じゃなくて、それだ！[p]

@jump target="*c2_end"

*c2_2
[cm]
[eval exp="f.t_douki += 1"]
;◆2を選んだ場合
#同期
今度は、電源の入れ直しを、忘れねェぜ[p]
#おまえ
それが、第一歩だね[p]
#同期
第一歩でつまずくのが、得意なんだよ[p]
;（ツッコミ）
#おまえ
得意に、しないで[p]

@jump target="*c2_end"

*c2_3
[cm]
[eval exp="f.t_leader += 1"]
;◆3を選んだ場合
#リーダー
自動化は、便利だよ。でも、間違いも、自動で広がるんだ[p]
だから、実行前の確認が、とても大事なんだね。おkかな[p]
#おまえ
肝に、銘じます[p]

@jump target="*c2_end"

*c2_4
[cm]
[eval exp="f.t_eigyo += 1"]
;◆4を選んだ場合
#営業
……報告メールは、短く。結論が、先[p]
……数字は、必ず確認[p]
#おまえ
はい[p]
#営業
……最近、お前の報告は、読みやすい[p]
#おまえ
（営業さんから、さりげない、褒め言葉）[p]
@jump target="*c2_end"

*c2_end
;=========================================
; 【自宅】（リザルト）
;=========================================
[playbgm storage="bgm_walk.mp3" restart="false"]

;[bg storage="（自宅の部屋（夜））" time="500"]
[bg storage="bg_home_night.gif" time="500"]

#ナレーション
布団に入って、今日の、スクリプトを、思い返す。[p]

;[リザルト表示]
;・今日の正解数：○／10
;・スキル：＋○
;・AI見極め回数：＋○（Q7で見極めたら＋1）
;・信頼度の変化：（選んだキャラ）＋1

;[ナレーション]
#おまえ
自動化は、便利。でも、間違いも、自動で、広がる[p]
確認する癖は、一生の武器だ[p]
#ナレーション
第5章 3日目へ。[p]

;=========================================
;■ 次回予告（第5章 3日目）
;バックアップを整備する。リーダー「いざというときの備えが、一番大事よ」（第6章への伏線）
;出題：ITパスポート（バックアップ、暗号化、個人情報保護）
;■ 未決定
;・社長以外の名前
;・各問題の中身（仮。見直す前提）
;・Q6（前フリ）は、Q7（AI提案の見極め）の導入として入れている。問題数が、多すぎないか
;・Q8（誤りの特定）は、Q7の補足問題。難しさ（cronの時刻指定、-mtimeの意味）が、高すぎないか
;・スクリプトの内容（find /var/log -mtime ...）は、実際の動作を、あとで確認する
;・第5章末のバッドエンド（自動化の確認不足でデータ消失）への、伏線になっている

;次のファイルへ
@jump storage="ch4_6/scene5_3.ks"
