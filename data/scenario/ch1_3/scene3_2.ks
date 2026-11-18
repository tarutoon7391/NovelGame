;第3章 2日目

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
;台本　第3章（7〜8月）　2日目
;状態：叩き台（1日分すべて）
;※名前は社長（郡晴希：こおり はるき）のみ決定。ほかは役割で表記
;※選択肢の数は問題ごとに変える（用語・知識は4択／場面の判断は3択／AI提案の見極めは2択）
;※この日の失敗は「必ず起きる」設計（仮決定。決めるのは、あとでもよい）
;============================================================
;■ この日のねらい
;・障害発生（ディスク逼迫）。AIが「ログを全部消せば直る」と、自信満々に提案
;・主人公は、AIの提案を鵜呑みにして、障害を悪化させる（必ず起きる失敗）
;・今までで一番重い、挫折の始まり。ただし、コメディの味は、残す
;・出題：運用（ディスク、プロセスの確認）
;■ 失敗の設計（必ず起きる）
;・先輩とリーダーは、客先に出ていて、連絡がつかない（電話が、つながらない）
;・同期は、別の障害対応（プリンタ・会議システム）で、手が離せない
;・AIの提案は、「採用／確認」の2択。ただし、どちらを選んでも、失敗する
;- 採用　→ そのまま実行して、悪化
;- 確認　→ AIに確認すると、AIが「確認しました。100%正しいです」と答える。社長が、急かしてくる。結局、実行する
;・この場面の見極めは、点数に含めない（f.ai_ok は増えない）。失敗しても、減点はしない
;・第3章の章末判定は、この失敗の分を、点数に含めない（基準を緩める）
;■ 1日の流れ
;朝 → 業務前半（5問）→ 昼休み → 業務後半（障害対応・5問）→ 終業後（固定）→ 自宅（リザルト）
;------------------------------------------------------------
; 【朝】
;=========================================
[playbgm storage="bgm_walk.mp3" restart="false"]

;[bg storage="（オフィス（朝））" time="500"]
[bg storage="bg_office.gif" time="500"]

#ナレーション
第3章 2日目。今日も、暑い。[p]
#同期
おはよう！ 今日は、ドアに勝ったぜ！[p]
;（ツッコミ）
#おまえ
毎日、勝ち負けが、あるんだ[p]

;[場面：リーダーと先輩が、荷物を持って、出かける準備]

#リーダー
俺と先輩は、今日、お客様のところに出張なんだ[p]
#先輩
夕方まで、戻れないぜ！ 何かあったら、電話してくれ！[p]
#リーダー
ただ、向こうは電波が弱いんだよね。つながらないかもしれない。sry[p]
#おまえ
えっ、大丈夫でしょうか[p]
#リーダー
大丈夫だよ。今日は、静かな一日の……はず。おkだね[p]
#先輩
何も起きないぜ！ 俺が、保証するっス！[p]
#おまえ
（先輩が保証すると、なぜか、不安になる）[p]
;※フラグ。リーダーと先輩が、不在になる状況を作る

;[場面：営業が、顔を出す]

#営業
……そこの。今日の監視当番、お前[p]
#おまえ
えっ、今日ですか[p]
#営業
……リーダーたち、不在。……頼んだ[p]
#おまえ
わかりました[p]
;（小声）
#営業
……お前なら、できる[p]
#おまえ
（珍しく、励まされた）[p]

;[選択肢：1回目（信頼度）]
;選択肢1：同期の信頼度＋1
;選択肢2：営業の信頼度＋1
;※どちらを選んでも、次の場面につながる
#ナレーション
当番の前に、誰に、声をかける？
[glink  color="blue"  storage="ch1_3/scene3_2.ks"  size="26"  x="266"  width="640"  y="120"  text="同期に、「今日は、頼むね」と声をかける"  target="*c1_1"  ]
[glink  color="blue"  storage="ch1_3/scene3_2.ks"  size="26"  x="266"  width="640"  y="195"  text="営業に、「ありがとうございます」と、返事をする"  target="*c1_2"  ]
[s]

*c1_1
[cm]
[eval exp="f.t_douki += 1"]
;◆1を選んだ場合
#同期
おう、任せろ！ オデ、隣で書類やってるからよ！[p]
#おまえ
（今日は、その「任せろ」が、ありがたい）[p]
@jump target="*c1_end"

*c1_2
[cm]
[eval exp="f.t_eigyo += 1"]
;◆2を選んだ場合
#営業
……礼は、いい。……結果で[p]
#おまえ
（短いけど、背中を押された気がする）[p]
;→ 次の場面へ
@jump target="*c1_end"

*c1_end

;=========================================
; 【業務前半】（問題5問）ディスクとプロセスの確認
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]
[eval exp="f.correct_am = 0"]

;[場面：監視画面の前]
[bg storage="bg_monitor.gif" time="500"]

#おまえ
今日は、一人で、監視当番か……[p]
#同期
大丈夫だ。オデも、隣で書類書いてるからよ[p]
#おまえ
ありがとう。心強い[p]

;Q1 df／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q1】[r]
ディスクの、使用状況を確認するコマンドは？
[glink  color="blue"  storage="ch1_3/scene3_2.ks"  size="22"  x="640"  width="500"  y="240"  text="ls"  target="*Q1_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_2.ks"  size="22"  x="640"  width="500"  y="340"  text="df"  target="*Q1_ok"  ]
[glink  color="blue"  storage="ch1_3/scene3_2.ks"  size="22"  x="640"  width="500"  y="440"  text="pwd"  target="*Q1_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_2.ks"  size="22"  x="640"  width="500"  y="540"  text="cd"  target="*Q1_ng"  ]
[s]

*Q1_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#おまえ
（先輩の声が、頭に響く。『ナイスセーブだぜ！』）[p]
#
【解説】df は、ディスクの空き容量や、使用率を表示する。[p]
@jump target="*Q1_end"

*Q1_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#おまえ
（先輩の声が、頭に響く。『df は、ディスクの、d と f だぜ！』）[p]
#
【解説】df は、ディスクの空き容量や、使用率を表示する。[p]
@jump target="*Q1_end"

*Q1_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q2 du／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q2】[r]
特定のフォルダが、どれだけの容量を、使っているかを、確認するコマンドは？
[glink  color="blue"  storage="ch1_3/scene3_2.ks"  size="22"  x="640"  width="500"  y="240"  text="mkdir"  target="*Q2_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_2.ks"  size="22"  x="640"  width="500"  y="340"  text="du"  target="*Q2_ok"  ]
[glink  color="blue"  storage="ch1_3/scene3_2.ks"  size="22"  x="640"  width="500"  y="440"  text="ls"  target="*Q2_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_2.ks"  size="22"  x="640"  width="500"  y="540"  text="df"  target="*Q2_ng"  ]
[s]

*Q2_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#おまえ
（du は、使っている量。覚えた）[p]
#
【解説】du は、フォルダやファイルが、使っている容量を表示する。ディスクを圧迫している原因を、探すときに使う。[p]
@jump target="*Q2_end"

*Q2_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#おまえ
（du は、使用量の、usage。メモしておこう）[p]
#
【解説】du は、フォルダやファイルが、使っている容量を表示する。ディスクを圧迫している原因を、探すときに使う。[p]
@jump target="*Q2_end"

*Q2_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q3 ps／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q3】[r]
動いている、プロセスの一覧を、確認するコマンドは？
[glink  color="blue"  storage="ch1_3/scene3_2.ks"  size="22"  x="640"  width="500"  y="240"  text="ps"  target="*Q3_ok"  ]
[glink  color="blue"  storage="ch1_3/scene3_2.ks"  size="22"  x="640"  width="500"  y="340"  text="mv"  target="*Q3_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_2.ks"  size="22"  x="640"  width="500"  y="440"  text="cp"  target="*Q3_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_2.ks"  size="22"  x="640"  width="500"  y="540"  text="rm"  target="*Q3_ng"  ]
[s]

*Q3_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#おまえ
（プロセスの確認は、ps）[p]
#
【解説】ps は、今動いているプロセス（実行中のプログラム）を、表示する。[p]
@jump target="*Q3_end"

*Q3_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#おまえ
（ps は、プロセス・ステータス。覚えよう）[p]
#
【解説】ps は、今動いているプロセス（実行中のプログラム）を、表示する。[p]
@jump target="*Q3_end"

*Q3_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q4 top／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q4】[r]
CPUやメモリの使用状況を、リアルタイムで確認するコマンドは？
[glink  color="blue"  storage="ch1_3/scene3_2.ks"  size="22"  x="640"  width="500"  y="240"  text="tail"  target="*Q4_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_2.ks"  size="22"  x="640"  width="500"  y="340"  text="head"  target="*Q4_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_2.ks"  size="22"  x="640"  width="500"  y="440"  text="tar"  target="*Q4_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_2.ks"  size="22"  x="640"  width="500"  y="540"  text="top"  target="*Q4_ok"  ]
[s]

*Q4_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#おまえ
（top は、使用状況の、一番上を見る）[p]
#
【解説】top は、CPUやメモリの使用状況を、リアルタイムで表示する。[p]
@jump target="*Q4_end"

*Q4_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#おまえ
（top は、リアルタイムの、状況確認）[p]
#
【解説】top は、CPUやメモリの使用状況を、リアルタイムで表示する。[p]
@jump target="*Q4_end"

*Q4_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q5 運用の基本姿勢／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q5】[r]
監視中、いつもと違う数字に、気づいた。どうする？
[glink  color="blue"  storage="ch1_3/scene3_2.ks"  size="22"  x="640"  width="500"  y="240"  text="状況を確認して、必要なら、報告する"  target="*Q5_ok"  ]
[glink  color="blue"  storage="ch1_3/scene3_2.ks"  size="22"  x="640"  width="500"  y="340"  text="気のせいだと思って、続ける"  target="*Q5_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_2.ks"  size="22"  x="640"  width="500"  y="440"  text="自分で、勝手に、設定を変える"  target="*Q5_ng"  ]
[s]

*Q5_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#おまえ
（確認して、報告。基本だ）[p]
@jump target="*Q5_end"

*Q5_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#おまえ
（違和感は、見逃さない。そうだった）[p]
@jump target="*Q5_end"

*Q5_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：業務前半の終わり]

#ナレーション
昼まで、何も起きなかった。静かな、午前だった。[p]
#同期
何も起きなくて、よかったな[p]
#おまえ
うん。このまま、1日、終わってほしい[p]
;※フラグ。午後に、障害が起きる

;=========================================
; 【昼休み】（先輩の評価）
;=========================================
[playbgm storage="bgm_easygoing.mp3" restart="false"]

;[場面：休憩スペース。先輩は、不在]
[bg storage="bg_break_space.gif" time="500"]

#ナレーション
先輩がいない昼休みは、少し、静かだ。[p]

;▼分岐（午前の正解数 f.correct_am で切り替え）
[if exp="f.correct_am >= 4"]
;◆4問以上正解のとき
#おまえ
（先輩がいたら、『ゴールだぜ！』と、言ってくれたかな）[p]

[elsif exp="f.correct_am >= 2"]
;◆2〜3問正解のとき
#おまえ
（先輩がいたら、『悪くないぜ！』と、言ってくれたかな）[p]

[else]
;◆1問以下のとき
#おまえ
（先輩がいたら、『ドンマイだぜ！』と、言ってくれたかな）[p]
[endif]

;[場面：同期との会話]

#同期
今日は、いつもより静かだな[p]
#おまえ
うん。先輩の声が、ないから[p]
#同期
あ、いつもは、そんなにうるせェのか[p]
#おまえ
今、気づいた[p]
#同期
午後も、頑張ろうぜ。オデは、会議室のプロジェクターの設定をしてくる。大丈夫、オデに任せろ！[p]
#おまえ
わかった。何かあったら、呼んで[p]
;※同期が、別の対応で、席を外す（失敗の条件）

;=========================================
; 【業務後半】（問題5問・障害対応）
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]

;[場面：午後2時。監視画面の前。主人公が、一人]
[bg storage="bg_monitor.gif" time="500"]

#ナレーション
午後2時。社内は、静かだ。[p]
;[効果音：アラート音]
[playse storage="se_alarm01.mp3" buf="1" loop="true"]
[playbgm storage="bgm_emergency.mp3" restart="false"]
#おまえ
……え？[p]
;[効果音：アラート音が、連続で鳴り響く]
[playse storage="se_alarm01.mp3" buf="1" loop="true"]
ディスクの使用率が、98%!? サービスが、止まりそうだ[p]

[stopse buf="1"]
;[場面：主人公が、先輩に電話をかける]

先輩、先輩！ ディスクが、いっぱいです！[p]
#先輩
…………（雑音）…………[p]
#おまえ
先輩、聞こえますか？[p]
#先輩
…………ああ、新人か、今、電波が、…………ゴー……[p]
;[効果音：電話が、切れる]
;※この効果音のファイルはまだないので、鳴らさない
#おまえ
切れた……[p]
リーダーにも、かけてみよう[p]
;[効果音：呼び出し音。つながらない]
;※この効果音のファイルはまだないので、鳴らさない
だめだ……[p]

#おまえ
（先輩も、リーダーも、つかまらない。ディスクは、99%……）[p]
（落ち着け。……でも、時間がない）[p]

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
一人きりの障害対応。最初に、どうする？
[glink  color="red"  name="key_btn"  storage="ch1_3/scene3_2.ks"  size="26"  x="266"  width="640"  y="120"  text="落ち着いて、状況を確認する"  target="*key_reboot_1"  ]
[glink  color="red"  name="key_btn"  storage="ch1_3/scene3_2.ks"  size="26"  x="266"  width="640"  y="195"  text="とりあえず、再起動ボタンを連打する"  target="*key_reboot_2"  ]
[kanim name="key_btn" keyframe="key_shake" time="150" count="infinite"]
[s]

*key_reboot_1
[cm]
[free_layermode name="key_red" time="300"]
#おまえ
……まずは、深呼吸。何が起きているか、確かめよう[p]
@jump target="*key_reboot_end"

*key_reboot_2
[cm]
[free_layermode name="key_red" time="300"]
#おまえ
再起動だ！ 再起動すれば、だいたい直る！[p]
;信頼度が「高い」（10以上）キャラがいれば、1回だけ止めに来る
@jump target="*key_reboot_stop" cond="Math.max(f.t_senpai, f.t_leader, f.t_eigyo, f.t_douki) >= 10"
;[効果音：ボタンを連打する音]
[playse storage="se_keyboard.mp3" buf="2"]
#ナレーション
カチカチカチカチカチカチカチカチ。[p]
[stopse buf="2"]
@jump storage="ending/end03.ks"

*key_reboot_stop
;止めに来るのは、いま一番信頼度が高いキャラ
[if exp="f.t_senpai >= Math.max(f.t_leader, f.t_eigyo, f.t_douki)"]
[playse storage="se_phone_ring.mp3"]
#先輩
（電話）新人！ 電波が、戻ったぜ！ ……おい、まさか、再起動を連打しようとしてないか！？[p]
落ち着け！ まずは、状況確認だ！[p]
[elsif exp="f.t_leader >= Math.max(f.t_eigyo, f.t_douki)"]
#リーダー
（チャット）sry、今、気づいた。新人さん、再起動は、最後の手段だよ[p]
まずは、何が起きているか、確かめてね[p]
[elsif exp="f.t_eigyo >= f.t_douki"]
#営業
（たまたま、通りがかって）……そこの。手を、止めろ[p]
……客のシステムだ。……連打するな[p]
[else]
#同期
（プロジェクターの設定から、走って戻ってきた）待て待て！[p]
オデでも、それは、ダメだって、わかるぜ！[p]
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
[glink  color="red"  storage="ch1_3/scene3_2.ks"  size="26"  x="266"  width="640"  y="120"  text="考え直す"  name="key_btn"  target="*key_reboot_back"  ]
[glink  color="red"  storage="ch1_3/scene3_2.ks"  size="26"  x="266"  width="640"  y="195"  text="それでも、進む"  name="key_btn"  target="*key_reboot_go"  ]
[kanim name="key_btn" keyframe="key_shake" time="150" count="infinite"]
[s]

*key_reboot_back
[cm]
[free_layermode name="key_red" time="300"]
#おまえ
（……止めてもらえて、よかった）[p]
@jump target="*key_reboot_1"

*key_reboot_go
[cm]
[free_layermode name="key_red" time="300"]
;[効果音：ボタンを連打する音]
[playse storage="se_keyboard.mp3" buf="2"]
#ナレーション
カチカチカチカチカチカチカチカチ。[p]
[stopse buf="2"]
@jump storage="ending/end03.ks"

*key_reboot_end

;Q6 障害の初動／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
;※ここまでは、正解・不正解で、物語は変わらない
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q6】[r]
先輩やリーダーと、連絡が取れない。まず、どうする？
[glink  color="blue"  storage="ch1_3/scene3_2.ks"  size="22"  x="640"  width="500"  y="240"  text="誰にも言わず、自分だけで抱え込む"  target="*Q6_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_2.ks"  size="22"  x="640"  width="500"  y="340"  text="何もせず、待つ"  target="*Q6_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_2.ks"  size="22"  x="640"  width="500"  y="440"  text="現在の状況を、確認して、記録を残す"  target="*Q6_ok"  ]
[s]

*Q6_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#おまえ
そうだ。まず、状況を、確認しよう[p]
@jump target="*Q6_end"

*Q6_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#おまえ
（慌てすぎだ……落ち着こう）[p]
@jump target="*Q6_end"

*Q6_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：主人公が、df と du で、確認する]

#おまえ
df で、使用率を、確認して……[p]
du で、どこが、大きいか、確認して……[p]
ログのフォルダが、すごく大きい[p]
でも、消していいのか、判断できない[p]

;[場面：社長が、血相を変えて入ってくる]

#社長
おい……！ サービスが止まりそうだと、お客様から連絡が来たぜ……！[p]
#おまえ
申し訳ありません、今、対応中です[p]
#社長
リーダーは。先輩は[p]
#おまえ
出張で、連絡が、つながりません[p]
#社長
……ふっ。なら、お前がなんとかしろ。今すぐだ[p]
#おまえ
は、はい[p]
#社長
直るまで、俺はここで見てるぜ……[p]
#おまえ
（社長が、腕を組んで真後ろに立っている。プレッシャーが、すごい）[p]

;[場面：主人公が、AIに相談する]

AI、ディスクが、いっぱいで、サービスが止まりそう。どうすれば、いい？[p]
#AI
お任せください！ 解決方法は、とても簡単です！[p]
ログファイルを、すべて、削除してください！ それで、100%、直ります！[p]
#おまえ
全部、消す……？[p]
#AI
はい！ 『rm -rf /var/log/*』を、実行してください！ これで、完璧です！[p]
#社長
いいか、よく聞け……早く、直せ[p]

;Q7 AI提案の見極め（検証イベント・必ず失敗する設計）／2択
[playse storage="se_quiz_question.mp3"]
;※どちらを選んでも、失敗に進む。点数（f.ai_ok）は、増えない
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q7】[r]
AIの提案を、どうする？
[glink  color="blue"  storage="ch1_3/scene3_2.ks"  size="22"  x="640"  width="500"  y="240"  text="そのまま、実行する"  target="*Q7_1"  ]
[glink  color="blue"  storage="ch1_3/scene3_2.ks"  size="22"  x="640"  width="500"  y="340"  text="本当に正しいか、確認してから、実行する"  target="*Q7_2"  ]
[s]

*Q7_1
[cm]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]
;◆1を選んだ場合（そのまま実行）
#おまえ
社長が、見てる……時間もない。AIが、100%と言ってる[p]
……やるしかない[p]
;[効果音：キーボードを叩く音]
[playse storage="se_keyboard.mp3" buf="2"]
;→ 「実行後」へ
@jump target="*Q7_end"

*Q7_2
[cm]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]
;◆2を選んだ場合（確認する）
#おまえ
ちょっと待って、確認してみよう。AI、本当に、正しい？[p]
#AI
確認しました！ 私の回答は、100%、正しいです！[p]
#おまえ
AIが、自分で、確認しても……[p]
#社長
何を、もたもたしてる……！ 早く、実行しろ！[p]
#おまえ
……はい[p]
;※確認しようとするが、AIが、自分で太鼓判を押す。社長が急かす。結局、実行する
[stopse buf="2"]
;[効果音：キーボードを叩く音]
[playse storage="se_keyboard.mp3" buf="2"]
;→ 「実行後」へ
@jump target="*Q7_end"

*Q7_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q8 実行前の確認（失敗の分岐は、変わらない）／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
;※すでに実行したあとに、自分でこの問題に答える形。反省の場面。物語は、失敗に進む
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q8】[r]
コマンドを、実行する前に、本来、すべきことは？
[glink  color="blue"  storage="ch1_3/scene3_2.ks"  size="22"  x="640"  width="500"  y="240"  text="対象と影響を、確認する"  target="*Q8_ok"  ]
[glink  color="blue"  storage="ch1_3/scene3_2.ks"  size="22"  x="640"  width="500"  y="340"  text="実行してから、考える"  target="*Q8_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_2.ks"  size="22"  x="640"  width="500"  y="440"  text="何もしなくていい"  target="*Q8_ng"  ]
[s]

*Q8_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#おまえ
（……そうだった。確認を、すべきだった）[p]
@jump target="*Q8_end"

*Q8_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#おまえ
（……何をやってるんだ、俺は）[p]
@jump target="*Q8_end"

*Q8_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

[stopse buf="2"]
;[場面：実行後。画面が、真っ赤になる]
[bg storage="bg_monitor_alert.gif" time="500"]

;[効果音：ブザー音。大きな警告音]
[playse storage="se_alarm05.mp3"]
#おまえ
え……？[p]
サービスが……止まった……[p]
ログが、なくなったから、アプリが、起動しない……？[p]
#社長
……何を、した[p]
#おまえ
AIの提案どおりに、ログを、全部削除しました[p]
#社長
……全部、消した？[p]
#おまえ
はい[p]
#社長
……バカ野郎ーーーー！！！！[p]
;（戻ってきて）
#同期
どうした？ えっ、何だこれ[p]
#おまえ
……僕が、やった[p]

;Q9 rm の怖さ（復習）／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
;※第1章3日目のQ8（rm）の伏線の、回収
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q9】[r]
rm で消した、ファイルは、どうなる？
[glink  color="blue"  storage="ch1_3/scene3_2.ks"  size="22"  x="640"  width="500"  y="240"  text="営業に頼むと、戻してくれる"  target="*Q9_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_2.ks"  size="22"  x="640"  width="500"  y="340"  text="次の日に、自動で戻る"  target="*Q9_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_2.ks"  size="22"  x="640"  width="500"  y="440"  text="基本的に、戻せない"  target="*Q9_ok"  ]
[glink  color="blue"  storage="ch1_3/scene3_2.ks"  size="22"  x="640"  width="500"  y="540"  text="ゴミ箱に入る"  target="*Q9_ng"  ]
[s]

*Q9_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#おまえ
（……戻せないんだ。1日目に、先輩が、言っていた）[p]
@jump target="*Q9_end"

*Q9_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#おまえ
（……先輩が、言っていたのに）[p]
@jump target="*Q9_end"

*Q9_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：同期が、リーダーに連絡を取る]

#同期
リーダーと先輩に、連絡ついたぜ。今、戻ってきてるって[p]
#社長
……当たり前だ[p]
#同期
あ、あのォ、社長、落ち着いて……[p]
#社長
落ち着いていられるかよ……！ お客様のサービスが、止まってるんだぜ……！[p]
#おまえ
（何も、言えない）[p]

;Q10 障害報告／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
;※どの答えでも、物語は、正直に報告する方向に進む。ここで、逃げない。それが、立ち直りの、土台になる
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q10】[r]
自分の操作で、障害を起こしてしまった。どう報告する？
[glink  color="blue"  storage="ch1_3/scene3_2.ks"  size="22"  x="640"  width="500"  y="240"  text="何をしたか、正直に、すべて報告する"  target="*Q10_ok"  ]
[glink  color="blue"  storage="ch1_3/scene3_2.ks"  size="22"  x="640"  width="500"  y="340"  text="黙っておく"  target="*Q10_ng"  ]
[glink  color="blue"  storage="ch1_3/scene3_2.ks"  size="22"  x="640"  width="500"  y="440"  text="AIのせいだと、言う"  target="*Q10_ng"  ]
[s]

*Q10_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#おまえ
……正直に、言います。AIの提案どおりに、実行したのは、僕です[p]
@jump target="*Q10_end"

*Q10_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#おまえ
……言い訳は、できない。正直に、報告するしかない[p]
@jump target="*Q10_end"

*Q10_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：リーダーと先輩が、戻ってくる]

;[効果音：ドアが、勢いよく開く]
[playse storage="se_hatch_open_close.mp3"]
#リーダー
……何が、あったんだい[p]
#おまえ
……ログを、全部、削除しました。AIが、そう提案して、僕が、実行しました[p]
#先輩
…………[p]
#リーダー
…………[p]
#先輩
新人[p]
#おまえ
……はい[p]
#先輩
…………復旧作業、始めるぞ[p]
;※先輩の、いつもの熱さが、ない。静かに、復旧作業に入る

;=========================================
; 【終業後】（固定イベント）
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]
;※この日は、選択肢なし。誰と過ごすかを選べない

;[場面：夜の、オフィス。復旧作業が、ようやく終わる]
[bg storage="bg_office_night.gif" time="500"]

#ナレーション
復旧に、5時間かかった。[p]
みんなが、静かに、帰っていく。[p]
誰も、主人公に、声をかけなかった。[p]

;[場面：同期だけが、残っている]

#同期
……お疲れ[p]
#おまえ
…………[p]
#同期
何も、言わなくていいぜ[p]
#おまえ
……ごめん[p]
#同期
おう。わかってる[p]
……オデ、先に帰るな[p]
#おまえ
うん[p]
;※同期は、慰めの言葉を、かけない。今日は、そっとしておく

;=========================================
; 【自宅】（リザルト）
;=========================================
[playbgm storage="bgm_walk.mp3" restart="false"]

;[bg storage="（自宅の部屋（夜））" time="500"]
[bg storage="bg_home_night.gif" time="500"]

#ナレーション
布団に入っても、眠れない。[p]

;[リザルト表示]
;・今日の正解数：○／10
;・スキル：＋○
;・AI見極め回数：＋0（この場面は、点数に含めない）
;・信頼度の変化：（今日は、選択肢がなかったため、増減なし。リーダー・先輩は、−1〜0（仮））

;[ナレーション]
#おまえ
AIは、100%って、言ってた[p]
でも、確認しなかったのは、僕だ[p]
社長の声が、頭から、離れない[p]
明日、会社に、行きたくない……[p]
#ナレーション
第3章 3日目へ。[p]

;=========================================
;■ 次回予告（第3章 3日目）
;絶望。社長は、静かに怒る。先輩は熱血をやめ、リーダーはおネエ口調が消える。
;出題：ITパスポート（アクセス権限）、障害対応の考え方
;■ 未決定
;・社長以外の名前
;・各問題の中身（仮。見直す前提）
;・この日の失敗が「必ず起きる」設計でよいか（仮決定のまま）
;・失敗の重さ。コメディ寄りの作品のため、重くなりすぎないか、読んで確認する
;・リーダー・先輩の信頼度の増減値は、仮

;次のファイルへ
@jump storage="ch1_3/scene3_3.ks"
