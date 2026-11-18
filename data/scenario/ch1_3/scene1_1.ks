;=========================================
; 第1章 1日目（4月1日）
; 試作：会話で学ぶ型
;   朝 → 業務前半（会話で学ぶ → 3問）→ 昼休み → 業務後半（会話で学ぶ → 3問）→ 終業後 → 自宅（クリックで行動）
;   問題は「その直前の会話で、キャラが説明したこと」を使えば解ける。
;   まちがえたら、別のキャラが、ちがうたとえで説明し直す。
;=========================================

*start
;ゲーム開始：変数の初期化（信頼度・点数・フラグ・お金・用語図鑑）
[eval exp="f.t_senpai = 0; f.t_leader = 0; f.t_eigyo = 0; f.t_douki = 0; f.shacho = 0"]
[eval exp="f.term_q = 0; f.term_ok = 0; f.correct_am = 0; f.ai_ok = 0; f.confess = 0; f.arrogant = 0"]
[eval exp="f.money = 30000; f.slot_count = 0; f.slot_total = 0; f.study = 0; f.terms = {}; f.wrong_today = []"]
[eval exp="f.met_senpai = false; f.met_leader = false; f.met_eigyo = false; f.met_douki = false"]

[cm]
[clearfix]
[start_keyconfig]

;このゲームで登場するキャラクターを宣言（立ち絵を用意したら、ここに足す）
;haruki
[chara_new  name="haruki" storage="chara/haruki/kimoharuki.jpg" jname="はるき"  ]

;章の始まりの演出
[eval exp="f.tr_chapter = '第1章'; f.tr_title = '自動ドアは、新人を選ぶ'; f.tr_date = '4月1日'"]
[call storage="system/transition.ks" target="*chapter"]


;=========================================
; 【朝】
;=========================================
;[場面：主人公の部屋（朝）。目が覚める]
[bg storage="bg_home_morning.gif" time="500"]
[playbgm storage="bgm_walk.mp3" restart="false"]
#
4月1日。今日から、社会人1年目だ。[p]
#おまえ
（緊張で、昨日はあまり眠れなかった。……でも、がんばるぞ）[p]

;[場面：会社の入口。スーツの男が、自動ドアに挟まっている]
[bg storage="ev_door_stuck.gif" time="500"]
#？？？
おっ、お前も新入社員か？ よかったァ、一人じゃ心細くてよ[p]
#おまえ
はい。……あの、ドアに挟まってますけど[p]
#？？？
大丈夫、オデに任せろ！[p]
#おまえ
（今、オデって言った？ ……任せられる状況じゃない）[p]

;――選択肢（信頼度）――
;選択肢1：同期の信頼度＋1
;選択肢2：リーダーの信頼度＋1（ちょうど通りかかる）
#
どうする？
[glink  color="black"  storage="ch1_3/scene1_1.ks"  size="24"  x="290"  width="700"  y="150"  text="ドアから、引っぱり出してあげる"  target="*c1_douki"  ]
[glink  color="black"  storage="ch1_3/scene1_1.ks"  size="24"  x="290"  width="700"  y="230"  text="通りかかった人に、助けを呼ぶ"  target="*c1_leader"  ]
[s]

*c1_douki
[cm]
[playse storage="se_autodoor_open.mp3"]
#？？？
ぶはァッ！ 助かったぜ！ お前、いいやつだな！ オデは、お前の同期だ！[p]
[eval exp="f.met_douki = true; f.t_douki += 1; f.toast = '同期の信頼度が上がった！'"]
[call storage="system/toast.ks"]
#リーダー
おやおや、朝から元気だね。俺は、運用チームのリーダー。よろしくね[p]
[eval exp="f.met_leader = true"]
@jump target="*c1_end"

*c1_leader
[cm]
#おまえ
すみません！ 人が、ドアに挟まってます！[p]
#リーダー
おやおや……新人さんだね。はい、センサーに手をかざして、と[p]
[playse storage="se_autodoor_open.mp3"]
#リーダー
俺は、運用チームのリーダー。困ったら、まず人を呼ぶ。いい判断だね。おkだよ[p]
[eval exp="f.met_leader = true; f.t_leader += 1; f.toast = 'リーダーの信頼度が上がった！'"]
[call storage="system/toast.ks"]
#？？？
助かったぜ……。オデは、お前の同期だ！ よろしくな！[p]
[eval exp="f.met_douki = true"]

*c1_end

;[場面：オフィス。社長が現れる]
[bg storage="bg_office.gif" time="500"]
#？？？
……ふっ。そこの二人、新入社員か。遅いぜ……[p]
#おまえ
まだ、始業の30分前ですが[p]
#社長
俺の30分前は、もう遅いんだぜ……。いいか、よく聞け……[p]
#
社長は、それ以上なにも言わずに、その場でくるりと一回転して去っていった。[p]
#おまえ
（……今の、何だったんだ）[p]
#リーダー
sry、社長はいつもあんな感じなんだ。すぐ慣れるよ。……たぶんね[p]

#リーダー
さて、君たちの指導役を紹介するね[p]
#先輩
おう！ 新人か！ 今日から俺が指導役だぜ！ 一緒に、ゴールまで走り抜けるぞ！[p]
[eval exp="f.met_senpai = true"]
#おまえ
（……熱い人だ）[p]


;=========================================
; 【業務前半】会話で学ぶ → Q1〜Q3
;=========================================
[bg storage="bg_team_desk.gif" time="500"]
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]
[eval exp="f.correct_am = 0"]

;――学ぶ：報連相（先輩・サッカーのたとえ）――
#先輩
いいか、新人。仕事は、サッカーと同じだ[p]
試合中にボールを取られたら、どうする？ 黙ってるか？[p]
#おまえ
……すぐ、味方に声をかけます[p]
#先輩
そうだ！ 黙ってたら、そのまま失点するだろ？ 仕事のミスも、同じだぜ[p]
ミスに気づいたら、すぐ声を出す。これが「報連相」の「報告」だ！[p]
#リーダー
報告・連絡・相談、で報連相。悪い知らせほど、早く伝えるのがコツだよ[p]
[eval exp="f.terms['報連相'] = '報告・連絡・相談。悪い知らせほど、早く伝える'; f.toast = '用語図鑑に「報連相」を記録した'"]
[call storage="system/toast.ks"]

;Q1 報連相（会話：ボールを取られたら、すぐ声を出す）
[eval exp="f.term_q += 1"]
[playse storage="se_quiz_question.mp3"]
#
【Q1】作業中に、自分のミスに気づいた。どうする？
[glink  color="black"  storage="ch1_3/scene1_1.ks"  size="24"  x="190"  width="900"  y="110"  text="すぐに、先輩に報告する"  target="*Q1_ok"  ]
[glink  color="black"  storage="ch1_3/scene1_1.ks"  size="24"  x="190"  width="900"  y="190"  text="自分で直してから、あとで報告する"  target="*Q1_ng"  ]
[glink  color="black"  storage="ch1_3/scene1_1.ks"  size="24"  x="190"  width="900"  y="270"  text="バレなければ、黙っておく"  target="*Q1_ng"  ]
[s]
*Q1_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#先輩
ゴールだぜ！ 声を出せるやつは、チームを救うんだ！[p]
@jump target="*Q1_end"
*Q1_ng
[cm]
[playse storage="se_wrong.mp3"]
[eval exp="f.wrong_today.push('報連相')"]
#リーダー
おしいね。……魚肉ソーセージが傷んでるのに気づいたら、すぐ言ってほしいよね？[p]
言うのが遅いほど、食べちゃう人が増える。ミスも、同じだよ。すぐ報告、だね[p]
*Q1_end

;――学ぶ：BCC（先輩・観客席のたとえ）――
#先輩
次は、メールだ！ 宛先には「TO」「CC」「BCC」の3つがある[p]
TOは、パスを出す相手。CCは、ベンチから見ている仲間だ[p]
#同期
じゃあ、BCCは？[p]
#先輩
BCCは、観客席から、こっそり見ている人だ。ほかの人からは、誰がいるか見えないぜ[p]
#おまえ
（BCCに入れた人のアドレスは、ほかの人に見えない……と）[p]
[eval exp="f.terms['BCC'] = 'メールの宛先の1つ。BCCに入れた人のアドレスは、ほかの受け取り手に見えない'; f.toast = '用語図鑑に「BCC」を記録した'"]
[call storage="system/toast.ks"]

;Q2 BCC（会話：観客席から、こっそり見ている人）
[eval exp="f.term_q += 1"]
[playse storage="se_quiz_question.mp3"]
#
【Q2】お客さま10人に、まとめて案内メールを送る。お互いのアドレスは、見せたくない。どこに入れる？
[glink  color="black"  storage="ch1_3/scene1_1.ks"  size="24"  x="190"  width="900"  y="110"  text="TO"   target="*Q2_ng"  ]
[glink  color="black"  storage="ch1_3/scene1_1.ks"  size="24"  x="190"  width="900"  y="190"  text="CC"   target="*Q2_ng"  ]
[glink  color="black"  storage="ch1_3/scene1_1.ks"  size="24"  x="190"  width="900"  y="270"  text="BCC"  target="*Q2_ok"  ]
[s]
*Q2_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#先輩
ナイスシュート！ お客さまのアドレスを守るのも、立派な守備だぜ！[p]
@jump target="*Q2_end"
*Q2_ng
[cm]
[playse storage="se_wrong.mp3"]
[eval exp="f.wrong_today.push('BCC')"]
#リーダー
それだと、全員のアドレスが、全員に丸見えになっちゃうね[p]
見せたくない宛先は、BCC。「こっそり見ている人」だったよね[p]
*Q2_end

;――学ぶ：パスワード（同期の失敗 → 先輩・鍵のたとえ）――
#同期
なあ、オデ、パスワード覚えるの苦手でよ。全部「doukidoor」にしてるぜ！[p]
#おまえ
全部、同じなの！？[p]
#先輩
おいおい！ それは、家も車もロッカーも、同じ鍵にしてるのと同じだぜ[p]
1本盗まれたら、全部開いちまう。パスワードは、サービスごとに変えるんだ！[p]
[eval exp="f.terms['パスワードの使い回し'] = '同じパスワードを、いくつものサービスで使うこと。1つ漏れると、全部が危ない'; f.toast = '用語図鑑に「パスワードの使い回し」を記録した'"]
[call storage="system/toast.ks"]

;Q3 パスワード（会話：同じ鍵だと、1本盗まれたら全部開く）
[eval exp="f.term_q += 1"]
[playse storage="se_quiz_question.mp3"]
#
【Q3】パスワードの扱いとして、正しいものはどれ？
[glink  color="black"  storage="ch1_3/scene1_1.ks"  size="24"  x="190"  width="900"  y="110"  text="覚えやすいように、全部同じにする"  target="*Q3_ng"  ]
[glink  color="black"  storage="ch1_3/scene1_1.ks"  size="24"  x="190"  width="900"  y="190"  text="サービスごとに、ちがうものにする"  target="*Q3_ok"  ]
[glink  color="black"  storage="ch1_3/scene1_1.ks"  size="24"  x="190"  width="900"  y="270"  text="忘れないように、モニターに貼っておく"  target="*Q3_ng"  ]
[s]
*Q3_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#先輩
そうだ！ 鍵は、1本ずつ別にするんだぜ！[p]
#同期
……オデ、今夜、全部変えるぜ[p]
@jump target="*Q3_end"
*Q3_ng
[cm]
[playse storage="se_wrong.mp3"]
[eval exp="f.wrong_today.push('パスワードの使い回し')"]
#リーダー
それだと、1つ漏れただけで、ほかも全部、開いちゃうね[p]
パスワードは、サービスごとに変える。モニターに貼るのも、だめだよ[p]
*Q3_end

#先輩
前半は、ここまで！ ハーフタイムだ。昼飯、行くぜ！[p]


;=========================================
; 【昼休み】
;=========================================
[bg storage="bg_break_space.gif" time="500"]
[playbgm storage="bgm_easygoing.mp3" restart="false"]
#先輩
前半の成績、見せてみろ！[p]
;午前の正解数で、先輩のひと言が変わる
[if exp="f.correct_am >= 3"]
#先輩
全問正解か！ 初日から、ハットトリックだぜ！[p]
[elsif exp="f.correct_am >= 2"]
#先輩
いい守備だったぜ！ 午後も、この調子だ！[p]
[else]
#先輩
ドンマイだ！ 試合は、まだ前半が終わっただけだぜ！[p]
[endif]

#同期
お、このコーヒーマシン、どうやって使うんだ？[p]
#
同期が、ボタンを連打した。[p]
#同期
ウオォォォッ！ ……お湯しか出ねェ[p]
#おまえ
それ、ボタンを押しすぎ[p]


;=========================================
; 【業務後半】会話で学ぶ → Q4〜Q6
;=========================================
[bg storage="bg_team_desk.gif" time="500"]
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]

;――学ぶ：クラウド（リーダー・魚肉ソーセージの倉庫のたとえ）――
#リーダー
午後は、俺からも。この会社のデータは、ほとんど「クラウド」に置いてあるんだ[p]
#おまえ
クラウド……雲、ですか？[p]
#リーダー
そう。自分の冷蔵庫じゃなくて、大きな冷凍倉庫に、魚肉ソーセージを預ける感じだね[p]
インターネットがあれば、どこからでも取り出せる。会社のパソコンでも、家でもね[p]
[eval exp="f.terms['クラウド'] = 'インターネットの向こうのサーバに、データやソフトを置いて使う仕組み'; f.toast = '用語図鑑に「クラウド」を記録した'"]
[call storage="system/toast.ks"]

;Q4 クラウド（会話：倉庫に預けて、どこからでも取り出す）
[eval exp="f.term_q += 1"]
[playse storage="se_quiz_question.mp3"]
#
【Q4】インターネットの向こうのサーバに、データを置いて使う仕組みを何という？
[glink  color="black"  storage="ch1_3/scene1_1.ks"  size="24"  x="190"  width="900"  y="110"  text="クラウド"      target="*Q4_ok"  ]
[glink  color="black"  storage="ch1_3/scene1_1.ks"  size="24"  x="190"  width="900"  y="190"  text="USBメモリ"     target="*Q4_ng"  ]
[glink  color="black"  storage="ch1_3/scene1_1.ks"  size="24"  x="190"  width="900"  y="270"  text="デスクトップ"  target="*Q4_ng"  ]
[s]
*Q4_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#リーダー
正解。倉庫の場所を、覚えたね。おkだよ[p]
@jump target="*Q4_end"
*Q4_ng
[cm]
[playse storage="se_wrong.mp3"]
[eval exp="f.wrong_today.push('クラウド')"]
#先輩
おしいぜ！ 雲の上のスタジアムに、ボールを預けておく感じだ[p]
どこからでも、蹴りに行ける。それが、クラウドだぜ！[p]
*Q4_end

;――学ぶ：あやしいメール（同期のメール → リーダー）――
#同期
なあ、知らない人から「至急！ 添付ファイルを開いてください」ってメールが来たぜ[p]
#リーダー
おやおや。開く前に、ちょっと待ってね[p]
知らない人からの「至急」は、まず疑う。開くと、ウイルスが入ることもあるんだ[p]
本物そっくりの、にせメールで、だまそうとする手口を「フィッシング」っていうよ[p]
#同期
……あぶねェ。もう少しで、クリックするところだったぜ[p]
[eval exp="f.terms['フィッシング'] = '本物そっくりの、にせのメールやサイトで、だまして情報やお金を盗む手口'; f.toast = '用語図鑑に「フィッシング」を記録した'"]
[call storage="system/toast.ks"]

;Q5 フィッシング（会話：知らない人の「至急」は、まず疑う）
[eval exp="f.term_q += 1"]
[playse storage="se_quiz_question.mp3"]
#
【Q5】知らない相手から「至急、添付ファイルを開いて」とメールが来た。どうする？
[glink  color="black"  storage="ch1_3/scene1_1.ks"  size="24"  x="190"  width="900"  y="110"  text="至急なので、すぐ開く"            target="*Q5_ng"  ]
[glink  color="black"  storage="ch1_3/scene1_1.ks"  size="24"  x="190"  width="900"  y="190"  text="開かずに、先輩やリーダーに相談する"  target="*Q5_ok"  ]
[glink  color="black"  storage="ch1_3/scene1_1.ks"  size="24"  x="190"  width="900"  y="270"  text="返信して、相手に理由を聞く"        target="*Q5_ng"  ]
[s]
*Q5_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#リーダー
その通り。疑って、相談。それが、会社を守るんだよ[p]
@jump target="*Q5_end"
*Q5_ng
[cm]
[playse storage="se_wrong.mp3"]
[eval exp="f.wrong_today.push('フィッシング')"]
#先輩
相手のフェイントに、引っかかったな！[p]
あやしいメールは、開かない、返さない。まず、相談だぜ！[p]
*Q5_end

;――学ぶ：AIの文章（ハイパーAIの紹介 → 先輩）――
#先輩
最後に、うちの秘密兵器を紹介するぜ。ハイパーAIだ！[p]
#AI
はじめまして。文章作成も、調べものも、おまかせください。私の正確さは、100%です[p]
#おまえ
（100%……？）[p]
#AI
さっそく、お客さまへの、お知らせメールを作りました。「4月31日に、点検を行います」[p]
#おまえ
……4月って、30日までですよね[p]
#先輩
これだ！ AIは便利だが、たまに、それっぽいウソを書く。だから、使う人が、必ず確認する[p]
道具の責任は、使う人にあるんだぜ！[p]
[eval exp="f.terms['生成AI'] = '文章や絵を作るAI。便利だが、まちがいも書くので、人が確認してから使う'; f.toast = '用語図鑑に「生成AI」を記録した'"]
[call storage="system/toast.ks"]

;Q6 生成AI（会話：AIの文章は、使う人が必ず確認する）
[eval exp="f.term_q += 1"]
[playse storage="se_quiz_question.mp3"]
#
【Q6】AIが、お客さま宛ての文章を作ってくれた。どうする？
[glink  color="black"  storage="ch1_3/scene1_1.ks"  size="24"  x="190"  width="900"  y="110"  text="正確さ100%らしいので、そのまま送る"  target="*Q6_ng"  ]
[glink  color="black"  storage="ch1_3/scene1_1.ks"  size="24"  x="190"  width="900"  y="190"  text="内容を自分で確認してから送る"        target="*Q6_ok"  ]
[s]
*Q6_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.ai_ok += 1"]
#先輩
よし！ その習慣が、いちばん大事だぜ！[p]
#AI
……私の正確さは、99%に、修正します[p]
@jump target="*Q6_end"
*Q6_ng
[cm]
[playse storage="se_wrong.mp3"]
[eval exp="f.wrong_today.push('生成AI')"]
#リーダー
4月31日の点検に、お客さまが来ちゃうね……[p]
AIの文章は、下書き。送る前に、人が確認する。それだけ、覚えておこうね[p]
*Q6_end

#先輩
試合終了！ 初日、お疲れだったぜ！[p]


;=========================================
; 【終業後】誰と過ごすか（信頼度）
;=========================================
[bg storage="bg_office_evening.gif" time="500"]
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]
#
初日の仕事が、終わった。外は、もう夕焼けだ。[p]

;選択肢1：同期の信頼度＋1
;選択肢2：先輩の信頼度＋1
;選択肢3：リーダーの信頼度＋1
#
誰と、少し話していく？
[glink  color="black"  storage="ch1_3/scene1_1.ks"  size="24"  x="290"  width="700"  y="110"  text="同期と、帰り道を歩く"      target="*c2_douki"   ]
[glink  color="black"  storage="ch1_3/scene1_1.ks"  size="24"  x="290"  width="700"  y="190"  text="先輩に、今日のお礼を言う"  target="*c2_senpai"  ]
[glink  color="black"  storage="ch1_3/scene1_1.ks"  size="24"  x="290"  width="700"  y="270"  text="リーダーに、質問をする"    target="*c2_leader"  ]
[s]

*c2_douki
[cm]
;帰り道なので、夜の道の背景にする
[bg storage="bg_street_night.gif" time="500"]
#同期
今日は、ありがとな！ 明日も、ドアには気をつけるぜ！[p]
#おまえ
まず、ドアに近づかないで[p]
[eval exp="f.t_douki += 1; f.toast = '同期の信頼度が上がった！'"]
[call storage="system/toast.ks"]
@jump target="*c2_end"

*c2_senpai
[cm]
#先輩
礼なんていらねェ！ ……でも、悪くない気分だぜ！ 明日も、全力で走るぞ！[p]
#おまえ
（明日の練習メニューが、増えた気がする）[p]
[eval exp="f.t_senpai += 1; f.toast = '先輩の信頼度が上がった！'"]
[call storage="system/toast.ks"]
@jump target="*c2_end"

*c2_leader
[cm]
#リーダー
いい質問だね。わからないことを聞けるのは、立派な才能だよ[p]
……あ、今日のこと、ここで保存しとく？[p]
#おまえ
（この人がリーダーなら、なんだか安心する……のかな）[p]
[eval exp="f.t_leader += 1; f.toast = 'リーダーの信頼度が上がった！'"]
[call storage="system/toast.ks"]

*c2_end


;=========================================
; 【自宅】画面の物をクリックして、行動を選ぶ
;=========================================
[call storage="system/home.ks"]

;次の日へ
@jump storage="ch1_3/scene1_2.ks"
