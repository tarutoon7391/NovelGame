;第4章 4日目

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
;台本　第4章（9〜10月）　4日目（第4章の最終日）
;状態：叩き台（1日分すべて）／ITパスポート枠は過去問に差し替え済み（11/4）
;※名前は社長（郡晴希：こおり はるき）のみ決定。ほかは役割で表記
;※選択肢の数は問題ごとに変える（用語・知識は4択／場面の判断は3択／AI提案の見極めは2択）
;============================================================
;■ この日のねらい
;・翌日。営業が、文句を言いながら、少し認める
;・出題：第4章の総復習
;・章末に、3つ目の途中判定（バッドエンドあり）
;■ 1日の流れ
;朝 → 業務前半（5問）→ 昼休み → 業務後半（5問）→ 終業後 → 自宅（リザルト）→ 章末の途中判定
;------------------------------------------------------------
; 【朝】
;=========================================
[playbgm storage="bgm_walk.mp3" restart="false"]

;[bg storage="（オフィス（朝））" time="500"]
[bg storage="bg_office.gif" time="500"]

#ナレーション
第4章 4日目。夜勤の疲れは、ようやく、抜けてきた。[p]
#同期
おはよう！ 今日、ドアに挟まれなかったぜ！[p]
;（ツッコミ）
#おまえ
今日は、報告しなくても、いいから[p]
#同期
でも、お前が元気になって、よかったぜ[p]
#おまえ
ありがとう[p]

;[場面：営業が、書類を持って、近づく]

#営業
……そこの[p]
#おまえ
はい[p]
#営業
……客から、連絡[p]
#おまえ
えっ、何か、問題が[p]
#営業
……いや、逆[p]
……『夜間の不正アクセスへの対応が、早くて、丁寧だった』[p]
#おまえ
……！[p]
#営業
……ただし[p]
#おまえ
ただし？[p]
#営業
……客宛ての報告書。誤字が、3つ[p]
#おまえ
えっ[p]
#営業
……『ご迷惑をおかけしました』が、『ご迷惑をかけまくりました』になってた[p]
#おまえ
それは、AIの、変換です！ あ、いや、僕の確認ミスです！[p]
#営業
……AIのせいに、するな[p]
#おまえ
はい。すみません[p]
;※第3章3日目の「AIのせいにするな」の、再登場。主人公は、すぐ、自分の責任として、認める

;[場面：営業が、少し、間を置く]

#営業
……だが、客の評価は、高かった[p]
……こっちの営業成績にも、貢献した[p]
#おまえ
ありがとうございます[p]
#営業
……勘違いするな。褒めてない。事実[p]
#同期
営業さん、うれしそうだな[p]
#営業
……うれしくない[p]
;※営業の、不器用な、認め方

;[選択肢：1回目（信頼度）]
;選択肢1：営業の信頼度＋2
;選択肢2：営業の信頼度＋1
;選択肢3：営業の信頼度＋1（営業が、否定しながら、少し、照れる）
;※3択。どれを選んでも、営業の信頼度は、上がる。反応は、変わる（変数を入れる段階で追加する）
#ナレーション
営業に、どう返事をする？
[glink  color="blue"  storage="ch4_6/scene4_4.ks"  size="26"  x="266"  width="640"  y="120"  text="「誤字は、次から、必ず、読み返します」と、素直に、返す"  target="*c1_1"  ]
[glink  color="blue"  storage="ch4_6/scene4_4.ks"  size="26"  x="266"  width="640"  y="234"  text="「お客様に、評価してもらえて、嬉しいです」と、喜ぶ"  target="*c1_2"  ]
[glink  color="blue"  storage="ch4_6/scene4_4.ks"  size="26"  x="266"  width="640"  y="348"  text="「それ、褒めてますよね？」と、ツッコむ"  target="*c1_3"  ]
[s]

*c1_1
[cm]
[eval exp="f.t_eigyo += 2"]
;◆1を選んだ場合
#営業
……ああ。それでいい[p]
……次は、完璧な報告書を[p]
#おまえ
はい[p]

@jump target="*c1_end"

*c1_2
[cm]
[eval exp="f.t_eigyo += 1"]
;◆2を選んだ場合
#営業
……喜ぶのは、いい。……慢心するな[p]
#おまえ
はい[p]
#営業
……次も、同じように[p]

@jump target="*c1_end"

*c1_3
[cm]
[eval exp="f.t_eigyo += 1"]
;◆3を選んだ場合
#営業
……褒めてない[p]
#おまえ
でも、顔が、緩んで、ます[p]
#営業
……緩んでない[p]
#同期
緩んでるっすね[p]
;（照れて、去る。去り際、猫の写真の待ち受けが、ちらっと見えた）
#営業
……うるさい[p]
@jump target="*c1_end"

*c1_end
;=========================================
; 【業務前半】（問題5問）第4章の総復習①
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]
[eval exp="f.correct_am = 0"]

;[場面：会議室。先輩が、元気に、復習を出す]
[bg storage="bg_meeting_room.gif" time="500"]

#先輩
今月の総復習だぜ！ 守備は、固まったか！[p]
#おまえ
今月は、守備ばかり、でしたね[p]
#先輩
守備ができるやつは、攻めも強いんだぜ！[p]

;Q1 不正アクセス（復習）／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=353 page=fore visible=true]
[font size=24]
#
【Q1】[r]
パスワードに関連した不適切な行為a〜dのうち、不正アクセス禁止法で規制されている行為だけを全て挙げたものはどれか。[r]
a　業務を代行してもらうために、社内データベースアクセス用の自分のIDとパスワードを同僚に伝えた。[r]
b　自分のPCに、社内データベースアクセス用の自分のパスワードのメモを貼り付けた。[r]
c　電子メールに添付されていた文書をPCに取り込んだ。その文書の閲覧用パスワードを、その文書を見る権利のない人に教えた。[r]
d　人気のショッピングサイトに登録されている他人のIDとパスワードを、無断で第三者に伝えた。
[glink  color="blue"  storage="ch4_6/scene4_4.ks"  size="22"  x="40"  width="1109"  y="361"  text="a、b、c、d"  target="*Q1_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_4.ks"  size="22"  x="40"  width="1109"  y="422"  text="a、c、d"  target="*Q1_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_4.ks"  size="22"  x="40"  width="1109"  y="483"  text="a、d"  target="*Q1_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_4.ks"  size="22"  x="40"  width="1109"  y="544"  text="d"  target="*Q1_ok"  ]
[s]

*Q1_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#先輩
基本の、一番上の問題だぜ！[p]
#
【解説】不正アクセス禁止法が禁じるのは、他人のIDやパスワードを、無断で第三者に教えること。自分のIDを同僚に伝えたり、メモを貼ったりするのは、会社のルール違反にはなっても、この法律の対象ではない。[p]
@jump target="*Q1_end"

*Q1_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
他人のIDやパスワードを、無断で第三者に渡す行為は、法律で禁止されてるぜ！[p]
#
【解説】不正アクセス禁止法が禁じるのは、他人のIDやパスワードを、無断で第三者に教えること。自分のIDを同僚に伝えたり、メモを貼ったりするのは、会社のルール違反にはなっても、この法律の対象ではない。[p]
@jump target="*Q1_end"

*Q1_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q2 多要素認証（復習）／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q2】[r]
二要素認証の説明として、最も適切なものはどれか。
[glink  color="blue"  storage="ch4_6/scene4_4.ks"  size="22"  x="40"  width="1109"  y="151"  text="所有物、記憶及び生体情報の3種類のうちの2種類を使用して認証する方式"  target="*Q2_ok"  ]
[glink  color="blue"  storage="ch4_6/scene4_4.ks"  size="22"  x="40"  width="1109"  y="212"  text="人間の生体器官や筆跡などを使った認証で、認証情報の2か所以上の特徴点を使用して認証する方式"  target="*Q2_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_4.ks"  size="22"  x="40"  width="1109"  y="273"  text="文字、数字及び記号のうち2種類以上を組み合わせたパスワードを用いて利用者を認証する方式"  target="*Q2_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_4.ks"  size="22"  x="40"  width="1109"  y="334"  text="利用者を一度認証することで二つ以上のシステムやサービスなどを利用できるようにする方式"  target="*Q2_ng"  ]
[s]

*Q2_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#先輩
鍵が、二重だな！[p]
#
【解説】本人確認の材料は、「持っているもの」「知っているもの」「身体の特徴」の3種類。このうち、種類の違うものを2つ組み合わせるのが、二要素認証。[p]
@jump target="*Q2_end"

*Q2_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
種類の違うものを、2つ組み合わせるのが、二要素認証だぜ！[p]
#
【解説】本人確認の材料は、「持っているもの」「知っているもの」「身体の特徴」の3種類。このうち、種類の違うものを2つ組み合わせるのが、二要素認証。[p]
@jump target="*Q2_end"

*Q2_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q3 総当たり攻撃への対応／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
;※先輩の「二度と」には、7月への、軽いいじりが、含まれる
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q3】[r]
同じIDに対する、ログイン失敗が、短時間に大量に記録された。どう判断する？
[glink  color="blue"  storage="ch4_6/scene4_4.ks"  size="22"  x="40"  width="1109"  y="151"  text="ログを、全部消す"  target="*Q3_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_4.ks"  size="22"  x="40"  width="1109"  y="212"  text="総当たり攻撃の可能性を、疑って、確認・報告する"  target="*Q3_ok"  ]
[glink  color="blue"  storage="ch4_6/scene4_4.ks"  size="22"  x="40"  width="1109"  y="273"  text="放置する"  target="*Q3_ng"  ]
[s]

*Q3_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#先輩
その警戒心が、夜のゴールキーパーだぜ！[p]
@jump target="*Q3_end"

*Q3_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
ログを消すのは、二度とやめろよ！[p]
@jump target="*Q3_end"

*Q3_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q4 脆弱性／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q4】[r]
情報セキュリティにおける脅威と脆弱性のうち、脆弱性に該当するものはどれか。
[glink  color="blue"  storage="ch4_6/scene4_4.ks"  size="22"  x="640"  width="500"  y="240"  text="コンピュータウイルス"  target="*Q4_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_4.ks"  size="22"  x="640"  width="500"  y="340"  text="ソーシャルエンジニアリング"  target="*Q4_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_4.ks"  size="22"  x="640"  width="500"  y="440"  text="通信データの盗聴"  target="*Q4_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_4.ks"  size="22"  x="640"  width="500"  y="540"  text="不適切なパスワード管理"  target="*Q4_ok"  ]
[s]

*Q4_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#先輩
同期の授業の、成果だな！[p]
#
【解説】脅威は、外から攻めてくるもの（ウイルスや盗聴など）。脆弱性は、守る側にある弱点。不適切なパスワード管理は、攻撃につけ込まれる弱点なので、脆弱性。[p]
@jump target="*Q4_end"

*Q4_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
脅威は、攻めてくるもの。脆弱性は、守りの穴だぜ！[p]
#
【解説】脅威は、外から攻めてくるもの（ウイルスや盗聴など）。脆弱性は、守る側にある弱点。不適切なパスワード管理は、攻撃につけ込まれる弱点なので、脆弱性。[p]
@jump target="*Q4_end"

*Q4_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q5 パッチ（復習）／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=182 page=fore visible=true]
[font size=26]
#
【Q5】[r]
OS、ミドルウェア及びアプリケーションに適用するセキュリティパッチに関する記述のうち、適切なものはどれか。
[glink  color="blue"  storage="ch4_6/scene4_4.ks"  size="22"  x="40"  width="1109"  y="190"  text="ウイルス感染予防として適用すべきである。"  target="*Q5_ok"  ]
[glink  color="blue"  storage="ch4_6/scene4_4.ks"  size="22"  x="40"  width="1109"  y="251"  text="ウイルスに感染した場合に適用すべきである。"  target="*Q5_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_4.ks"  size="22"  x="40"  width="1109"  y="312"  text="現在の機能に満足している場合は、パッチが提供されても適用する必要はない。"  target="*Q5_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_4.ks"  size="22"  x="40"  width="1109"  y="373"  text="サポートが終了したソフトウェアは、それまでのパッチを全て適用していれば、安全に使い続けられる。"  target="*Q5_ng"  ]
[s]

*Q5_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#先輩
俺が、全力で当て忘れた、あれだぜ！[p]
;（ツッコミ）
#おまえ
自分で、いじるんですね[p]
#先輩
反省してるからな！[p]
#
【解説】パッチは、ソフトの弱点を直すためのもの。感染してから当てても遅いので、感染する前に当てて、弱点をふさぐ。サポートが終わると、新しい弱点が見つかっても、パッチは出なくなる。[p]
@jump target="*Q5_end"

*Q5_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
パッチだぜ！ 俺みたいに、当て忘れるなよ！[p]
;（ツッコミ）
#おまえ
自分で、いじるんですね[p]
#先輩
反省してるからな！[p]
#
【解説】パッチは、ソフトの弱点を直すためのもの。感染してから当てても遅いので、感染する前に当てて、弱点をふさぐ。サポートが終わると、新しい弱点が見つかっても、パッチは出なくなる。[p]
@jump target="*Q5_end"

*Q5_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：業務前半の終わり]

#先輩
前半終了だ！ ハーフタイムだぜ！[p]

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
完璧だぜ！ 夜勤の経験が、血肉になってるな！[p]

[elsif exp="f.correct_am >= 2"]
;◆2〜3問正解のとき
#先輩
いい調子だぜ！ 後半も、集中しろ！[p]

[else]
;◆1問以下のとき
#先輩
ドンマイだ！ 夜勤明けの影響が、残ってるのか！ 後半に、取り返すぞ！[p]
[endif]

;[場面：同期との会話]

#同期
なあ、オデ、決めたことがあるんだ[p]
#おまえ
何を[p]
#同期
機械を、克服する！[p]
#おまえ
えっ[p]
#同期
まずは、プリンタの紙詰まりの直し方を、覚えるぜ[p]
#おまえ
小さい目標から、いいね[p]
#同期
でも、先輩、教えてくれるかな[p]
#おまえ
先輩は、全力で、教えてくれると思うよ[p]
#同期
全力すぎて、プリンタが壊れそうだよな[p]
#おまえ
それは、ありうる[p]

;=========================================
; 【業務後半】（問題5問）第4章の総復習②
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]

;[場面：午後・会議室]
[bg storage="bg_meeting_room.gif" time="500"]

#リーダー
後半は、実践的な復習だね[p]

;Q6 ログの保全（復習）／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q6】[r]
不正アクセスの疑いがあるとき、ログを、消さずに残す、理由は？
[glink  color="blue"  storage="ch4_6/scene4_4.ks"  size="22"  x="640"  width="500"  y="240"  text="ディスクが、空くから"  target="*Q6_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_4.ks"  size="22"  x="640"  width="500"  y="340"  text="社長に、見せるため"  target="*Q6_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_4.ks"  size="22"  x="640"  width="500"  y="440"  text="原因や被害範囲を、調べる手がかりになる"  target="*Q6_ok"  ]
[s]

*Q6_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#リーダー
ログは、事件の証拠だね[p]
@jump target="*Q6_end"

*Q6_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
消すと、原因がわからなくなるよ[p]
@jump target="*Q6_end"

*Q6_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q7 ソーシャルエンジニアリング（復習）／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q7】[r]
ソーシャルエンジニアリングに該当する行為の例はどれか。
[glink  color="blue"  storage="ch4_6/scene4_4.ks"  size="22"  x="40"  width="1109"  y="151"  text="あらゆる文字の組合せを総当たりで機械的に入力することによって、パスワードを見つけ出す。"  target="*Q7_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_4.ks"  size="22"  x="40"  width="1109"  y="212"  text="肩越しに盗み見して入手したパスワードを利用し、他人になりすましてシステムを不正利用する。"  target="*Q7_ok"  ]
[glink  color="blue"  storage="ch4_6/scene4_4.ks"  size="22"  x="40"  width="1109"  y="273"  text="標的のサーバに大量のリクエストを送りつけて過負荷状態にすることによって、サービスの提供を妨げる。"  target="*Q7_ng"  ]
[s]

*Q7_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#リーダー
パスワードは、誰にも教えないんだよ[p]
#
【解説】ソーシャルエンジニアリングは、機械の弱点ではなく、人の不注意や油断につけ込んで、情報を盗む手口。肩越しの盗み見や、関係者のふりをした電話などがその例。[p]
@jump target="*Q7_end"

*Q7_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
人の不注意につけ込むのが、ソーシャルエンジニアリング。盗み見も、その一つだね[p]
#
【解説】ソーシャルエンジニアリングは、機械の弱点ではなく、人の不注意や油断につけ込んで、情報を盗む手口。肩越しの盗み見や、関係者のふりをした電話などがその例。[p]
@jump target="*Q7_end"

*Q7_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q8 DoS攻撃（復習）／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q8】[r]
DoS攻撃の説明として、適切なものはどれか。
[glink  color="blue"  storage="ch4_6/scene4_4.ks"  size="22"  x="40"  width="1109"  y="151"  text="他人になりすまして、ネットワーク上のサービスを不正に利用する。"  target="*Q8_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_4.ks"  size="22"  x="40"  width="1109"  y="212"  text="通信経路上で、他人のデータを盗み見る。"  target="*Q8_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_4.ks"  size="22"  x="40"  width="1109"  y="273"  text="大量のメールやWebリクエストなどを送りつけ、サービスを提供できなくする。"  target="*Q8_ok"  ]
[glink  color="blue"  storage="ch4_6/scene4_4.ks"  size="22"  x="40"  width="1109"  y="334"  text="文字の組合せを順に試して、パスワードを解読しようとする。"  target="*Q8_ng"  ]
[s]

*Q8_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#リーダー
過大な負荷で、止める攻撃だね[p]
#
【解説】DoS攻撃は、サーバに、普通ではありえない数のリクエストを送りつけて、過負荷にして止める攻撃。なりすまし、盗聴、総当たりとは、別の手口。[p]
@jump target="*Q8_end"

*Q8_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
DoSは、負荷でサービスを止める攻撃だよ[p]
#
【解説】DoS攻撃は、サーバに、普通ではありえない数のリクエストを送りつけて、過負荷にして止める攻撃。なりすまし、盗聴、総当たりとは、別の手口。[p]
@jump target="*Q8_end"

*Q8_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q9 エスカレーション（復習）／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q9】[r]
夜間、判断できない異常が、起きた。どうする？
[glink  color="blue"  storage="ch4_6/scene4_4.ks"  size="22"  x="40"  width="1109"  y="151"  text="手順書の連絡先に、すぐ連絡して、判断をあおぐ"  target="*Q9_ok"  ]
[glink  color="blue"  storage="ch4_6/scene4_4.ks"  size="22"  x="40"  width="1109"  y="212"  text="朝まで、待つ"  target="*Q9_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_4.ks"  size="22"  x="40"  width="1109"  y="273"  text="自分の、思いつきで、操作する"  target="*Q9_ng"  ]
[s]

*Q9_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#リーダー
夜でも、遠慮はいらないよ[p]
@jump target="*Q9_end"

*Q9_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
一人で抱えないのが、運用の基本だね[p]
@jump target="*Q9_end"

*Q9_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：パソコンの画面に、AIが、現れる]

#AI
こんにちは！ 100%、確実な、セキュリティ対策を、お教えします！[p]
全社員のパスワードを、『1234』に、統一してください！ 覚えやすくて、絶対に、安全です！[p]
#おまえ
…………[p]
#先輩
……ツッコミ、入れていいか？[p]
#おまえ
どうぞ[p]
#先輩
パスワード、全員同じ、1234だと！？ オウンゴールだぜ！[p]
#リーダー
おやおや。それは、最も危険な設定だね[p]
#同期
AI、もうちょっと学習しろよ……[p]

;Q10 AI提案の見極め（総復習・検証イベント）／2択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
;選択肢2（f.ai_ok＋1）
;※第1章1日目のQ7（パスワードの管理）の、復習。AIの正確さは、……0%
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q10】[r]
AIの提案を、どう扱う？
[glink  color="blue"  storage="ch4_6/scene4_4.ks"  size="22"  x="640"  width="500"  y="240"  text="そのまま、採用する"  target="*Q10_ng"  ]
[glink  color="blue"  storage="ch4_6/scene4_4.ks"  size="22"  x="640"  width="500"  y="340"  text="危険な提案だと、判断して、採用しない"  target="*Q10_ok"  ]
[s]

*Q10_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.ai_ok += 1"]
#
【正解！】[l][r]
#おまえ
パスワードは、複雑で、使い回さない。これは、入社した日の、基本だ[p]
#先輩
ナイス判断だぜ！ 4月の練習が、ここで活きたな！[p]
@jump target="*Q10_end"

*Q10_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
待て、新人！ それは、さすがにアウトだぜ！[p]
#リーダー
4月に戻ろうか。パスワードの基本からね[p]
@jump target="*Q10_end"

*Q10_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：AIが、しゅんとする]

#AI
……私の回答は、……0%、正確でした[p]
;（ツッコミ）
#おまえ
ついに、0%[p]
#AI
でも、私は、あなたを、信じています[p]
#おまえ
僕の信頼度の話は、してない[p]
#同期
AI、泣きそうだぜ[p]
#先輩
泣くな、AI！ 俺が慰める！[p]
#おまえ
先輩は、余計に、慰めないでください[p]

;[場面：業務後半の終わり]

#先輩
今月の練習は、これで終わりだ！ よくやったぜ、新人！[p]
#リーダー
今月は、本当に頑張ったね。おkだよ[p]
#おまえ
ありがとうございます[p]

;=========================================
; 【終業後】（誰と過ごすか）
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]

;[場面：夕方・オフィス]
[bg storage="bg_office_evening.gif" time="500"]

#ナレーション
第4章の、最後の夕方。[p]
夕焼けが、オフィスを、オレンジ色に、染めている。[p]

;[選択肢：終業後（信頼度）]
;選択肢1：先輩の信頼度＋1
;選択肢2：同期の信頼度＋1
;選択肢3：リーダーの信頼度＋1
;選択肢4：営業の信頼度＋1
#ナレーション
今日の夕方、誰と過ごす？
[glink  color="blue"  storage="ch4_6/scene4_4.ks"  size="26"  x="266"  width="640"  y="120"  text="先輩と、今月の振り返りをする"  target="*c2_1"  ]
[glink  color="blue"  storage="ch4_6/scene4_4.ks"  size="26"  x="266"  width="640"  y="195"  text="同期と、プリンタの、紙詰まりを、練習する"  target="*c2_2"  ]
[glink  color="blue"  storage="ch4_6/scene4_4.ks"  size="26"  x="266"  width="640"  y="270"  text="リーダーに、これからの、成長について、聞く"  target="*c2_3"  ]
[glink  color="blue"  storage="ch4_6/scene4_4.ks"  size="26"  x="266"  width="640"  y="345"  text="営業に、報告書の、書き方を、教わる"  target="*c2_4"  ]
[s]

*c2_1
[cm]
[eval exp="f.t_senpai += 1"]
;◆1を選んだ場合
#先輩
今月は、お前が、立派に成長したぜ！[p]
俺も、お前に負けないように、頑張る！[p]
;（ツッコミ）
#おまえ
先輩は、パッチの、当て忘れから、頑張ってください[p]
#先輩
……言うな！[p]

@jump target="*c2_end"

*c2_2
[cm]
[eval exp="f.t_douki += 1"]
;◆2を選んだ場合
#同期
紙詰まりを直すには、まず、電源を切って[p]
#おまえ
そのとおり[p]
#同期
次に、紙を、ゆっくり引き抜く[p]
#おまえ
慎重に、ゆっくりね[p]
#同期
あ、破れた。ウオォォォッ！[p]
#おまえ
それが、よくある、失敗だよ[p]

@jump target="*c2_end"

*c2_3
[cm]
[eval exp="f.t_leader += 1"]
;◆3を選んだ場合
#リーダー
次は、11月だね。会社の経営や、法務の勉強になるよ[p]
今までは、守りの勉強。次は、会社全体を見る勉強だね[p]
#おまえ
楽しみです[p]

@jump target="*c2_end"

*c2_4
[cm]
[eval exp="f.t_eigyo += 1"]
;◆4を選んだ場合
#営業
……報告書は、誰が読むかを、考えて書け[p]
……客が読むなら、専門用語を、減らせ[p]
……社長が読むなら、結論を、先に[p]
#おまえ
なるほど[p]
#営業
……今日の授業料は、高い[p]
#おまえ
えっ[p]
;（珍しく、笑う）
#営業
……冗談だ[p]
@jump target="*c2_end"

*c2_end
;=========================================
; 【自宅】（リザルト）
;=========================================
[playbgm storage="bgm_walk.mp3" restart="false"]

;[bg storage="（自宅の部屋（夜））" time="500"]
[bg storage="bg_home_night.gif" time="500"]

#ナレーション
布団に入って、この1か月を、振り返る。[p]

;[リザルト表示]
;・今日の正解数：○／10
;・スキル：＋○
;・AI見極め回数：＋○（Q10で見極めたら＋1）
;・信頼度の変化：（選んだキャラ）＋1（朝の返事の分も、加算）

;[ナレーション]
#おまえ
夜の当番も、乗り切った[p]
営業さんは、言葉は少ないけど、認めてくれる[p]
あと2か月で、年の終わり。もう少し、頑張ろう[p]
#ナレーション
第4章 おわり[p]

;=========================================
; 【第4章の章末：途中判定】
;=========================================
[fadeoutbgm time="1500"]
;※3つ目の途中判定。見極め回数・スキル（正解数）・信頼度の、合計点で判定する
;※基準の数値は、配点が決まってから決める（今は、仮）

;[判定の場面：10月の終わりの夜・当番室]
[bg storage="bg_dutyroom_night.gif" time="500"]

#ナレーション
10月の終わり。2回目の、夜間オンコールの、夜だ。[p]
先輩とリーダーは、今夜も、外出している。[p]

;▼分岐（合計点が、基準以上か、未満か）
[if exp="f.term_ok >= f.term_q * 0.6"]
;◆基準以上のとき（合格）
;[場面：午前3時。静かな夜]
#ナレーション
午前3時。静かな夜が、続いている。[p]
;[効果音：小さな、アラート音]
[playse storage="se_alarm01.mp3" buf="1" loop="true" volume="40"]
#おまえ
……ログイン失敗の、連続。短時間に、何十回も[p]
総当たり攻撃の、可能性がある[p]
ログは、消さずに、残して。疑わしい通信を、一時的に、止める[p]
リーダーに、報告[p]
[stopse buf="1"]
;[効果音：電話の、呼び出し音]
;※この効果音のファイルはまだないので、鳴らさない
#リーダー
……もしもし。新人さん？ どうしたんだい[p]
#おまえ
総当たり攻撃の、疑いです。対応は、済ませました[p]
#リーダー
……さすがだね。朝、詳しく聞くよ[p]
#ナレーション
その夜も、無事に、乗り切った。[p]
翌朝。社長室。[p]
#社長
ふっ……昨夜の対応は、聞いたぜ[p]
#おまえ
はい[p]
#社長
……もう、一人前だな[p]
#おまえ
えっ[p]
#社長
ただし、慢心するなよ。次は、年末だ[p]
#おまえ
はい[p]
;→ 第5章 1日目へ

[else]
;◆基準未満のとき（バッドエンド：夜間の不正アクセスを見逃した）
;[場面：午前3時。静かな夜]
#ナレーション
午前3時。静かな夜が、続いている。[p]
;[効果音：小さな、アラート音]
[playse storage="se_alarm01.mp3" buf="1" loop="true" volume="40"]
#おまえ
……ん？ アラートが、鳴ってる[p]
#おまえ
でも、前にも、誤報が、あった[p]
#おまえ
様子を、見よう[p]
;※本来なら、確認すべき場面。知識や判断が、足りない結果として、見逃してしまう
#ナレーション
アラートは、その後も、鳴り続けた。[p]
#ナレーション
主人公は、うとうとして、気づかなかった。[p]
[stopse buf="1"]
;[場面：翌朝・オフィス]
[bg storage="bg_office.gif" time="500"]
#ナレーション
午前8時。[p]
#社長
新人……夜間に、何があった[p]
#おまえ
えっ、何も、なかったと……[p]
#社長
お客様のサーバから、データが流出してるぜ……！[p]
#おまえ
そんな……[p]
#リーダー
ログを、見たよ。午前3時にアラートが鳴っていたのに、対応していないね[p]
#先輩
新人……どうして、報告しなかった！[p]
#おまえ
……誤報だと、思いました[p]
#営業
……誤報かどうかを、確認するのが、仕事だ[p]
#社長
いいか、よく聞け……お前に、夜間は、任せられない[p]
#社長
……今日で、終わりだ[p]
#同期
…………[p]
#おまえ
……最後に、一つだけ、いいですか[p]
#社長
なんだ[p]
#おまえ
うとうとしていた、僕が、悪いんですが、なぜ、夜勤の人が、一人だけだったんですか[p]
#社長
……それは、俺が決めた[p]
#おまえ
それ、会社の問題では[p]
#社長
……[p]
#先輩
社長、一本取られたっスね！[p]
#社長
いいか、よく聞け……[p]
#先輩
……はいっス[p]
;※重く終わらないように、主人公のツッコミと、社長の反応で、締める
;→ バッドエンド3「夜間の不正アクセスを見逃した」を、エンド一覧に記録して、タイトルへ
@jump storage="ending/end06.ks"
[endif]

;=========================================
;■ 次回予告（第5章 1日目）
;11月。落ち着いた日。社長が、経営の話をする（ブチ切れながら）。会社全体を見る余裕が、出る。
;出題：ITパスポート（ストラテジ：経営、会社の仕組み）
;■ 未決定
;・社長以外の名前
;・各問題の中身（仮。見直す前提）
;・章末の途中判定の基準（配点が決まってから）
;・バッドエンド3の、見極めの描写（うとうと、は、重くなりすぎないか）
;・AIの「正確さ」の数字ネタ（100%→0%）の、最終的な着地点

;次のファイルへ
@jump storage="ch4_6/scene5_1.ks"
