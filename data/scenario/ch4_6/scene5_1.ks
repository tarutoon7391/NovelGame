;第5章 1日目

*start
;章セレクトで、この章を選べるようにする
[eval exp="sf.reach_ch5 = true"]
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
;台本　第5章（11〜12月）　1日目
;状態：叩き台（1日分すべて）／ITパスポート枠は過去問に差し替え済み（11/4）
;※名前は社長（郡晴希：こおり はるき）のみ決定。ほかは役割で表記
;※選択肢の数は問題ごとに変える（用語・知識は4択／場面の判断は3択／AI提案の見極めは2択）
;============================================================
;■ この章のねらい
;自動化・バックアップ。周りを見る余裕が出る。
;1日目：落ち着いた日。社長が経営の話をする（ブチ切れながら）。会社全体を見る余裕が出る
;2日目：先輩と、作業の自動化に取り組む。AIが、自動化スクリプトを提案し、主人公が、小さな誤りを見つける
;3日目：バックアップを整備する。リーダー「いざというときの備えが、一番大事よ」（第6章への伏線）
;4日目：年末。忘年会のような場面（コメディ多め）。信頼度のイベントが多い日
;■ この日のねらい
;・11月。落ち着いた日。会社の「大きな話」を、初めて聞く
;・社長が、経営の話をする。ただし、ブチ切れながら
;・ITの仕事は、会社の経営と、つながっていることに、気づく
;・社長が、少しだけ、人間らしい一面を見せる（まれに、優しい）
;・出題：ITパスポート（ストラテジ：経営、会社の仕組み）
;■ 1日の流れ
;朝 → 業務前半（5問）→ 昼休み → 業務後半（5問）→ 終業後 → 自宅（リザルト）
;------------------------------------------------------------
; 【朝】
;=========================================
[playbgm storage="bgm_walk.mp3" restart="false"]

;[bg storage="（真っ白な画面（時間経過の演出））" time="500"]
[bg storage="bg_white.png" time="500"]

#ナレーション
第4章が終わって、1か月が過ぎた。[p]
11月。朝の空気が、ぐっと、冷たくなった。[p]

;[bg storage="（オフィス（朝））" time="500"]
[bg storage="bg_office.gif" time="500"]

第5章 1日目。入社して、7か月。[p]
#同期
おはよう！ 今日は、ドアが半分しか開かなかったぜ[p]
#おまえ
それは、ドアの故障では[p]
#同期
おう。でも、挟まれなかったから、勝ちだ！[p]
;（ツッコミ）
#おまえ
勝ちの、基準が、低い[p]

;[場面：オフィスが、静かで、穏やか]

#ナレーション
今日は、障害も、アラートも、ない。[p]
#先輩
平和だな！ 練習試合がない日も、いいもんだぜ！[p]
#リーダー
こういう日に、基礎を固めるんだよ[p]
#営業
……平和でも、営業は、忙しい[p]
#おまえ
（今日は、穏やかな一日になりそうだ）[p]

;[場面：社長が、突然、入ってくる]

;[効果音：ドアが、バーンと、開く]
[playse storage="se_hatch_open_close.mp3"]
#社長
ふっ……全員、集まれ[p]
#先輩
おお、社長が、サンバの衣装を着てるっス！[p]
#リーダー
先輩、しっ[p]
#社長
いいか、よく聞け……今日は、経営の話をするぜ[p]
#おまえ
経営、ですか[p]
#社長
お前たちは、IT技術だけ知っていればいい、と思っていないか[p]
#おまえ
いえ、そんなことは[p]
;（腰を振りながら）
#社長
違うぜ……会社が潰れたら、技術も、仕事も、なくなるんだ[p]
#同期
踊りながら、大事なこと言ってるぜ……[p]
;（ツッコミ）
#おまえ
サンバ経営セミナーだ[p]

;[選択肢：1回目（信頼度）]
;選択肢1：先輩の信頼度＋1
;選択肢2：同期の信頼度＋1
;選択肢3：営業の信頼度＋1
;※どれを選んでも、次の場面につながる
#ナレーション
社長の、話を、聞く前に、どうする？
[glink  color="blue"  storage="ch4_6/scene5_1.ks"  size="26"  x="266"  width="640"  y="120"  text="先輩の隣に座って、一緒にメモを取る"  target="*c1_1"  ]
[glink  color="blue"  storage="ch4_6/scene5_1.ks"  size="26"  x="266"  width="640"  y="195"  text="同期の隣に座って、一緒に聞く"  target="*c1_2"  ]
[glink  color="blue"  storage="ch4_6/scene5_1.ks"  size="26"  x="266"  width="640"  y="270"  text="営業の隣に座って、社長の話の、解説を、聞く"  target="*c1_3"  ]
[s]

*c1_1
[cm]
[eval exp="f.t_senpai += 1"]
;◆1を選んだ場合
#先輩
よし、メモの準備だぜ！ 社長の話は、ボールの軌道より読めないからな！[p]
#おまえ
（先輩でも、読めないんだ）[p]
@jump target="*c1_end"

*c1_2
[cm]
[eval exp="f.t_douki += 1"]
;◆2を選んだ場合
#同期
なあ、あの衣装、どこで買ったんだろうな[p]
#おまえ
（気になるのは、そこなんだ）[p]
@jump target="*c1_end"

*c1_3
[cm]
[eval exp="f.t_eigyo += 1"]
;◆3を選んだ場合
#営業
……社長の話。……あとで、要点だけ、教える[p]
#おまえ
（解説してくれるらしい。言葉は少ないけど）[p]
;→ 次の場面へ
@jump target="*c1_end"

*c1_end

;=========================================
; 【業務前半】（問題5問）経営の基礎
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]
[eval exp="f.correct_am = 0"]

;[場面：会議室。社長が、ホワイトボードの前に立つ]
[bg storage="bg_meeting_room.gif" time="500"]

#社長
いいか、よく聞け……会社は、慈善事業じゃないぜ[p]
売上から、費用を引いた残りが、利益だ[p]
#おまえ
利益、ですね[p]
#社長
利益がなければ、給料も出ないぜ……[p]
#先輩
それは、切実っス！[p]

;Q1 経常利益の計算／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=221 page=fore visible=true]
[font size=26]
#
【Q1】[r]
次の損益計算書から求められる経常利益は何百万円か。（単位：百万円）[r]
売上高 10,000　売上原価 5,000　販売費及び一般管理費 4,600　営業外収益 1,200　営業外費用 1,000　特別利益 30　特別損失 50
[glink  color="blue"  storage="ch4_6/scene5_1.ks"  size="22"  x="40"  width="1109"  y="229"  text="400"  target="*Q1_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_1.ks"  size="22"  x="40"  width="1109"  y="290"  text="580"  target="*Q1_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_1.ks"  size="22"  x="40"  width="1109"  y="351"  text="600"  target="*Q1_ok"  ]
[glink  color="blue"  storage="ch4_6/scene5_1.ks"  size="22"  x="40"  width="1109"  y="412"  text="5,000"  target="*Q1_ng"  ]
[s]

*Q1_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#社長
ふっ……経常利益は、本業と、それ以外の収支をあわせた、会社の体力だぜ[p]
#
【解説】売上高－売上原価＝売上総利益（5,000）。そこから販売費及び一般管理費を引くと、営業利益（400）。営業外収益を足して営業外費用を引くと、経常利益（600）。特別利益と特別損失は、経常利益のあとに加える。[p]
@jump target="*Q1_end"

*Q1_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#社長
営業利益に、営業外の収益を足して、営業外の費用を引く……いいか、よく聞け……何度も言わせるな[p]
#
【解説】売上高－売上原価＝売上総利益（5,000）。そこから販売費及び一般管理費を引くと、営業利益（400）。営業外収益を足して営業外費用を引くと、経常利益（600）。特別利益と特別損失は、経常利益のあとに加える。[p]
@jump target="*Q1_end"

*Q1_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q2 SWOT分析（機会）／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q2】[r]
ある業界への新規参入を検討している企業がSWOT分析を行った。分析結果のうち、機会に該当するものはどれか。
[glink  color="blue"  storage="ch4_6/scene5_1.ks"  size="22"  x="640"  width="500"  y="240"  text="既存事業での成功体験"  target="*Q2_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_1.ks"  size="22"  x="640"  width="500"  y="340"  text="業界の規制緩和"  target="*Q2_ok"  ]
[glink  color="blue"  storage="ch4_6/scene5_1.ks"  size="22"  x="640"  width="500"  y="440"  text="自社の商品開発力"  target="*Q2_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_1.ks"  size="22"  x="640"  width="500"  y="540"  text="全国をカバーする自社の小売店舗網"  target="*Q2_ng"  ]
[s]

*Q2_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#社長
外の追い風が、機会だぜ……会社の現在地を知ることが、第一歩だ[p]
#
【解説】SWOT分析では、強みと弱みは会社の内側、機会と脅威は会社の外側の要因。規制緩和は、外側で起きる追い風なので、機会。[p]
@jump target="*Q2_end"

*Q2_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#社長
強み、弱みは内側。機会、脅威は外側。……4つの頭文字だぜ[p]
#
【解説】SWOT分析では、強みと弱みは会社の内側、機会と脅威は会社の外側の要因。規制緩和は、外側で起きる追い風なので、機会。[p]
@jump target="*Q2_end"

*Q2_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：社長が、突然、声を、落とす]

#社長
……うちの強みは、何だと思う[p]
#おまえ
えっ[p]
#社長
……お前たちだぜ[p]
#おまえ
……！[p]
;（急に、サンバのステップを再開する）
#社長
……いや、何でもない。続けるぜ[p]
#同期
今、さらっと、いいこと言ったよな[p]
#先輩
社長、照れてるっスね！[p]
#社長
いいか、よく聞け……照れてない[p]
;※社長の、まれに優しい一面。すぐに、奇行に戻る

;Q3 PDCAサイクル（Check）／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q3】[r]
PDCAサイクルで業務を運営している。KPIなどの指標をもとに、業務の実施状況が計画どおりかを測定・評価する段階は、PDCAのどれか。
[glink  color="blue"  storage="ch4_6/scene5_1.ks"  size="22"  x="640"  width="500"  y="240"  text="Plan（計画）"  target="*Q3_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_1.ks"  size="22"  x="640"  width="500"  y="340"  text="Do（実行）"  target="*Q3_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_1.ks"  size="22"  x="640"  width="500"  y="440"  text="Check（点検・評価）"  target="*Q3_ok"  ]
[glink  color="blue"  storage="ch4_6/scene5_1.ks"  size="22"  x="640"  width="500"  y="540"  text="Act（処置・改善）"  target="*Q3_ng"  ]
[s]

*Q3_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#社長
確認と改善を、繰り返せ……ふっ[p]
#
【解説】PDCAは、計画（Plan）、実行（Do）、点検（Check）、改善（Act）を回す考え方。指標で、計画どおりに進んでいるかを測る段階が、点検（Check）。[p]
@jump target="*Q3_end"

*Q3_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#社長
計画、実行、確認、改善。指標で測るのは、確認の段階だぜ[p]
#
【解説】PDCAは、計画（Plan）、実行（Do）、点検（Check）、改善（Act）を回す考え方。指標で、計画どおりに進んでいるかを測る段階が、点検（Check）。[p]
@jump target="*Q3_end"

*Q3_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q4 KPI／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q4】[r]
目標の達成度を、測るための、数値の指標を、何という？
[glink  color="blue"  storage="ch4_6/scene5_1.ks"  size="22"  x="640"  width="500"  y="240"  text="KDDI"  target="*Q4_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_1.ks"  size="22"  x="640"  width="500"  y="340"  text="KTV"  target="*Q4_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_1.ks"  size="22"  x="640"  width="500"  y="440"  text="KPI"  target="*Q4_ok"  ]
[glink  color="blue"  storage="ch4_6/scene5_1.ks"  size="22"  x="640"  width="500"  y="540"  text="KGB"  target="*Q4_ng"  ]
[s]

*Q4_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#社長
数字で、見えるようにしろ……[p]
#
【解説】KPI（重要業績評価指標）は、目標に、どれだけ近づいたかを、測る指標。[p]
@jump target="*Q4_end"

*Q4_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#社長
KPI。目標を、数字で測るんだぜ[p]
#
【解説】KPI（重要業績評価指標）は、目標に、どれだけ近づいたかを、測る指標。[p]
@jump target="*Q4_end"

*Q4_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q5 コンプライアンス／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=260 page=fore visible=true]
[font size=26]
#
【Q5】[r]
企業が社会の信頼に応えるうえで、コンプライアンスの観点から考慮すべきものを、a〜dから全て挙げたものはどれか。[r]
a　交通ルールの遵守　　b　公務員への接待の禁止　　c　自社の就業規則の遵守　　d　他者の知的財産権の尊重
[glink  color="blue"  storage="ch4_6/scene5_1.ks"  size="22"  x="40"  width="1109"  y="268"  text="a、b、c"  target="*Q5_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_1.ks"  size="22"  x="40"  width="1109"  y="329"  text="a、b、c、d"  target="*Q5_ok"  ]
[glink  color="blue"  storage="ch4_6/scene5_1.ks"  size="22"  x="40"  width="1109"  y="390"  text="a、c、d"  target="*Q5_ng"  ]
[s]

*Q5_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#社長
会社の信頼の、土台だぜ[p]
#
【解説】コンプライアンスは、法律だけでなく、社会のルールや会社の規則、倫理まで守ること。交通ルールも、接待の禁止も、就業規則も、他人の権利の尊重も、全部含まれる。[p]
@jump target="*Q5_end"

*Q5_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#社長
法令だけじゃない。会社の規則も、社会のルールも、全部だ。……破ると、会社が潰れるぜ[p]
#
【解説】コンプライアンスは、法律だけでなく、社会のルールや会社の規則、倫理まで守ること。交通ルールも、接待の禁止も、就業規則も、他人の権利の尊重も、全部含まれる。[p]
@jump target="*Q5_end"

*Q5_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：業務前半の終わり]

#社長
前半は、ここまでだ。昼飯を、食え[p]
#先輩
社長、今日は、よくしゃべるっスね[p]
#社長
しゃべってない。……踊りながら、説明している[p]
#おまえ
（自覚はあったんだ）[p]

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
経営の話も、バッチリだな！ 視野が、広がってるぜ！[p]

[elsif exp="f.correct_am >= 2"]
;◆2〜3問正解のとき
#先輩
いい調子だぜ！ 後半も、頑張れ！[p]

[else]
;◆1問以下のとき
#先輩
ドンマイだ！ 経営の用語は、馴染みが薄いからな！ 後半に、取り返すぞ！[p]
[endif]

;[場面：営業が、近づく]

#営業
……そこの[p]
#おまえ
はい[p]
#営業
……社長の話。どう思った[p]
#おまえ
踊ってましたが、会社のことを真剣に考えているのは、伝わりました[p]
#営業
……そうか[p]
……社長は、変わってるが、社員の給料は、一度も、遅らせたことがない[p]
#おまえ
えっ[p]
#営業
……創業以来、一度も。自分の給料を、削ってでも、払ってる[p]
#おまえ
……そうなんですか[p]
#営業
……そういう人。……誰にも、言うな[p]
#おまえ
（社長の、見方が、少し、変わった）[p]
;※社長の、隠れた一面を、営業が、教える

;=========================================
; 【業務後半】（問題5問）会社の仕組みと、ITの役割
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]

;[場面：午後・会議室。リーダーが、講師]
[bg storage="bg_meeting_room.gif" time="500"]

#リーダー
後半は、会社の仕組みと、ITの役割を、考えよう[p]
ITは、会社のあらゆる部分を、支えてるんだよ[p]

;Q6 株式会社の最高意思決定機関／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q6】[r]
株式会社の最高意思決定機関はどれか。
[glink  color="blue"  storage="ch4_6/scene5_1.ks"  size="22"  x="640"  width="500"  y="240"  text="株主総会"  target="*Q6_ok"  ]
[glink  color="blue"  storage="ch4_6/scene5_1.ks"  size="22"  x="640"  width="500"  y="340"  text="監査役会"  target="*Q6_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_1.ks"  size="22"  x="640"  width="500"  y="440"  text="代表取締役"  target="*Q6_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_1.ks"  size="22"  x="640"  width="500"  y="540"  text="取締役会"  target="*Q6_ng"  ]
[s]

*Q6_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#リーダー
出資者が、会社の所有者なんだ[p]
#
【解説】株式会社は、お金を出す株主と、経営を行う人が別。株主が集まる株主総会が、会社の最も大事なことを決める場。[p]
@jump target="*Q6_end"

*Q6_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
株主が集まって決める場が、株主総会。会社の、最高の意思決定機関だよ[p]
#
【解説】株式会社は、お金を出す株主と、経営を行う人が別。株主が集まる株主総会が、会社の最も大事なことを決める場。[p]
@jump target="*Q6_end"

*Q6_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q7 オフショアアウトソーシング／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q7】[r]
システムの開発や運用を、海外の事業者や海外子会社に委託することを表す用語はどれか。
[glink  color="blue"  storage="ch4_6/scene5_1.ks"  size="22"  x="640"  width="500"  y="240"  text="オフショアアウトソーシング"  target="*Q7_ok"  ]
[glink  color="blue"  storage="ch4_6/scene5_1.ks"  size="22"  x="640"  width="500"  y="340"  text="システムインテグレーション"  target="*Q7_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_1.ks"  size="22"  x="640"  width="500"  y="440"  text="ファシリティマネジメント"  target="*Q7_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_1.ks"  size="22"  x="640"  width="500"  y="540"  text="ホスティング"  target="*Q7_ng"  ]
[s]

*Q7_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#リーダー
海外に任せるのが、オフショアだね[p]
#
【解説】アウトソーシングは、仕事の一部を外部に任せること。オフショアは「海外」の意味で、海外に任せるのが、オフショアアウトソーシング。人件費の安い国に任せて、費用を抑える狙いが多い。[p]
@jump target="*Q7_end"

*Q7_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
外（アウト）に任せるのがアウトソーシング。海外（オフショア）に任せるなら、オフショアアウトソーシングだよ[p]
#
【解説】アウトソーシングは、仕事の一部を外部に任せること。オフショアは「海外」の意味で、海外に任せるのが、オフショアアウトソーシング。人件費の安い国に任せて、費用を抑える狙いが多い。[p]
@jump target="*Q7_end"

*Q7_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：パソコンの画面に、AIが、現れる]

#AI
こんにちは！ 経営の、お手伝いを、します！ 100%、確実です！[p]
会社の、コストを削減する、最高の方法を、お教えします！[p]
運用チームを、全員、解雇して、AIだけで、24時間、運用してください！[p]
#先輩
俺たちを、解雇だと！？ レッドカードだぜ！[p]
#おまえ
…………[p]
#リーダー
おやおや。ちょっと、待とうか[p]
#同期
AI、人事に、口出しすんなよ[p]
;（会議室の外から、聞いていて）
#社長
……何だと[p]
;※社長が、ドアの外から、顔を出す。場が、凍りつく

;Q8 AI提案の見極め（経営の提案）／2択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
;選択肢1（f.ai_ok＋1）
;※「AIに給料は払っとらん」は、7月の章末のバッドエンドの、決めゼリフ。ここでは、別の意味（AIは責任を取らない）で使われる
;※AIの正確さの数字ネタは、この日は、封印（0%のあと、静かに退場）
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q8】[r]
AIの、経営提案を、どう扱う？
[glink  color="blue"  storage="ch4_6/scene5_1.ks"  size="22"  x="640"  width="500"  y="240"  text="影響やリスクを、確認して、採用しない"  target="*Q8_ok"  ]
[glink  color="blue"  storage="ch4_6/scene5_1.ks"  size="22"  x="640"  width="500"  y="340"  text="そのまま、採用する"  target="*Q8_ng"  ]
[s]

*Q8_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.ai_ok += 1"]
#
【正解！】[l][r]
#おまえ
24時間、運用するのは、人の判断が、必要です[p]
AIが、間違えたとき、誰が、気づいて、止めるんですか[p]
#社長
……ふっ。その通りだ[p]
いいか、よく聞け……AIに、給料は、払っとらん。だが、AIが責任を取ってくれるわけでもないぜ[p]
@jump target="*Q8_end"

*Q8_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#社長
いいか、よく聞け……却下だ[p]
#リーダー
AIは、道具だよ。責任は、取ってくれないんだ[p]
@jump target="*Q8_end"

*Q8_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：AIが、画面から、静かに、消える]

#AI
…………[p]
#おまえ
今日は、AIが、何も、言わないで、消えた[p]
#同期
落ち込んでんのかな[p]
#先輩
AIも、反省する時期だな！[p]

;Q9 BCP（事業継続計画）／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
;※第6章の、大規模障害への、伏線
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q9】[r]
大規模な災害などによって、企業活動を支える重要な情報システムに障害が発生したような場合でも、企業活動の継続を可能にするために、あらかじめ策定する計画はどれか。
[glink  color="blue"  storage="ch4_6/scene5_1.ks"  size="22"  x="640"  width="500"  y="240"  text="BCP"  target="*Q9_ok"  ]
[glink  color="blue"  storage="ch4_6/scene5_1.ks"  size="22"  x="640"  width="500"  y="340"  text="BPR"  target="*Q9_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_1.ks"  size="22"  x="640"  width="500"  y="440"  text="ERP"  target="*Q9_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_1.ks"  size="22"  x="640"  width="500"  y="540"  text="RFP"  target="*Q9_ng"  ]
[s]

*Q9_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#リーダー
冬の、大事なテーマにもなるよ[p]
#
【解説】BCPは、事業継続計画。災害や障害が起きても、大事な事業を止めない、または早く再開するための計画。バックアップも、その一部。[p]
@jump target="*Q9_end"

*Q9_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
事業を止めない計画。BCPだよ。覚えておいてね[p]
#
【解説】BCPは、事業継続計画。災害や障害が起きても、大事な事業を止めない、または早く再開するための計画。バックアップも、その一部。[p]
@jump target="*Q9_end"

*Q9_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q10 バックアップ（復習）／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=338 page=fore visible=true]
[font size=26]
#
【Q10】[r]
毎週日曜日の業務終了後にフルバックアップファイルを取得し、月曜日〜土曜日の業務終了後には増分バックアップファイルを取得しているシステムがある。水曜日の業務中に故障が発生したので、バックアップファイルを使って火曜日の業務終了時点の状態にデータを復元することにした。データ復元に必要なバックアップファイルを全て挙げたものはどれか。ここで、増分バックアップファイルとは、前回のバックアップファイル（フルバックアップファイル又は増分バックアップファイル）の取得以降に変更されたデータだけのバックアップファイルを意味する。
[glink  color="blue"  storage="ch4_6/scene5_1.ks"  size="22"  x="40"  width="1109"  y="346"  text="日曜日のフルバックアップファイル、月曜日と火曜日の増分バックアップファイル"  target="*Q10_ok"  ]
[glink  color="blue"  storage="ch4_6/scene5_1.ks"  size="22"  x="40"  width="1109"  y="407"  text="日曜日のフルバックアップファイル、火曜日の増分バックアップファイル"  target="*Q10_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_1.ks"  size="22"  x="40"  width="1109"  y="468"  text="月曜日と火曜日の増分バックアップファイル"  target="*Q10_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_1.ks"  size="22"  x="40"  width="1109"  y="529"  text="火曜日の増分バックアップファイル"  target="*Q10_ng"  ]
[s]

*Q10_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#リーダー
備えが一番、大事だね[p]
#
【解説】復元には、土台になるフルバックアップと、そのあとの増分を、順番に全部使う。日曜日のフル、月曜日の増分、火曜日の増分、の3つが必要。[p]
@jump target="*Q10_end"

*Q10_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
フルの土台に、増分を順番に重ねるんだよ。全部、必要なんだ[p]
#
【解説】復元には、土台になるフルバックアップと、そのあとの増分を、順番に全部使う。日曜日のフル、月曜日の増分、火曜日の増分、の3つが必要。[p]
@jump target="*Q10_end"

*Q10_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：業務後半の終わり]

#リーダー
今日の勉強は、ここまでだね[p]
#先輩
なんだか、会社の中が、ピッチ全体みたいに、広く見えてきたぜ！[p]
#おまえ
はい。ITだけじゃなくて、会社全体を、見る目が、少し、できた気がします[p]
#リーダー
それが、今日の一番の収穫だね。おkだよ[p]

;=========================================
; 【終業後】（誰と過ごすか）
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]

;[場面：夕方・オフィス]
[bg storage="bg_office_evening.gif" time="500"]

#ナレーション
穏やかな一日が、終わった。[p]
窓の外は、もう、暗い。冬が、近づいている。[p]

;[選択肢：終業後（信頼度）]
;選択肢1：先輩の信頼度＋1
;選択肢2：同期の信頼度＋1
;選択肢3：リーダーの信頼度＋1
;選択肢4：営業の信頼度＋1
#ナレーション
今日の夕方、誰と過ごす？
[glink  color="blue"  storage="ch4_6/scene5_1.ks"  size="26"  x="266"  width="640"  y="120"  text="社長の話について、先輩と、語り合う"  target="*c2_1"  ]
[glink  color="blue"  storage="ch4_6/scene5_1.ks"  size="26"  x="266"  width="640"  y="195"  text="同期と、会社の、経営について、おさらいする"  target="*c2_2"  ]
[glink  color="blue"  storage="ch4_6/scene5_1.ks"  size="26"  x="266"  width="640"  y="270"  text="リーダーに、会社の将来を、聞く"  target="*c2_3"  ]
[glink  color="blue"  storage="ch4_6/scene5_1.ks"  size="26"  x="266"  width="640"  y="345"  text="営業に、社長の、隠れた一面について、もう少し、聞く"  target="*c2_4"  ]
[s]

*c2_1
[cm]
[eval exp="f.t_senpai += 1"]
;◆1を選んだ場合
#先輩
社長は、変わってるが、本当はいい人だぜ！[p]
俺は、前から知ってたっス！[p]
#おまえ
本当ですか[p]
#先輩
……たぶん[p]
;（ツッコミ）
#おまえ
たぶん、は、余計です[p]

@jump target="*c2_end"

*c2_2
[cm]
[eval exp="f.t_douki += 1"]
;◆2を選んだ場合
#同期
利益、SWOT、KPI。覚える用語が、多いぜ[p]
#おまえ
全部、会社の、仕組みだからね[p]
#同期
オデ、プリンタを克服する前に、会社を経営できそうだぜ[p]
#おまえ
それは、順番が、おかしい[p]

@jump target="*c2_end"

*c2_3
[cm]
[eval exp="f.t_leader += 1"]
;◆3を選んだ場合
#リーダー
会社の将来、か。俺は、この会社が好きだよ[p]
社長は変わってるけど、社員を大事にしてるのが、わかるからね[p]
#おまえ
リーダーも、そう、思いますか[p]
#リーダー
そうだね。……内緒だよ[p]

@jump target="*c2_end"

*c2_4
[cm]
[eval exp="f.t_eigyo += 1"]
;◆4を選んだ場合
#営業
……社長は、創業のとき、ずっと一人で、会社を支えてた[p]
……だから、社員に、厳しい。守りたいから[p]
#おまえ
そうなんですか[p]
#営業
……変な行動は、照れ隠しの、癖みたいなもの。……許してやれ[p]
#おまえ
（社長を、少し、理解できた気がする）[p]
@jump target="*c2_end"

*c2_end
;=========================================
; 【自宅】（リザルト）
;=========================================
[playbgm storage="bgm_walk.mp3" restart="false"]

;[bg storage="（自宅の部屋（夜））" time="500"]
[bg storage="bg_home_night.gif" time="500"]

#ナレーション
布団に入って、今日の、社長の話を、思い返す。[p]

;[リザルト表示]
;・今日の正解数：○／10
;・スキル：＋○
;・AI見極め回数：＋○（Q8で見極めたら＋1）
;・信頼度の変化：（選んだキャラ）＋1

;[ナレーション]
#おまえ
社長は、変な人だけど、会社を、一番、守りたい人なんだ[p]
ITの仕事も、会社を守るための、仕事の、一部だ[p]
明日から、もっと、広い目で、仕事を、見てみよう[p]
#ナレーション
第5章 2日目へ。[p]

;=========================================
;■ 次回予告（第5章 2日目）
;先輩と、作業の自動化に取り組む。AIが自動化スクリプトを提案し、主人公が、疑って、小さな誤りを見つける。
;出題：運用（シェルスクリプト、cron）を少し、ITパスポート（情報の扱い）
;■ 未決定
;・社長以外の名前
;・各問題の中身（仮。見直す前提）
;・社長の「隠れた優しさ」の、出し方（この日は、少しだけ、のぞかせる）
;・AIの「正確さ」の数字ネタの、終わり方（この日は、封印して、静かに退場）
;・Q8の「AIに給料は払っとらん」は、第3章末のバッドエンドの、決めゼリフ。使い方が、かぶっていないか

;次のファイルへ
@jump storage="ch4_6/scene5_2.ks"
