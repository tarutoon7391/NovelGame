;=========================================
; 第1章 4日目（4月4日）……1週目の総仕上げ
; 会話で学ぶ型：朝（★キー選択肢：自動ドア）→ 業務前半（思い出す → 3問）→ 昼休み
;               → 業務後半（思い出す → 3問）→ 終業後（同期との勉強会）→ 自宅 → 第1章のおわり
; この日の問題は、1〜3日目の復習。問題の前に、キャラが「あのときの、たとえ」を思い出させる。
;=========================================

*start
[cm]
[clearfix]
[start_keyconfig]

;日の始まりの演出
[eval exp="f.tr_date = '4月4日'"]
[call storage="system/transition.ks" target="*day"]


;=========================================
; 【朝】
;=========================================
[playbgm storage="bgm_walk.mp3" restart="false"]
;[場面：会社の入口。自動ドアの前]
[bg storage="bg_entrance_door.gif" time="500"]

#
会社の入口に、着いた。[p]
今日も、自動ドアが、静かに、こちらを待ち構えている。[p]
#おまえ
（……このドアは、今週だけで、同期を、4回も挟んでいる）[p]
（今日こそ、決着を、つけるべきなのかもしれない）[p]

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
#
自動ドアの前で、どうする？
[glink  color="red"  name="key_btn"  storage="ch1_3/scene1_4.ks"  size="26"  x="266"  width="640"  y="120"  text="普通に、通る"  target="*key_door_1"  ]
[glink  color="red"  name="key_btn"  storage="ch1_3/scene1_4.ks"  size="26"  x="266"  width="640"  y="195"  text="自動ドアに、真っ向から勝負を挑む"  target="*key_door_2"  ]
[kanim name="key_btn" keyframe="key_shake" time="150" count="infinite"]
[s]

*key_door_1
[cm]
[free_layermode name="key_red" time="300"]
[playse storage="se_autodoor_open.mp3"]
#
自動ドアは、何事もなく、開いた。[p]
#おまえ
（……普通が、一番だ）[p]
@jump target="*key_door_end"

*key_door_2
[cm]
[free_layermode name="key_red" time="300"]
#おまえ
（同期の、かたきだ）[p]
;信頼度が「高い」（10以上）キャラがいれば、1回だけ止めに来る
@jump target="*key_door_stop" cond="Math.max(f.t_senpai, f.t_leader, f.t_eigyo, f.t_douki) >= 10"
#おまえ
……行くぞ！[p]
@jump storage="ending/end08.ks"

*key_door_stop
;止めに来るのは、いま一番信頼度が高いキャラ
[if exp="f.t_senpai >= Math.max(f.t_leader, f.t_eigyo, f.t_douki)"]
#先輩
待て、新人！ そのドアは、ゴールキーパーより、手ごわいぜ！[p]
無理なシュートは、打つな！[p]
[elsif exp="f.t_leader >= Math.max(f.t_eigyo, f.t_douki)"]
#リーダー
おやおや、新人さん。そのドアと勝負するのは、やめておこうね[p]
同期くんを、見たでしょ。……一回、保存しとく？[p]
[elsif exp="f.t_eigyo >= f.t_douki"]
#営業
……そこの。やめろ[p]
……そのドアは、客より、手ごわい[p]
[else]
#同期
待て！ そいつと勝負しちゃ、ダメだ！[p]
オデは、何回も、負けてるんだぜ……[p]
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
#
……どうする？
[glink  color="red"  storage="ch1_3/scene1_4.ks"  size="26"  x="266"  width="640"  y="120"  text="考え直す"  name="key_btn"  target="*key_door_back"  ]
[glink  color="red"  storage="ch1_3/scene1_4.ks"  size="26"  x="266"  width="640"  y="195"  text="それでも、進む"  name="key_btn"  target="*key_door_go"  ]
[kanim name="key_btn" keyframe="key_shake" time="150" count="infinite"]
[s]

*key_door_back
[cm]
[free_layermode name="key_red" time="300"]
#おまえ
（……止めてもらえて、よかった）[p]
@jump target="*key_door_1"

*key_door_go
[cm]
[free_layermode name="key_red" time="300"]
#おまえ
……行くぞ！[p]
@jump storage="ending/end08.ks"

*key_door_end

[bg storage="bg_office.gif" time="500"]
#同期
なあ、今日の夜、勉強会しねェか？ 今週のおさらい、一緒にやりたくてよ[p]
#おまえ
いいね。仕事のあとに、会議室でやろう[p]
#同期
ありがとな。ずっと「オデに任せろ」って言ってきたけど、本当は、ちょっと不安でよ[p]
#おまえ
（任せろの人にも、弱いところがあるんだ）[p]

#先輩
おはよう！ 今日は、1週目の総仕上げだぜ！[p]
#営業
……そこの。今日の復習、足を引っ張るな[p]
#社長
ふっ……一週間、経ったな。慣れたと言うやつほど、油断するんだぜ。いいか、よく聞け……[p]
#
社長は、続きを言わないまま、窓の外を見つめて去っていった。[p]
#リーダー
あれ、実は褒めてるんだよ。たぶんね[p]

;――選択肢（信頼度）――
;選択肢1：先輩の信頼度＋1
;選択肢2：営業の信頼度＋1
#
今週の総仕上げ。最初に、誰に声をかける？
[glink  color="black"  storage="ch1_3/scene1_4.ks"  size="24"  x="290"  width="700"  y="150"  text="先輩に「今週はありがとうございました」"  target="*c1_senpai"  ]
[glink  color="black"  storage="ch1_3/scene1_4.ks"  size="24"  x="290"  width="700"  y="230"  text="営業に「お客さまの話を聞かせてください」"  target="*c1_eigyo"   ]
[s]

*c1_senpai
[cm]
#先輩
おう、こちらこそだぜ！ 最終週のロスタイム、全力で走るぞ！[p]
#おまえ
（まだ、1週目です）[p]
[eval exp="f.t_senpai += 1; f.toast = '先輩の信頼度が上がった！'"]
[call storage="system/toast.ks"]
@jump target="*c1_end"

*c1_eigyo
[cm]
#営業
……客の話。昼に、少しだけ[p]
#おまえ
（少しだけ、が、うれしい）[p]
[eval exp="f.t_eigyo += 1; f.toast = '営業の信頼度が上がった！'"]
[call storage="system/toast.ks"]

*c1_end


;=========================================
; 【業務前半】思い出す → Q1〜Q3（1〜2日目の復習）
;=========================================
[bg storage="bg_team_desk.gif" time="500"]
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]
[eval exp="f.correct_am = 0"]
#先輩
よし！ 今週の復習だぜ！ 迷ったら、俺たちの「たとえ」を思い出せ！[p]

;――思い出す：報連相（1日目・ボールを取られたら、すぐ声を出す）――
#同期
オデ、ノートにまとめたぜ。報連相は……「ボールを取られたら、すぐ声を出す」！[p]

;Q1 報連相（復習）
[eval exp="f.term_q += 1"]
[playse storage="se_quiz_question.mp3"]
#
【Q1】お客さまに送るはずのメールを、まちがえて別の人に送ってしまった。どうする？
[glink  color="black"  storage="ch1_3/scene1_4.ks"  size="24"  x="190"  width="900"  y="110"  text="気づかなかったことにする"      target="*Q1_ng"  ]
[glink  color="black"  storage="ch1_3/scene1_4.ks"  size="24"  x="190"  width="900"  y="190"  text="すぐに先輩に報告して、相談する"  target="*Q1_ok"  ]
[glink  color="black"  storage="ch1_3/scene1_4.ks"  size="24"  x="190"  width="900"  y="270"  text="明日、落ち着いてから報告する"    target="*Q1_ng"  ]
[s]
*Q1_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#先輩
それだ！ 悪い知らせほど、早く伝えるんだぜ！[p]
@jump target="*Q1_end"
*Q1_ng
[cm]
[playse storage="se_wrong.mp3"]
[eval exp="f.wrong_today.push('報連相')"]
#リーダー
まちがえて送ったときこそ、すぐ報告。早いほど、取り消したり、謝ったりできるからね[p]
*Q1_end

;――思い出す：BCC（1日目・観客席から、こっそり見ている人）――
#同期
BCCは……「観客席から、こっそり見ている人」だったよな？[p]
#先輩
そうだ！ ほかの人からは、見えない席だぜ[p]

;Q2 BCC（復習）
[eval exp="f.term_q += 1"]
[playse storage="se_quiz_question.mp3"]
#
【Q2】BCCに入れた人のメールアドレスは、ほかの受け取り手から見える？
[glink  color="black"  storage="ch1_3/scene1_4.ks"  size="24"  x="190"  width="900"  y="110"  text="見える"    target="*Q2_ng"  ]
[glink  color="black"  storage="ch1_3/scene1_4.ks"  size="24"  x="190"  width="900"  y="190"  text="見えない"  target="*Q2_ok"  ]
[s]
*Q2_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#先輩
正解！ こっそり見ている席だからな！[p]
@jump target="*Q2_end"
*Q2_ng
[cm]
[playse storage="se_wrong.mp3"]
[eval exp="f.wrong_today.push('BCC')"]
#リーダー
BCCは、ほかの人からは見えないよ。だから、お客さまどうしのアドレスを守れるんだ[p]
*Q2_end

;――思い出す：メモリとストレージ（2日目・作業机と本棚）――
#リーダー
2日目の、作業机と本棚の話、覚えてる？ 電源を切ると、どっちが片付けられたかな[p]

;Q3 メモリ（復習）
[eval exp="f.term_q += 1"]
[playse storage="se_quiz_question.mp3"]
#
【Q3】パソコンの電源を切ると、中身が消えてしまうのはどっち？
[glink  color="black"  storage="ch1_3/scene1_4.ks"  size="24"  x="190"  width="900"  y="110"  text="メモリ（作業机）"    target="*Q3_ok"  ]
[glink  color="black"  storage="ch1_3/scene1_4.ks"  size="24"  x="190"  width="900"  y="190"  text="ストレージ（本棚）"  target="*Q3_ng"  ]
[s]
*Q3_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#リーダー
正解。作業机は、片付けられちゃうんだったね。おkだよ[p]
@jump target="*Q3_end"
*Q3_ng
[cm]
[playse storage="se_wrong.mp3"]
[eval exp="f.wrong_today.push('メモリとストレージ')"]
#先輩
逆だぜ！ 本棚（ストレージ）は残る。作業机（メモリ）は、片付けられて消えるんだ！[p]
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
一週間で、ここまで来るとは、立派だぜ！[p]
#リーダー
新人さん、ほんとにすごいね。おkだよ[p]
[elsif exp="f.correct_am >= 2"]
#先輩
いい感じだぜ！ 後半で、仕上げるぞ！[p]
[else]
#先輩
ドンマイだ！ 夜の勉強会で、取り返せ！[p]
#おまえ
（夜の勉強会が、頼みの綱だ）[p]
[endif]
#同期
今日の夜、ちゃんと教えるぜ！ オデ、説明するのは得意なんだ[p]
#おまえ
こちらこそ。お互い、わからないところを、教えよう[p]


;=========================================
; 【業務後半】思い出す → Q4〜Q6（1〜3日目の復習）
;=========================================
[bg storage="bg_team_desk.gif" time="500"]
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]
#先輩
後半は、Linuxとセキュリティの復習だ！ 黒い画面が怖くなくなったか、確かめるぜ！[p]

;――思い出す：pwd と ls（3日目・ピッチのどこにいるか／まわりを見回す）――
#同期
pwd は「ピッチのどこにいるか」、ls は「まわりを見回す」……だったよな[p]

;Q4 ls（復習）
[eval exp="f.term_q += 1"]
[playse storage="se_quiz_question.mp3"]
#
【Q4】フォルダの中に何があるか、一覧で見たい。打つのはどっち？
[glink  color="black"  storage="ch1_3/scene1_4.ks"  size="24"  x="190"  width="900"  y="110"  text="pwd"  target="*Q4_ng"  ]
[glink  color="black"  storage="ch1_3/scene1_4.ks"  size="24"  x="190"  width="900"  y="190"  text="ls"   target="*Q4_ok"  ]
[s]
*Q4_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#同期
オデのノート、合ってたぜ！[p]
@jump target="*Q4_end"
*Q4_ng
[cm]
[playse storage="se_wrong.mp3"]
[eval exp="f.wrong_today.push('ls')"]
#リーダー
pwd は、今いる場所。一覧は、ls だよ[p]
*Q4_end

;――思い出す：rm（3日目・レッドカード）――
#先輩
rm は、覚えてるな？ レッドカードの、あのコマンドだぜ[p]

;Q5 rm（復習）
[eval exp="f.term_q += 1"]
[playse storage="se_quiz_question.mp3"]
#
【Q5】rm で消したファイルは、どうなる？
[glink  color="black"  storage="ch1_3/scene1_4.ks"  size="24"  x="190"  width="900"  y="110"  text="ゴミ箱に入るので、あとで戻せる"  target="*Q5_ng"  ]
[glink  color="black"  storage="ch1_3/scene1_4.ks"  size="24"  x="190"  width="900"  y="190"  text="ゴミ箱を通らず、元に戻せない"    target="*Q5_ok"  ]
[s]
*Q5_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#先輩
その通り！ 一発退場だ。だから、確認してから使うんだぜ！[p]
@jump target="*Q5_end"
*Q5_ng
[cm]
[playse storage="se_wrong.mp3"]
[eval exp="f.wrong_today.push('rm')"]
#リーダー
rm は、ゴミ箱を通らないんだ。食べちゃった魚肉ソーセージと同じで、もう戻らないよ[p]
*Q5_end

;――思い出す：フィッシング（1日目・知らない人の「至急」は、まず疑う）――
#同期
あ、またメールが来たぜ。「あなたのアカウントが止まります。今すぐログインを」だってよ[p]
#リーダー
おやおや。1日目に話したこと、覚えてるかな？[p]

;Q6 フィッシング（復習）
[eval exp="f.term_q += 1"]
[playse storage="se_quiz_question.mp3"]
#
【Q6】「今すぐログインを」というメールの、リンクを押す前に、どうする？
[glink  color="black"  storage="ch1_3/scene1_4.ks"  size="24"  x="190"  width="900"  y="110"  text="急いでいるので、すぐ押してログインする"  target="*Q6_ng"  ]
[glink  color="black"  storage="ch1_3/scene1_4.ks"  size="24"  x="190"  width="900"  y="190"  text="押さずに、本物かどうか確かめ、相談する"  target="*Q6_ok"  ]
[s]
*Q6_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#リーダー
正解。「今すぐ」は、フィッシングの、よくある手口だね[p]
#同期
……あぶねェ。また、押すところだったぜ[p]
@jump target="*Q6_end"
*Q6_ng
[cm]
[playse storage="se_wrong.mp3"]
[eval exp="f.wrong_today.push('フィッシング')"]
#先輩
相手のフェイントだぜ！ 急がせるのは、だます手口の、お決まりだ！[p]
押す前に、まず相談。にせのサイトかもしれないぜ！[p]
*Q6_end

#先輩
試合終了だ！ 今週は、本当によく頑張ったぜ！[p]
#営業
……勉強会か。……悪くない[p]
#おまえ
（営業さんに、また、褒められた）[p]


;=========================================
; 【終業後】同期との初めての勉強会（決まったイベント）
;=========================================
[bg storage="bg_meeting_room_night.gif" time="500"]
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]
#
終業後の会議室。ホワイトボードに、今週の用語が並んでいる。[p]
#同期
よし、始めるぜ！ 今週出てきた用語を、順番に、オデが説明するからな[p]
報連相、BCC、CPU、LAN、それから……ストレージ！[p]
#おまえ
ちゃんとまとまってる。さすが、面倒見がいい[p]
#同期
へへっ。じゃあ、ここからはお前が先生な。Linuxの操作、教えてくれ[p]
#おまえ
pwd で、今いる場所を確認して、ls で、一覧を見て……[p]
#同期
わかった。pwd……あれ、画面が、真っ暗になったぞ[p]
#おまえ
……それ、電源ボタン[p]
#同期
わりィ……オデ、「任せろ」って言うくせに、機械だけは、本当にダメでよ[p]
みんなに、迷惑かけてる気がしてよ……[p]

;――選択肢（同期との特別イベント）――
;選択肢1：同期の信頼度＋2
;選択肢2：同期の信頼度＋1
#
同期が、少し落ち込んでいる。何と声をかける？
[glink  color="black"  storage="ch1_3/scene1_4.ks"  size="24"  x="290"  width="700"  y="150"  text="「得意なことで、助け合おう」"  target="*c2_help"  ]
[glink  color="black"  storage="ch1_3/scene1_4.ks"  size="24"  x="290"  width="700"  y="230"  text="「慣れれば、できるようになるよ」"  target="*c2_cheer"  ]
[s]

*c2_help
[cm]
#おまえ
僕は機械、同期は説明。得意なことで、助け合おうよ[p]
#同期
……ありがとな。そう言ってもらえると、本当に助かるぜ[p]
じゃあ、オデは、教える側に回る。お前は、機械の先生だ！[p]
[eval exp="f.t_douki += 2; f.toast = '同期の信頼度が、大きく上がった！'"]
[call storage="system/toast.ks"]
@jump target="*c2_end"

*c2_cheer
[cm]
#同期
おう、そうだよな。慣れれば、できるよな。少し、元気が出たぜ！[p]
#おまえ
無理しなくていいよ[p]
[eval exp="f.t_douki += 1; f.toast = '同期の信頼度が上がった！'"]
[call storage="system/toast.ks"]

*c2_end
#同期
今日は、ありがとな！ 来週も、またやろうぜ！[p]
#おまえ
うん。次は、電源ボタンに気をつけて[p]
#同期
おう、それは約束する！ ……たぶん[p]


;=========================================
; 【自宅】画面の物をクリックして、行動を選ぶ
;=========================================
[call storage="system/home.ks"]


;=========================================
; 【第1章のおわり】
;=========================================
[eval exp="f.tr_chapter = '第1章'; f.tr_next = '第2章「AIは、100%を語る」'"]
[call storage="system/transition.ks" target="*chapter_end"]

;次のファイルへ（第2章）
@jump storage="ch1_3/scene2_1.ks"
