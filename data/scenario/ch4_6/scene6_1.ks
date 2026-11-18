;第6章 1日目

*start
;章セレクトで、この章を選べるようにする
[eval exp="sf.reach_ch6 = true"]
;章末の判定が終わったので、点数を数え直す
[eval exp="f.term_q = 0; f.term_ok = 0"]

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
;台本　第6章（1〜3月）　1日目
;状態：叩き台（1日分すべて）／ITパスポート枠は過去問に差し替え済み（11/4）
;※名前は社長（郡晴希：こおり はるき）のみ決定。ほかは役割で表記
;※選択肢の数は問題ごとに変える（用語・知識は4択／場面の判断は3択／AI提案の見極めは2択）
;============================================================
;■ この章のねらい
;大規模障害・評価面談。成長の総決算。最終章。
;1日目：年明け。小さな異変が起きる（予兆）。ツッコミが「疑う癖」になっていることに、自分で気づく
;2日目：大規模障害が発生。複数のAI提案が飛び交い、正しい提案と誤った提案を見極める。第5章のバックアップが役に立つ
;3日目：復旧。信頼度が高いキャラが駆けつけて助ける（信頼度による布陣の分岐）
;4日目：評価面談。社長が1年を振り返る。合計点で、成功エンドか、バッドエンド（クビ）かが決まる
;■ この日のねらい
;・1月。年明け。1年前の、入社初日との、対比を出す
;・小さな異変が起きる（大規模障害の予兆）。気づけるかどうか
;・主人公が、「ツッコミ」が「疑う癖」になっていることに、自分で気づく
;・出題：総合（これまでの復習）
;■ 1日の流れ
;朝 → 業務前半（5問）→ 昼休み → 業務後半（5問）→ 終業後 → 自宅（リザルト）
;------------------------------------------------------------
; 【朝】
;=========================================
[playbgm storage="bgm_walk.mp3" restart="false"]

;[bg storage="（真っ白な画面（時間経過の演出））" time="500"]
[bg storage="bg_white.png" time="500"]

#ナレーション
第5章が終わって、年が、明けた。[p]
1月。吐く息が、白い。[p]

;[bg storage="（会社の前（朝））" time="500"]
[bg storage="bg_company_front.gif" time="500"]

第6章 1日目。1年前の、あの日と、同じ、自動ドアの前に、立っている。[p]
#おまえ
（1年前は、ここで、同期が、挟まれた）[p]
#同期
あけましておめでとう！ 今年も、よろしくな！[p]
#おまえ
あけましておめでとう。……あれ、同期、ドアは？[p]
#同期
見ろよ。今日は、もう通ったぜ！[p]
#おまえ
えっ、本当に[p]
#同期
1年かけて、ドアを、克服したぜ！[p]
;（ツッコミ）
#おまえ
ドアを、克服するのに、1年かかったのか[p]
#同期
オデにとっては、大きな一歩なんだよ[p]
#おまえ
それは、そうだけど[p]

;[場面：オフィスの中。先輩が、書き初めを、見せる]
[bg storage="bg_office.gif" time="500"]

#先輩
見ろ、新人！ 今年の目標だぜ！[p]
;[画面：大きな筆文字で『全力』と、書かれた紙]
#おまえ
去年も、同じでしたよね[p]
#先輩
今年は、金色だぜ！[p]
;（ツッコミ）
#おまえ
見た目の違い、だけ[p]
#リーダー
おやおや、素敵だね。俺は、『備え』と書いたよ[p]
#営業
……『報告』[p]
#同期
オデは、『ドア』って書いたぜ！[p]
;（ツッコミ）
#おまえ
それ、目標なの[p]

;[場面：社長が、入ってくる]

#社長
ふっ……全員、聞け[p]
いいか、よく聞け……今年が、勝負の年だ[p]
3月に、1年の総決算を、行うぜ[p]
#おまえ
評価面談、ですね[p]
#社長
そうだ。新人。お前の、1年の成果を、見せてもらう[p]
#おまえ
……はい[p]
#社長
それまで、気を抜くなよ……[p]
#先輩
承知しましたっス、社長！[p]
#社長
いいか、よく聞け……[p]
#先輩
……はいっス[p]

;[選択肢：1回目（信頼度）]
;選択肢1：先輩の信頼度＋1
;選択肢2：リーダーの信頼度＋1
;選択肢3：営業の信頼度＋1
;選択肢4：同期の信頼度＋1
;※どれを選んでも、次の場面につながる
#ナレーション
新年の、あいさつを、誰に、しに行く？
[glink  color="blue"  storage="ch4_6/scene6_1.ks"  size="26"  x="266"  width="640"  y="120"  text="先輩に、「今年も、よろしくお願いします」と、挨拶する"  target="*c1_1"  ]
[glink  color="blue"  storage="ch4_6/scene6_1.ks"  size="26"  x="266"  width="640"  y="234"  text="リーダーに、「今年も、ご指導を、お願いします」と、挨拶する"  target="*c1_2"  ]
[glink  color="blue"  storage="ch4_6/scene6_1.ks"  size="26"  x="266"  width="640"  y="348"  text="営業に、「今年も、お世話になります」と、挨拶する"  target="*c1_3"  ]
[glink  color="blue"  storage="ch4_6/scene6_1.ks"  size="26"  x="266"  width="640"  y="423"  text="同期に、「今年は、ドアに、勝とう」と、声をかける"  target="*c1_4"  ]
[s]

*c1_1
[cm]
[eval exp="f.t_senpai += 1"]
;◆1を選んだ場合
#先輩
おう、今年もよろしくだぜ！ 今年は、金色の全力で行くぞ！[p]
#おまえ
（色の違いは、気持ちの違いらしい）[p]
@jump target="*c1_end"

*c1_2
[cm]
[eval exp="f.t_leader += 1"]
;◆2を選んだ場合
#リーダー
こちらこそ、今年もよろしくね。お年玉は、魚肉ソーセージでいいかな[p]
#おまえ
（いらない、とは言えなかった）[p]
@jump target="*c1_end"

*c1_3
[cm]
[eval exp="f.t_eigyo += 1"]
;◆3を選んだ場合
#営業
……今年も。……報告、頼む[p]
#おまえ
（新年の挨拶まで、報告の話だ）[p]
@jump target="*c1_end"

*c1_4
[cm]
[eval exp="f.t_douki += 1"]
;◆4を選んだ場合
#同期
おう！ 今年こそ、ドアに全勝してやるぜ！ ウオォォォッ！[p]
#おまえ
（新年早々、叫んでいる）[p]
;→ 次の場面へ
@jump target="*c1_end"

*c1_end

;=========================================
; 【業務前半】（問題5問）総合復習①：IT基礎・セキュリティ
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]
[eval exp="f.correct_am = 0"]

;[場面：会議室。先輩とリーダーが、並んで、講師]
[bg storage="bg_meeting_room.gif" time="500"]

#先輩
今日は、1年の総復習の、第1弾だぜ！[p]
#リーダー
入社してから学んだことを、振り返ろうね[p]

;Q1 IPアドレス（総合）／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=182 page=fore visible=true]
[font size=26]
#
【Q1】[r]
インターネットにサーバを接続するときに設定するIPアドレスに関する記述のうち、適切なものはどれか。ここで、設定するIPアドレスはグローバルIPアドレスである。
[glink  color="blue"  storage="ch4_6/scene6_1.ks"  size="22"  x="40"  width="1109"  y="190"  text="IPアドレスは一度設定すると変更することができない。"  target="*Q1_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_1.ks"  size="22"  x="40"  width="1109"  y="251"  text="IPアドレスは他で使用されていなければ、許可を得ることなく自由に設定し、使用することができる。"  target="*Q1_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_1.ks"  size="22"  x="40"  width="1109"  y="312"  text="現在使用しているサーバと同じIPアドレスを他のサーバにも設定して、2台同時に使用することができる。"  target="*Q1_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_1.ks"  size="22"  x="40"  width="1109"  y="373"  text="サーバが故障して使用できなくなった場合、そのサーバで使用していたIPアドレスを、新しく購入したサーバに設定して利用することができる。"  target="*Q1_ok"  ]
[s]

*Q1_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#リーダー
5月の、基本だね[p]
#
【解説】グローバルIPアドレスは、インターネット上で1つだけの番号。同じ番号を2台で使ったり、勝手に決めたりはできないが、故障した機器の番号を、新しい機器に引き継ぐことはできる。[p]
@jump target="*Q1_end"

*Q1_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
IPアドレスは、世界で1つだけの番号だよ。勝手には決められないんだ[p]
#
【解説】グローバルIPアドレスは、インターネット上で1つだけの番号。同じ番号を2台で使ったり、勝手に決めたりはできないが、故障した機器の番号を、新しい機器に引き継ぐことはできる。[p]
@jump target="*Q1_end"

*Q1_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q2 データベース（総合）／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=182 page=fore visible=true]
[font size=26]
#
【Q2】[r]
関係データベースの構築を、次のa〜cの工程で行うとき、実行順序として適切なものはどれか。[r]
a　管理するデータ項目の洗い出し　　b　対象業務の分析　　c　表の作成
[glink  color="blue"  storage="ch4_6/scene6_1.ks"  size="22"  x="40"  width="1109"  y="190"  text="a → b → c"  target="*Q2_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_1.ks"  size="22"  x="40"  width="1109"  y="251"  text="b → a → c"  target="*Q2_ok"  ]
[glink  color="blue"  storage="ch4_6/scene6_1.ks"  size="22"  x="40"  width="1109"  y="312"  text="b → c → a"  target="*Q2_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_1.ks"  size="22"  x="40"  width="1109"  y="373"  text="c → a → b"  target="*Q2_ng"  ]
[s]

*Q2_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#先輩
5月の、データベースだな！ ナイスだぜ！[p]
#
【解説】まず、どんな仕事のデータかを調べ（業務の分析）、必要なデータ項目を洗い出してから、表を作る。[p]
@jump target="*Q2_end"

*Q2_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
まず業務、次に項目、最後に表だぜ！[p]
#
【解説】まず、どんな仕事のデータかを調べ（業務の分析）、必要なデータ項目を洗い出してから、表を作る。[p]
@jump target="*Q2_end"

*Q2_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q3 不審なメール（総合）／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=221 page=fore visible=true]
[font size=26]
#
【Q3】[r]
企業内において、不審な相手から届いた電子メールの添付ファイルを誤って開いてしまったところ、使用していたPCがウイルス感染を強く疑う挙動を示した。このPCの使用者がまず最初に取るべき行動として、適切なものはどれか。
[glink  color="blue"  storage="ch4_6/scene6_1.ks"  size="22"  x="40"  width="1109"  y="229"  text="ウイルス定義ファイルを最新にし、ウイルスの検査と駆除を行う。"  target="*Q3_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_1.ks"  size="22"  x="40"  width="1109"  y="290"  text="その電子メールを削除し、PCを再起動する。"  target="*Q3_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_1.ks"  size="22"  x="40"  width="1109"  y="351"  text="ネットワークからPCを切り離してシステム管理者に連絡する。"  target="*Q3_ok"  ]
[s]

*Q3_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#先輩
入社した月から、一貫してるな！[p]
#
【解説】感染が疑われたら、まずネットワークから切り離して、被害を広げない。そのうえで、システム管理者に連絡する。自分で駆除や再起動をして、様子を見るのは危ない。[p]
@jump target="*Q3_end"

*Q3_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
感染したかも、と思ったら、まず切り離せ！ 1年間、言い続けてるぜ！[p]
#
【解説】感染が疑われたら、まずネットワークから切り離して、被害を広げない。そのうえで、システム管理者に連絡する。自分で駆除や再起動をして、様子を見るのは危ない。[p]
@jump target="*Q3_end"

*Q3_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q4 SLA（総合）／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q4】[r]
ITサービスの提供者と顧客の間でサービスレベルに関して取り交わすSLAの目的はどれか。
[glink  color="blue"  storage="ch4_6/scene6_1.ks"  size="22"  x="40"  width="1109"  y="151"  text="サービスの範囲と品質を明確にする。"  target="*Q4_ok"  ]
[glink  color="blue"  storage="ch4_6/scene6_1.ks"  size="22"  x="40"  width="1109"  y="212"  text="サービスマネジメントを定期的にチェックする手順を明確にする。"  target="*Q4_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_1.ks"  size="22"  x="40"  width="1109"  y="273"  text="システム化目標を明確にする。"  target="*Q4_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_1.ks"  size="22"  x="40"  width="1109"  y="334"  text="要員に必要な教育を明確にする。"  target="*Q4_ng"  ]
[s]

*Q4_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#リーダー
お客様との、約束だね[p]
#
【解説】SLAは、サービスの範囲と品質（たとえば稼働率99.9%以上など）を、提供者と利用者の間で、あらかじめ決めておく約束。[p]
@jump target="*Q4_end"

*Q4_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
SLAは、サービスの範囲と品質の約束だよ[p]
#
【解説】SLAは、サービスの範囲と品質（たとえば稼働率99.9%以上など）を、提供者と利用者の間で、あらかじめ決めておく約束。[p]
@jump target="*Q4_end"

*Q4_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q5 多要素認証（総合）／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q5】[r]
二要素認証の説明として、最も適切なものはどれか。
[glink  color="blue"  storage="ch4_6/scene6_1.ks"  size="22"  x="40"  width="1109"  y="151"  text="所有物、記憶及び生体情報の3種類のうちの2種類を使用して認証する方式"  target="*Q5_ok"  ]
[glink  color="blue"  storage="ch4_6/scene6_1.ks"  size="22"  x="40"  width="1109"  y="212"  text="人間の生体器官や筆跡などを使った認証で、認証情報の2か所以上の特徴点を使用して認証する方式"  target="*Q5_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_1.ks"  size="22"  x="40"  width="1109"  y="273"  text="文字、数字及び記号のうち2種類以上を組み合わせたパスワードを用いて利用者を認証する方式"  target="*Q5_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_1.ks"  size="22"  x="40"  width="1109"  y="334"  text="利用者を一度認証することで二つ以上のシステムやサービスなどを利用できるようにする方式"  target="*Q5_ng"  ]
[s]

*Q5_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#リーダー
秋の夜勤で、学んだね[p]
#
【解説】本人確認の材料は、「持っているもの」「知っているもの」「身体の特徴」の3種類。このうち、種類の違うものを2つ組み合わせるのが、二要素認証。[p]
@jump target="*Q5_end"

*Q5_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
種類の違うものを、2つ組み合わせるのが、二要素認証だよ[p]
#
【解説】本人確認の材料は、「持っているもの」「知っているもの」「身体の特徴」の3種類。このうち、種類の違うものを2つ組み合わせるのが、二要素認証。[p]
@jump target="*Q5_end"

*Q5_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：業務前半の終わり]

#先輩
前半は、ここまで！ ハーフタイムだぜ！[p]
#リーダー
今年も、よろしくね、新人さん[p]
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
1年の成果が、出てるな！ 立派だぜ！[p]

[elsif exp="f.correct_am >= 2"]
;◆2〜3問正解のとき
#先輩
いい調子だぜ！ 後半も、頑張れ！[p]

[else]
;◆1問以下のとき
#先輩
ドンマイだ！ 1年分の復習は、範囲が広いからな！ 後半に、取り返すぞ！[p]
[endif]

;[場面：同期との会話（ツッコミ＝疑う癖に気づく）]

#同期
なあ、1つ、聞いてもいいか？[p]
#おまえ
どうしたの[p]
#同期
最近お前、何でも疑うよな[p]
#おまえ
えっ[p]
#同期
AIが何か言うと、すぐ『本当に？』って[p]
メールが来ると、すぐ『これ、怪しくない？』って[p]
#おまえ
……確かに[p]
#同期
前は、ただのツッコミ役だったのによ[p]
#おまえ
……そうか[p]
（ツッコミを入れる癖が、いつの間にか、疑って確かめる癖に、なってたんだ）[p]

;[選択肢：2回目（同期への返事・信頼度）]
;選択肢1：同期の信頼度＋2
;選択肢2：同期の信頼度＋1
;選択肢3：同期の信頼度＋1
;※どれを選んでも、同期の信頼度は、上がる。反応が、変わる（変数を入れる段階で追加する）
#ナレーション
同期に、何と、答える？
[glink  color="blue"  storage="ch4_6/scene6_1.ks"  size="26"  x="266"  width="640"  y="120"  text="「疑うのは、確かめるためなんだ。1年前の、失敗で、学んだ」"  target="*c2_1"  ]
[glink  color="blue"  storage="ch4_6/scene6_1.ks"  size="26"  x="266"  width="640"  y="234"  text="「そう？ 自分では、気づかなかった」"  target="*c2_2"  ]
[glink  color="blue"  storage="ch4_6/scene6_1.ks"  size="26"  x="266"  width="640"  y="309"  text="「疑ってるんじゃなくて、ツッコミだよ」と、はぐらかす"  target="*c2_3"  ]
[s]

*c2_1
[cm]
[eval exp="f.t_douki += 2"]
;◆1を選んだ場合
#同期
そっか。それが、お前の強みだな[p]
疑うのは、悪いことじゃねェよ。守るためだもんな[p]
#おまえ
……ありがとう[p]

@jump target="*c2_end"

*c2_2
[cm]
[eval exp="f.t_douki += 1"]
;◆2を選んだ場合
#同期
でも、それは、いいことだと思うぜ[p]
確認するやつがいると、みんな、安心するからな[p]
#おまえ
……そうなんだ[p]

@jump target="*c2_end"

*c2_3
[cm]
[eval exp="f.t_douki += 1"]
;◆3を選んだ場合
#同期
へへっ。ツッコミでも、疑うのでも、どっちでもいいぜ[p]
お前のツッコミは、みんなを、守ってるからな[p]
#おまえ
（……なんだか、照れくさい）[p]
;※第1章1日目の「ツッコミ」が、「武器」に変わったことを、描く場面
@jump target="*c2_end"

*c2_end
;=========================================
; 【業務後半】（問題5問）予兆と、小さな異変
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]

;[場面：午後・監視画面の前]
[bg storage="bg_monitor.gif" time="500"]

#ナレーション
午後は、穏やかな時間が、流れていた。[p]
#おまえ
今日は、当番じゃ、ないけど、ちょっと、画面を見ておこう[p]
#同期
勉強熱心だな[p]
#おまえ
習慣に、なってきた[p]

;[場面：監視画面に、小さな、異変]

ん？[p]
ディスクの、読み書きの時間が、少し、長くなってる[p]
エラーログも、ほんの少しだけ、増えてる[p]
でも、アラートは、鳴ってない[p]
#同期
どうした？[p]
#おまえ
何でも、ない。……たぶん[p]
#同期
たぶん、はやめろって。前にも言ったろ[p]
#おまえ
……そうだね。もう少し、見てみる[p]

;Q6 予兆の扱い／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q6】[r]
アラートは鳴っていないが、普段と、少し違う動きが、見られる。どうする？
[glink  color="blue"  storage="ch4_6/scene6_1.ks"  size="22"  x="640"  width="500"  y="240"  text="自分で、勝手に、設定を変える"  target="*Q6_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_1.ks"  size="22"  x="640"  width="500"  y="340"  text="気のせいだと思って、放置する"  target="*Q6_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_1.ks"  size="22"  x="640"  width="500"  y="440"  text="状況をメモして、先輩やリーダーに、共有する"  target="*Q6_ok"  ]
[s]

*Q6_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#おまえ
そうだ。小さな異変こそ、報告だ[p]
#
【解説】小さな異変は、大きな障害の予兆かもしれない。早めに、共有して、記録を残す。[p]
@jump target="*Q6_end"

*Q6_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#おまえ
（1年前なら、放置していたかも。でも、今は違う）[p]
#
【解説】小さな異変は、大きな障害の予兆かもしれない。早めに、共有して、記録を残す。[p]
@jump target="*Q6_end"

*Q6_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：パソコンの画面に、AIが、現れる]

#AI
こんにちは！ 今年も、よろしくお願いします！ ……私の、正確さは、80%です[p]
#おまえ
今年は、控えめだな[p]
#AI
そのディスクの数値、気になりますか？ 大丈夫です！[p]
その程度の変動は、正常の範囲です！ 100%、問題ありません！[p]
放置しても、まったく、問題ないでしょう！[p]
#同期
そう言ってるぜ？[p]
#おまえ
…………[p]
（……本当に？）[p]
（1年前の、俺なら、そのまま受け入れていた）[p]
（でも、今は、違う）[p]

;Q7 AI提案の見極め（検証イベント）／2択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
;選択肢2（f.ai_ok＋1）
;※不正解でも、リーダーが、止めてくれる（その場面で、画面を一緒に見る）。ただし、f.ai_ok は、増えない
;（という判断を、どう扱う？）
#AIの
問題ない[p]
[position layer="message0" left=0 top=0 width=1280 height=104 page=fore visible=true]
[font size=26]
#
【Q7】[r]
[glink  color="blue"  storage="ch4_6/scene6_1.ks"  size="22"  x="40"  width="1109"  y="112"  text="そのまま、信じて、放置する"  target="*Q7_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_1.ks"  size="22"  x="40"  width="1109"  y="173"  text="数値の変化の、原因を、自分で確認して、共有する"  target="*Q7_ok"  ]
[s]

*Q7_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.ai_ok += 1"]
#
【正解！】[l][r]
#おまえ
念のため、過去の、数値と、比べてみよう[p]
……やっぱり、先週から、少しずつ、悪くなってる[p]
@jump target="*Q7_end"

*Q7_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
待って、新人さん。念のため、一緒に確認しようか[p]
#おまえ
……はい。確認します[p]
@jump target="*Q7_end"

*Q7_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q8 ログの確認（総合）／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q8】[r]
ログファイルの、一番最後の部分を、確認するコマンドは？
[glink  color="blue"  storage="ch4_6/scene6_1.ks"  size="22"  x="640"  width="500"  y="240"  text="cd"  target="*Q8_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_1.ks"  size="22"  x="640"  width="500"  y="340"  text="mkdir"  target="*Q8_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_1.ks"  size="22"  x="640"  width="500"  y="440"  text="tail"  target="*Q8_ok"  ]
[glink  color="blue"  storage="ch4_6/scene6_1.ks"  size="22"  x="640"  width="500"  y="540"  text="pwd"  target="*Q8_ng"  ]
[s]

*Q8_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#おまえ
しっぽを、見る。5月から、変わらない[p]
@jump target="*Q8_end"

*Q8_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
しっぽ（tail）だぜ！ 毎回、言ってるぞ！[p]
@jump target="*Q8_end"

*Q8_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：リーダーに、共有する]

#おまえ
リーダー、少し、気になる数値が、あります[p]
#リーダー
どれ？[p]
#おまえ
ディスクの、読み書きの時間が、少しずつ、長くなっています[p]
#リーダー
……確かに。先週より、悪化してるね[p]
新人さん、よく気づいたね[p]
#おまえ
たまたま、画面を、見ていて[p]
#リーダー
たまたまじゃないよ。習慣に、なってるんだ[p]
念のため、ストレージの状態を、詳しく調べよう。……あ、大事な話だから、保存しとく？[p]
#おまえ
はい[p]

;Q9 エスカレーション（総合）／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q9】[r]
小さな異変を見つけて、原因が、わからない。どうする？
[glink  color="blue"  storage="ch4_6/scene6_1.ks"  size="22"  x="640"  width="500"  y="240"  text="自分だけで、調べ続ける"  target="*Q9_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_1.ks"  size="22"  x="640"  width="500"  y="340"  text="上位者に、状況を伝えて、一緒に、確認する"  target="*Q9_ok"  ]
[glink  color="blue"  storage="ch4_6/scene6_1.ks"  size="22"  x="640"  width="500"  y="440"  text="朝まで、放置する"  target="*Q9_ng"  ]
[s]

*Q9_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#リーダー
その判断が、一番大事だね[p]
@jump target="*Q9_end"

*Q9_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
一人で抱えない。秋に、学んだよね[p]
@jump target="*Q9_end"

*Q9_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q10 バックアップ（総合）／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=338 page=fore visible=true]
[font size=26]
#
【Q10】[r]
毎週日曜日の業務終了後にフルバックアップファイルを取得し、月曜日〜土曜日の業務終了後には増分バックアップファイルを取得しているシステムがある。水曜日の業務中に故障が発生したので、バックアップファイルを使って火曜日の業務終了時点の状態にデータを復元することにした。データ復元に必要なバックアップファイルを全て挙げたものはどれか。ここで、増分バックアップファイルとは、前回のバックアップファイル（フルバックアップファイル又は増分バックアップファイル）の取得以降に変更されたデータだけのバックアップファイルを意味する。
[glink  color="blue"  storage="ch4_6/scene6_1.ks"  size="22"  x="40"  width="1109"  y="346"  text="日曜日のフルバックアップファイル、月曜日と火曜日の増分バックアップファイル"  target="*Q10_ok"  ]
[glink  color="blue"  storage="ch4_6/scene6_1.ks"  size="22"  x="40"  width="1109"  y="407"  text="日曜日のフルバックアップファイル、火曜日の増分バックアップファイル"  target="*Q10_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_1.ks"  size="22"  x="40"  width="1109"  y="468"  text="月曜日と火曜日の増分バックアップファイル"  target="*Q10_ng"  ]
[glink  color="blue"  storage="ch4_6/scene6_1.ks"  size="22"  x="40"  width="1109"  y="529"  text="火曜日の増分バックアップファイル"  target="*Q10_ng"  ]
[s]

*Q10_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#リーダー
備えが、一番大事だね[p]
#
【解説】復元には、土台になるフルバックアップと、そのあとの増分を、順番に全部使う。日曜日のフル、月曜日の増分、火曜日の増分、の3つが必要。[p]
@jump target="*Q10_end"

*Q10_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
フルの土台に、増分を順番に重ねて戻すんだ。全部、必要なんだよ[p]
#
【解説】復元には、土台になるフルバックアップと、そのあとの増分を、順番に全部使う。日曜日のフル、月曜日の増分、火曜日の増分、の3つが必要。[p]
@jump target="*Q10_end"

*Q10_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：リーダーが、静かに、言う]

#リーダー
……念のため、今日のうちに、最新のバックアップを、取っておこう[p]
#先輩
備えは、全力で、だぜ！[p]
#おまえ
はい[p]
;※大規模障害（2日目）に備えた、バックアップが、ここで、取られる（伏線）

;[場面：業務後半の終わり]

#リーダー
今日は、ここまでにしよう[p]
でも、明日も、数値の変化には、注意してね[p]
#おまえ
はい[p]
#先輩
何も起きなければ、いいがな！[p]
;（ツッコミ）
#おまえ
それ、フラグです[p]

;=========================================
; 【終業後】（誰と過ごすか）
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]

;[場面：夕方・オフィス]
[bg storage="bg_office_evening.gif" time="500"]

#ナレーション
1月の、夕方。外は、もう、暗い。[p]

;[選択肢：終業後（信頼度）]
;選択肢1：先輩の信頼度＋1
;選択肢2：同期の信頼度＋1
;選択肢3：リーダーの信頼度＋1
;選択肢4：営業の信頼度＋1
#ナレーション
今日の夕方、誰と過ごす？
[glink  color="blue"  storage="ch4_6/scene6_1.ks"  size="26"  x="266"  width="640"  y="120"  text="先輩と、新年の目標について、語り合う"  target="*c3_1"  ]
[glink  color="blue"  storage="ch4_6/scene6_1.ks"  size="26"  x="266"  width="640"  y="195"  text="同期と、1年を、振り返る"  target="*c3_2"  ]
[glink  color="blue"  storage="ch4_6/scene6_1.ks"  size="26"  x="266"  width="640"  y="270"  text="リーダーと、バックアップの確認を、続ける"  target="*c3_3"  ]
[glink  color="blue"  storage="ch4_6/scene6_1.ks"  size="26"  x="266"  width="640"  y="345"  text="営業に、年始の、お客様対応について、聞く"  target="*c3_4"  ]
[s]

*c3_1
[cm]
[eval exp="f.t_senpai += 1"]
;◆1を選んだ場合
#先輩
今年の目標は、『全力』だぜ！[p]
#おまえ
去年と、同じですよね[p]
#先輩
だが、金色だぜ！[p]
;（ツッコミ）
#おまえ
そこは、変わってますね[p]

@jump target="*c3_end"

*c3_2
[cm]
[eval exp="f.t_douki += 1"]
;◆2を選んだ場合
#同期
1年前は、ドアに挟まれて、泣きそうだったよな[p]
#おまえ
今は、挟まれない[p]
#同期
お前のおかげで、機械が、少し怖くなくなったぜ[p]
#おまえ
僕も、同期がいたから、続けられた[p]

@jump target="*c3_end"

*c3_3
[cm]
[eval exp="f.t_leader += 1"]
;◆3を選んだ場合
#リーダー
バックアップの、リストアも、確認しようね[p]
備えは、取るだけじゃなく、戻せること、だよね[p]
#おまえ
はい。去年、教わりました[p]
#リーダー
その通り。ちゃんと、身についてるね。おkだよ[p]

@jump target="*c3_end"

*c3_4
[cm]
[eval exp="f.t_eigyo += 1"]
;◆4を選んだ場合
#営業
……年始は、客からの問い合わせが、増える[p]
……そこの。対応力に、期待してる[p]
#おまえ
ありがとうございます[p]
#営業
……期待。褒めてない[p]
#おまえ
わかってます[p]
@jump target="*c3_end"

*c3_end
;=========================================
; 【自宅】（リザルト）
;=========================================
[playbgm storage="bgm_walk.mp3" restart="false"]

;[bg storage="（自宅の部屋（夜））" time="500"]
[bg storage="bg_home_night.gif" time="500"]

#ナレーション
布団に入って、1年を、振り返る。[p]

;[リザルト表示]
;・今日の正解数：○／10
;・スキル：＋○
;・AI見極め回数：＋○（Q7で見極めたら＋1）
;・信頼度の変化：（選んだキャラ）＋1〜2

;[ナレーション]
#おまえ
1年前の、僕なら、あの数値の変化に、気づかなかった[p]
ツッコミを、入れる癖が、疑って確かめる、力に、なっていた[p]
でも、なんとなく、嫌な予感が、する[p]
あの、ディスクの数値。……ただの、気のせい、だと、いいけど[p]
#ナレーション
第6章 2日目へ。[p]

;=========================================
;■ 次回予告（第6章 2日目）
;大規模障害が発生。複数のAI提案が飛び交い、正しい提案と誤った提案を、見極める。
;第5章のバックアップが、役に立つ。
;出題：総合（全範囲）
;■ 未決定
;・社長以外の名前
;・各問題の中身（仮。見直す前提）
;・大規模障害の原因（この日の予兆では、ストレージの劣化として、描いた）
;・AIの「正確さ」の数字ネタ（80%）の、最終的な着地点
;・同期が「ドアを克服した」という描写が、第1章からの、回収として、成立しているか

;次のファイルへ
@jump storage="ch4_6/scene6_2.ks"
