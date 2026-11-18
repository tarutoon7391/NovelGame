;=========================================
; 第1章 3日目（4月3日）
; 会話で学ぶ型：朝 → 業務前半（学ぶ → 3問）→ 昼休み → 業務後半（学ぶ → 3問）→ 終業後 → 自宅
; この日の用語：pwd・ls・cd・mkdir・rm・二要素認証（初めてのLinux）
;=========================================

*start
[cm]
[clearfix]
[start_keyconfig]

;日の始まりの演出
[eval exp="f.tr_date = '4月3日'"]
[call storage="system/transition.ks" target="*day"]


;=========================================
; 【朝】
;=========================================
[bg storage="bg_office.gif" time="500"]
[playbgm storage="bgm_walk.mp3" restart="false"]
#
入社3日目。今日は、Linuxをさわる日だ。[p]
#同期
Linuxって、何だっけ。ペンギンのやつだよな？[p]
#おまえ
ペンギンは、マスコットだね[p]
#同期
かわいいなら、オデでも大丈夫そうだぜ！[p]
#おまえ
（かわいさは、関係ない）[p]

[bg storage="bg_team_desk.gif" time="500"]
#先輩
見ろ、これがLinuxの画面だぜ！ 黒い画面に、文字だけ。かっこいいだろ！[p]
#おまえ
……暗いです[p]
#先輩
暗いんじゃない、渋いんだぜ！[p]
#社長
ふっ……黒い画面が使えないやつは、うちにはいらないぜ……[p]
#おまえ
今日、初めて見たんですが[p]
#社長
なら、今日覚えろ。いいか、よく聞け……[p]
#
社長は、何も言わずに、ムーンウォークで去っていった。[p]

;――選択肢（信頼度）――
;選択肢1：先輩の信頼度＋1
;選択肢2：同期の信頼度＋1
#
黒い画面に、少し緊張している。どうする？
[glink  color="black"  storage="ch1_3/scene1_3.ks"  size="24"  x="290"  width="700"  y="150"  text="先輩に「教えてください」と言う"  target="*c1_senpai"  ]
[glink  color="black"  storage="ch1_3/scene1_3.ks"  size="24"  x="290"  width="700"  y="230"  text="同期と「一緒にやろう」と言う"    target="*c1_douki"   ]
[s]

*c1_senpai
[cm]
#先輩
いい判断だぜ！ 最初の一歩は、キックオフと同じ。思い切っていけ！[p]
#おまえ
（いきなり声が大きい）[p]
[eval exp="f.t_senpai += 1; f.toast = '先輩の信頼度が上がった！'"]
[call storage="system/toast.ks"]
@jump target="*c1_end"

*c1_douki
[cm]
#同期
おう、一緒にやろうぜ！ 大丈夫、オデに任せろ！[p]
#おまえ
（その「任せろ」が、一番こわい）[p]
[eval exp="f.t_douki += 1; f.toast = '同期の信頼度が上がった！'"]
[call storage="system/toast.ks"]

*c1_end


;=========================================
; 【業務前半】会話で学ぶ → Q1〜Q3
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]
[eval exp="f.correct_am = 0"]

;――学ぶ：pwd（先輩・ピッチのどこにいるか）――
#先輩
いいか。黒い画面では、まず「自分が今、どこにいるか」を知るんだ[p]
試合中、ピッチのどこに立ってるか分からなかったら、パスも出せないだろ？[p]
「pwd」と打つと、今いる場所を、教えてくれるぜ[p]
#リーダー
パソコンの中の「場所」は、フォルダのことだよ。pwd は、今いるフォルダを表示するんだ[p]
[eval exp="f.terms['pwd'] = 'Linuxのコマンド。今いる場所（フォルダ）を表示する'; f.toast = '用語図鑑に「pwd」を記録した'"]
[call storage="system/toast.ks"]

;Q1 pwd（会話：ピッチのどこにいるかを知る）
[eval exp="f.term_q += 1"]
[playse storage="se_quiz_question.mp3"]
#
【Q1】黒い画面で、「今いる場所」を確認したい。どれを打つ？
[glink  color="black"  storage="ch1_3/scene1_3.ks"  size="24"  x="190"  width="900"  y="110"  text="pwd"  target="*Q1_ok"  ]
[glink  color="black"  storage="ch1_3/scene1_3.ks"  size="24"  x="190"  width="900"  y="190"  text="rm"   target="*Q1_ng"  ]
[glink  color="black"  storage="ch1_3/scene1_3.ks"  size="24"  x="190"  width="900"  y="270"  text="cd"   target="*Q1_ng"  ]
[s]
*Q1_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#先輩
ナイスポジショニングだぜ！[p]
@jump target="*Q1_end"
*Q1_ng
[cm]
[playse storage="se_wrong.mp3"]
[eval exp="f.wrong_today.push('pwd')"]
#リーダー
今いる場所は、pwd。地図アプリの「現在地」ボタンみたいなものだね[p]
*Q1_end

;――学ぶ：ls（同期・まわりを見回す）――
#同期
場所はわかったけどよ、ここに何があるのか、見えねェぞ[p]
#先輩
そういう時は「ls」だ。まわりを見回して、どんな選手がいるか確かめる感じだぜ[p]
今いるフォルダの中にある、ファイルやフォルダの一覧を、ずらっと出してくれる[p]
[eval exp="f.terms['ls'] = 'Linuxのコマンド。今いるフォルダの中身を、一覧で表示する'; f.toast = '用語図鑑に「ls」を記録した'"]
[call storage="system/toast.ks"]

;Q2 ls（会話：まわりを見回して、一覧を出す）
[eval exp="f.term_q += 1"]
[playse storage="se_quiz_question.mp3"]
#
【Q2】今いるフォルダの中に、何が入っているか一覧で見たい。どれを打つ？
[glink  color="black"  storage="ch1_3/scene1_3.ks"  size="24"  x="190"  width="900"  y="110"  text="pwd"  target="*Q2_ng"  ]
[glink  color="black"  storage="ch1_3/scene1_3.ks"  size="24"  x="190"  width="900"  y="190"  text="ls"   target="*Q2_ok"  ]
[glink  color="black"  storage="ch1_3/scene1_3.ks"  size="24"  x="190"  width="900"  y="270"  text="mkdir"  target="*Q2_ng"  ]
[s]
*Q2_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#同期
おお、ずらっと出たぜ！ オデにも、見えた！[p]
@jump target="*Q2_end"
*Q2_ng
[cm]
[playse storage="se_wrong.mp3"]
[eval exp="f.wrong_today.push('ls')"]
#リーダー
中身の一覧は、ls だよ。「list（リスト）」の ls、と覚えるといいね[p]
*Q2_end

;――学ぶ：cd（先輩・ポジション移動）――
#先輩
最後は、移動だ。「cd フォルダの名前」で、そのフォルダに移れる[p]
ポジションを変えるのと同じだぜ。ひとつ前のフォルダに戻るときは「cd ..」だ！[p]
[eval exp="f.terms['cd'] = 'Linuxのコマンド。フォルダを移動する。cd .. で、ひとつ前に戻る'; f.toast = '用語図鑑に「cd」を記録した'"]
[call storage="system/toast.ks"]

;Q3 cd（会話：ポジションを変える）
[eval exp="f.term_q += 1"]
[playse storage="se_quiz_question.mp3"]
#
【Q3】「report」というフォルダの中に移動したい。どれを打つ？
[glink  color="black"  storage="ch1_3/scene1_3.ks"  size="24"  x="190"  width="900"  y="110"  text="ls report"   target="*Q3_ng"  ]
[glink  color="black"  storage="ch1_3/scene1_3.ks"  size="24"  x="190"  width="900"  y="190"  text="pwd report"  target="*Q3_ng"  ]
[glink  color="black"  storage="ch1_3/scene1_3.ks"  size="24"  x="190"  width="900"  y="270"  text="cd report"   target="*Q3_ok"  ]
[s]
*Q3_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#先輩
ポジション移動、完璧だぜ！[p]
@jump target="*Q3_end"
*Q3_ng
[cm]
[playse storage="se_wrong.mp3"]
[eval exp="f.wrong_today.push('cd')"]
#同期
移動は、cd だぜ！ ……オデ、今のは分かったぞ[p]
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
黒い画面が、もう怖くないな！ やるじゃねえか！[p]
[elsif exp="f.correct_am >= 2"]
#先輩
悪くないぜ！ 後半で、逆転できる！[p]
[else]
#先輩
ドンマイだ！ 俺も最初は、cd と ls を間違えたぜ！[p]
#おまえ
（先輩にも、そんな頃が）[p]
[endif]
#同期
前半は、ペンギンしか覚えてねェ……[p]
#おまえ
午後も、ペンギンは出てこないと思う[p]


;=========================================
; 【業務後半】会話で学ぶ → Q4〜Q6
;=========================================
[bg storage="bg_meeting_room.gif" time="500"]
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]

;――学ぶ：mkdir（先輩・新しいロッカーを作る）――
#先輩
後半は、応用だ。まずは、フォルダを作る「mkdir」[p]
make directory（フォルダを作る）の略だぜ。新しいロッカーを、用意する感じだな[p]
[eval exp="f.terms['mkdir'] = 'Linuxのコマンド。新しいフォルダを作る（make directory の略）'; f.toast = '用語図鑑に「mkdir」を記録した'"]
[call storage="system/toast.ks"]

;Q4 mkdir（会話：新しいロッカーを用意する）
[eval exp="f.term_q += 1"]
[playse storage="se_quiz_question.mp3"]
#
【Q4】新しいフォルダ「memo」を作りたい。どれを打つ？
[glink  color="black"  storage="ch1_3/scene1_3.ks"  size="24"  x="190"  width="900"  y="110"  text="mkdir memo"  target="*Q4_ok"  ]
[glink  color="black"  storage="ch1_3/scene1_3.ks"  size="24"  x="190"  width="900"  y="190"  text="cd memo"     target="*Q4_ng"  ]
[glink  color="black"  storage="ch1_3/scene1_3.ks"  size="24"  x="190"  width="900"  y="270"  text="rm memo"     target="*Q4_ng"  ]
[s]
*Q4_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#先輩
新しいロッカー、完成だぜ！[p]
@jump target="*Q4_end"
*Q4_ng
[cm]
[playse storage="se_wrong.mp3"]
[eval exp="f.wrong_today.push('mkdir')"]
#リーダー
作るのは、mkdir。「make（作る）」の mk、だね[p]
*Q4_end

;――学ぶ：rm（先輩が、真剣な顔になる）――
#先輩
ここから、大事な話だ。コマンドには、取り返しのつかないものがある[p]
「rm」は、ファイルを消すコマンド。ゴミ箱を通らずに、本当に消える[p]
#同期
えっ、戻らねェのか？[p]
#先輩
戻らない。だから、使う前に、何を消すのか、必ず確認しろ。……レッドカードは、一発退場だぜ[p]
[eval exp="f.terms['rm'] = 'Linuxのコマンド。ファイルを消す。ゴミ箱を通らないので、元に戻せない'; f.toast = '用語図鑑に「rm」を記録した'"]
[call storage="system/toast.ks"]

;Q5 rm（会話：ゴミ箱を通らず、本当に消える）
[eval exp="f.term_q += 1"]
[playse storage="se_quiz_question.mp3"]
#
【Q5】rm でファイルを消すとき、正しい考え方はどれ？
[glink  color="black"  storage="ch1_3/scene1_3.ks"  size="24"  x="190"  width="900"  y="110"  text="ゴミ箱から戻せるので、気軽に使う"          target="*Q5_ng"  ]
[glink  color="black"  storage="ch1_3/scene1_3.ks"  size="24"  x="190"  width="900"  y="190"  text="元に戻せないので、消す物を確認してから使う"  target="*Q5_ok"  ]
[glink  color="black"  storage="ch1_3/scene1_3.ks"  size="24"  x="190"  width="900"  y="270"  text="消えたら、先輩がなんとかしてくれる"          target="*Q5_ng"  ]
[s]
*Q5_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#先輩
それでいい！ 慎重さは、最強の守備だぜ！[p]
@jump target="*Q5_end"
*Q5_ng
[cm]
[playse storage="se_wrong.mp3"]
[eval exp="f.wrong_today.push('rm')"]
#リーダー
rm で消したら、ゴミ箱には入らないんだ。魚肉ソーセージを、食べちゃったのと同じ。もう戻らないね[p]
#先輩
……あと、俺にも、なんとかできないぜ！[p]
*Q5_end

;――学ぶ：二要素認証（リーダー・鍵と暗証番号）――
#リーダー
最後は、セキュリティ。会社のシステムに入るときは、パスワードのあと、スマホに届く番号も打つよ[p]
家の鍵と、暗証番号の両方がないと開かない金庫、みたいなものだね[p]
パスワードが盗まれても、スマホがなければ入れない。これを「二要素認証」っていうよ[p]
[eval exp="f.terms['二要素認証'] = 'パスワードに加えて、スマホに届く番号など、2種類の確認でログインする仕組み'; f.toast = '用語図鑑に「二要素認証」を記録した'"]
[call storage="system/toast.ks"]

;Q6 二要素認証（会話：鍵と暗証番号の両方で開く）
[eval exp="f.term_q += 1"]
[playse storage="se_quiz_question.mp3"]
#
【Q6】パスワードと、スマホに届く番号の両方で、ログインする仕組みは？
[glink  color="black"  storage="ch1_3/scene1_3.ks"  size="24"  x="190"  width="900"  y="110"  text="二要素認証"            target="*Q6_ok"  ]
[glink  color="black"  storage="ch1_3/scene1_3.ks"  size="24"  x="190"  width="900"  y="190"  text="パスワードの使い回し"  target="*Q6_ng"  ]
[glink  color="black"  storage="ch1_3/scene1_3.ks"  size="24"  x="190"  width="900"  y="270"  text="フィッシング"          target="*Q6_ng"  ]
[s]
*Q6_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#リーダー
正解。鍵が2つあれば、ずっと安心だね。おkだよ[p]
@jump target="*Q6_end"
*Q6_ng
[cm]
[playse storage="se_wrong.mp3"]
[eval exp="f.wrong_today.push('二要素認証')"]
#先輩
ゴールキーパーが2人いる、みたいなもんだ！ 1人抜かれても、まだ守れるぜ！[p]
それが、二要素認証だ！[p]
*Q6_end

#先輩
試合終了だ！ 初めてのLinux、よく頑張ったな！[p]
#同期
今日は、ペンギンと……「ぺんぎん」はコマンドじゃねェ、ってのを覚えたぜ[p]
#おまえ
そこは、覚えてて偉い[p]


;=========================================
; 【終業後】誰と過ごすか（信頼度）
;=========================================
[bg storage="bg_office_evening.gif" time="500"]
#
3日目が、終わった。黒い画面にも、少し慣れてきた。[p]

;選択肢1：先輩の信頼度＋1
;選択肢2：同期の信頼度＋1
;選択肢3：営業の信頼度＋1
#
誰と、少し話していく？
[glink  color="black"  storage="ch1_3/scene1_3.ks"  size="24"  x="290"  width="700"  y="110"  text="先輩に、居残り練習を頼む"  target="*c2_senpai"  ]
[glink  color="black"  storage="ch1_3/scene1_3.ks"  size="24"  x="290"  width="700"  y="190"  text="同期と、コマンドを見直す"  target="*c2_douki"   ]
[glink  color="black"  storage="ch1_3/scene1_3.ks"  size="24"  x="290"  width="700"  y="270"  text="営業に、Linuxのことを聞く"  target="*c2_eigyo"   ]
[s]

*c2_senpai
[cm]
#先輩
やる気があるな！ 練習は、裏切らないぜ！[p]
#おまえ
（練習メニューが、すごく増えた気がする）[p]
[eval exp="f.t_senpai += 1; f.toast = '先輩の信頼度が上がった！'"]
[call storage="system/toast.ks"]
@jump target="*c2_end"

*c2_douki
[cm]
#同期
なあ、pwd と ls、どっちがどっちだっけ[p]
#おまえ
pwd が、今いる場所。ls が、一覧[p]
#同期
ありがとな！ メモしとくぜ[p]
[eval exp="f.t_douki += 1; f.toast = '同期の信頼度が上がった！'"]
[call storage="system/toast.ks"]
@jump target="*c2_end"

*c2_eigyo
[cm]
#営業
……Linux。客のサーバは、ほとんど、あれで動いてる。……覚えないと、こっちが止まる[p]
#おまえ
責任が、重いです[p]
#営業
……重くていい。覚えろ[p]
[eval exp="f.t_eigyo += 1; f.toast = '営業の信頼度が上がった！'"]
[call storage="system/toast.ks"]

*c2_end


;=========================================
; 【自宅】画面の物をクリックして、行動を選ぶ
;=========================================
[call storage="system/home.ks"]

;次の日へ
@jump storage="ch1_3/scene1_4.ks"
