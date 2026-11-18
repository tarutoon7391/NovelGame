;第2章 3日目

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
;台本　第2章（5〜6月）　3日目
;状態：叩き台（1日分すべて）／ITパスポート枠は過去問に差し替え済み（11/4）
;※名前は社長（郡晴希：こおり はるき）のみ決定。ほかは役割で表記
;※選択肢の数は問題ごとに変える（用語・知識は4択／場面の判断は3択／AI提案の見極めは2択）
;============================================================
;■ この日のねらい
;・AIの回答が、少し外れる（検証イベント・軽め）。気づけるかの練習
;・AIは「自信満々に間違える相棒」。第3章の大きな失敗への、軽い予行演習
;・出題：ITパスポート（セキュリティ：マルウェア、ウイルス対策）
;■ 1日の流れ
;朝 → 業務前半（5問）→ 昼休み → 業務後半（5問）→ 終業後 → 自宅（リザルト）
;■ AI検証イベント（軽め）の扱い
;・この日のAI提案は、間違いが小さく、被害も出ない
;・見極められたら「見極め回数」が増える（f.ai_ok＋1）。見逃しても、ペナルティは軽い
;・先輩が、笑いに変えてフォローする（落ち込ませない）
;------------------------------------------------------------
; 【朝】
;=========================================
[playbgm storage="bgm_walk.mp3" restart="false"]

;[bg storage="（オフィス（朝））" time="500"]
[bg storage="bg_office.gif" time="500"]

#ナレーション
第2章 3日目。昨日の疲れが、少し残っている。[p]
#同期
昨日は、ありがとな！ リーダー、すごすぎて感動したぜ[p]
#おまえ
僕たちも、いつかああなれるかな[p]
#同期
なれるさ。電源コードを、踏まなければな！[p]
;（ツッコミ）
#おまえ
そこが、一番の課題だね[p]

;[場面：先輩が、パソコンの画面を指さす]

#先輩
見てくれ、新人！ うちのチームに、新しい相棒が加入したぜ！[p]
#おまえ
相棒、ですか[p]
#先輩
そうだ。ハイパーAIだ！ 文章を作ったり、調べものをしてくれる！[p]
#おまえ
そういえば、1日目に、少し紹介されました[p]
#先輩
今日から、本格的に使ってみろ！ ただし、鵜呑みにするなよ！ 道具は、使う人の腕次第だぜ！[p]
;※先輩の「鵜呑みにするな」は、あとの伏線。ただし、今日は、軽く触れる程度

;[場面：AIが、画面に初登場]

#AI
こんにちは！ 私は、AIです！ 何でも、お任せください！ 私の回答は、100%、正確です！[p]
;（ツッコミ）
#おまえ
100%って、自分で言ってる[p]
#同期
頼もしいけど、ちょっと怪しいぜ[p]
#先輩
そこが、いいところだぜ！[p]
#おまえ
いいところ、なんですか[p]

;[選択肢：1回目（信頼度）]
;選択肢1：先輩の信頼度＋1
;選択肢2：同期の信頼度＋1
;※どちらを選んでも、次の場面につながる
#ナレーション
今日は、まず、誰と話す？
[glink  color="blue"  storage="ch1_3/scene2_3.ks"  size="26"  x="266"  width="640"  y="120"  text="先輩に、AIの使い方のコツを聞く"  target="*c1_1"  ]
[glink  color="blue"  storage="ch1_3/scene2_3.ks"  size="26"  x="266"  width="640"  y="195"  text="同期と、AIの怪しさについて話す"  target="*c1_2"  ]
[s]

*c1_1
[cm]
[eval exp="f.t_senpai += 1"]
;◆1を選んだ場合
#先輩
コツは、パスと同じだ！ 何をしてほしいか、はっきり伝えるんだぜ！[p]
#おまえ
（意外と、まともなアドバイスだ）[p]
@jump target="*c1_end"

*c1_2
[cm]
[eval exp="f.t_douki += 1"]
;◆2を選んだ場合
#同期
なあ、100%って言うやつ、だいたい怪しくねェか？[p]
#おまえ
（いつも「任せろ」って言う人が、それを言うんだ）[p]
;→ 次の場面へ
@jump target="*c1_end"

*c1_end

;=========================================
; 【業務前半】（問題5問）マルウェアと情報セキュリティの基本
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]
[eval exp="f.correct_am = 0"]

;[場面：会議室]
[bg storage="bg_meeting_room.gif" time="500"]

#先輩
今日の勉強は、セキュリティだぜ！ 守りを固めるぞ！[p]
悪意のあるプログラムのことを、マルウェアという！ 相手チームの、反則プレーみたいなもんだ！[p]

;Q1 マルウェア感染の初動／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=260 page=fore visible=true]
[font size=26]
#
【Q1】[r]
社内に設置された無線LANネットワークに接続している業務用のPCで、インターネット上のあるWebサイトを閲覧した直後、Webブラウザが突然終了したり、見知らぬファイルが作成されたりするなど、マルウェアに感染した可能性が考えられる事象が発生した。このPCの利用者が最初に取るべき行動として適切なものはどれか。
[glink  color="blue"  storage="ch1_3/scene2_3.ks"  size="22"  x="40"  width="1109"  y="268"  text="Webブラウザを再インストールする。"  target="*Q1_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_3.ks"  size="22"  x="40"  width="1109"  y="329"  text="マルウェア対策ソフトのマルウェア定義ファイルを最新にする。"  target="*Q1_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_3.ks"  size="22"  x="40"  width="1109"  y="390"  text="無線LANとの通信を切断し、PCをネットワークから隔離する。"  target="*Q1_ok"  ]
[glink  color="blue"  storage="ch1_3/scene2_3.ks"  size="22"  x="40"  width="1109"  y="451"  text="無線通信の暗号化方式を変更する。"  target="*Q1_ng"  ]
[s]

*Q1_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#先輩
ナイス判断だぜ！ まず切り離すのが、守備の基本だ！[p]
#
【解説】感染が疑われたら、まずネットワークから切り離して、被害を広げない。定義ファイルの更新や再インストールは、そのあと。[p]
@jump target="*Q1_end"

*Q1_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
感染したかも、と思ったら、まず切り離せ！ 被害を広げるなよ！[p]
#
【解説】感染が疑われたら、まずネットワークから切り離して、被害を広げない。定義ファイルの更新や再インストールは、そのあと。[p]
@jump target="*Q1_end"

*Q1_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q2 ランサムウェア／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q2】[r]
ランサムウェアの説明として、適切なものはどれか。
[glink  color="blue"  storage="ch1_3/scene2_3.ks"  size="22"  x="40"  width="1109"  y="151"  text="ウイルスなどを検知して、コンピュータを脅威から守り、安全性を高めるソフトウェアの総称"  target="*Q2_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_3.ks"  size="22"  x="40"  width="1109"  y="212"  text="感染すると勝手にファイルやデータの暗号化などを行って、正常にデータにアクセスできないようにし、元に戻すための代金を利用者に要求するソフトウェア"  target="*Q2_ok"  ]
[glink  color="blue"  storage="ch1_3/scene2_3.ks"  size="22"  x="40"  width="1109"  y="306"  text="キーボード入力や画面出力といった入出力機能や、ディスクやメモリの管理などコンピュータシステム全体を管理するソフトウェア"  target="*Q2_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_3.ks"  size="22"  x="40"  width="1109"  y="400"  text="ローマ字から平仮名や片仮名へ変換したり、仮名から漢字へ変換するなどコンピュータでの利用者の文字入力を補助するソフトウェア"  target="*Q2_ng"  ]
[s]

*Q2_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#先輩
身代金の、ランサムだ！ 名前の通りだぜ！[p]
#
【解説】ランサムは「身代金」の意味。データを勝手に暗号化して、元に戻す代わりにお金を要求するソフトが、ランサムウェア。[p]
@jump target="*Q2_end"

*Q2_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
ランサム＝身代金だ！ 覚えやすいだろう！[p]
#
【解説】ランサムは「身代金」の意味。データを勝手に暗号化して、元に戻す代わりにお金を要求するソフトが、ランサムウェア。[p]
@jump target="*Q2_end"

*Q2_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q3 フィッシング／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q3】[r]
フィッシングの説明として、最も適切なものはどれか。
[glink  color="blue"  storage="ch1_3/scene2_3.ks"  size="22"  x="40"  width="1109"  y="151"  text="ウイルスに感染したコンピュータを、そのウイルスの機能を利用することによってインターネットなどのネットワークを介して外部から不正に操作する。"  target="*Q3_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_3.ks"  size="22"  x="40"  width="1109"  y="245"  text="偽の電子メールを送信するなどして、受信者を架空のWebサイトや実在しているWebサイトの偽サイトに誘導し、情報を不正に取得する。"  target="*Q3_ok"  ]
[glink  color="blue"  storage="ch1_3/scene2_3.ks"  size="22"  x="40"  width="1109"  y="339"  text="利用者に気づかれないようにPCにプログラムを常駐させ、ファイルのデータやPC操作の情報を不正に取得する。"  target="*Q3_ng"  ]
[s]

*Q3_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#先輩
その警戒心が、会社を守るんだぜ！[p]
#
【解説】フィッシングは、偽のメールなどで、本物そっくりの偽サイトに誘い込み、IDやパスワードなどを盗む手口。[p]
@jump target="*Q3_end"

*Q3_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
フィッシングは、偽のメールで、偽サイトに誘い込む手口だ！ リンクは開くなよ！[p]
#
【解説】フィッシングは、偽のメールなどで、本物そっくりの偽サイトに誘い込み、IDやパスワードなどを盗む手口。[p]
@jump target="*Q3_end"

*Q3_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面転換：同期が、スマートフォンを見せる]

#同期
なあ、これ、本物かな。『当選しました』ってメールが来たんだけどよ[p]
#おまえ
それ、絶対に、怪しい[p]
#同期
でも、当たったって書いてあるぜ？[p]
#おまえ
当たった覚えが、ないなら、詐欺だよ[p]
#同期
そっか……危なかったぜ[p]
#先輩
いい判断だぜ！ 同期も、成長してるな！[p]
;※第1章Q9（不審なメール）の復習を、会話で自然に入れる

;Q4 スパイウェア／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q4】[r]
スパイウェアの説明はどれか。
[glink  color="blue"  storage="ch1_3/scene2_3.ks"  size="22"  x="40"  width="1109"  y="151"  text="Webサイトの閲覧や画像のクリックだけで料金を請求する詐欺のこと"  target="*Q4_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_3.ks"  size="22"  x="40"  width="1109"  y="212"  text="攻撃者がPCへの侵入後に利用するために、ログの消去やバックドアなどの攻撃ツールをパッケージ化して隠しておく仕組みのこと"  target="*Q4_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_3.ks"  size="22"  x="40"  width="1109"  y="306"  text="多数のPCに感染して、ネットワークを通じた指示に従ってPCを不正に操作することで一斉攻撃などの動作を行うプログラムのこと"  target="*Q4_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_3.ks"  size="22"  x="40"  width="1109"  y="400"  text="利用者が認識することなくインストールされ、利用者の個人情報やアクセス履歴などの情報を収集するプログラムのこと"  target="*Q4_ok"  ]
[s]

*Q4_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#先輩
スパイは、こっそり情報を盗む！ 名前のとおりだぜ！[p]
#
【解説】スパイウェアは、利用者に気づかれないようにインストールされ、個人情報やアクセス履歴をこっそり集めるプログラム。[p]
@jump target="*Q4_end"

*Q4_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
スパイ＝こっそり盗む、だぜ！[p]
#
【解説】スパイウェアは、利用者に気づかれないようにインストールされ、個人情報やアクセス履歴をこっそり集めるプログラム。[p]
@jump target="*Q4_end"

*Q4_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q5 ウイルス対策ソフト／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=299 page=fore visible=true]
[font size=26]
#
【Q5】[r]
ウイルス対策ソフトに関する記述a〜cのうち、適切なものだけを全て挙げたものはどれか。[r]
a　USBメモリから感染するタイプのウイルスを検知できるものがある。[r]
b　定期的にウイルス対策ソフトとウイルス定義ファイルの更新を行っていても、ウイルスを検知できないことがある。[r]
c　ボットウイルスを検知できるものがある。
[glink  color="blue"  storage="ch1_3/scene2_3.ks"  size="22"  x="40"  width="1109"  y="307"  text="a、b"  target="*Q5_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_3.ks"  size="22"  x="40"  width="1109"  y="368"  text="a、b、c"  target="*Q5_ok"  ]
[glink  color="blue"  storage="ch1_3/scene2_3.ks"  size="22"  x="40"  width="1109"  y="429"  text="b"  target="*Q5_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_3.ks"  size="22"  x="40"  width="1109"  y="490"  text="b、c"  target="*Q5_ng"  ]
[s]

*Q5_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#先輩
対策ソフトは頼れるが、万能じゃない！ 更新と、ほかの対策を組み合わせる。それがフォーメーションだぜ！[p]
#
【解説】対策ソフトには、USBメモリ経由のウイルスやボットを見つけられるものがある。ただし、定義ファイルを更新していても、見つけられないウイルスはある。だから、更新を続けながら、ほかの対策も組み合わせる。[p]
@jump target="*Q5_end"

*Q5_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
3つとも、正しい記述だぜ！ 対策ソフトは役に立つが、万能じゃない！[p]
#
【解説】対策ソフトには、USBメモリ経由のウイルスやボットを見つけられるものがある。ただし、定義ファイルを更新していても、見つけられないウイルスはある。だから、更新を続けながら、ほかの対策も組み合わせる。[p]
@jump target="*Q5_end"

*Q5_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：業務前半の終わり]

#先輩
前半は、ここまで！ ハーフタイムだ！ 後半は、AIと一緒にウイルス対策の勉強をするぜ！[p]
#おまえ
AIと、ですか[p]
#先輩
そうだ！ ただし、AIが言うことを、そのまま信じるな！ 後半のテーマだぜ！[p]

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
完璧だぜ！ これなら、後半も安心だな！[p]

[elsif exp="f.correct_am >= 2"]
;◆2〜3問正解のとき
#先輩
いい調子だぜ！ 後半も、頑張るぞ！[p]

[else]
;◆1問以下のとき
#先輩
ドンマイだぜ！ マルウェアは、種類が多い！ 後半に、整理し直すぞ！[p]
[endif]

;[場面：営業が、通りがかる]

#営業
……そこの。AI、使い始めたらしいな[p]
#おまえ
はい。今日から[p]
#営業
……AIは、便利。……前に、一度、痛い目にあった[p]
#おまえ
痛い目、ですか[p]
#営業
……客宛ての文書。AIが、存在しない製品名を書いた。……送る前に、気づいた[p]
#おまえ
危なかったですね[p]
#営業
……だから、自分の目で、確認しろ。……それが、プロ[p]
#おまえ
（営業さんの話は、説得力がある）[p]
;※営業の体験談。AIに対する警戒心を、ここで補強する

;=========================================
; 【業務後半】（問題5問）AI検証イベント（軽め）とセキュリティ
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]

;[場面：午後・パソコンの前]
[bg storage="bg_team_desk.gif" time="500"]

#先輩
さて、後半は、AIに質問してみるぜ！[p]
質問は、『ウイルス対策は、何をすればいい？』だ[p]
#おまえ
はい[p]

;[場面：AIの回答]

#AI
お答えします！ ウイルス対策は、とても簡単です！[p]
ウイルス対策ソフトを入れれば、OSの更新は、一切、不要です！ 100%、安全です！[p]
;（ツッコミ）
#おまえ
100%って、また言ってる[p]
#同期
なあ、OSの更新って、しなくていいのか？[p]
#先輩
さあ、どうする？ シュートを打つかどうかは、お前たちの判断だぜ！[p]

;Q6 AI提案の見極め（検証イベント）／2択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
;選択肢2（f.ai_ok＋1）
;※不正解でも、物語は進む。被害は出ない（軽い検証イベント）
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q6】[r]
AIの回答を、どう扱う？
[glink  color="blue"  storage="ch1_3/scene2_3.ks"  size="22"  x="640"  width="500"  y="240"  text="そのまま採用する"  target="*Q6_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_3.ks"  size="22"  x="640"  width="500"  y="340"  text="本当に正しいか、確認してから使う"  target="*Q6_ok"  ]
[s]

*Q6_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.ai_ok += 1"]
#
【正解！】[l][r]
#先輩
いいぞ！ 疑う力が、育ってきたぜ！ 見極め成功だ！[p]
@jump target="*Q6_end"

*Q6_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
ちょっと怪しかったな。でも大丈夫だ。今日は、練習試合だぜ！[p]
@jump target="*Q6_end"

*Q6_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：確認する。先輩が、正しい情報を示す]

#先輩
結論から言うと、AIは間違っていたぜ！[p]
OSの更新は、必要だ！ なぜだと思う？[p]
#同期
えっと……弱点が、見つかるから……か？[p]
#先輩
ほう！ いい線いってるぜ！[p]

;Q7 パッチ／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
;※Q6の補足問題。AIの間違いを、知識で確かめる流れ
更新プログラムは、正式には、何というか知ってるか？[p]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q7】[r]
ソフトウェアの不具合を修正するために提供されるファイルのことを何というか。
[glink  color="blue"  storage="ch1_3/scene2_3.ks"  size="22"  x="640"  width="500"  y="240"  text="パターンファイル"  target="*Q7_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_3.ks"  size="22"  x="640"  width="500"  y="340"  text="バックアップファイル"  target="*Q7_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_3.ks"  size="22"  x="640"  width="500"  y="440"  text="バッチファイル"  target="*Q7_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_3.ks"  size="22"  x="640"  width="500"  y="540"  text="パッチファイル"  target="*Q7_ok"  ]
[s]

*Q7_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#先輩
そのとおり！ 弱点を直すパッチを当てるから、更新は必要なんだぜ！ ウイルス対策ソフトだけでは、守れない！[p]
#
【解説】ソフトの不具合や弱点を直すために配られるファイルが、パッチ。OSを更新すると、パッチが当たり、弱点がふさがる。[p]
@jump target="*Q7_end"

*Q7_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
バッチじゃない、パッチだぜ！ 弱点を直す、つぎはぎのことだ！ これは大事だぞ！[p]
#
【解説】ソフトの不具合や弱点を直すために配られるファイルが、パッチ。OSを更新すると、パッチが当たり、弱点がふさがる。[p]
@jump target="*Q7_end"

*Q7_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：AIが、フォローする]

#AI
ご指摘ありがとうございます！ 私の回答は、99%、正確でした！[p]
;（ツッコミ）
#おまえ
1%、減った[p]
#先輩
100%じゃなかったな！[p]
#同期
AIも、反省してる……のか？[p]

;Q8 ファイアウォール／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q8】[r]
ネットワークにおいて、外部からの不正アクセスを防ぐために内部ネットワークと外部ネットワークの間に置かれるものはどれか。
[glink  color="blue"  storage="ch1_3/scene2_3.ks"  size="22"  x="640"  width="500"  y="240"  text="DNSサーバ"  target="*Q8_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_3.ks"  size="22"  x="640"  width="500"  y="340"  text="サーチエンジン"  target="*Q8_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_3.ks"  size="22"  x="640"  width="500"  y="440"  text="スイッチングハブ"  target="*Q8_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_3.ks"  size="22"  x="640"  width="500"  y="540"  text="ファイアウォール"  target="*Q8_ok"  ]
[s]

*Q8_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#先輩
入口のゴールキーパーだな！[p]
#
【解説】ファイアウォールは、内側のネットワークと外側のネットワークの間で、通信を見張り、不正なものを止める壁。[p]
@jump target="*Q8_end"

*Q8_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
火の壁（ファイアウォール）で、ゴールを守るんだぜ！[p]
#
【解説】ファイアウォールは、内側のネットワークと外側のネットワークの間で、通信を見張り、不正なものを止める壁。[p]
@jump target="*Q8_end"

*Q8_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q9 名簿の漏えい対策／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=377 page=fore visible=true]
[font size=26]
#
【Q9】[r]
限られた人にしか閲覧を許可していない紙の名簿を電子化して、名簿ファイルとして管理することにした。次のa〜dのうち、個人情報の漏えい対策として、適切なものだけを全て挙げたものはどれか。[r]
a　名簿ファイルに読込みパスワードを設定する。[r]
b　名簿ファイルを暗号化して保存する。[r]
c　名簿ファイルを保存するサーバを二重化構成にする。[r]
d　名簿を電子化した後、紙の名簿をシュレッダーで廃棄する。
[glink  color="blue"  storage="ch1_3/scene2_3.ks"  size="22"  x="40"  width="1109"  y="385"  text="a、b"  target="*Q9_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_3.ks"  size="22"  x="40"  width="1109"  y="446"  text="a、b、d"  target="*Q9_ok"  ]
[glink  color="blue"  storage="ch1_3/scene2_3.ks"  size="22"  x="40"  width="1109"  y="507"  text="c、d"  target="*Q9_ng"  ]
[s]

*Q9_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#先輩
ファイルも紙も、両方守る！ その判断が、会社を守るんだぜ！[p]
#
【解説】読込みパスワードと暗号化は、ファイルが持ち出されても読まれにくくする。紙の名簿は、シュレッダーで細かく切ってから捨てる。サーバの二重化は、壊れたときの備えで、漏えい対策ではない。[p]
@jump target="*Q9_end"

*Q9_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#営業
……的外れ。……漏えいの入口は、ファイルにも、紙にもある[p]
#
【解説】読込みパスワードと暗号化は、ファイルが持ち出されても読まれにくくする。紙の名簿は、シュレッダーで細かく切ってから捨てる。サーバの二重化は、壊れたときの備えで、漏えい対策ではない。[p]
@jump target="*Q9_end"

*Q9_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q10 復習（DNS）／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q10】[r]
DNSの説明として、適切なものはどれか。
[glink  color="blue"  storage="ch1_3/scene2_3.ks"  size="22"  x="40"  width="1109"  y="151"  text="インターネット上で様々な情報検索を行うためのシステムである。"  target="*Q10_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_3.ks"  size="22"  x="40"  width="1109"  y="212"  text="インターネットに接続された機器のホスト名とIPアドレスを対応させるシステムである。"  target="*Q10_ok"  ]
[glink  color="blue"  storage="ch1_3/scene2_3.ks"  size="22"  x="40"  width="1109"  y="273"  text="オンラインショッピングを安全に行うための個人認証システムである。"  target="*Q10_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_3.ks"  size="22"  x="40"  width="1109"  y="334"  text="メール配信のために個人のメールアドレスを管理するシステムである。"  target="*Q10_ng"  ]
[s]

*Q10_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#先輩
今月の最初の問題も、バッチリだな！[p]
#
【解説】DNSは、ホスト名（ドメイン名）とIPアドレスを結びつける仕組み。電話帳のような役割。[p]
@jump target="*Q10_end"

*Q10_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
名前から住所を引くのが、DNSだぜ！[p]
#
【解説】DNSは、ホスト名（ドメイン名）とIPアドレスを結びつける仕組み。電話帳のような役割。[p]
@jump target="*Q10_end"

*Q10_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：業務後半の終わり]

#先輩
試合終了だ！ AIとの付き合い方が、少しわかってきたか？[p]
#おまえ
はい。便利だけど、確認は、必要ですね[p]
#先輩
それがわかれば、十分だぜ！[p]
#リーダー
AIは、道具だよ。使うのは、俺たちだね[p]
それを、忘れないでね。おkかな？[p]

;=========================================
; 【終業後】（誰と過ごすか）
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]

;[場面：夕方・オフィス]
[bg storage="bg_office_evening.gif" time="500"]

#ナレーション
今日は、AIと一緒に、一日を過ごした。便利だけど、少し危なっかしい相棒だ。[p]

;[選択肢：終業後（信頼度）]
;選択肢1：先輩の信頼度＋1
;選択肢2：同期の信頼度＋1
;選択肢3：リーダーの信頼度＋1
;選択肢4：営業の信頼度＋1
#ナレーション
今日の夕方、誰と過ごす？
[glink  color="blue"  storage="ch1_3/scene2_3.ks"  size="26"  x="266"  width="640"  y="120"  text="先輩と、AIの使い方を、もう少し練習する"  target="*c2_1"  ]
[glink  color="blue"  storage="ch1_3/scene2_3.ks"  size="26"  x="266"  width="640"  y="195"  text="同期と、今日のセキュリティの用語を整理する"  target="*c2_2"  ]
[glink  color="blue"  storage="ch1_3/scene2_3.ks"  size="26"  x="266"  width="640"  y="270"  text="リーダーに、AIとの付き合い方を相談する"  target="*c2_3"  ]
[glink  color="blue"  storage="ch1_3/scene2_3.ks"  size="26"  x="266"  width="640"  y="345"  text="営業に、さっきのAIの失敗談を、詳しく聞く"  target="*c2_4"  ]
[s]

*c2_1
[cm]
[eval exp="f.t_senpai += 1"]
;◆1を選んだ場合
#先輩
AIも、練習すれば、使いこなせるぜ！ 反復練習が、大事だ！[p]
#おまえ
（練習メニューが、また増えた）[p]

@jump target="*c2_end"

*c2_2
[cm]
[eval exp="f.t_douki += 1"]
;◆2を選んだ場合
#同期
マルウェア、ランサムウェア、スパイウェア。ウェアが多すぎるぜ……[p]
#おまえ
全部、ソフトウェアの仲間だからね[p]
#同期
サッカーのウェアなら、覚えやすいのによ[p]
;（ツッコミ）
#おまえ
それは、ユニフォーム[p]

@jump target="*c2_end"

*c2_3
[cm]
[eval exp="f.t_leader += 1"]
;◆3を選んだ場合
#リーダー
AIが言ったことは、一回、自分の頭を通してから使う。それがコツだね[p]
#おまえ
（深い言葉だ）[p]

@jump target="*c2_end"

*c2_4
[cm]
[eval exp="f.t_eigyo += 1"]
;◆4を選んだ場合
#営業
……AIが書いた製品名。世の中に、存在しなかった[p]
……それ以来、AIの文は、必ず読み直す[p]
#おまえ
営業さんも、苦労してるんですね[p]
#営業
……当たり前。……口数が少ないのは、苦労してるからだ[p]
@jump target="*c2_end"

*c2_end
;=========================================
; 【自宅】（リザルト）
;=========================================
[playbgm storage="bgm_walk.mp3" restart="false"]

;[bg storage="（自宅の部屋（夜））" time="500"]
[bg storage="bg_home_night.gif" time="500"]

#ナレーション
布団に入る。画面の中で、AIが「100%」と言っていたことを、思い出す。[p]

;[リザルト表示]
;・今日の正解数：○／10
;・スキル：＋○
;・AI見極め回数：＋○（Q6で見極めたら＋1）
;・信頼度の変化：（選んだキャラ）＋1

;[ナレーション]
#おまえ
便利だけど、確認は、必要。覚えておこう[p]
でも、あのAI、次は、もっと大きな間違いをしそうな気がする[p]
#ナレーション
第2章 4日目へ。[p]

;=========================================
;■ 次回予告（第2章 4日目）
;営業に文句を言われ、報連相の小さな失敗を経験する。少し自信がつく。
;出題：一般常識（報連相）、第2章の総復習
;※第2章の最終日。章末に、最初の途中判定がある
;■ 未決定
;・社長以外の名前
;・各問題の中身（仮。見直す前提）
;・AIの口調（「100%」のくだり）が、くどくないか。あとで調整する
;・見極め回数（f.ai_ok）の配点（配点が決まってから）

;次のファイルへ
@jump storage="ch1_3/scene2_4.ks"
