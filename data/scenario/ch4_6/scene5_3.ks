;第5章 3日目

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
;台本　第5章（11〜12月）　3日目
;状態：叩き台（1日分すべて）／ITパスポート枠は過去問に差し替え済み（11/4）
;※名前は社長（郡晴希：こおり はるき）のみ決定。ほかは役割で表記
;※選択肢の数は問題ごとに変える（用語・知識は4択／場面の判断は3択／AI提案の見極めは2択）
;============================================================
;■ この日のねらい
;・バックアップを整備する
;・リーダー「いざというときの備えが、一番大事よ」（第6章の大規模障害への、伏線）
;・「バックアップは、取るだけでは、意味がない。戻せて、はじめて、意味がある」を学ぶ
;・リーダーの、過去の経験談が、少しだけ、のぞく
;・出題：ITパスポート（バックアップ、暗号化、個人情報保護）
;■ 1日の流れ
;朝 → 業務前半（5問）→ 昼休み → 業務後半（5問）→ 終業後 → 自宅（リザルト）
;------------------------------------------------------------
; 【朝】
;=========================================
[playbgm storage="bgm_walk.mp3" restart="false"]

;[bg storage="（オフィス（朝））" time="500"]
[bg storage="bg_office.gif" time="500"]

#ナレーション
第5章 3日目。昨日の、自動化の成果が、早速、出ている。[p]

;[場面：営業が、携帯を見ながら、近づく]

#営業
……そこの。今朝の、サーバ状況の報告メール。届いた[p]
#おまえ
はい。自動で、送られました[p]
#営業
……内容も、正確。……やるな[p]
#おまえ
ありがとうございます[p]
#営業
……客にも、そのまま転送した[p]
#おまえ
えっ、お客様にも！[p]
#営業
……評判、よかった。……調子に乗るな[p]
#おまえ
（営業さんから、褒められるのが、日常に、なってきた）[p]

;[場面：リーダーが、少し、いつもと違う雰囲気で、近づく]

#リーダー
新人さん、今日は、大事なお勉強の日だね[p]
#おまえ
はい。バックアップ、ですよね[p]
#リーダー
そう。……あのさ[p]
俺がバックアップにうるさい理由、あとで話すよ[p]
#おまえ
理由、ですか[p]
#リーダー
うん。聞いてくれるかい？[p]
#おまえ
もちろんです[p]
#リーダー
ありがとう。それは、昼休みにね。……大事な話の前だから、保存しとく？[p]
#おまえ
（今日の「保存しとく？」は、いつもより、少しだけ真剣な声だった）[p]
;[選択肢：1回目（信頼度）]
;選択肢1：先輩の信頼度＋1
;選択肢2：同期の信頼度＋1
;選択肢3：リーダーの信頼度＋1
;※どれを選んでも、次の場面につながる
#ナレーション
朝のうちに、誰と話す？
[glink  color="blue"  storage="ch4_6/scene5_3.ks"  size="26"  x="266"  width="640"  y="120"  text="先輩と、今日の作業の段取りを、確認する"  target="*c1_1"  ]
[glink  color="blue"  storage="ch4_6/scene5_3.ks"  size="26"  x="266"  width="640"  y="195"  text="同期と、昨日の、自動化の復習を、する"  target="*c1_2"  ]
[glink  color="blue"  storage="ch4_6/scene5_3.ks"  size="26"  x="266"  width="640"  y="270"  text="リーダーに、「今日、何を、準備しておけば、いいですか」と、聞く"  target="*c1_3"  ]
[s]

*c1_1
[cm]
[eval exp="f.t_senpai += 1"]
;◆1を選んだ場合
#先輩
段取り八分だぜ！ 試合前のミーティングで、勝負は決まる！[p]
#おまえ
（今日も、サッカーだ）[p]
@jump target="*c1_end"

*c1_2
[cm]
[eval exp="f.t_douki += 1"]
;◆2を選んだ場合
#同期
昨日のcronな、オデ、夢に出てきたぜ。* * * * *って[p]
#おまえ
（それは、毎分うなされる夢だ）[p]
@jump target="*c1_end"

*c1_3
[cm]
[eval exp="f.t_leader += 1"]
;◆3を選んだ場合
#リーダー
準備かい？ メモと、復元の手順書。あとは、魚肉ソーセージ。おkだね[p]
#おまえ
（最後のは、いつもどおり関係ない）[p]
;→ 次の場面へ
@jump target="*c1_end"

*c1_end

;=========================================
; 【業務前半】（問題5問）バックアップの基礎
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]
[eval exp="f.correct_am = 0"]

;[場面：会議室。リーダーが、講師]
[bg storage="bg_meeting_room.gif" time="500"]

#リーダー
バックアップの種類から、勉強しよう[p]
全部のデータをコピーするのが、フルバックアップ[p]
前回から、変わった部分だけコピーするのが、増分バックアップだね[p]

;Q1 バックアップ／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=338 page=fore visible=true]
[font size=26]
#
【Q1】[r]
毎週日曜日の業務終了後にフルバックアップファイルを取得し、月曜日〜土曜日の業務終了後には増分バックアップファイルを取得しているシステムがある。水曜日の業務中に故障が発生したので、バックアップファイルを使って火曜日の業務終了時点の状態にデータを復元することにした。データ復元に必要なバックアップファイルを全て挙げたものはどれか。ここで、増分バックアップファイルとは、前回のバックアップファイル（フルバックアップファイル又は増分バックアップファイル）の取得以降に変更されたデータだけのバックアップファイルを意味する。
[glink  color="blue"  storage="ch4_6/scene5_3.ks"  size="22"  x="40"  width="1109"  y="346"  text="日曜日のフルバックアップファイル、月曜日と火曜日の増分バックアップファイル"  target="*Q1_ok"  ]
[glink  color="blue"  storage="ch4_6/scene5_3.ks"  size="22"  x="40"  width="1109"  y="407"  text="日曜日のフルバックアップファイル、火曜日の増分バックアップファイル"  target="*Q1_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_3.ks"  size="22"  x="40"  width="1109"  y="468"  text="月曜日と火曜日の増分バックアップファイル"  target="*Q1_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_3.ks"  size="22"  x="40"  width="1109"  y="529"  text="火曜日の増分バックアップファイル"  target="*Q1_ng"  ]
[s]

*Q1_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#リーダー
もう、これは鉄板だね[p]
#
【解説】復元には、土台になるフルバックアップと、そのあとの増分を、順番に全部使う。日曜日のフル、月曜日の増分、火曜日の増分、の3つが必要。[p]
@jump target="*Q1_end"

*Q1_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
フルの土台に、増分を順番に重ねるんだよ。全部、必要なんだ[p]
#
【解説】復元には、土台になるフルバックアップと、そのあとの増分を、順番に全部使う。日曜日のフル、月曜日の増分、火曜日の増分、の3つが必要。[p]
@jump target="*Q1_end"

*Q1_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q2 バックアップにかかる時間／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=299 page=fore visible=true]
[font size=26]
#
【Q2】[r]
月曜日から金曜日まで、ハードディスク上の6,000個のファイル（1個3Mバイト）を使って業務を行い、毎日の業務終了後に、別のハードディスクにバックアップを取る。1日に更新されるファイルは1,000個である。月曜日から木曜日は更新されたファイルだけを、金曜日は全ファイルをバックアップする。複写速度を10Mバイト/秒とするとき、月曜日から金曜日までのバックアップ取得時間の合計は何分か。
[glink  color="blue"  storage="ch4_6/scene5_3.ks"  size="22"  x="40"  width="1109"  y="307"  text="25分"  target="*Q2_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_3.ks"  size="22"  x="40"  width="1109"  y="368"  text="35分"  target="*Q2_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_3.ks"  size="22"  x="40"  width="1109"  y="429"  text="50分"  target="*Q2_ok"  ]
[glink  color="blue"  storage="ch4_6/scene5_3.ks"  size="22"  x="40"  width="1109"  y="490"  text="150分"  target="*Q2_ng"  ]
[s]

*Q2_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#リーダー
全部を取る日と、変更分だけの日の使い分けだね。計算も、バッチリ[p]
#
【解説】月〜木は、1日1,000個×3Mバイト＝3,000Mバイトを、10Mバイト/秒で複写するので300秒。4日で1,200秒。金曜は、6,000個×3Mバイト＝18,000Mバイトで1,800秒。合計3,000秒＝50分。[p]
@jump target="*Q2_end"

*Q2_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
月〜木は、1日300秒。金曜は、全部で1,800秒だよ[p]
#
【解説】月〜木は、1日1,000個×3Mバイト＝3,000Mバイトを、10Mバイト/秒で複写するので300秒。4日で1,200秒。金曜は、6,000個×3Mバイト＝18,000Mバイトで1,800秒。合計3,000秒＝50分。[p]
@jump target="*Q2_end"

*Q2_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q3 増分バックアップ／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q3】[r]
前回のバックアップ以降に、変更された部分だけを、コピーするバックアップ方式は？
[glink  color="blue"  storage="ch4_6/scene5_3.ks"  size="22"  x="640"  width="500"  y="240"  text="フルバックアップ"  target="*Q3_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_3.ks"  size="22"  x="640"  width="500"  y="340"  text="増分バックアップ"  target="*Q3_ok"  ]
[glink  color="blue"  storage="ch4_6/scene5_3.ks"  size="22"  x="640"  width="500"  y="440"  text="ミラーリング"  target="*Q3_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_3.ks"  size="22"  x="640"  width="500"  y="540"  text="暗号化"  target="*Q3_ng"  ]
[s]

*Q3_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#リーダー
効率がいいんだ。ただし、復元が、少し手間だね[p]
#
【解説】増分バックアップは、前回からの、変更分だけ。時間と容量を、節約できるが、復元には、前の分も、必要。[p]
@jump target="*Q3_end"

*Q3_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
前回からの、増えた分だけ。それが、増分だよ[p]
#
【解説】増分バックアップは、前回からの、変更分だけ。時間と容量を、節約できるが、復元には、前の分も、必要。[p]
@jump target="*Q3_end"

*Q3_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：同期が、手を挙げる]

#同期
あのォ……質問っす[p]
#リーダー
どうぞ[p]
#同期
バックアップの、バックアップって、必要なんすか[p]
#リーダー
おやおや、いい質問だね[p]
#先輩
バックアップの、バックアップ！ ゴールキーパーが二人、ということか！[p]
;（ツッコミ）
#おまえ
先輩、そこまで、言ってません[p]
#リーダー
実は、必要なこともあるんだ。同じ場所に置いておくと、災害で、両方なくなるからね[p]

;Q4 バックアップの保管場所／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q4】[r]
バックアップデータは、どこに、保管するのが、望ましい？
[glink  color="blue"  storage="ch4_6/scene5_3.ks"  size="22"  x="640"  width="500"  y="240"  text="元のデータと、離れた場所"  target="*Q4_ok"  ]
[glink  color="blue"  storage="ch4_6/scene5_3.ks"  size="22"  x="640"  width="500"  y="340"  text="社長の机の、引き出し"  target="*Q4_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_3.ks"  size="22"  x="640"  width="500"  y="440"  text="元のデータと、同じ場所"  target="*Q4_ng"  ]
[s]

*Q4_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#リーダー
離れた場所に置くのが、基本だね[p]
#
【解説】同じ場所に、置くと、火災や災害で、元のデータも、バックアップも、一緒に失う。離れた場所に、保管する。[p]
@jump target="*Q4_end"

*Q4_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
同じ場所だと、一緒に失われるよ[p]
#
【解説】同じ場所に、置くと、火災や災害で、元のデータも、バックアップも、一緒に失う。離れた場所に、保管する。[p]
@jump target="*Q4_end"

*Q4_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q5 復元テスト／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
;※のちの、AIの提案（復元テストは不要）への、伏線
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q5】[r]
バックアップを、取ったあと、本当に、元に戻せるかを、確認することは？
[glink  color="blue"  storage="ch4_6/scene5_3.ks"  size="22"  x="40"  width="1109"  y="151"  text="必要ない。取れていれば、十分"  target="*Q5_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_3.ks"  size="22"  x="40"  width="1109"  y="212"  text="社長が、確認する"  target="*Q5_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_3.ks"  size="22"  x="40"  width="1109"  y="273"  text="必要。実際に、復元できるか、定期的に、テストする"  target="*Q5_ok"  ]
[s]

*Q5_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#リーダー
その通り。ここが、一番大事なんだ[p]
#
【解説】バックアップは、取るだけでなく、復元できることを、確認して、はじめて、意味がある。[p]
@jump target="*Q5_end"

*Q5_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
戻せないバックアップは、バックアップとは、言えないよ[p]
#
【解説】バックアップは、取るだけでなく、復元できることを、確認して、はじめて、意味がある。[p]
@jump target="*Q5_end"

*Q5_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：業務前半の終わり]

#リーダー
前半は、ここまでだね。お昼にしよう[p]
新人さん。さっきの約束。昼休みに、話すね[p]
#おまえ
はい[p]

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
バックアップも、バッチリだぜ！[p]

[elsif exp="f.correct_am >= 2"]
;◆2〜3問正解のとき
#先輩
いい調子だぜ！ 後半も、頑張れ！[p]

[else]
;◆1問以下のとき
#先輩
ドンマイだ！ 種類が多いからな！ 後半に、整理しよう！[p]
[endif]

;[場面：リーダーが、静かに、話し始める]

#リーダー
新人さん。聞いてくれるかい？[p]
#おまえ
はい[p]
#リーダー
俺さ、前の会社で、大変な失敗をしたんだ[p]
#おまえ
えっ[p]
#リーダー
お客様のデータを、全部、失ったんだよ[p]
#おまえ
全部……！？[p]
#リーダー
バックアップは、取ってた。でも、復元しようとしたら[p]
壊れていて、戻せなかったんだ[p]
#おまえ
…………[p]
#リーダー
お客様の信頼も、仕事も、一緒に失った[p]
だから、バックアップだけは、絶対に手を抜かないって、決めたんだよ[p]
#おまえ
……そうだったんですね[p]
#リーダー
sry。急に、重い話をして[p]
#おまえ
いえ。話してくれて、ありがとうございます[p]

;[選択肢：2回目（リーダーへの返事・信頼度）]
;選択肢1：リーダーの信頼度＋2
;選択肢2：リーダーの信頼度＋1
;選択肢3：リーダーの信頼度＋1
;※どれを選んでも、リーダーの信頼度は、上がる。反応が、変わる（変数を入れる段階で追加する）
#ナレーション
リーダーに、何と、声をかける？
[glink  color="blue"  storage="ch4_6/scene5_3.ks"  size="26"  x="266"  width="640"  y="120"  text="「話してくれて、ありがとうございます。僕も、バックアップを、大事にします」"  target="*c2_1"  ]
[glink  color="blue"  storage="ch4_6/scene5_3.ks"  size="26"  x="266"  width="640"  y="234"  text="「リーダーでも、失敗することが、あるんですね」"  target="*c2_2"  ]
[glink  color="blue"  storage="ch4_6/scene5_3.ks"  size="26"  x="266"  width="640"  y="309"  text="黙って、うなずく"  target="*c2_3"  ]
[s]

*c2_1
[cm]
[eval exp="f.t_leader += 2"]
;◆1を選んだ場合
#リーダー
……ありがとう。君は、いい後輩だね[p]
その気持ちが、備えの第一歩だよ[p]

@jump target="*c2_end"

*c2_2
[cm]
[eval exp="f.t_leader += 1"]
;◆2を選んだ場合
#リーダー
うん、あるよ。俺も、人間だからね[p]
だから、失敗から学ぶのが、大事なんだ[p]

@jump target="*c2_end"

*c2_3
[cm]
[eval exp="f.t_leader += 1"]
;◆3を選んだ場合
#リーダー
……聞いてくれて、ありがとう[p]
それだけで、十分だよ[p]
;→ 次の場面へ
@jump target="*c2_end"

*c2_end

;[場面：社長が、通りがかる]

#社長
ふっ……何を、しんみりしている[p]
#リーダー
社長。何でもないっすよ[p]
#社長
いいか、よく聞け……バックアップの費用の話だが[p]
#おまえ
費用、ですか[p]
#社長
ストレージの追加費用が、予算を超えてるぜ……[p]
#リーダー
ですが、大事な備えです[p]
#社長
……わかっている[p]
リーダーの、過去の失敗は、知っている[p]
#リーダー
社長……[p]
#社長
備えの費用は、削らない。……ただし、無駄遣いはするなよ[p]
#リーダー
おk。承知しました[p]
#おまえ
（社長も、リーダーの、事情を、知っていたんだ）[p]
;※社長が、陰で、社員の事情を、理解している描写

;=========================================
; 【業務後半】（問題5問）暗号化、個人情報保護、復元テスト
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]

;[場面：午後・会議室]
[bg storage="bg_meeting_room.gif" time="500"]

#リーダー
後半は、バックアップの中身を守る話だよ[p]
暗号化と、個人情報の扱いだね[p]

;Q6 暗号化／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q6】[r]
暗号化に関する記述のうち、適切なものはどれか。
[glink  color="blue"  storage="ch4_6/scene5_3.ks"  size="22"  x="40"  width="1109"  y="151"  text="暗号文を平文に戻すことをリセットという。"  target="*Q6_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_3.ks"  size="22"  x="40"  width="1109"  y="212"  text="共通鍵暗号方式では、暗号文と共通鍵を同時に送信する。"  target="*Q6_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_3.ks"  size="22"  x="40"  width="1109"  y="273"  text="公開鍵暗号方式では、暗号化のための鍵と平文に戻すための鍵が異なる。"  target="*Q6_ok"  ]
[glink  color="blue"  storage="ch4_6/scene5_3.ks"  size="22"  x="40"  width="1109"  y="334"  text="電子署名には、共通鍵暗号方式が使われる。"  target="*Q6_ng"  ]
[s]

*Q6_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#リーダー
公開鍵と秘密鍵は、別の鍵。バックアップを守るときにも、役に立つよ[p]
#
【解説】公開鍵暗号方式は、暗号化の鍵（公開鍵）と、元に戻す鍵（秘密鍵）が別。暗号文を元に戻すのは「復号」。共通鍵は同じ鍵を使うので、暗号文と一緒に送ってはいけない。[p]
@jump target="*Q6_end"

*Q6_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
暗号化と復号で、鍵が別なのが、公開鍵暗号方式だよ[p]
#
【解説】公開鍵暗号方式は、暗号化の鍵（公開鍵）と、元に戻す鍵（秘密鍵）が別。暗号文を元に戻すのは「復号」。共通鍵は同じ鍵を使うので、暗号文と一緒に送ってはいけない。[p]
@jump target="*Q6_end"

*Q6_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q7 個人情報保護／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q7】[r]
顧客の個人情報を、バックアップするとき、適切な、扱いは？
[glink  color="blue"  storage="ch4_6/scene5_3.ks"  size="22"  x="40"  width="1109"  y="151"  text="誰でも、見られる場所に、保管する"  target="*Q7_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_3.ks"  size="22"  x="40"  width="1109"  y="212"  text="アクセス権限を、制限して、暗号化したうえで、保管する"  target="*Q7_ok"  ]
[glink  color="blue"  storage="ch4_6/scene5_3.ks"  size="22"  x="40"  width="1109"  y="273"  text="社外の、個人のパソコンに、コピーする"  target="*Q7_ng"  ]
[s]

*Q7_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#リーダー
個人情報の扱いには、慎重に、だね[p]
#
【解説】個人情報は、法律で、厳しく、保護されている。権限の制限と、暗号化で、漏えいを防ぐ。[p]
@jump target="*Q7_end"

*Q7_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
個人情報のバックアップこそ、厳重に守るんだよ[p]
#
【解説】個人情報は、法律で、厳しく、保護されている。権限の制限と、暗号化で、漏えいを防ぐ。[p]
@jump target="*Q7_end"

*Q7_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：パソコンの画面に、AIが、現れる]

#AI
こんにちは！ バックアップについて、お手伝い、します！[p]
バックアップは、とても簡単です！ 毎日、取るだけで、100%、安心です！[p]
復元テストは、時間の無駄なので、不要です！[p]
暗号鍵は、バックアップと、同じ場所に、保管すれば、便利です！[p]
#リーダー
…………[p]
#おまえ
…………[p]
#先輩
おいおい、AI。それは、オウンゴールだぜ[p]
#同期
全部、危ねェことを言ってるぞ[p]

;Q8 AI提案の見極め（バックアップの提案）／2択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
;選択肢2（f.ai_ok＋1）
;※不正解でも、リーダーと先輩が、止める。リーダーの過去を、聞いた直後で、見逃す、とは、考えにくい構成にしてある
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q8】[r]
AIの提案を、どう扱う？
[glink  color="blue"  storage="ch4_6/scene5_3.ks"  size="22"  x="40"  width="1109"  y="151"  text="そのまま、採用する"  target="*Q8_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_3.ks"  size="22"  x="40"  width="1109"  y="212"  text="復元テストや、鍵の保管場所に、問題がないか、確認して、採用しない"  target="*Q8_ok"  ]
[s]

*Q8_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.ai_ok += 1"]
#
【正解！】[l][r]
#おまえ
復元できないバックアップは、意味がない、と、習いました[p]
鍵を、バックアップと、同じ場所に置いたら、盗まれたときに、一緒に、読まれてしまいます[p]
#リーダー
……その通りだよ。よく、気づいたね[p]
@jump target="*Q8_end"

*Q8_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
待って。それは、俺が一番避けたい、やり方なんだ[p]
#先輩
新人、さっきの前半の授業を、思い出せ！[p]
@jump target="*Q8_end"

*Q8_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：AIが、静かに、謝る]

#AI
……失礼しました。バックアップについては、私の理解が、浅かったようです[p]
#おまえ
素直に、謝るようになったな[p]
#AI
あなたから、学ばせて、いただきました[p]
#おまえ
お互い、様だよ[p]
#先輩
AIも、成長してるぜ！[p]

;Q9 復元の手順／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q9】[r]
バックアップから、データを、元の状態に戻す作業を、何という？
[glink  color="blue"  storage="ch4_6/scene5_3.ks"  size="22"  x="640"  width="500"  y="240"  text="リストア（復元）"  target="*Q9_ok"  ]
[glink  color="blue"  storage="ch4_6/scene5_3.ks"  size="22"  x="640"  width="500"  y="340"  text="バックアップ"  target="*Q9_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_3.ks"  size="22"  x="640"  width="500"  y="440"  text="アップデート"  target="*Q9_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_3.ks"  size="22"  x="640"  width="500"  y="540"  text="ダウンロード"  target="*Q9_ng"  ]
[s]

*Q9_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#リーダー
バックアップは、リストアして、はじめて完成なんだ[p]
#
【解説】リストアは、バックアップから、データを、元に戻すこと。定期的に、リストアのテストを、行うことが、大切。[p]
@jump target="*Q9_end"

*Q9_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
戻す作業は、リストアだよ。覚えておいてね[p]
#
【解説】リストアは、バックアップから、データを、元に戻すこと。定期的に、リストアのテストを、行うことが、大切。[p]
@jump target="*Q9_end"

*Q9_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q10 BCP（復習）／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q10】[r]
大規模な災害などによって、企業活動を支える重要な情報システムに障害が発生したような場合でも、企業活動の継続を可能にするために、あらかじめ策定する計画はどれか。
[glink  color="blue"  storage="ch4_6/scene5_3.ks"  size="22"  x="640"  width="500"  y="240"  text="BCP"  target="*Q10_ok"  ]
[glink  color="blue"  storage="ch4_6/scene5_3.ks"  size="22"  x="640"  width="500"  y="340"  text="BPR"  target="*Q10_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_3.ks"  size="22"  x="640"  width="500"  y="440"  text="ERP"  target="*Q10_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_3.ks"  size="22"  x="640"  width="500"  y="540"  text="RFP"  target="*Q10_ng"  ]
[s]

*Q10_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#リーダー
バックアップは、BCPの大事な一部だね[p]
#
【解説】BCPは、事業継続計画。災害や障害が起きても、大事な事業を止めない、または早く再開するための計画。バックアップも、その一部。[p]
@jump target="*Q10_end"

*Q10_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
事業を止めない計画。BCPだよ[p]
#
【解説】BCPは、事業継続計画。災害や障害が起きても、大事な事業を止めない、または早く再開するための計画。バックアップも、その一部。[p]
@jump target="*Q10_end"

*Q10_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：実践・バックアップの、復元テスト]

#リーダー
じゃあ、実際にやってみよう[p]
新人さん。昨日のテスト環境のバックアップを、リストアしてみて[p]
#おまえ
はい[p]
;[効果音：キーボードを叩く音]
[playse storage="se_keyboard.mp3" buf="2"]
……リストア、開始[p]
[stopse buf="2"]
;[効果音：進捗バーが、進む]
[playse storage="se_piko.mp3"]
……完了しました。データが、戻りました[p]
#リーダー
成功だね。……これが、安心感、ってやつだよ[p]
#おまえ
はい。何か、ほっとします[p]
#リーダー
備えがあると、人は、慌てずにいられるんだ[p]
いざというときの備えが、一番大事だよ[p]
#おまえ
……はい[p]
;※リーダーの決めゼリフ。冬（第6章）の大規模障害への、伏線

;=========================================
; 【終業後】（誰と過ごすか）
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]

;[場面：夕方・オフィス]
[bg storage="bg_office_evening.gif" time="500"]

#ナレーション
3日目の仕事が、終わった。[p]
備えの、大切さを、学んだ一日だった。[p]

;[選択肢：終業後（信頼度）]
;選択肢1：先輩の信頼度＋1
;選択肢2：同期の信頼度＋1
;選択肢3：リーダーの信頼度＋1
;選択肢4：営業の信頼度＋1
#ナレーション
今日の夕方、誰と過ごす？
[glink  color="blue"  storage="ch4_6/scene5_3.ks"  size="26"  x="266"  width="640"  y="120"  text="先輩と、リストアの、手順を、もう一度、練習する"  target="*c3_1"  ]
[glink  color="blue"  storage="ch4_6/scene5_3.ks"  size="26"  x="266"  width="640"  y="195"  text="同期と、今日の用語を、整理する"  target="*c3_2"  ]
[glink  color="blue"  storage="ch4_6/scene5_3.ks"  size="26"  x="266"  width="640"  y="270"  text="リーダーに、過去の話の、続きを、聞く"  target="*c3_3"  ]
[glink  color="blue"  storage="ch4_6/scene5_3.ks"  size="26"  x="266"  width="640"  y="345"  text="営業に、お客様向けの、バックアップの、説明を、相談する"  target="*c3_4"  ]
[s]

*c3_1
[cm]
[eval exp="f.t_senpai += 1"]
;◆1を選んだ場合
#先輩
リストアは、失敗が許されない作業だぜ！ PKと同じだ！[p]
何回やっても、練習は裏切らないぜ！[p]
#おまえ
何回、やらせる、つもりですか[p]
#先輩
納得するまで、だぜ！[p]

@jump target="*c3_end"

*c3_2
[cm]
[eval exp="f.t_douki += 1"]
;◆2を選んだ場合
#同期
フル、増分、リストア、暗号化。覚える用語が、多いぜ[p]
#おまえ
でも、全部、データを、守るための、用語だよ[p]
#同期
オデも、プリンタのデータを、守るぜ[p]
#おまえ
プリンタのデータ、あるの？[p]
#同期
……ねェ、かも[p]

@jump target="*c3_end"

*c3_3
[cm]
[eval exp="f.t_leader += 1"]
;◆3を選んだ場合
#リーダー
あのとき、お客様に言われたんだ[p]
『あなたを、信頼していたのに』って[p]
それが、今も、忘れられないんだよ[p]
#おまえ
リーダー……[p]
#リーダー
だから、今は、君たちを守るための備えを、整えてるんだ[p]
#おまえ
（リーダーの、強さの、理由が、わかった気がする）[p]

@jump target="*c3_end"

*c3_4
[cm]
[eval exp="f.t_eigyo += 1"]
;◆4を選んだ場合
#営業
……客向けの説明は、数字が大事[p]
……『何日分のデータが戻せるか』。必ず、書け[p]
#おまえ
はい[p]
#営業
……安心は、数字にできる。……覚えておけ[p]
@jump target="*c3_end"

*c3_end
;=========================================
; 【自宅】（リザルト）
;=========================================
[playbgm storage="bgm_walk.mp3" restart="false"]

;[bg storage="（自宅の部屋（夜））" time="500"]
[bg storage="bg_home_night.gif" time="500"]

#ナレーション
布団に入って、リーダーの言葉を、思い返す。[p]

;[リザルト表示]
;・今日の正解数：○／10
;・スキル：＋○
;・AI見極め回数：＋○（Q8で見極めたら＋1）
;・信頼度の変化：（選んだキャラ）＋1〜2

;[ナレーション]
#おまえ
備えが、あると、慌てずに、いられる[p]
リーダーの、過去を、聞いて、バックアップの、重みが、わかった[p]
もし、大きな、障害が、起きても、今日の経験が、きっと、役に立つ[p]
#ナレーション
第5章 4日目へ。[p]

;=========================================
;■ 次回予告（第5章 4日目）
;年末。みんなで、忘年会のような場面（コメディ多め）。信頼度のイベントが、多い日。
;出題：ITパスポート（法務）、第5章の総復習
;※第5章の最終日。章末に、4つ目の途中判定がある
;■ 未決定
;・社長以外の名前
;・各問題の中身（仮。見直す前提）
;・リーダーの過去の話の、重さ（コメディ寄りの作品として、重すぎないか）
;・「リーダーの、決めゼリフ」の位置（この日の、リストア成功の場面）
;・Q2・Q3・Q9は、用語が、似ている。混乱しないか

;次のファイルへ
@jump storage="ch4_6/scene5_4.ks"
