;第5章 4日目

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
;台本　第5章（11〜12月）　4日目（第5章の最終日）
;状態：叩き台（1日分すべて）／ITパスポート枠は過去問に差し替え済み（11/4）
;※名前は社長（郡晴希：こおり はるき）のみ決定。ほかは役割で表記
;※選択肢の数は問題ごとに変える（用語・知識は4択／場面の判断は3択／AI提案の見極めは2択）
;============================================================
;■ この日のねらい
;・年末。みんなで、忘年会のような場面（コメディ多め）
;・信頼度のイベントが、多い日（終業後に、複数の選択肢）
;・出題：ITパスポート（法務）、第5章の総復習
;・章末に、4つ目の途中判定（バッドエンドあり）
;■ 1日の流れ
;朝 → 業務前半（5問）→ 昼休み → 業務後半（5問）→ 終業後（忘年会）→ 自宅（リザルト）→ 章末の途中判定
;------------------------------------------------------------
; 【朝】
;=========================================
[playbgm storage="bgm_walk.mp3" restart="false"]

;[bg storage="（真っ白な画面（時間経過の演出））" time="500"]
[bg storage="bg_white.png" time="500"]

#ナレーション
第5章の3日目から、数週間が、過ぎた。[p]
12月。街は、イルミネーションで、輝いている。[p]

;[bg storage="（オフィス（朝））" time="500"]
[bg storage="bg_office.gif" time="500"]

第5章 4日目。今日は、今年最後の、出社日だ。[p]
#同期
おはよう！ 今日、ドアに挟まれなかったぜ！[p]
#おまえ
今年は、ドアに、何回、挟まれた？[p]
#同期
数えてねェ[p]
;（ツッコミ）
#おまえ
数えて[p]
#同期
今日は年末だから、特別に、ドアがゆっくり閉まるんだってよ[p]
#おまえ
それは、ありえない[p]

;[場面：先輩が、紙を持って、登場]

#先輩
全員、集まれ！ 今夜は、忘年会だぜ！[p]
#リーダー
おやおや、先輩が幹事なんだね[p]
#先輩
そうっス！ 全力で、盛り上げるぜ！[p]
#おまえ
全力すぎて、不安です[p]
#先輩
その不安は、的中するぜ！[p]
;（ツッコミ）
#おまえ
なぜ、断言するんですか[p]

;[場面：社長が、入ってくる]

#社長
ふっ……忘年会、か[p]
#先輩
はいっス！ 社長も、ぜひ、ご参加を！[p]
#社長
……仕方ない。予算は、出すぜ[p]
#同期
社長が、予算を出したぜ……[p]
;（言いながら、ムーンウォークで去る）
#社長
いいか、よく聞け……無駄遣いは、するなよ[p]
#先輩
承知しましたっス！[p]
#おまえ
（踊りながら、予算を出す、社長）[p]

;[選択肢：1回目（信頼度）]
;選択肢1：先輩の信頼度＋1
;選択肢2：同期の信頼度＋1
;選択肢3：リーダーの信頼度＋1
;選択肢4：営業の信頼度＋1
;※どれを選んでも、次の場面につながる
#ナレーション
忘年会の準備で、誰を、手伝う？
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="26"  x="266"  width="640"  y="120"  text="先輩の、幹事の仕事を、手伝う"  target="*c1_1"  ]
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="26"  x="266"  width="640"  y="195"  text="同期と、会場の飾りつけを、担当する"  target="*c1_2"  ]
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="26"  x="266"  width="640"  y="270"  text="リーダーと、お店の予約を、確認する"  target="*c1_3"  ]
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="26"  x="266"  width="640"  y="345"  text="営業と、お客様への、年末の挨拶メールを、準備する"  target="*c1_4"  ]
[s]

*c1_1
[cm]
[eval exp="f.t_senpai += 1"]
;◆1を選んだ場合
#先輩
助かるぜ！ 幹事は、チームの司令塔だからな！[p]
#おまえ
（司令塔の仕事は、店の予約だった）[p]
@jump target="*c1_end"

*c1_2
[cm]
[eval exp="f.t_douki += 1"]
;◆2を選んだ場合
#同期
飾りつけなら任せろ！ 脚立は……オデ、乗らねェほうがいいな[p]
#おまえ
（賢明な判断だ）[p]
@jump target="*c1_end"

*c1_3
[cm]
[eval exp="f.t_leader += 1"]
;◆3を選んだ場合
#リーダー
予約、確認しとこうね。大事な宴会の前だから、ここで保存しとく？[p]
#おまえ
（予約を、だろうか）[p]
@jump target="*c1_end"

*c1_4
[cm]
[eval exp="f.t_eigyo += 1"]
;◆4を選んだ場合
#営業
……年末の挨拶。……短く。……心をこめて[p]
#おまえ
（短くて、心をこめる。難しい）[p]
;→ 次の場面へ
@jump target="*c1_end"

*c1_end

;=========================================
; 【業務前半】（問題5問）法務の基礎
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]
[eval exp="f.correct_am = 0"]

;[場面：会議室。営業が、講師]
[bg storage="bg_meeting_room.gif" time="500"]

#営業
……今日は、法務[p]
……営業は、契約と法律に、一番近い[p]
#おまえ
営業さんが、先生ですか[p]
#営業
……文句があるなら、聞く[p]
#おまえ
いえ。お願いします[p]

;Q1 著作権の保護対象／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=221 page=fore visible=true]
[font size=26]
#
【Q1】[r]
著作権法で保護の対象となるものだけを全て挙げたものはどれか。[r]
a　インターネットで公開されているフリーソフトウェア　　b　データベースの操作マニュアル[r]
c　プログラム言語　　d　プログラムのアルゴリズム
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="22"  x="40"  width="1109"  y="229"  text="a、b"  target="*Q1_ok"  ]
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="22"  x="40"  width="1109"  y="290"  text="a、d"  target="*Q1_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="22"  x="40"  width="1109"  y="351"  text="b、c"  target="*Q1_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="22"  x="40"  width="1109"  y="412"  text="c、d"  target="*Q1_ng"  ]
[s]

*Q1_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#営業
……ソフトも、マニュアルも、作品。基本[p]
#
【解説】プログラム言語、決まり事（規約）、解法（アルゴリズム）は、著作権法の保護の対象外。ソフトそのものと、マニュアルの文章は、著作物として守られる。[p]
@jump target="*Q1_end"

*Q1_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#営業
……言語や、アルゴリズムそのものは、対象外。覚えておけ[p]
#
【解説】プログラム言語、決まり事（規約）、解法（アルゴリズム）は、著作権法の保護の対象外。ソフトそのものと、マニュアルの文章は、著作物として守られる。[p]
@jump target="*Q1_end"

*Q1_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q2 要配慮個人情報／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q2】[r]
個人情報保護法で定められた、特に取扱いに配慮が必要となる「要配慮個人情報」に該当するものはどれか。
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="22"  x="640"  width="500"  y="240"  text="学歴"  target="*Q2_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="22"  x="640"  width="500"  y="340"  text="国籍"  target="*Q2_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="22"  x="640"  width="500"  y="440"  text="信条"  target="*Q2_ok"  ]
[s]

*Q2_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#営業
……利用目的を、明確に。……特に気をつける情報もある。それが、ルール[p]
#
【解説】要配慮個人情報は、差別や偏見につながるおそれがある、特に大事に扱う個人情報。信条（思想や信仰）は含まれる。取得には、原則として、本人の同意が必要。[p]
@jump target="*Q2_end"

*Q2_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#営業
……要配慮個人情報は、本人の同意が要る。信条などが、その例[p]
#
【解説】要配慮個人情報は、差別や偏見につながるおそれがある、特に大事に扱う個人情報。信条（思想や信仰）は含まれる。取得には、原則として、本人の同意が必要。[p]
@jump target="*Q2_end"

*Q2_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q3 ソフトウェアの利用形態／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q3】[r]
あるソフトウェアは、定額の料金や一定の期間での利用ができる形態で提供されている。この利用形態を表す用語として、適切なものはどれか。
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="22"  x="640"  width="500"  y="240"  text="アクティベーション"  target="*Q3_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="22"  x="640"  width="500"  y="340"  text="アドウェア"  target="*Q3_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="22"  x="640"  width="500"  y="440"  text="サブスクリプション"  target="*Q3_ok"  ]
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="22"  x="640"  width="500"  y="540"  text="ボリュームライセンス"  target="*Q3_ng"  ]
[s]

*Q3_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#営業
……ソフトにも、使い方の約束がある[p]
#
【解説】サブスクリプションは、買い切りではなく、期間や定額の料金で、使える形態。動画や音楽の配信サービスも、その例。[p]
@jump target="*Q3_end"

*Q3_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#営業
……期間や定額で使う形が、サブスクリプション。ライセンスの形は、いろいろ[p]
#
【解説】サブスクリプションは、買い切りではなく、期間や定額の料金で、使える形態。動画や音楽の配信サービスも、その例。[p]
@jump target="*Q3_end"

*Q3_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q4 秘密保持契約（NDA）／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q4】[r]
NDA（Non Disclosure Agreement）の事例はどれか。
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="22"  x="40"  width="1109"  y="151"  text="ITサービスを提供する前に、サービスの提供者と顧客の間で提供されるサービス内容について契約で定めた。"  target="*Q4_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="22"  x="40"  width="1109"  y="212"  text="コンピュータ設備の売主が財産権を移転する義務を負い、買主がその代金を支払う義務を負うことについて契約で定めた。"  target="*Q4_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="22"  x="40"  width="1109"  y="306"  text="システム開発などに際して、委託者と受託者間でお互いに知り得た相手の秘密情報の守秘義務について契約で定めた。"  target="*Q4_ok"  ]
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="22"  x="40"  width="1109"  y="400"  text="汎用パッケージ導入の委託を受けた者が自己の裁量と責任によって仕事を行い、仕事の完了をもって報酬を受けることについて契約で定めた。"  target="*Q4_ng"  ]
[s]

*Q4_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#営業
……信頼の、土台。破ると、大変なことになる[p]
#
【解説】NDAは、秘密保持契約。仕事で知った相手の秘密を、他に漏らさないと約束する契約。ア＝サービスの約束（SLA）、イ＝売買契約、エ＝請負契約。[p]
@jump target="*Q4_end"

*Q4_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#営業
……秘密を守る約束が、NDA[p]
#
【解説】NDAは、秘密保持契約。仕事で知った相手の秘密を、他に漏らさないと約束する契約。ア＝サービスの約束（SLA）、イ＝売買契約、エ＝請負契約。[p]
@jump target="*Q4_end"

*Q4_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q5 著作権の侵害／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q5】[r]
著作物の使用事例のうち、著作権を侵害するおそれのある行為はどれか。
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="22"  x="40"  width="1109"  y="151"  text="音楽番組を家庭でDVDに録画し、録画者本人とその家族の範囲内で使用した。"  target="*Q5_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="22"  x="40"  width="1109"  y="212"  text="海外のWebサイトに公表された他人の闘病日記を著作者に断りなく翻訳し、自分のWebサイトに公開した。"  target="*Q5_ok"  ]
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="22"  x="40"  width="1109"  y="273"  text="専門誌に掲載された研究論文から数行の文を引用し、その引用箇所と出所を明示して論文を作成した。"  target="*Q5_ng"  ]
[s]

*Q5_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#営業
……確認する癖は、ここでも、活きる[p]
#
【解説】他人の文章を、断りなく翻訳して公開するのは、著作者の権利（翻訳権）の侵害。家庭内での録画や、出所を示した引用は、認められている。[p]
@jump target="*Q5_end"

*Q5_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#営業
……無断で翻訳して公開するのは、著作権の侵害[p]
#
【解説】他人の文章を、断りなく翻訳して公開するのは、著作者の権利（翻訳権）の侵害。家庭内での録画や、出所を示した引用は、認められている。[p]
@jump target="*Q5_end"

*Q5_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：業務前半の終わり]

#営業
……前半は、ここまで[p]
……今日の講義は、まじめにやった[p]
#おまえ
いつもまじめです[p]
#営業
……そうか？[p]

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
完璧だぜ！ 法務も、バッチリだな！[p]

[elsif exp="f.correct_am >= 2"]
;◆2〜3問正解のとき
#先輩
いい調子だぜ！ 後半も、頑張れ！[p]

[else]
;◆1問以下のとき
#先輩
ドンマイだ！ 法律の話は、馴染みが薄いからな！ 後半に、取り返すぞ！[p]
[endif]

;[場面：同期との会話]

#同期
今夜の忘年会、楽しみだぜ！[p]
#おまえ
そうだね[p]
#同期
オデ、今回は、カラオケの機械を動かす係に、なったんだ[p]
#おまえ
えっ、機械が、苦手なのに[p]
#同期
克服のチャンスだと、思ってよ[p]
#おまえ
大丈夫かな[p]
#同期
大丈夫だ。マニュアル、3回読んだぜ。オデに任せろ！[p]
#おまえ
それは、頼もしい[p]

;=========================================
; 【業務後半】（問題5問）第5章の総復習
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]

;[場面：午後・会議室。リーダーが、講師]
[bg storage="bg_meeting_room.gif" time="500"]

#リーダー
後半は、今年の総復習だね[p]

;Q6 cron（復習）／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q6】[r]
決まった時刻に、決まった作業を、自動で実行する、仕組みは？
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="22"  x="640"  width="500"  y="240"  text="clock（クロック）"  target="*Q6_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="22"  x="640"  width="500"  y="340"  text="cron（クーロン）"  target="*Q6_ok"  ]
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="22"  x="640"  width="500"  y="440"  text="curl（カール）"  target="*Q6_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="22"  x="640"  width="500"  y="540"  text="cry（クライ）"  target="*Q6_ng"  ]
[s]

*Q6_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#リーダー
定期実行の、基本だね[p]
@jump target="*Q6_end"

*Q6_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
cron は、時間を決めて、自動実行する仕組みだよ[p]
@jump target="*Q6_end"

*Q6_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q7 バックアップの保管場所（復習）／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q7】[r]
バックアップデータは、どこに、保管するのが、望ましい？
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="22"  x="640"  width="500"  y="240"  text="元のデータと、離れた場所"  target="*Q7_ok"  ]
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="22"  x="640"  width="500"  y="340"  text="元のデータと、同じ場所"  target="*Q7_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="22"  x="640"  width="500"  y="440"  text="社長の机の、引き出し"  target="*Q7_ng"  ]
[s]

*Q7_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#リーダー
離れた場所だね。備えが、一番大事[p]
@jump target="*Q7_end"

*Q7_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
同じ場所だと、一緒に失うよ[p]
@jump target="*Q7_end"

*Q7_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q8 リストア（復習）／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q8】[r]
バックアップから、データを元に戻す、作業を、何という？
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="22"  x="640"  width="500"  y="240"  text="アップデート"  target="*Q8_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="22"  x="640"  width="500"  y="340"  text="バックアップ"  target="*Q8_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="22"  x="640"  width="500"  y="440"  text="リストア（復元）"  target="*Q8_ok"  ]
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="22"  x="640"  width="500"  y="540"  text="ダウンロード"  target="*Q8_ng"  ]
[s]

*Q8_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#リーダー
戻せて、はじめて、バックアップだね[p]
@jump target="*Q8_end"

*Q8_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
戻す作業は、リストアだよ[p]
@jump target="*Q8_end"

*Q8_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：パソコンの画面に、AIが、現れる]

#AI
こんにちは！ 忘年会の、お手伝いを、します！ 99%、確実です！[p]
忘年会を、盛り上げる、アイデアです！[p]
全社員の、給料明細を、スクリーンに、映して、みんなで、笑いましょう！[p]
#先輩
それは、面白い……いや、ダメだろ！ レッドカードだぜ！[p]
#同期
個人情報を、スクリーンに映すのかよ！？[p]
#リーダー
AI、それは、アウトだね[p]
;（廊下から）
#社長
……何だと[p]

;Q9 AI提案の見極め（忘年会の企画）／2択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
;選択肢1（f.ai_ok＋1）
;※不正解でも、社長が、却下する（社長が、味方になる場面）
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q9】[r]
AIの提案を、どう扱う？
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="22"  x="40"  width="1109"  y="151"  text="個人情報の扱いの、問題を、指摘して、採用しない"  target="*Q9_ok"  ]
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="22"  x="40"  width="1109"  y="212"  text="そのまま、採用する"  target="*Q9_ng"  ]
[s]

*Q9_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.ai_ok += 1"]
#
【正解！】[l][r]
#おまえ
給料明細は、個人情報です。本人の同意なく、他の人に、見せては、いけません[p]
;（小声）
#営業
……前半に、教えたとおり[p]
#社長
……ふっ。その通りだ。却下だぜ[p]
@jump target="*Q9_end"

*Q9_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#社長
いいか、よく聞け……個人情報だぜ。……却下だ[p]
#営業
……前半の講義は、何だったんだ[p]
@jump target="*Q9_end"

*Q9_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：AIが、謝る]

#AI
失礼しました。代わりに、おすすめのゲームを、ご提案します[p]
全社員で、ババ抜きを、しましょう！[p]
#先輩
それなら、いけるぜ！[p]
;（ツッコミ）
#おまえ
それは、AIが、考える、必要が、あるのか[p]

;Q10 自動化の確認（総復習）／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q10】[r]
自動化スクリプトを、本番環境で、実行する前に、すべきことは？
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="22"  x="640"  width="500"  y="240"  text="実行してから、結果を、見る"  target="*Q10_ng"  ]
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="22"  x="640"  width="500"  y="340"  text="テスト環境で、対象や、動作を、確認する"  target="*Q10_ok"  ]
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="22"  x="640"  width="500"  y="440"  text="いきなり、本番で、実行する"  target="*Q10_ng"  ]
[s]

*Q10_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#リーダー
自動化は、間違いも、自動で広がるんだ。確認が、命だよ[p]
@jump target="*Q10_end"

*Q10_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
確認を怠ると、取り返しのつかないことになるよ[p]
@jump target="*Q10_end"

*Q10_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：業務後半の終わり]

#リーダー
今日の勉強は、ここまでだね[p]
今年のお仕事、お疲れさま。今夜は、楽しもうね。おkだよ[p]
#先輩
よし、忘年会、全力で盛り上げるぜ！[p]

;=========================================
; 【終業後】（忘年会・信頼度イベント多め）
;=========================================
[playbgm storage="bgm_cheerful.mp3" restart="false"]

;[bg storage="（居酒屋の、座敷。忘年会の、会場）" time="500"]
[bg storage="bg_izakaya.gif" time="500"]

#ナレーション
今年最後の夜。全員で、居酒屋に、集まった。[p]

;[場面：乾杯]

#先輩
それでは！ 今年も、お疲れさまでしたっス！ 乾杯！[p]
#全員
乾杯！[p]
;（少し、笑っている）
#社長
……ふっ[p]
#おまえ
（社長が、笑ってる）[p]

;[選択肢：忘年会①（席を選ぶ）]
;選択肢1：先輩の信頼度＋1
;選択肢2：同期の信頼度＋1
;選択肢3：リーダーの信頼度＋1
;選択肢4：営業の信頼度＋1
#ナレーション
最初に、誰の隣に、座る？
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="26"  x="266"  width="640"  y="120"  text="先輩の隣"  target="*c2_1"  ]
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="26"  x="266"  width="640"  y="195"  text="同期の隣"  target="*c2_2"  ]
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="26"  x="266"  width="640"  y="270"  text="リーダーの隣"  target="*c2_3"  ]
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="26"  x="266"  width="640"  y="345"  text="営業の隣"  target="*c2_4"  ]
[s]

*c2_1
[cm]
[eval exp="f.t_senpai += 1"]
;◆1を選んだ場合
#先輩
新人！ 今年は、よく頑張ったぜ！[p]
俺の指導の、おかげだな！[p]
;（ツッコミ）
#おまえ
パッチの、当て忘れも、含めて、ですか[p]
#先輩
……それは、言うな！[p]

@jump target="*c2_end"

*c2_2
[cm]
[eval exp="f.t_douki += 1"]
;◆2を選んだ場合
#同期
カラオケの機械、設定できたぜ！[p]
#おまえ
えっ、すごい[p]
#同期
……でも、画面に、『ペンギン』って出てる[p]
;（ツッコミ）
#おまえ
それは、曲名じゃない[p]

@jump target="*c2_end"

*c2_3
[cm]
[eval exp="f.t_leader += 1"]
;◆3を選んだ場合
#リーダー
今年は、本当に、頑張ったね[p]
新人さんが、一番、成長したよ[p]
#おまえ
ありがとうございます[p]
#リーダー
来年も、頼りにしてるよ。……あ、この魚肉ソーセージ、食べる？[p]

@jump target="*c2_end"

*c2_4
[cm]
[eval exp="f.t_eigyo += 1"]
;◆4を選んだ場合
#営業
……そこの。報告メール。最近、評判がいい[p]
……客から、指名された[p]
#おまえ
えっ、本当ですか[p]
#営業
……調子に、乗るな[p]
#おまえ
はい[p]
;→ 余興へ
@jump target="*c2_end"

*c2_end

;[場面：宴会の、余興タイム]

#先輩
では、余興の時間だ！ まずは、社長から、一言っス！[p]
#社長
……何だと[p]
#先輩
全力で、お願いしますっス！[p]
#社長
…………[p]
……いいか、よく聞け。今年は、いろいろ、あった[p]
障害も、あった。失敗も、あった[p]
だが、全員、ここまで、来たぜ[p]
……来年も、頼む[p]
#全員
…………[p]
#同期
社長が、いいこと言ったぜ……[p]
#先輩
社長！ 締めに、もう一回、一回転してもいいっスよ！[p]
#社長
……するか[p]
#おまえ
（そう言いながら、きっちり一回転した。いつもの社長に、戻った）[p]

#社長
ふっ……では、余興だ。毎年恒例、『全財産ビンゴ』を、始めるぜ[p]
#リーダー
おやおや、社長。そんな恒例、ありましたっけ[p]
#社長
今、できた[p]
#同期
全財産って、何を賭けるんすか……？[p]
#社長
全部だ[p]

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
社長の『全財産ビンゴ』。どうする？
[glink  color="red"  name="key_btn"  storage="ch4_6/scene5_4.ks"  size="26"  x="266"  width="640"  y="120"  text="普通のビンゴなら、参加します"  target="*key_bingo_1"  ]
[glink  color="red"  name="key_btn"  storage="ch4_6/scene5_4.ks"  size="26"  x="266"  width="640"  y="195"  text="全財産を、賭ける"  target="*key_bingo_2"  ]
[kanim name="key_btn" keyframe="key_shake" time="150" count="infinite"]
[s]

*key_bingo_1
[cm]
[free_layermode name="key_red" time="300"]
#社長
……ふっ。堅実だな。景品は、魚肉ソーセージだぜ[p]
#リーダー
それは、俺が、もらうね[p]
@jump target="*key_bingo_end"

*key_bingo_2
[cm]
[free_layermode name="key_red" time="300"]
#おまえ
……乗ります。全財産、賭けます！[p]
;信頼度が「高い」（10以上）キャラがいれば、1回だけ止めに来る
@jump target="*key_bingo_stop" cond="Math.max(f.t_senpai, f.t_leader, f.t_eigyo, f.t_douki) >= 10"
#営業
……やめておけ[p]
#おまえ
もう、止まれません！[p]
@jump storage="ending/end10.ks"

*key_bingo_stop
;止めに来るのは、いま一番信頼度が高いキャラ
[if exp="f.t_senpai >= Math.max(f.t_leader, f.t_eigyo, f.t_douki)"]
#先輩
待て、新人！ 全財産は、オウンゴールだぜ！[p]
ビンゴは、楽しむもんだ！[p]
[elsif exp="f.t_leader >= Math.max(f.t_eigyo, f.t_douki)"]
#リーダー
おやおや……新人さん。賭けごとは、確認なしの、本番実行と同じだよ[p]
やめておこうね[p]
[elsif exp="f.t_eigyo >= f.t_douki"]
#営業
……そこの。手を、出せ[p]
……財布は、預かる[p]
[else]
#同期
お前の全財産がなくなったら、オデ、誰と、昼ごはん食べればいいんだよ！[p]
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
[glink  color="red"  storage="ch4_6/scene5_4.ks"  size="26"  x="266"  width="640"  y="120"  text="考え直す"  name="key_btn"  target="*key_bingo_back"  ]
[glink  color="red"  storage="ch4_6/scene5_4.ks"  size="26"  x="266"  width="640"  y="195"  text="それでも、進む"  name="key_btn"  target="*key_bingo_go"  ]
[kanim name="key_btn" keyframe="key_shake" time="150" count="infinite"]
[s]

*key_bingo_back
[cm]
[free_layermode name="key_red" time="300"]
#おまえ
（……止めてもらえて、よかった）[p]
@jump target="*key_bingo_1"

*key_bingo_go
[cm]
[free_layermode name="key_red" time="300"]
#営業
……やめておけ[p]
#おまえ
もう、止まれません！[p]
@jump storage="ending/end10.ks"

*key_bingo_end

;[選択肢：忘年会②（社長への、言葉）]
;選択肢1：社長との関係が、深まる（隠しフラグ＋1）
;選択肢2：社長との関係が、深まる（隠しフラグ＋1）
;選択肢3：先輩の信頼度＋1（先輩が、爆笑する）
;※社長は、信頼度の、対象キャラではない（隠しフラグのみ）。3は、先輩が、大受けする（変数を入れる段階で追加する）
#ナレーション
社長に、何と、声をかける？
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="26"  x="266"  width="640"  y="120"  text="「社長、今年も、ありがとうございました」"  target="*c3_1"  ]
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="26"  x="266"  width="640"  y="195"  text="「社長、さっきの挨拶、感動しました」"  target="*c3_2"  ]
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="26"  x="266"  width="640"  y="270"  text="「社長、もっと、踊ってください」と、冗談を言う"  target="*c3_3"  ]
[s]

*c3_1
[cm]
[eval exp="f.shacho += 1"]
;◆1を選んだ場合
#社長
……ふっ。礼は、いらない[p]
だが……受け取っておくぜ[p]

@jump target="*c3_end"

*c3_2
[cm]
[eval exp="f.shacho += 1"]
;◆2を選んだ場合
#社長
感動するな……恥ずかしいぜ[p]
#おまえ
（照れて、いる）[p]

@jump target="*c3_end"

*c3_3
[cm]
[eval exp="f.t_senpai += 1"]
;◆3を選んだ場合
#社長
いいか、よく聞け……[p]
#先輩
ハッハッハ！ 新人、最高だぜ！[p]
#社長
……今日は、特別に、サンバを見せてやるぜ[p]
@jump target="*c3_end"

*c3_end
;[選択肢：忘年会③（余興の、メイン）]
;選択肢1：先輩の信頼度＋1
;選択肢2：同期の信頼度＋1
;選択肢3：リーダーの信頼度＋1（リーダーが、赤面する）
;選択肢4：営業の信頼度＋1（営業が、微妙な顔をする）
#ナレーション
余興で、何を、やる？
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="26"  x="266"  width="640"  y="120"  text="先輩と、全力の、漫才を、やる"  target="*c4_1"  ]
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="26"  x="266"  width="640"  y="195"  text="同期と、機械が、苦手な人を、克服する、コントを、やる"  target="*c4_2"  ]
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="26"  x="266"  width="640"  y="309"  text="リーダーと、リーダーの口ぐせの、ものまねを、やる"  target="*c4_3"  ]
[glink  color="blue"  storage="ch4_6/scene5_4.ks"  size="26"  x="266"  width="640"  y="384"  text="営業と、お客様に、怒られる、場面の、再現を、やる"  target="*c4_4"  ]
[s]

*c4_1
[cm]
[eval exp="f.t_senpai += 1"]
;◆1を選んだ場合
#先輩
全力で、いくぜ！[p]
;（ツッコミ）
#おまえ
声が、大きいです[p]
#先輩
大きいほうが、ウケるんだぜ！[p]
#ナレーション
会場は、大爆笑。[p]

@jump target="*c4_end"

*c4_2
[cm]
[eval exp="f.t_douki += 1"]
;◆2を選んだ場合
#同期
機械が苦手でも、大丈夫！ オデに任せろ！[p]
#おまえ
そこで、プリンタに、挟まる[p]
#同期
挟まらねェよ！ ……ウオォォォッ！[p]
#ナレーション
会場は、大笑い。[p]

@jump target="*c4_end"

*c4_3
[cm]
[eval exp="f.t_leader += 1"]
;◆3を選んだ場合
#おまえ
おやおや、新人さん。sry。……大事な話の前に、保存しとく？[p]
#リーダー
……俺、そんな口調かな[p]
#同期
そっくりだぜ！[p]
#ナレーション
リーダーは、赤面している。[p]

@jump target="*c4_end"

*c4_4
[cm]
[eval exp="f.t_eigyo += 1"]
;◆4を選んだ場合
#おまえ
……そこの。……報告、遅い[p]
#営業
……そんな言い方は、しない[p]
#先輩
いや、してるっス！[p]
#営業
……うるさい[p]
#ナレーション
会場は、笑いに包まれる。[p]
;→ 宴会の終わりへ
@jump target="*c4_end"

*c4_end

;[場面：宴会の、終わり]

#先輩
それでは、締めの一本締めだぜ！[p]
;（パン！）
#全員
よーっ！[p]
#ナレーション
今年最後の夜が、静かに、更けていった。[p]

;=========================================
; 【自宅】（リザルト）
;=========================================
[playbgm storage="bgm_walk.mp3" restart="false"]

;[bg storage="（自宅の部屋（夜））" time="500"]
[bg storage="bg_home_night.gif" time="500"]

#ナレーション
布団に入って、今年を、振り返る。[p]

;[リザルト表示]
;・今日の正解数：○／10
;・スキル：＋○
;・AI見極め回数：＋○（Q9で見極めたら＋1）
;・信頼度の変化：（朝・忘年会①〜③で選んだキャラ）＋1〜3

;[ナレーション]
#おまえ
入社して、9か月。いろんなことが、あった[p]
失敗も、したし、乗り越えても、きた[p]
来年は、最後の章。……どうなるんだろう[p]
#ナレーション
第5章 おわり[p]

;=========================================
; 【第5章の章末：途中判定】
;=========================================
[fadeoutbgm time="1500"]
;※4つ目の途中判定。見極め回数・スキル（正解数）・信頼度の、合計点で判定する
;※基準の数値は、配点が決まってから決める（今は、仮）

;[判定の場面：12月28日・仕事納めの、夜]
[bg storage="bg_office_night.gif" time="500"]

#ナレーション
12月28日。仕事納めの夜。[p]
今夜は、年末の、データ整理作業を、自動化スクリプトで、行う予定だ。[p]

;▼分岐（合計点が、基準以上か、未満か）
[if exp="f.term_ok >= f.term_q * 0.6"]
;◆基準以上のとき（合格）
;[場面：作業前の確認]
#おまえ
スクリプトの、対象と、動作を、もう一度、確認しよう[p]
テスト環境で、問題なし。バックアップも、リストアできることを、確認済み[p]
#リーダー
準備は、万全だね[p]
#先輩
全力で、見守るっス！[p]
;[効果音：スクリプトが、実行される]
[playse storage="se_typewriter_key.mp3"]
#ナレーション
作業は、無事に、完了した。[p]
翌朝。社長室。[p]
#社長
ふっ……年末の作業は、無事に終わったそうだな[p]
#おまえ
はい。確認と、バックアップの、おかげです[p]
#社長
……備えが、役に立ったな[p]
いいか、よく聞け……来年は、いよいよ、勝負の年だ。覚悟しておけよ[p]
#おまえ
はい[p]
;→ 第6章 1日目へ

[else]
;◆基準未満のとき（バッドエンド：自動化の確認不足でデータ消失）
;[場面：作業前]
#おまえ
スクリプトは、AIが、作ったものを、そのまま使おう[p]
#おまえ
テストは、時間が、かかるし、大丈夫だろう[p]
#おまえ
バックアップも、取ってあるはずだし[p]
;※確認を、省略した。リストアのテストも、していない
;[効果音：スクリプトが、実行される]
[playse storage="se_typewriter_key.mp3"]
;[効果音：警告音]
[playse storage="se_alarm05.mp3"]
#おまえ
……え？ 対象の、データが、全部、消えてる[p]
#おまえ
バックアップから、戻そう[p]
#おまえ
……あれ？ リストアが、失敗する[p]
#おまえ
バックアップが、壊れてる？[p]
;[場面：翌朝・オフィス]
[bg storage="bg_office.gif" time="500"]
#ナレーション
午前8時。[p]
#社長
新人……お客様のデータが、消えたと、聞いたぜ[p]
#おまえ
申し訳ありません。自動化の確認が、不足していました[p]
#リーダー
…………[p]
#リーダー
備えが大事って、言ったよね？[p]
#おまえ
……はい[p]
#リーダー
バックアップを取るだけじゃなくて、戻せるか確認するのが、大事だって[p]
#おまえ
……はい。聞いていました。……でも、確認を、省きました[p]
#リーダー
…………[p]
#社長
……責任は、取ってもらうぜ[p]
#社長
今日で、終わりだ[p]
#先輩
新人……すまねェ。俺たちも、もっと教えるべきだった[p]
#営業
……客には、こっちが謝る。……お前の責任は、軽くはならないが[p]
;（涙目）
#同期
…………[p]
#おまえ
最後に、一つだけ[p]
#社長
なんだ[p]
#おまえ
年末に、全員で、忘年会をして、今年は、いい年だった、と思っていたのに[p]
#社長
……それとこれとは、別だぜ[p]
#おまえ
ですよね[p]
;※重く終わらないよう、主人公の、ツッコミと、社長の、一言で、締める
;→ バッドエンド4「自動化の確認不足でデータ消失」を、エンド一覧に記録して、タイトルへ
@jump storage="ending/end06.ks"
[endif]

;=========================================
;■ 次回予告（第6章 1日目）
;1月。年明け。小さな異変が起きる（予兆）。ツッコミが、疑う癖に、なっていることに、自分で気づく。
;出題：総合（これまでの復習）
;※第6章は、最終章。1年の総決算。大規模障害が、起きる
;■ 未決定
;・社長以外の名前
;・各問題の中身（仮。見直す前提）
;・章末の途中判定の基準（配点が決まってから）
;・忘年会の、信頼度イベントの、加算量（1日で、最大＋4。他の日と、バランスが、取れているか）
;・社長の「隠しフラグ」の、扱い（エンディングに、影響させるか）
;・バッドエンド4の、見送りの場面の、細かい調整
;・Q9「給料明細をスクリーンに」は、コメディとして、成立するか

;次のファイルへ
@jump storage="ch4_6/scene6_1.ks"
