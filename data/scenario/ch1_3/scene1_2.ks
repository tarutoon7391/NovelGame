;=========================================
; 第1章 2日目（4月2日）
; 会話で学ぶ型：朝 → 業務前半（学ぶ → 3問）→ 昼休み → 業務後半（学ぶ → 3問）→ 終業後 → 自宅
; この日の用語：進捗の報告・ハードウェアとソフトウェア・CPU・メモリとストレージ・LAN・個人情報
;=========================================

*start
[cm]
[clearfix]
[start_keyconfig]

;日の始まりの演出
[eval exp="f.tr_date = '4月2日'"]
[call storage="system/transition.ks" target="*day"]


;=========================================
; 【朝】営業の初登場
;=========================================
[bg storage="bg_company_front.gif" time="500"]
[playbgm storage="bgm_walk.mp3" restart="false"]
#
入社2日目。今日は、自動ドアを、無事に通れた。[p]
#同期
見ろよ！ 今日は、一回も挟まれなかったぜ！[p]
#おまえ
それ、普通のことだから[p]

[bg storage="bg_office.gif" time="500"]
;[効果音：ドアが勢いよく開く]
[playse storage="se_hatch_open_close.mp3"]
[quake count="2" time="200" hmax="10"]
#
オフィスのドアが勢いよく開き、ドアの後ろにいた同期が、弾き飛ばされた。[p]
#同期
ウオォォォッ！ ……今日も、ドアにやられた[p]
#？？？
……運用。返信、遅い[p]
#リーダー
おやおや、朝から元気だね。紹介するよ、営業担当だ[p]
#営業
……営業。名前は、覚えなくていい[p]
[eval exp="f.met_eigyo = true"]
#おまえ
（自己紹介が、一行で終わった）[p]
#営業
……依頼。『今日中に、社内のパソコンを全部、最新の状態にしてほしい』[p]
#先輩
全部、今日中か！ ウォームアップなしで、延長戦に出るようなもんだぜ！[p]
#営業
……できない、は禁止。客が、離れる[p]

;――選択肢（信頼度）――
;選択肢1：営業の信頼度＋1
;選択肢2：リーダーの信頼度＋1
#
慌てる運用チームの中で、どうする？
[glink  color="black"  storage="ch1_3/scene1_2.ks"  size="24"  x="290"  width="700"  y="150"  text="営業に、依頼の中身をくわしく聞く"  target="*c1_eigyo"   ]
[glink  color="black"  storage="ch1_3/scene1_2.ks"  size="24"  x="290"  width="700"  y="230"  text="リーダーに、どう進めるか相談する"  target="*c1_leader"  ]
[s]

*c1_eigyo
[cm]
#営業
……聞く気、あるのか。……要点だけ、言う。台数は30台。期限は、客次第[p]
[eval exp="f.t_eigyo += 1; f.toast = '営業の信頼度が上がった！'"]
[call storage="system/toast.ks"]
@jump target="*c1_end"

*c1_leader
[cm]
#リーダー
助かるよ、おk。まずは、台数と期限を確認してから、返事をしよう[p]
[eval exp="f.t_leader += 1; f.toast = 'リーダーの信頼度が上がった！'"]
[call storage="system/toast.ks"]

*c1_end


;=========================================
; 【業務前半】会話で学ぶ → Q1〜Q3
;=========================================
[bg storage="bg_team_desk.gif" time="500"]
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]
[eval exp="f.correct_am = 0"]

;――学ぶ：進捗の報告（先輩・試合の途中経過のたとえ）――
#先輩
いいか、新人。慌てたときこそ、基本だ。報連相、覚えてるな？[p]
今日みたいな仕事は、終わってから報告するんじゃない。途中で、何度も伝えるんだ[p]
試合の途中経過を、ベンチに伝えるのと同じだぜ。「今、2対1で負けてる」ってな[p]
#リーダー
遅れそうだと分かった時点で言ってくれれば、手を打てるからね。これを「進捗の報告」っていうよ[p]
[eval exp="f.terms['進捗の報告'] = '仕事の途中で、どこまで進んだかを伝えること。遅れそうなら、分かった時点で伝える'; f.toast = '用語図鑑に「進捗の報告」を記録した'"]
[call storage="system/toast.ks"]

;Q1 進捗の報告（会話：試合の途中経過を、ベンチに伝える）
[eval exp="f.term_q += 1"]
[playse storage="se_quiz_question.mp3"]
#
【Q1】30台の更新作業が、予定より遅れそうだ。どうする？
[glink  color="black"  storage="ch1_3/scene1_2.ks"  size="24"  x="190"  width="900"  y="110"  text="遅れそうだと分かった今、リーダーに伝える"  target="*Q1_ok"  ]
[glink  color="black"  storage="ch1_3/scene1_2.ks"  size="24"  x="190"  width="900"  y="190"  text="全部終わってから、まとめて報告する"        target="*Q1_ng"  ]
[glink  color="black"  storage="ch1_3/scene1_2.ks"  size="24"  x="190"  width="900"  y="270"  text="遅れたことは、聞かれるまで言わない"        target="*Q1_ng"  ]
[s]
*Q1_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#先輩
ナイスパスだぜ！ 途中経過が分かれば、作戦を変えられる！[p]
@jump target="*Q1_end"
*Q1_ng
[cm]
[playse storage="se_wrong.mp3"]
[eval exp="f.wrong_today.push('進捗の報告')"]
#リーダー
終わってからだと、もう間に合わないかもしれないね[p]
魚肉ソーセージの在庫も、なくなる前に言ってほしいでしょ？ 遅れそうなら、その時に、だよ[p]
*Q1_end

;――学ぶ：ハードウェアとソフトウェア（先輩・ボールと作戦のたとえ）――
#同期
なあ、パソコンを「最新の状態に」って、何を新しくするんだ？ 機械ごと買い替えるのか？[p]
#先輩
いい質問だぜ！ パソコンには、ハードウェアと、ソフトウェアがある[p]
ハードウェアは、ボールやゴールみたいに、手でさわれる「物」。キーボードや画面もそうだ[p]
ソフトウェアは、作戦。目には見えないけど、物を動かす中身だぜ。今日、新しくするのは、こっちだ[p]
[eval exp="f.terms['ハードウェアとソフトウェア'] = 'ハードウェアは、さわれる機械の部分。ソフトウェアは、機械を動かすプログラム'; f.toast = '用語図鑑に「ハードウェアとソフトウェア」を記録した'"]
[call storage="system/toast.ks"]

;Q2 ハードウェア（会話：手でさわれる「物」がハードウェア）
[eval exp="f.term_q += 1"]
[playse storage="se_quiz_question.mp3"]
#
【Q2】キーボードやマウスは、ハードウェアとソフトウェアの、どちら？
[glink  color="black"  storage="ch1_3/scene1_2.ks"  size="24"  x="190"  width="900"  y="110"  text="ハードウェア"  target="*Q2_ok"  ]
[glink  color="black"  storage="ch1_3/scene1_2.ks"  size="24"  x="190"  width="900"  y="190"  text="ソフトウェア"  target="*Q2_ng"  ]
[s]
*Q2_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#先輩
正解！ さわれる物は、ハードウェアだぜ！[p]
@jump target="*Q2_end"
*Q2_ng
[cm]
[playse storage="se_wrong.mp3"]
[eval exp="f.wrong_today.push('ハードウェアとソフトウェア')"]
#リーダー
キーボードは、手でさわれるよね。だから、ハードウェア[p]
ソフトウェアは、パソコンの中で動いているプログラムのほうだよ[p]
*Q2_end

;――学ぶ：CPU（先輩・司令塔のたとえ）――
#先輩
ついでに、パソコンの中の選手も覚えるぞ。まずは「CPU」だ[p]
CPUは、チームの司令塔。全部の計算や命令を、すごい速さでさばいてるんだぜ[p]
#同期
司令塔……先輩みたいなもんすか？[p]
#先輩
……俺は、どっちかと言うと、フォワードだぜ[p]
[eval exp="f.terms['CPU'] = 'パソコンの頭脳。計算や命令の処理をする部品'; f.toast = '用語図鑑に「CPU」を記録した'"]
[call storage="system/toast.ks"]

;Q3 CPU（会話：計算や命令をさばく司令塔）
[eval exp="f.term_q += 1"]
[playse storage="se_quiz_question.mp3"]
#
【Q3】パソコンの中で、計算や命令の処理をする「司令塔」はどれ？
[glink  color="black"  storage="ch1_3/scene1_2.ks"  size="24"  x="190"  width="900"  y="110"  text="マウス"      target="*Q3_ng"  ]
[glink  color="black"  storage="ch1_3/scene1_2.ks"  size="24"  x="190"  width="900"  y="190"  text="CPU"         target="*Q3_ok"  ]
[glink  color="black"  storage="ch1_3/scene1_2.ks"  size="24"  x="190"  width="900"  y="270"  text="モニター"    target="*Q3_ng"  ]
[s]
*Q3_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#先輩
ゴール！ 司令塔は、CPUだぜ！[p]
@jump target="*Q3_end"
*Q3_ng
[cm]
[playse storage="se_wrong.mp3"]
[eval exp="f.wrong_today.push('CPU')"]
#リーダー
マウスやモニターは、手足や目みたいなもの。考えているのは、CPUだよ[p]
*Q3_end

#先輩
前半は、ここまで！ ハーフタイムだぜ！[p]


;=========================================
; 【昼休み】
;=========================================
[bg storage="bg_break_space.gif" time="500"]
[playbgm storage="bgm_easygoing.mp3" restart="false"]
#先輩
前半の成績、見せてみろ！[p]
[if exp="f.correct_am >= 3"]
#先輩
全問正解！ 2日目で、もう司令塔の動きだぜ！[p]
#営業
……悪くない[p]
[elsif exp="f.correct_am >= 2"]
#先輩
いい調子だぜ！ 後半も、集中していくぞ！[p]
#営業
……半分は、できてる[p]
[else]
#先輩
ドンマイだ！ 昨日の今日で、全部は無理だぜ！[p]
[endif]

#同期
営業さん、怖かったなァ……[p]
#おまえ
でも、仕事はできる人らしいよ[p]
#同期
お、ここが休憩スペースの入口か。……開かねェ！ ウオォォォッ！[p]
#おまえ
それ、引くドア[p]


;=========================================
; 【業務後半】会話で学ぶ → Q4〜Q6
;=========================================
[bg storage="bg_team_desk.gif" time="500"]
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]
#営業
……客。『やっぱり、明日でいい』[p]
#先輩
結局、明日でいいのか！ 今までの全力ダッシュは、なんだったんだ！[p]
#営業
……文句は、客に言え[p]

;――学ぶ：メモリとストレージ（リーダー・作業机と本棚のたとえ）――
#リーダー
時間ができたから、パソコンの中の「しまう場所」の話をしようか[p]
「メモリ」は、作業机。広いほど、たくさんの作業を同時に広げられる[p]
でも、電源を切ると、机の上は片付けられて、全部消えちゃうんだ[p]
「ストレージ」は、本棚。しまっておけば、電源を切っても、ちゃんと残るよ[p]
[eval exp="f.terms['メモリとストレージ'] = 'メモリは作業机（電源を切ると消える）。ストレージは本棚（電源を切っても残る）'; f.toast = '用語図鑑に「メモリとストレージ」を記録した'"]
[call storage="system/toast.ks"]

;Q4 ストレージ（会話：本棚は、電源を切っても残る）
[eval exp="f.term_q += 1"]
[playse storage="se_quiz_question.mp3"]
#
【Q4】パソコンの電源を切っても、データが消えずに残るのはどっち？
[glink  color="black"  storage="ch1_3/scene1_2.ks"  size="24"  x="190"  width="900"  y="110"  text="メモリ（作業机）"      target="*Q4_ng"  ]
[glink  color="black"  storage="ch1_3/scene1_2.ks"  size="24"  x="190"  width="900"  y="190"  text="ストレージ（本棚）"    target="*Q4_ok"  ]
[s]
*Q4_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#リーダー
正解。本棚にしまえば、明日もちゃんとあるね。おkだよ[p]
@jump target="*Q4_end"
*Q4_ng
[cm]
[playse storage="se_wrong.mp3"]
[eval exp="f.wrong_today.push('メモリとストレージ')"]
#先輩
作業机は、試合が終わったら片付けるロッカールームのベンチだ！[p]
残しておきたい物は、本棚、つまりストレージにしまうんだぜ！[p]
*Q4_end

;――学ぶ：LAN（同期のケーブル → リーダー）――
#同期
なあ、オデの机の下に、青いケーブルがあるんだけどよ。これ、何だ？[p]
#リーダー
それは、LANケーブル。会社の中のパソコンどうしを、つないでいるんだ[p]
会社やお家の中みたいに、せまい範囲のネットワークを、「LAN」っていうよ[p]
#同期
大丈夫、オデに任せろ！ ……抜いたりは、しないぜ[p]
[eval exp="f.terms['LAN'] = '会社や家の中など、せまい範囲のネットワーク'; f.toast = '用語図鑑に「LAN」を記録した'"]
[call storage="system/toast.ks"]

;Q5 LAN（会話：会社や家の中の、せまい範囲のネットワーク）
[eval exp="f.term_q += 1"]
[playse storage="se_quiz_question.mp3"]
#
【Q5】会社や家の中など、せまい範囲のネットワークを何という？
[glink  color="black"  storage="ch1_3/scene1_2.ks"  size="24"  x="190"  width="900"  y="110"  text="LAN"         target="*Q5_ok"  ]
[glink  color="black"  storage="ch1_3/scene1_2.ks"  size="24"  x="190"  width="900"  y="190"  text="CPU"         target="*Q5_ng"  ]
[glink  color="black"  storage="ch1_3/scene1_2.ks"  size="24"  x="190"  width="900"  y="270"  text="BCC"         target="*Q5_ng"  ]
[s]
*Q5_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#同期
LAN！ オデのケーブルの名前だぜ！[p]
@jump target="*Q5_end"
*Q5_ng
[cm]
[playse storage="se_wrong.mp3"]
[eval exp="f.wrong_today.push('LAN')"]
#同期
オデの机の下の、青いケーブルのやつだぜ！ LAN、だ！[p]
*Q5_end

;――学ぶ：個人情報（営業・客の財布のたとえ）――
#営業
……そこの。客のリスト、見たか[p]
#おまえ
はい。名前と、住所と、電話番号が[p]
#営業
……それは、客の財布と同じ。……なくしたら、客は、二度と来ない[p]
……会社の外には、持ち出すな。メールで、勝手に送るな[p]
[eval exp="f.terms['個人情報'] = '名前・住所・電話番号など、その人がだれか分かる情報。勝手に持ち出したり、送ったりしない'; f.toast = '用語図鑑に「個人情報」を記録した'"]
[call storage="system/toast.ks"]

;Q6 個人情報（会話：客の財布と同じ。外に持ち出さない）
[eval exp="f.term_q += 1"]
[playse storage="se_quiz_question.mp3"]
#
【Q6】お客さまの名前や住所が入ったファイル。家で続きをやりたい。どうする？
[glink  color="black"  storage="ch1_3/scene1_2.ks"  size="24"  x="190"  width="900"  y="110"  text="自分のメールに送って、家で開く"      target="*Q6_ng"  ]
[glink  color="black"  storage="ch1_3/scene1_2.ks"  size="24"  x="190"  width="900"  y="190"  text="USBメモリに入れて、持ち帰る"        target="*Q6_ng"  ]
[glink  color="black"  storage="ch1_3/scene1_2.ks"  size="24"  x="190"  width="900"  y="270"  text="持ち出さず、会社のルールを確認する"  target="*Q6_ok"  ]
[s]
*Q6_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#営業
……それで、いい[p]
#
営業は、ほんの少しだけ、うなずいた。[p]
@jump target="*Q6_end"
*Q6_ng
[cm]
[playse storage="se_wrong.mp3"]
[eval exp="f.wrong_today.push('個人情報')"]
#リーダー
それだと、お客さまの大事な情報が、会社の外に出ちゃうね[p]
なくしたら、取り返しがつかない。持ち出さないのが、基本だよ[p]
*Q6_end

#先輩
試合終了だ！ 明日からは、いよいよLinuxだぜ。楽しみにしてろ！[p]
#おまえ
楽しみにしてるのは、先輩だけです[p]


;=========================================
; 【終業後】誰と過ごすか（信頼度）
;=========================================
[bg storage="bg_office_evening.gif" time="500"]
#
2日目が、終わった。会社の中は、もう静かだ。[p]

;選択肢1：営業の信頼度＋1
;選択肢2：同期の信頼度＋1
;選択肢3：リーダーの信頼度＋1
#
誰と、少し話していく？
[glink  color="black"  storage="ch1_3/scene1_2.ks"  size="24"  x="290"  width="700"  y="110"  text="営業に、仕事のコツを聞く"  target="*c2_eigyo"   ]
[glink  color="black"  storage="ch1_3/scene1_2.ks"  size="24"  x="290"  width="700"  y="190"  text="同期と、LANケーブルを見る"  target="*c2_douki"   ]
[glink  color="black"  storage="ch1_3/scene1_2.ks"  size="24"  x="290"  width="700"  y="270"  text="リーダーと、今日をふり返る"  target="*c2_leader"  ]
[s]

*c2_eigyo
[cm]
#営業
……珍しい。聞いてくるのは。……客の話は、最後まで聞け。それだけ[p]
……猫さんが、待ってる。帰る[p]
#おまえ
（猫を飼ってるんだ……しかも、さん付け）[p]
[eval exp="f.t_eigyo += 1; f.toast = '営業の信頼度が上がった！'"]
[call storage="system/toast.ks"]
@jump target="*c2_end"

*c2_douki
[cm]
#同期
よし、今度、ケーブルの先を見てみるぜ！ 大丈夫、オデに任せろ！[p]
#おまえ
（見るだけにしておいて）[p]
[eval exp="f.t_douki += 1; f.toast = '同期の信頼度が上がった！'"]
[call storage="system/toast.ks"]
@jump target="*c2_end"

*c2_leader
[cm]
#リーダー
今日は、営業の口数の少なさに、負けなかったね。あいつ、本当は、すごく頑張り屋なんだよ[p]
[eval exp="f.t_leader += 1; f.toast = 'リーダーの信頼度が上がった！'"]
[call storage="system/toast.ks"]

*c2_end


;=========================================
; 【自宅】画面の物をクリックして、行動を選ぶ
;=========================================
[call storage="system/home.ks"]

;次の日へ
@jump storage="ch1_3/scene1_3.ks"
