;第6章 3日目

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
;台本　第6章（1〜3月）　3日目
;状態：叩き台（1日分すべて）／ITパスポート枠は過去問に差し替え済み（11/4）
;※名前は社長（郡晴希：こおり はるき）のみ決定。ほかは役割で表記
;※選択肢の数は問題ごとに変える（用語・知識は4択／場面の判断は3択／AI提案の見極めは2択）
;============================================================
;■ この日のねらい
;・復旧の日。信頼度が高いキャラが、駆けつけて助ける（信頼度による布陣の分岐）
;・1年間の、人との関係が、そのまま、復旧の力になる
;・同期の「機械が苦手」が、ここで、報われる（同期の信頼度が高い場合）
;・出題：総合（運用、セキュリティ、一般常識）
;■ 布陣の分岐（この日の核）
;復旧作業には、4つの役割がある。信頼度が基準以上のキャラが、その役割を、担当する。
;・先輩（信頼度が高い）：復旧後の、動作確認を、全力で担当する
;・リーダー（信頼度が高い）：復旧の手順と、データの整合性の確認を、担当する
;・営業（信頼度が高い）：お客様への、説明と、対応を担当する
;・同期（信頼度が高い）：機器の交換など、物理的な作業を、担当する（機械の克服）
;※信頼度が、基準に届いていないキャラは、「別件で、手が離せない」などの形で、不在になる
;※不在の役割は、主人公が、自分で行う（時間がかかり、大変になる。ただし、バッドエンドにはならない）
;※基準の数値は、配点が決まってから決める（今は、仮）
;■ 1日の流れ
;朝 → 業務前半（5問）→ 昼休み（布陣の確認）→ 業務後半（5問）→ 終業後 → 自宅（リザルト）
;------------------------------------------------------------
; 【朝】
;=========================================
[playbgm storage="bgm_walk.mp3" restart="false"]

;[bg storage="（オフィス（早朝））" time="500"]
[bg storage="bg_office_dawn.gif" time="500"]

#ナレーション
第6章 3日目。午前6時。[p]
徹夜の、オフィス。みんな、疲れた顔を、している。[p]

;[場面：リストアが、完了する]

;[効果音：「ピッ」と、完了の音]
[playse storage="se_beep.mp3"]
#同期
おい、リストア、完了したぜ！[p]
#おまえ
本当に！？[p]
#先輩
全力で、よくやったぜ！ 新人！[p]
#リーダー
……ここからが、本番だよ[p]
リストアが終わったのは、データだけ。壊れたディスクの交換と、動作確認が、残ってる[p]
#おまえ
はい[p]
#リーダー
今日は、一日、復旧作業だね[p]

;[場面：社長が、入ってくる]

#社長
……状況は[p]
#リーダー
リストアは、完了しました。これから、機器の交換と、動作確認です[p]
#社長
……そうか[p]
お客様への説明は[p]
#営業
……午前中に、こっちが、行く[p]
#社長
……頼む[p]
新人[p]
#おまえ
はい[p]
#社長
いいか、よく聞け……今日が、勝負だ[p]
全員で、乗り切れよ[p]

;[選択肢：1回目（信頼度）]
;選択肢1：先輩の信頼度＋1
;選択肢2：リーダーの信頼度＋1
;選択肢3：営業の信頼度＋1
;選択肢4：同期の信頼度＋1
;※どれを選んでも、次の場面につながる
#ナレーション
復旧作業の、前に、誰かに、声をかける？
[glink  color="blue"  storage="ch4_6/scene6_3.ks"  size="26"  x="266"  width="640"  y="120"  text="先輩に、「今日も、よろしくお願いします」と、言う"  target="*c1_1"  ]
[glink  color="blue"  storage="ch4_6/scene6_3.ks"  size="26"  x="266"  width="640"  y="195"  text="リーダーに、「手順を、確認させてください」と、言う"  target="*c1_2"  ]
[glink  color="blue"  storage="ch4_6/scene6_3.ks"  size="26"  x="266"  width="640"  y="309"  text="営業に、「お客様対応、お願いします」と、頼む"  target="*c1_3"  ]
[glink  color="blue"  storage="ch4_6/scene6_3.ks"  size="26"  x="266"  width="640"  y="384"  text="同期に、「機器の交換、よろしく」と、頼む"  target="*c1_4"  ]
[s]

*c1_1
[cm]
[eval exp="f.t_senpai += 1"]
;◆1を選んだ場合
#先輩
おう！ 延長戦だろうが、PK戦だろうが、走り切るぜ！[p]
#おまえ
（徹夜明けなのに、一番元気だ）[p]
@jump target="*c1_end"

*c1_2
[cm]
[eval exp="f.t_leader += 1"]
;◆2を選んだ場合
#リーダー
うん、確認しよう。手順は、急がば回れ、だね[p]
#おまえ
（手順書の端に、魚肉ソーセージのシールが貼ってある）[p]
@jump target="*c1_end"

*c1_3
[cm]
[eval exp="f.t_eigyo += 1"]
;◆3を選んだ場合
#営業
……任せろ。……客の前では、言葉を、増やす[p]
#おまえ
（営業さんの「言葉を増やす」は、少し見てみたい）[p]
@jump target="*c1_end"

*c1_4
[cm]
[eval exp="f.t_douki += 1"]
;◆4を選んだ場合
#同期
おう、任せろ！ ……今日は、本当に、任せていいぜ[p]
#おまえ
（その「本当に」が、頼もしい）[p]
;→ 次の場面へ
@jump target="*c1_end"

*c1_end

;=========================================
; 【業務前半】（問題5問）復旧作業の準備と、情報セキュリティの基本
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]
[eval exp="f.correct_am = 0"]

;[場面：会議室。リーダーが、整理する]
[bg storage="bg_meeting_room.gif" time="500"]

#リーダー
復旧作業の前に、情報セキュリティの、3つの要素を、確認しよう[p]
機密性、完全性、可用性。それぞれの意味、わかるかな？[p]

;Q1 完全性／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=182 page=fore visible=true]
[font size=26]
#
【Q1】[r]
情報セキュリティの要素である機密性、完全性及び可用性のうち、完全性を高める例として、最も適切なものはどれか。
[glink  color="blue"  storage="ch4_6/scene6_3.ks"  size="22"  x="40"  width="1109"  y="190"  text="データの入力者以外の者が、入力されたデータの正しさをチェックする。"  target="*Q1_ok"  ]
[glink  color="blue"  storage="ch4_6/scene6_3.ks"  size="22"  x="40"  width="1109"  y="251"  text="データを外部媒体に保存するときは、暗号化する。"  target="*Q1_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_3.ks"  size="22"  x="40"  width="1109"  y="312"  text="データを処理するシステムに予備電源を増設する。"  target="*Q1_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_3.ks"  size="22"  x="40"  width="1109"  y="373"  text="ファイルに読出し用パスワードを設定する。"  target="*Q1_ng"  ]
[s]

*Q1_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#リーダー
正しさを守る工夫が、完全性を高めるんだ。リストア後の確認も、同じだね[p]
#
【解説】完全性は、情報が正確で、書き換えられたり壊れたりしていないこと。別の人が正しさを確認するのは、完全性を高める。暗号化とパスワードは機密性、予備電源は可用性。[p]
@jump target="*Q1_end"

*Q1_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
正確さを保つ性質が、完全性だよ。暗号化は機密性、予備電源は可用性だね[p]
#
【解説】完全性は、情報が正確で、書き換えられたり壊れたりしていないこと。別の人が正しさを確認するのは、完全性を高める。暗号化とパスワードは機密性、予備電源は可用性。[p]
@jump target="*Q1_end"

*Q1_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q2 可用性／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q2】[r]
情報セキュリティの観点から、システムの可用性を高める施策の例として、最も適切なものはどれか。
[glink  color="blue"  storage="ch4_6/scene6_3.ks"  size="22"  x="640"  width="500"  y="240"  text="生体認証を採用する。"  target="*Q2_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_3.ks"  size="22"  x="640"  width="500"  y="340"  text="デジタル署名を行う。"  target="*Q2_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_3.ks"  size="22"  x="640"  width="500"  y="440"  text="データを暗号化する。"  target="*Q2_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_3.ks"  size="22"  x="640"  width="500"  y="540"  text="ハードウェアを二重化する。"  target="*Q2_ok"  ]
[s]

*Q2_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#リーダー
サービスが止まった今回は、可用性の危機だったね[p]
#
【解説】可用性は、必要なときに、ちゃんと使えること。機器を二重にしておけば、1台が壊れても、止まりにくい。生体認証と暗号化は機密性、デジタル署名は完全性の対策。[p]
@jump target="*Q2_end"

*Q2_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
止まらないための工夫が、可用性。機器の二重化が、その例だよ[p]
#
【解説】可用性は、必要なときに、ちゃんと使えること。機器を二重にしておけば、1台が壊れても、止まりにくい。生体認証と暗号化は機密性、デジタル署名は完全性の対策。[p]
@jump target="*Q2_end"

*Q2_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q3 機密性／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q3】[r]
許可された人だけが、情報に、アクセスできるようにする性質は？
[glink  color="blue"  storage="ch4_6/scene6_3.ks"  size="22"  x="640"  width="500"  y="240"  text="完全性"  target="*Q3_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_3.ks"  size="22"  x="640"  width="500"  y="340"  text="機密性"  target="*Q3_ok"  ]
[glink  color="blue"  storage="ch4_6/scene6_3.ks"  size="22"  x="640"  width="500"  y="440"  text="可用性"  target="*Q3_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_3.ks"  size="22"  x="640"  width="500"  y="540"  text="透過性"  target="*Q3_ng"  ]
[s]

*Q3_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#リーダー
個人情報や、顧客データを、守る要素だね[p]
@jump target="*Q3_end"

*Q3_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
許可された人だけが、見られること。それが、機密性だよ[p]
@jump target="*Q3_end"

*Q3_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q4 復旧後の確認／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q4】[r]
データを、リストアしたあとに、必ず、すべきことは？
[glink  color="blue"  storage="ch4_6/scene6_3.ks"  size="22"  x="40"  width="1109"  y="151"  text="データが、正しく戻っているか、動作を、確認してから、再開する"  target="*Q4_ok"  ]
[glink  color="blue"  storage="ch4_6/scene6_3.ks"  size="22"  x="40"  width="1109"  y="212"  text="社長に、任せる"  target="*Q4_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_3.ks"  size="22"  x="40"  width="1109"  y="273"  text="何も確認せず、そのまま、サービスを再開する"  target="*Q4_ng"  ]
[s]

*Q4_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#リーダー
確認しないで再開すると、二次障害に、なりかねないからね[p]
@jump target="*Q4_end"

*Q4_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
復旧後の確認は、必須だよ[p]
@jump target="*Q4_end"

*Q4_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q5 報連相（総合）／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q5】[r]
作業の途中で、問題が、見つかった。どうする？
[glink  color="blue"  storage="ch4_6/scene6_3.ks"  size="22"  x="640"  width="500"  y="240"  text="隠して、作業を、続ける"  target="*Q5_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_3.ks"  size="22"  x="640"  width="500"  y="340"  text="作業を、中断して、帰る"  target="*Q5_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_3.ks"  size="22"  x="640"  width="500"  y="440"  text="すぐに、状況を、報告して、判断を、仰ぐ"  target="*Q5_ok"  ]
[s]

*Q5_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#リーダー
基本は、変わらないね[p]
@jump target="*Q5_end"

*Q5_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
入社した日から、変わらない基本だよ。すぐに報告[p]
@jump target="*Q5_end"

*Q5_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：業務前半の終わり]

#リーダー
ここまでが、準備だね[p]
午後から、本格的な復旧作業に、入るよ[p]
その前に、昼休みに、誰が何を担当するか、確認しよう[p]

;=========================================
; 【昼休み】（布陣の確認）
;=========================================
[playbgm storage="bgm_easygoing.mp3" restart="false"]
;※この日の昼休みは、「布陣の確認」。信頼度が、基準以上のキャラが、役割を担当する

;[場面：対策本部]

#リーダー
状況を、整理しよう[p]
復旧には、4つの役割が、必要なんだ[p]
機器の交換、動作確認、手順とデータの確認、お客様への説明[p]

;▼分岐（各キャラの信頼度で、駆けつけるかどうかが決まる）
[if exp="f.t_senpai >= 6"]
;◆【先輩】の信頼度が、基準以上のとき
#先輩
俺に、任せろ！ 動作確認は、全力でやるぜ！[p]
声が大きくても、気にするな！ 今日は、気合いだぜ！[p]
#おまえ
先輩……ありがとうございます[p]
#先輩
礼は、いらねェ！ 俺たちは、チームだぜ！[p]

[else]
;◆【先輩】の信頼度が、基準未満のとき
#先輩
すまねェ、新人！ 別件の、緊急対応が入った！[p]
#先輩
動作確認は、お前に任せる！[p]
#おまえ
えっ、僕一人で、ですか[p]
#先輩
マニュアルがある！ 全力で、頑張れ！[p]
;※動作確認は、主人公が、一人で行う。時間がかかる
[endif]

[if exp="f.t_leader >= 6"]
;◆【リーダー】の信頼度が、基準以上のとき
#リーダー
手順と、データの整合性の確認は、俺に任せて[p]
君が、1年間で成長した姿を、信じてるよ[p]
#おまえ
リーダー……ありがとうございます[p]

[else]
;◆【リーダー】の信頼度が、基準未満のとき
#リーダー
sry。社長への報告で、手が離せないんだ[p]
#リーダー
手順書は、渡しておくね。確認は、君にお願い[p]
#おまえ
はい……[p]
;※手順と整合性の確認は、主人公が、行う。ミスが起きやすい
[endif]

[if exp="f.t_eigyo >= 6"]
;◆【営業】の信頼度が、基準以上のとき
#営業
……客への説明は、こっちが、全部やる[p]
……お前は、復旧に、専念しろ[p]
……頼りにしてる。……褒めてはいない[p]
#おまえ
営業さん……ありがとうございます[p]

[else]
;◆【営業】の信頼度が、基準未満のとき
#営業
……客対応、全部は無理。……別の客の対応もある[p]
#営業
……そこの。客への説明のメールは、お前が書け[p]
#おまえ
えっ、僕が[p]
#営業
……内容は、確認する。……書くのは、お前[p]
;※お客様への説明は、主人公が、一部、担当する
[endif]

[if exp="f.t_douki >= 6"]
;◆【同期】の信頼度が、基準以上のとき
#同期
機器の交換は、オデに任せろ！[p]
#おまえ
えっ、機械が、苦手なのに[p]
#同期
大丈夫だ。1年かけて、ドアも、プリンタも、克服したからよ[p]
お前が、1年間、教えてくれたから、できるんだ[p]
#おまえ
……ありがとう[p]
#同期
今度は、オデが、お前を助ける番だぜ。……今度の『任せろ』は、本物だ[p]

[else]
;◆【同期】の信頼度が、基準未満のとき
#同期
わりィ。機械の交換は、まだ自信がなくてよ[p]
#同期
でも、記録と連絡は、全力でやるぜ[p]
#おまえ
ありがとう。それだけでも、助かる[p]
[endif]
;※機器の交換は、主人公が、行う。ただし、同期も、サポートする

;=========================================
; 【業務後半】（問題5問）復旧の実行と、再発防止
;=========================================
[playbgm storage="bgm_emergency.mp3" restart="false"]

;[場面：データセンター。壊れたディスクの、交換作業]
[bg storage="bg_datacenter.gif" time="500"]

#ナレーション
午後。復旧作業が、本格的に、始まった。[p]

;▼分岐（同期の信頼度で、場面が変わる）
[if exp="f.t_douki >= 6"]
;◆同期の信頼度が、基準以上のとき（同期が、機器の交換を担当）
#同期
電源を、切って……慎重に、ディスクを、外して[p]
新しいディスクを、ゆっくり、差し込んで[p]
#おまえ
完璧だよ！[p]
#同期
できたぜ！ 電源を入れ直すのも、忘れねェ！[p]
#先輩
同期が、機械を克服したっス！ ゴールだぜ！[p]
#おまえ
1年前の、同期とは、別人だ[p]
#同期
お前の、おかげだぜ[p]
;※同期の成長が、物語の、感動ポイント

[else]
;◆同期の信頼度が、基準未満のとき（主人公が、機器の交換を担当）
#おまえ
……電源を、切って、ディスクを、外して[p]
#おまえ
新しいディスクを、……あれ、向きが、違う[p]
;（サポート役）
#同期
その向き、逆だぜ[p]
#おまえ
ありがとう。……入った[p]
[endif]
;※時間はかかるが、同期が、サポートしてくれる

;Q6 冗長化（デュプレックスシステム）／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q6】[r]
通常稼働する系と、その系の故障に備えて待機しながら別の処理も実行する系の、二つの系で構成されるコンピュータシステムはどれか。
[glink  color="blue"  storage="ch4_6/scene6_3.ks"  size="22"  x="640"  width="500"  y="240"  text="クライアントサーバシステム"  target="*Q6_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_3.ks"  size="22"  x="640"  width="500"  y="340"  text="デュアルシステム"  target="*Q6_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_3.ks"  size="22"  x="640"  width="500"  y="440"  text="デュプレックスシステム"  target="*Q6_ok"  ]
[glink  color="blue"  storage="ch4_6/scene6_3.ks"  size="22"  x="640"  width="500"  y="540"  text="ピアツーピアシステム"  target="*Q6_ng"  ]
[s]

*Q6_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#リーダー
今回の、再発防止の大事な対策だね[p]
#
【解説】デュプレックスシステムは、主の系と待機の系で、二重にしておくやり方。主の系が壊れたら、待機の系が引き継ぐので、全体は止まらない。[p]
@jump target="*Q6_end"

*Q6_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
待機する系を用意して、1つ壊れても止めない。それが冗長化の考え方だよ[p]
#
【解説】デュプレックスシステムは、主の系と待機の系で、二重にしておくやり方。主の系が壊れたら、待機の系が引き継ぐので、全体は止まらない。[p]
@jump target="*Q6_end"

*Q6_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：パソコンの画面に、AIが、現れる]

#AI
……こんにちは。私の、正確さは、……70%に、なりました[p]
#おまえ
少し、回復したな[p]
#AI
復旧作業は、順調ですね。……1つ、ご提案が、あります[p]
データの確認は、サンプリングで、十分です。全データを、確認する必要は、ありません[p]
時間の、節約に、なります[p]
#リーダー
…………[p]
#先輩
確認を、省くのか……？[p]

;Q7 AI提案の見極め（確認の省略）／2択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
;選択肢2（f.ai_ok＋1）
;※7月の「確認を怠る」失敗が、ここで、問い直される
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q7】[r]
AIの提案を、どう扱う？
[glink  color="blue"  storage="ch4_6/scene6_3.ks"  size="22"  x="40"  width="1109"  y="151"  text="採用する（サンプリングだけで、済ませる）"  target="*Q7_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_3.ks"  size="22"  x="40"  width="1109"  y="212"  text="重要データは、全件確認する、または、確認範囲を、慎重に決める"  target="*Q7_ok"  ]
[s]

*Q7_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.ai_ok += 1"]
#
【正解！】[l][r]
#おまえ
お客様の、重要なデータは、少しでも、壊れていたら、大問題です[p]
サンプリングで、済ませずに、重要な部分は、全件、確認しましょう[p]
#リーダー
その通りだね。見極め、だよ[p]
@jump target="*Q7_end"

*Q7_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
待って。リストアの確認は、省いちゃいけないよ[p]
#先輩
新人！ 1年間、確認の大切さを、学んだだろう！[p]
@jump target="*Q7_end"

*Q7_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q8 お客様への謝罪／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q8】[r]
障害で、お客様に、ご迷惑をかけた。謝罪のポイントは？
[glink  color="blue"  storage="ch4_6/scene6_3.ks"  size="22"  x="40"  width="1109"  y="151"  text="事実の説明と、再発防止策を、誠意をもって伝える"  target="*Q8_ok"  ]
[glink  color="blue"  storage="ch4_6/scene6_3.ks"  size="22"  x="40"  width="1109"  y="212"  text="言い訳を、して、納得してもらう"  target="*Q8_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_3.ks"  size="22"  x="40"  width="1109"  y="273"  text="連絡しない"  target="*Q8_ng"  ]
[s]

*Q8_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#営業
……その通り。誠意が、一番伝わる[p]
@jump target="*Q8_end"

*Q8_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#営業
……言い訳より、誠意と、再発防止[p]
@jump target="*Q8_end"

*Q8_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q9 再発防止の報告書／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q9】[r]
再発防止の、報告書に、書くべき内容として、適切なものは？
[glink  color="blue"  storage="ch4_6/scene6_3.ks"  size="22"  x="640"  width="500"  y="240"  text="事実、原因、対応、再発防止策"  target="*Q9_ok"  ]
[glink  color="blue"  storage="ch4_6/scene6_3.ks"  size="22"  x="640"  width="500"  y="340"  text="今日の天気"  target="*Q9_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_3.ks"  size="22"  x="640"  width="500"  y="440"  text="誰が悪いか、だけ"  target="*Q9_ng"  ]
[s]

*Q9_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#リーダー
夏に、学んだことだね[p]
@jump target="*Q9_end"

*Q9_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
責めるためじゃなく、次に活かすための書類だよ[p]
@jump target="*Q9_end"

*Q9_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q10 パスワード（総合）／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=182 page=fore visible=true]
[font size=26]
#
【Q10】[r]
システム運用における利用者IDとパスワードの管理に関する記述のうち、最も適切なものはどれか。
[glink  color="blue"  storage="ch4_6/scene6_3.ks"  size="22"  x="40"  width="1109"  y="190"  text="業務システムごとに異なる利用者IDとパスワードを使用させ、利用者は入力を間違えないように、その一覧表を携帯する。"  target="*Q10_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_3.ks"  size="22"  x="40"  width="1109"  y="284"  text="パスワードは、会社が定期的に全社員に変更を促し、利用者自身が変更する。"  target="*Q10_ok"  ]
[glink  color="blue"  storage="ch4_6/scene6_3.ks"  size="22"  x="40"  width="1109"  y="345"  text="パスワードは、システムが辞書から無作為に選んだ単語を利用者に配布し、定期的な更新日まで使用させる。"  target="*Q10_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_3.ks"  size="22"  x="40"  width="1109"  y="406"  text="パスワードは、利用者自身の誕生日や電話番号などの、覚えやすくて使いやすい数字列を使用させる。"  target="*Q10_ng"  ]
[s]

*Q10_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#先輩
入社した日から、ずっと変わらない基本だぜ！[p]
#
【解説】パスワードは、会社が変更を促し、本人が自分で変えるのが基本。一覧表を持ち歩く、辞書の単語を使う、誕生日や電話番号にする、のは、見られたり破られたりしやすい。[p]
@jump target="*Q10_end"

*Q10_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
4月に戻れ！ パスワードは、会社が促して、自分で変える。1年間、言い続けてるぜ！[p]
#
【解説】パスワードは、会社が変更を促し、本人が自分で変えるのが基本。一覧表を持ち歩く、辞書の単語を使う、誕生日や電話番号にする、のは、見られたり破られたりしやすい。[p]
@jump target="*Q10_end"

*Q10_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：復旧が、完了する]

;[効果音：「ピッ」と、完了の音]
[playse storage="se_beep.mp3"]
#おまえ
サービス、再開しました！[p]
;[効果音：画面が、緑に、変わっていく]
[playse storage="se_chime_pinpon.mp3"]
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]
#同期
全部、緑になったぜ！ ウオォォォッ！[p]
#先輩
やったぞ！ 全力で、やったぜ！[p]
#リーダー
……ありがとう。みんな[p]
#営業
……客にも、復旧の連絡を入れた。『ありがとう』と、言われた[p]
#おまえ
本当ですか[p]
#営業
……ああ。お前たちの、おかげ[p]
#社長
…………[p]
……ふっ。全員、ご苦労だったぜ[p]
#全員
えっ[p]
#社長
何だ。何か、言いたいことでも、あるのか[p]
;（ツッコミ）
#おまえ
いえ。『ご苦労様』は、目上から目下に使う言葉ですが、社長なら、正しい使い方です[p]
#先輩
社長が、全員をねぎらったっス！[p]
;（そう言って、静かに、サンバのステップを踏んだ）
#社長
いいか、よく聞け……今日だけだぜ[p]

;=========================================
; 【終業後】（誰と過ごすか）
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]

;[場面：夕方・オフィス]
[bg storage="bg_office_evening.gif" time="500"]

#ナレーション
徹夜から、丸2日。復旧は、完了した。[p]
みんな、ぐったりしているが、笑顔だ。[p]

;[選択肢：終業後（信頼度）]
;選択肢1：先輩の信頼度＋1
;選択肢2：同期の信頼度＋1
;選択肢3：リーダーの信頼度＋1
;選択肢4：営業の信頼度＋1
#ナレーション
今夜は、誰と、時間を過ごす？
[glink  color="blue"  storage="ch4_6/scene6_3.ks"  size="26"  x="266"  width="640"  y="120"  text="先輩と、復旧の成功を、祝う"  target="*c2_1"  ]
[glink  color="blue"  storage="ch4_6/scene6_3.ks"  size="26"  x="266"  width="640"  y="195"  text="同期と、機械を克服した、喜びを、分かち合う"  target="*c2_2"  ]
[glink  color="blue"  storage="ch4_6/scene6_3.ks"  size="26"  x="266"  width="640"  y="270"  text="リーダーと、今回の、反省を、整理する"  target="*c2_3"  ]
[glink  color="blue"  storage="ch4_6/scene6_3.ks"  size="26"  x="266"  width="640"  y="345"  text="営業と、お客様からの、感謝の声を、聞く"  target="*c2_4"  ]
[s]

*c2_1
[cm]
[eval exp="f.t_senpai += 1"]
;◆1を選んだ場合
#先輩
新人！ お前は、本当に、立派になったぜ！[p]
俺が育てたと言いたいが、お前自身の力だ！[p]
#おまえ
先輩の、全力の、指導のおかげです[p]
;（涙目）
#先輩
泣かせるじゃねェか！[p]

;先輩の信頼度が、10以上のときだけ、このキー選択肢が出る（結婚エンドへの、条件の1つ）
[if exp="f.t_senpai >= 10"]
#ナレーション
先輩の目に、涙が、光っている。[p]
#おまえ
（……1年間、ずっと、この人の背中を、追いかけてきた）[p]

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
先輩に、何を伝える？
[glink  color="red"  name="key_btn"  storage="ch4_6/scene6_3.ks"  size="26"  x="266"  width="640"  y="120"  text="「来年も、よろしくお願いします」と伝える"  target="*key_confess_1"  ]
[glink  color="red"  name="key_btn"  storage="ch4_6/scene6_3.ks"  size="26"  x="266"  width="640"  y="195"  text="「先輩のことが、好きです」と伝える"  target="*key_confess_2"  ]
[kanim name="key_btn" keyframe="key_shake" time="150" count="infinite"]
[s]

*key_confess_1
[cm]
[free_layermode name="key_red" time="300"]
#先輩
おう！ 来年も、全力で、走るぞ！[p]
@jump target="*key_confess_end"

*key_confess_2
[cm]
[free_layermode name="key_red" time="300"]
[eval exp="f.confess = 1"]
#おまえ
……先輩。僕、先輩のことが、好きです[p]
#先輩
…………[p]
……な、何だ、急に！ 今のは、オフサイドだぜ！[p]
#おまえ
（……オフサイドかどうかは、明日、わかる気がする）[p]
@jump target="*key_confess_end"

*key_confess_end

[endif]


@jump target="*c2_end"

*c2_2
[cm]
[eval exp="f.t_douki += 1"]
;◆2を選んだ場合
#同期
機械が、怖くなくなったんだ[p]
1年前は、ドアが怖かった[p]
#おまえ
今は、ディスクの交換が、できる[p]
#同期
お前の、おかげだ。ありがとな[p]
#おまえ
こちらこそ。同期が、いなかったら、続けられなかった[p]

@jump target="*c2_end"

*c2_3
[cm]
[eval exp="f.t_leader += 1"]
;◆3を選んだ場合
#リーダー
今回の障害で、備えの大切さが、証明されたね[p]
君がバックアップを軽視しなかったから、救われたんだよ[p]
#おまえ
リーダーの、話を、聞いていたからです[p]
#リーダー
……ありがとう。……大事な夜だから、保存しとく？[p]
#おまえ
……今日は、保存したいです[p]
@jump target="*c2_end"

*c2_4
[cm]
[eval exp="f.t_eigyo += 1"]
;◆4を選んだ場合
#営業
……客から、感謝のメールが、届いた[p]
……『次も、御社にお願いしたい』と[p]
#おまえ
本当ですか[p]
#営業
……ああ。お前の報告と、対応が、大きかった[p]
……褒めてない。事実[p]
;（笑）
#おまえ
わかってます[p]
@jump target="*c2_end"

*c2_end
;=========================================
; 【自宅】（リザルト）
;=========================================
[playbgm storage="bgm_walk.mp3" restart="false"]

;[bg storage="（自宅の部屋（夜））" time="500"]
[bg storage="bg_home_night.gif" time="500"]

#ナレーション
ようやく、自宅の、布団に、帰ってきた。[p]

;[リザルト表示]
;・今日の正解数：○／10
;・スキル：＋○
;・AI見極め回数：＋○（Q7で見極めたら＋1）
;・信頼度の変化：（選んだキャラ）＋1
;・布陣：誰が、駆けつけたか（先輩・リーダー・営業・同期）の、結果を、表示

;[ナレーション]
#おまえ
1年間の、積み重ねが、全部、ここで、活きた[p]
みんなが、いたから、乗り切れた[p]
明日は、いよいよ、評価面談だ[p]
#ナレーション
第6章 4日目へ。[p]

;=========================================
;■ 次回予告（第6章 4日目）
;評価面談。社長が、1年を振り返る。合計点で、成功エンドか、バッドエンド（クビ）かが決まる。
;出題：総合（最終問題）
;■ 未決定
;・社長以外の名前
;・各問題の中身（仮。見直す前提）
;・布陣の分岐の、信頼度の基準（配点が決まってから）
;・信頼度が低いキャラの、「不在」の理由（別件、手が離せない、など）が、不自然でないか
;・同期が、機器の交換を担当する場面が、感動ポイントとして、成立するか
;・社長のねぎらいの言葉（第4章3日目「よく、やった」、第6章2日目「頼りにしている」、第6章3日目「ご苦労だった」）が、くどくないか

;次のファイルへ
@jump storage="ch4_6/scene6_4.ks"
