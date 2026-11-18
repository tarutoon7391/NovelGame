;第4章 3日目

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
;台本　第4章（9〜10月）　3日目
;状態：叩き台（1日分すべて）／ITパスポート枠は過去問に差し替え済み（11/4）
;※名前は社長（郡晴希：こおり はるき）のみ決定。ほかは役割で表記
;※選択肢の数は問題ごとに変える（用語・知識は4択／場面の判断は3択／AI提案の見極めは2択）
;============================================================
;■ この日のねらい
;・夜明け。不正アクセスの原因は、パッチ（修正プログラム）の当て忘れ
;・主人公が、リーダーにすぐ報告し、エスカレーション（上への連絡）を判断する
;・初めて、自分の判断で、乗り切る日
;・「誰かを責めない」姿勢が出る（第3章の学びの、活かし方）
;・出題：ITパスポート（パッチ、脆弱性対策）、エスカレーション
;■ 1日の流れ
;朝（早朝の報告）→ 業務前半（5問）→ 昼休み → 業務後半（5問）→ 終業後 → 自宅（リザルト）
;------------------------------------------------------------
; 【朝】
;=========================================
[playbgm storage="bgm_walk.mp3" restart="false"]

;[bg storage="（オフィス（早朝））" time="500"]
[bg storage="bg_office_dawn.gif" time="500"]

#ナレーション
第4章 3日目。午前6時。[p]
主人公は、一睡も、していない。[p]
#おまえ
……原因が、わかった[p]
不正アクセスの、入口は、ある古いサーバの、脆弱性だ[p]
修正プログラム（パッチ）が、当たっていなかった[p]

;[場面：主人公が、リーダーに、電話をかける]

リーダー、おはようございます。夜間の件で、報告があります[p]
#リーダー
おやおや、どうしたんだい。早いね[p]
#おまえ
午前2時に、不正アクセスの疑いを、検知しました[p]
ログは、保全してあります。疑わしいアカウントは、一時停止しました[p]
#リーダー
……詳しく、聞かせて[p]
#おまえ
原因は、パッチの、当て忘れのようです[p]
#リーダー
…………[p]
よく、一人でそこまでやったね[p]
#おまえ
いえ。電話で、助言をもらいました[p]
#リーダー
それも含めて、だよ。すぐ戻るね。……あ、大事な話の前に、ここで保存しとく？[p]
#おまえ
（……今は、それどころじゃない）[p]
;[選択肢：1回目（エスカレーションの判断・3択）]
;選択肢1：リーダーの信頼度＋1
;選択肢2：営業の信頼度＋1
;選択肢3：信頼度の増減なし
;※どれを選んでも、物語は進む。ただし、1と2は、判断と報告ができた、というボーナス（f.escalate＋1）
#ナレーション
リーダーが戻る前に、誰に、報告を、入れておく？
[glink  color="blue"  storage="ch4_6/scene4_3.ks"  size="26"  x="266"  width="640"  y="120"  text="社長に、すぐ、状況を報告する"  target="*c1_1"  ]
[glink  color="blue"  storage="ch4_6/scene4_3.ks"  size="26"  x="266"  width="640"  y="195"  text="営業に、お客様への影響の、有無を、確認する"  target="*c1_2"  ]
[glink  color="blue"  storage="ch4_6/scene4_3.ks"  size="26"  x="266"  width="640"  y="270"  text="誰にも報告せず、リーダーの帰りを、待つ"  target="*c1_3"  ]
[s]

*c1_1
[cm]
[eval exp="f.t_leader += 1"]
;◆1を選んだ場合
#おまえ
社長、おはようございます。夜間の件で、至急の報告です[p]
#社長
……何があった[p]
#おまえ
不正アクセスの疑いがあり、すでに、被害の拡大は止めています[p]
#社長
……詳しく、話せ[p]
#おまえ
はい[p]
;※社長は、奇行も「いいか、よく聞け」もなく、最後まで聞く

@jump target="*c1_end"

*c1_2
[cm]
[eval exp="f.t_eigyo += 1"]
;◆2を選んだ場合
#おまえ
営業さん、夜間に、不正アクセスの疑いがありました[p]
お客様のデータには、影響が出ていない、はずですが、確認をお願いします[p]
#営業
…………[p]
……すぐ、客の窓口に確認する。……よく、連絡してきた[p]
;※営業は、素早く動く。主人公への評価が、上がる

@jump target="*c1_end"

*c1_3
[cm]
;◆3を選んだ場合
#おまえ
（リーダーが戻るまで、待とう）[p]
（……でも、本当に、それでいいのかな）[p]
#ナレーション
やがて、リーダーが戻ってきた。[p]
#リーダー
報告が、遅いね。社長にも、すぐ伝えようか[p]
#おまえ
はい[p]
;※遅れた分は、少しだけ、リーダーに、指摘される（信頼度は、変わらない）
;→ 次の場面へ
@jump target="*c1_end"

*c1_end

;[場面：リーダーと先輩が、戻ってくる]

;[効果音：ドアが、勢いよく開く]
[playse storage="se_hatch_open_close.mp3"]
#先輩
新人！ 無事か！[p]
#リーダー
新人さん。状況を、見せて[p]
#おまえ
はい。こちらが、ログと、対応の記録です[p]
#リーダー
……記録も、きちんと残してあるね[p]
#先輩
ログも、消してないな！ ナイスセーブだぜ！[p]
#おまえ
消さない、っていうか、消せなかった、というか[p]
#先輩
何だ、それは！[p]
#リーダー
ははは。7月の教訓だね[p]

;=========================================
; 【業務前半】（問題5問）パッチと脆弱性対策
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]
[eval exp="f.correct_am = 0"]

;[場面：会議室]
[bg storage="bg_meeting_room.gif" time="500"]

#リーダー
まず、今回の原因を、整理しよう[p]
パッチの当て忘れ。つまり、修正プログラムを、適用していなかった[p]
#先輩
……すまねェ。それは、俺の担当だった[p]
#おまえ
え[p]
#先輩
研修の前に、当てる予定だった。当て忘れた[p]
全力で、当て忘れたぜ！[p]
;（たまたま通りがかり）
#同期
全力で当て忘れたって、何っすか[p]
#先輩
そこは、深く聞くな！[p]

;先輩の信頼度が、基準（6）に届いていないときだけ、このキー選択肢が出る
[if exp="f.t_senpai < 6"]
#おまえ
（……この人のせいで、昨日は、一睡も、できなかったんだよな）[p]

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
パッチを当て忘れた先輩に、どう言う？
[glink  color="red"  name="key_btn"  storage="ch4_6/scene4_3.ks"  size="26"  x="266"  width="640"  y="120"  text="「次から、一緒に確認しましょう」と言う"  target="*key_blame_1"  ]
[glink  color="red"  name="key_btn"  storage="ch4_6/scene4_3.ks"  size="26"  x="266"  width="640"  y="195"  text="「全部、先輩のせいです！」と責め立てる"  target="*key_blame_2"  ]
[kanim name="key_btn" keyframe="key_shake" time="150" count="infinite"]
[s]

*key_blame_1
[cm]
[free_layermode name="key_red" time="300"]
#先輩
……お、おう。すまねェ。次は、ダブルチェックだぜ！[p]
@jump target="*key_blame_end"

*key_blame_2
[cm]
[free_layermode name="key_red" time="300"]
#おまえ
（……もう、我慢できない）[p]
;信頼度が「高い」（10以上）キャラがいれば、1回だけ止めに来る
@jump target="*key_blame_stop" cond="Math.max(f.t_senpai, f.t_leader, f.t_eigyo, f.t_douki) >= 10"
#おまえ
全部、先輩のせいです！ 僕の睡眠時間を、返してください！[p]
#先輩
…………[p]
……今、何て言った？[p]
@jump storage="ending/end09.ks"

*key_blame_stop
;止めに来るのは、いま一番信頼度が高いキャラ
[if exp="f.t_senpai >= Math.max(f.t_leader, f.t_eigyo, f.t_douki)"]
#先輩
……言いたいことは、わかるぜ。でも、その前に、一回、深呼吸しろ[p]
[elsif exp="f.t_leader >= Math.max(f.t_eigyo, f.t_douki)"]
#リーダー
新人さん、ちょっと待って[p]
ふりかえりは、人を責めるためじゃないよ。次に、どうするかを、話そう[p]
[elsif exp="f.t_eigyo >= f.t_douki"]
#営業
……そこの。それは、言うな[p]
……責めても、客は、喜ばない[p]
[else]
#同期
なあ、待てよ。オデも、毎日ドアに挟まって、迷惑かけてるけどよ[p]
先輩は、一度も、オデを、責めなかったぜ[p]
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
[glink  color="red"  storage="ch4_6/scene4_3.ks"  size="26"  x="266"  width="640"  y="120"  text="考え直す"  name="key_btn"  target="*key_blame_back"  ]
[glink  color="red"  storage="ch4_6/scene4_3.ks"  size="26"  x="266"  width="640"  y="195"  text="それでも、進む"  name="key_btn"  target="*key_blame_go"  ]
[kanim name="key_btn" keyframe="key_shake" time="150" count="infinite"]
[s]

*key_blame_back
[cm]
[free_layermode name="key_red" time="300"]
#おまえ
（……止めてもらえて、よかった）[p]
@jump target="*key_blame_1"

*key_blame_go
[cm]
[free_layermode name="key_red" time="300"]
#おまえ
全部、先輩のせいです！ 僕の睡眠時間を、返してください！[p]
#先輩
…………[p]
……今、何て言った？[p]
@jump storage="ending/end09.ks"

*key_blame_end

[endif]

;※先輩が、自分の、ミスを、認める

;Q1 パッチ管理／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=182 page=fore visible=true]
[font size=26]
#
【Q1】[r]
OS、ミドルウェア及びアプリケーションに適用するセキュリティパッチに関する記述のうち、適切なものはどれか。
[glink  color="blue"  storage="ch4_6/scene4_3.ks"  size="22"  x="40"  width="1109"  y="190"  text="ウイルス感染予防として適用すべきである。"  target="*Q1_ok"  ]
[glink  color="blue"  storage="ch4_6/scene4_3.ks"  size="22"  x="40"  width="1109"  y="251"  text="ウイルスに感染した場合に適用すべきである。"  target="*Q1_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_3.ks"  size="22"  x="40"  width="1109"  y="312"  text="現在の機能に満足している場合は、パッチが提供されても適用する必要はない。"  target="*Q1_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_3.ks"  size="22"  x="40"  width="1109"  y="373"  text="サポートが終了したソフトウェアは、それまでのパッチを全て適用していれば、安全に使い続けられる。"  target="*Q1_ng"  ]
[s]

*Q1_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#リーダー
そう。パッチは、当てるまで、意味がないんだ[p]
#
【解説】パッチは、ソフトの弱点を直すためのもの。感染してから当てても遅いので、感染する前に当てて、弱点をふさぐ。サポートが終わると、新しい弱点が見つかっても、パッチは出なくなる。[p]
@jump target="*Q1_end"

*Q1_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
見つかった弱点を、直すのが、パッチだよ[p]
#
【解説】パッチは、ソフトの弱点を直すためのもの。感染してから当てても遅いので、感染する前に当てて、弱点をふさぐ。サポートが終わると、新しい弱点が見つかっても、パッチは出なくなる。[p]
@jump target="*Q1_end"

*Q1_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q2 マルウェアの感染防止／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=299 page=fore visible=true]
[font size=26]
#
【Q2】[r]
職場のPCで、マルウェア対策ソフトを導入しているが、それに加えて、マルウェアの感染防止に有効な対策を、a〜cから全て挙げたものはどれか。[r]
a　OSのセキュリティパッチ（修正モジュール）の適用[r]
b　起動ドライブのハードディスクへのパスワード設定[r]
c　複雑かつ十分な長さをもつログインパスワードの導入
[glink  color="blue"  storage="ch4_6/scene4_3.ks"  size="22"  x="40"  width="1109"  y="307"  text="a"  target="*Q2_ok"  ]
[glink  color="blue"  storage="ch4_6/scene4_3.ks"  size="22"  x="40"  width="1109"  y="368"  text="a、b"  target="*Q2_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_3.ks"  size="22"  x="40"  width="1109"  y="429"  text="b"  target="*Q2_ng"  ]
[s]

*Q2_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#リーダー
その通りだね。更新を、サボらないこと[p]
#
【解説】マルウェアは、ソフトの弱点（脆弱性）から入り込む。パッチで弱点をふさぐのは、感染防止に有効。HDDのパスワードは、PCの紛失や盗難のときの対策で、感染は防げない。[p]
@jump target="*Q2_end"

*Q2_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
パッチで弱点をふさぐのが、感染防止の基本だよ。HDDのパスワードは、盗難に備える対策なんだ[p]
#
【解説】マルウェアは、ソフトの弱点（脆弱性）から入り込む。パッチで弱点をふさぐのは、感染防止に有効。HDDのパスワードは、PCの紛失や盗難のときの対策で、感染は防げない。[p]
@jump target="*Q2_end"

*Q2_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q3 インシデント初動（復習）／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q3】[r]
障害が起きたとき、最初に、すべきことは？
[glink  color="blue"  storage="ch4_6/scene4_3.ks"  size="22"  x="40"  width="1109"  y="151"  text="誰にも言わず、様子を見る"  target="*Q3_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_3.ks"  size="22"  x="40"  width="1109"  y="212"  text="犯人探しを、始める"  target="*Q3_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_3.ks"  size="22"  x="40"  width="1109"  y="273"  text="まず、サービスの復旧と、被害の、拡大防止を優先する"  target="*Q3_ok"  ]
[s]

*Q3_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#リーダー
復旧と、被害の拡大防止が、先だね[p]
@jump target="*Q3_end"

*Q3_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
犯人探しは、あと。まず、被害を食い止めるんだ[p]
@jump target="*Q3_end"

*Q3_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q4 エスカレーション／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q4】[r]
自分では、判断できない、重大な問題が、起きた。どうする？
[glink  color="blue"  storage="ch4_6/scene4_3.ks"  size="22"  x="40"  width="1109"  y="151"  text="次の定例会議まで、待つ"  target="*Q4_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_3.ks"  size="22"  x="40"  width="1109"  y="212"  text="上位者に、状況を、すぐに伝えて、判断をあおぐ"  target="*Q4_ok"  ]
[glink  color="blue"  storage="ch4_6/scene4_3.ks"  size="22"  x="40"  width="1109"  y="273"  text="自分で、なんとか、解決する"  target="*Q4_ng"  ]
[s]

*Q4_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#リーダー
今朝の君の動きが、まさに、これだね[p]
@jump target="*Q4_end"

*Q4_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
重大なことほど、早く、上に伝えるんだよ[p]
@jump target="*Q4_end"

*Q4_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q5 影響範囲の確認／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q5】[r]
不正アクセスの被害を、調べるとき、まず、確認すべきことは？
[glink  color="blue"  storage="ch4_6/scene4_3.ks"  size="22"  x="640"  width="500"  y="240"  text="先輩の、声の大きさ"  target="*Q5_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_3.ks"  size="22"  x="640"  width="500"  y="340"  text="影響を受けた、システムやデータの範囲"  target="*Q5_ok"  ]
[glink  color="blue"  storage="ch4_6/scene4_3.ks"  size="22"  x="640"  width="500"  y="440"  text="社長の、機嫌"  target="*Q5_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_3.ks"  size="22"  x="640"  width="500"  y="540"  text="社内の、ランチの、メニュー"  target="*Q5_ng"  ]
[s]

*Q5_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#リーダー
影響範囲がわからないと、次の手が打てないからね[p]
#
【解説】どこまで被害が、及んでいるか（影響範囲）を、確認することが、対応の第一歩。[p]
@jump target="*Q5_end"

*Q5_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
被害の範囲を、まず確認する。これは、基本だよ[p]
#
【解説】どこまで被害が、及んでいるか（影響範囲）を、確認することが、対応の第一歩。[p]
@jump target="*Q5_end"

*Q5_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：業務前半の終わり]

#リーダー
前半は、ここまでだね。お昼にしよう[p]
#先輩
ハーフタイムだ！ 新人、今日は、俺がおごるぜ！[p]
#おまえ
ほんとですか[p]
#先輩
全力で、おごるぜ！[p]
;（ツッコミ）
#おまえ
全力で、ってつけないでください[p]

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
よくできてるぜ！ 夜勤明けとは、思えないな！[p]

[elsif exp="f.correct_am >= 2"]
;◆2〜3問正解のとき
#先輩
いい調子だぜ！ 無理するなよ！[p]

[else]
;◆1問以下のとき
#先輩
ドンマイだ！ 夜勤明けだぜ。疲れてるのは、当然だ！[p]
[endif]

;[場面：先輩が、改まって、謝る]

#先輩
新人[p]
#おまえ
はい[p]
#先輩
今回の件、俺が、パッチを当て忘れた[p]
お前に、夜、大変な思いをさせた。……本当に、すまねェ[p]
#おまえ
先輩……[p]

;[選択肢：2回目（先輩への返事・信頼度）]
;選択肢1：先輩の信頼度＋2
;選択肢2：先輩の信頼度＋1
;選択肢3：先輩の信頼度＋1（先輩が、豪快に笑う）
;※どれを選んでも、先輩の信頼度は、上がる。ただし、返事で、先輩の反応が、変わる（変数を入れる段階で追加する）
#ナレーション
先輩に、何と、声をかける？
[glink  color="blue"  storage="ch4_6/scene4_3.ks"  size="26"  x="266"  width="640"  y="120"  text="「誰にでも、ミスは、あります。次に活かしましょう」"  target="*c2_1"  ]
[glink  color="blue"  storage="ch4_6/scene4_3.ks"  size="26"  x="266"  width="640"  y="234"  text="「正直、怖かったです。でも、乗り切れました」"  target="*c2_2"  ]
[glink  color="blue"  storage="ch4_6/scene4_3.ks"  size="26"  x="266"  width="640"  y="309"  text="「先輩のせいですよ」と、冗談で返す"  target="*c2_3"  ]
[s]

*c2_1
[cm]
[eval exp="f.t_senpai += 2"]
;◆1を選んだ場合
#先輩
……ありがとな。お前は、立派な後輩だぜ[p]
今度は、俺が、全力でお前を守る！ ゴールキーパーは、俺だ！[p]
#おまえ
ありがとうございます[p]

@jump target="*c2_end"

*c2_2
[cm]
[eval exp="f.t_senpai += 1"]
;◆2を選んだ場合
#先輩
……そうか。怖かったか[p]
それでも、乗り切った。それが、一番大事だぜ！[p]
次は、俺がそばにいる！[p]

@jump target="*c2_end"

*c2_3
[cm]
[eval exp="f.t_senpai += 1"]
;◆3を選んだ場合
#先輩
ハッハッハ！ 言うじゃないか！[p]
確かに、俺のせいだ！ 反論は、できねェ！[p]
;（ツッコミ）
#おまえ
そこは、反論して、ください[p]
;→ 次の場面へ
@jump target="*c2_end"

*c2_end

;[場面：営業が、近づく]

#営業
……そこの[p]
#おまえ
はい[p]
#営業
……客のデータへの影響。確認できなかった[p]
……客への説明も、済んだ[p]
#おまえ
ありがとうございます[p]
#営業
……昨日の夜。すぐ報告があったから、早く動けた[p]
……報告の遅れは、被害を広げる。……わかってきたな[p]
#おまえ
6月に、営業さんに、教わりました[p]
#営業
……覚えてたか。……悪くない[p]
;※第2章4日目の、営業への報告の失敗が、ここで活きる

;=========================================
; 【業務後半】（問題5問）再発防止と、責めない振り返り
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]

;[場面：午後・会議室。振り返りの、会議]
[bg storage="bg_meeting_room.gif" time="500"]

#リーダー
今回の件を、振り返ろうか[p]
#ナレーション
社長が、会議室に、入ってきた。[p]

;[場面：社長が、座る]

#社長
……報告は、受けたぜ[p]
#おまえ
はい[p]
#社長
…………[p]
新人。なぜ、一人で判断せずに、リーダーと俺に、すぐ連絡した[p]
#おまえ
……判断に、迷ったら、報告する。それが、運用の、ルールだと思ったからです[p]
#社長
…………[p]
7月の時は、どうだった[p]
#おまえ
……確認せず、実行して、失敗しました[p]
#社長
今回は[p]
#おまえ
確認して、報告して、判断しました[p]
#社長
……ふっ[p]
それができるなら、いい[p]
#おまえ
はい[p]

;Q6 個人情報取扱事業者の義務／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q6】[r]
個人情報保護法における、個人情報取扱事業者の義務はどれか。
[glink  color="blue"  storage="ch4_6/scene4_3.ks"  size="22"  x="40"  width="1109"  y="151"  text="個人情報の安全管理が図られるよう、業務委託先を監督する。"  target="*Q6_ok"  ]
[glink  color="blue"  storage="ch4_6/scene4_3.ks"  size="22"  x="40"  width="1109"  y="212"  text="個人情報の安全管理を図るため、行政によるシステム監査を受ける。"  target="*Q6_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_3.ks"  size="22"  x="40"  width="1109"  y="273"  text="個人情報の利用に関して、監督官庁に届出を行う。"  target="*Q6_ng"  ]
[s]

*Q6_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#リーダー
個人情報を預かる側の、義務だね[p]
#
【解説】個人情報を預かる事業者は、自社だけでなく、預けた先（委託先）まで含めて、安全に守る責任がある。届出や監査、マークの取得は、法律上の義務ではない。[p]
@jump target="*Q6_end"

*Q6_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
預かった個人情報は、委託先まで含めて、守る責任があるんだ[p]
#
【解説】個人情報を預かる事業者は、自社だけでなく、預けた先（委託先）まで含めて、安全に守る責任がある。届出や監査、マークの取得は、法律上の義務ではない。[p]
@jump target="*Q6_end"

*Q6_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：AIが、画面に、現れる]

#AI
こんにちは！ 報告書の、お手伝いを、します！ 100%、完璧です！[p]
今回の原因は、先輩の、ミスです！ 報告書には、『先輩が、パッチを当て忘れた。全責任は、先輩にある』と、書きましょう！[p]
#先輩
俺の、責任……[p]
;（会議室の外から）
#同期
ちょっと待て！ それは、ひでェだろ！[p]
#おまえ
…………[p]

;Q7 AI提案の見極め（報告書）／2択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
;選択肢2（f.ai_ok＋1）
;※第3章3日目のQ6（報告書）と同じ「報告書の見極め」。今回は、主人公が、迷わず、責めない書き方を選べる
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q7】[r]
AIが作った報告書の案を、どう扱う？
[glink  color="blue"  storage="ch4_6/scene4_3.ks"  size="22"  x="40"  width="1109"  y="151"  text="そのまま、採用する"  target="*Q7_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_3.ks"  size="22"  x="40"  width="1109"  y="212"  text="個人を責める書き方をやめて、事実と、再発防止策を、中心に書き直す"  target="*Q7_ok"  ]
[s]

*Q7_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.ai_ok += 1"]
#
【正解！】[l][r]
#おまえ
責めるための、報告書じゃない。次に、同じことを、起こさないための、報告書だ[p]
#リーダー
その通りだね。7月に、君が学んだことだ[p]
@jump target="*Q7_end"

*Q7_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
待って。責任の押し付けは、再発防止には、ならないよ[p]
#先輩
新人、気持ちはうれしいが、ちゃんと書き直そうぜ！[p]
@jump target="*Q7_end"

*Q7_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q8 再発防止／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q8】[r]
パッチの、当て忘れを、二度と、起こさないために、まず、取り組むべきことは？
[glink  color="blue"  storage="ch4_6/scene4_3.ks"  size="22"  x="40"  width="1109"  y="151"  text="反省文を、100枚書く"  target="*Q8_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_3.ks"  size="22"  x="40"  width="1109"  y="212"  text="担当者を、叱る"  target="*Q8_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_3.ks"  size="22"  x="40"  width="1109"  y="273"  text="適用状況を、確認できる仕組みや、手順を、作る"  target="*Q8_ok"  ]
[s]

*Q8_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#リーダー
仕組みで、防ぐんだ。人は、忘れるものだからね[p]
@jump target="*Q8_end"

*Q8_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
人を責めても、再発は防げないよ。仕組みを、作ろう[p]
@jump target="*Q8_end"

*Q8_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q9 パッチの適用と変更管理／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=182 page=fore visible=true]
[font size=26]
#
【Q9】[r]
ソフトウェアベンダーから提供されたセキュリティパッチの内容を確認し、自社システムに適用する場合の影響を評価した。この作業はシステム運用管理業務のうちどれに該当するか。
[glink  color="blue"  storage="ch4_6/scene4_3.ks"  size="22"  x="40"  width="1109"  y="190"  text="インシデント管理"  target="*Q9_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_3.ks"  size="22"  x="40"  width="1109"  y="251"  text="構成管理"  target="*Q9_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_3.ks"  size="22"  x="40"  width="1109"  y="312"  text="変更管理"  target="*Q9_ok"  ]
[glink  color="blue"  storage="ch4_6/scene4_3.ks"  size="22"  x="40"  width="1109"  y="373"  text="リリース管理"  target="*Q9_ng"  ]
[s]

*Q9_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#リーダー
7月の、変更管理にも、つながるね[p]
#
【解説】システムを変えるとき（パッチを当てるときなど）に、影響やリスクを先に調べて、進めてよいかを判断するのが、変更管理。[p]
@jump target="*Q9_end"

*Q9_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
パッチを当てる前に、影響を評価するのは、変更管理の仕事だよ[p]
#
【解説】システムを変えるとき（パッチを当てるときなど）に、影響やリスクを先に調べて、進めてよいかを判断するのが、変更管理。[p]
@jump target="*Q9_end"

*Q9_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q10 最小権限の原則（復習）／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=260 page=fore visible=true]
[font size=26]
#
【Q10】[r]
セキュリティ対策の目的①〜④のうち、適切なアクセス権を設定することによって効果があるものだけを全て挙げたものはどれか。[r]
①　DoS攻撃から守る。　　②　情報漏えいを防ぐ。　　③　ショルダハッキングを防ぐ。　　④　不正利用者による改ざんを防ぐ。
[glink  color="blue"  storage="ch4_6/scene4_3.ks"  size="22"  x="40"  width="1109"  y="268"  text="①、②"  target="*Q10_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_3.ks"  size="22"  x="40"  width="1109"  y="329"  text="①、③"  target="*Q10_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_3.ks"  size="22"  x="40"  width="1109"  y="390"  text="②、④"  target="*Q10_ok"  ]
[glink  color="blue"  storage="ch4_6/scene4_3.ks"  size="22"  x="40"  width="1109"  y="451"  text="③、④"  target="*Q10_ng"  ]
[s]

*Q10_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#リーダー
これは、もう、鉄則だね[p]
#
【解説】アクセス権を適切に設定すると、見てはいけない人に見られること（漏えい）や、触ってはいけない人に書き換えられること（改ざん）を防げる。仕事に必要な最小限の権限だけを渡す考え方を、最小権限の原則という。[p]
@jump target="*Q10_end"

*Q10_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
漏えいと改ざんを防ぐのは、権限の設定だよ。必要なものだけ渡す。最小権限の原則だね[p]
#
【解説】アクセス権を適切に設定すると、見てはいけない人に見られること（漏えい）や、触ってはいけない人に書き換えられること（改ざん）を防げる。仕事に必要な最小限の権限だけを渡す考え方を、最小権限の原則という。[p]
@jump target="*Q10_end"

*Q10_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：振り返りの、終わり]

#社長
……以上だ[p]
#おまえ
ありがとうございました[p]
#社長
新人[p]
#おまえ
はい[p]
#社長
いいか、よく聞け……[p]
よく、やった[p]
;（初めて、続きがあった）
#おまえ
えっ[p]
#社長
聞こえなかったなら、もう言わないぜ[p]
#おまえ
聞こえました！ ありがとうございます！[p]
#ナレーション
社長は、静かに一回転して、去っていった。[p]
#先輩
社長が、褒めたっス！ 全力で、褒めたぜ！[p]
;（ツッコミ）
#おまえ
全力で、ってつけないでください[p]
;※社長が、初めて「いいか、よく聞け」の続きを言う。主人公を、素直に褒める

;=========================================
; 【終業後】（誰と過ごすか）
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]

;[場面：夕方・オフィス]
[bg storage="bg_office_evening.gif" time="500"]

#ナレーション
長い、夜勤明けの一日が、終わった。[p]
窓の外は、夕焼け空だ。[p]

;[選択肢：終業後（信頼度）]
;選択肢1：同期の信頼度＋1
;選択肢2：先輩の信頼度＋1
;選択肢3：リーダーの信頼度＋1
;選択肢4：営業の信頼度＋1
#ナレーション
今日の夕方、誰と過ごす？
[glink  color="blue"  storage="ch4_6/scene4_3.ks"  size="26"  x="266"  width="640"  y="120"  text="同期と、帰りに、一緒に、ごはんを食べる"  target="*c3_1"  ]
[glink  color="blue"  storage="ch4_6/scene4_3.ks"  size="26"  x="266"  width="640"  y="195"  text="先輩と、あらためて、今回の件を、振り返る"  target="*c3_2"  ]
[glink  color="blue"  storage="ch4_6/scene4_3.ks"  size="26"  x="266"  width="640"  y="270"  text="リーダーに、夜の対応について、評価を聞く"  target="*c3_3"  ]
[glink  color="blue"  storage="ch4_6/scene4_3.ks"  size="26"  x="266"  width="640"  y="345"  text="営業に、お客様対応の、お礼を言う"  target="*c3_4"  ]
[s]

*c3_1
[cm]
[eval exp="f.t_douki += 1"]
;◆1を選んだ場合
#同期
夜の電話、うれしかったぜ[p]
機械の話はわかんなかったけど、役に立ててよかった[p]
#おまえ
ありがとう。落ち着けたよ[p]
#同期
へへっ。次は、機械も頑張るぜ！ オデに任せろ！[p]

@jump target="*c3_end"

*c3_2
[cm]
[eval exp="f.t_senpai += 1"]
;◆2を選んだ場合
#先輩
今回は、俺の失敗だ。次は、同じ失敗はしないぜ！[p]
お前が成長して、俺は、うれしいぜ！[p]
;（ツッコミ）
#おまえ
先輩も、成長してください[p]
#先輩
言うじゃないか！[p]

@jump target="*c3_end"

*c3_3
[cm]
[eval exp="f.t_leader += 1"]
;◆3を選んだ場合
#リーダー
夜の対応、見事だったね[p]
でも、何より、すぐに報告したことが、評価できるよ[p]
判断力と、報告力。両方、伸びてるね。おkだよ[p]

@jump target="*c3_end"

*c3_4
[cm]
[eval exp="f.t_eigyo += 1"]
;◆4を選んだ場合
#営業
……礼は、いらない。仕事をしただけ[p]
……ただ、報告は、的確だった[p]
#おまえ
ありがとうございます[p]
#営業
……調子に、乗るな[p]
@jump target="*c3_end"

*c3_end
;=========================================
; 【自宅】（リザルト）
;=========================================
[playbgm storage="bgm_walk.mp3" restart="false"]

;[bg storage="（自宅の部屋（夜））" time="500"]
[bg storage="bg_home_night.gif" time="500"]

#ナレーション
布団に入った瞬間、眠りに落ちた。[p]

;[リザルト表示]
;・今日の正解数：○／10
;・スキル：＋○
;・AI見極め回数：＋○（Q7で見極めたら＋1）
;・エスカレーション判断：＋○（朝の選択で、1か2を選んだ場合に加算）
;・信頼度の変化：（選んだキャラ）＋1〜2

;[ナレーション]
#おまえ
初めて、自分の判断で、乗り切れた[p]
社長が、褒めてくれた[p]
ツッコミは、役に立つ、武器になる[p]
#ナレーション
第4章 4日目へ。[p]

;=========================================
;■ 次回予告（第4章 4日目）
;翌日。営業が、文句を言いながら、少し認める。
;出題：第4章の総復習
;※第4章の最終日。章末に、3つ目の途中判定がある
;■ 未決定
;・社長以外の名前
;・各問題の中身（仮。見直す前提）
;・エスカレーション判断（f.escalate）を、点数に入れるか（配点が決まってから）
;・社長の「よく、やった」の、タイミング（この日の、最後に置いた）
;・先輩が、パッチを当て忘れた、という設定（責めない振り返りに、つなげるための案）

;次のファイルへ
@jump storage="ch4_6/scene4_4.ks"
