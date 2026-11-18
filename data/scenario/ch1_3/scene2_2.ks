;第2章 2日目

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
;台本　第2章（5〜6月）　2日目
;状態：叩き台（1日分すべて）／ITパスポート枠は過去問に差し替え済み（11/4）
;※名前は社長（郡晴希：こおり はるき）のみ決定。ほかは役割で表記
;※選択肢の数は問題ごとに変える（用語・知識は4択／場面の判断は3択／AI提案の見極めは2択）
;============================================================
;■ この日のねらい
;・初めての監視当番。アラートが鳴って慌てる。リーダーが落ち着いて対応する
;・出題：ITパスポート（データベース）、運用（監視、ログ）を少し
;■ 1日の流れ
;朝 → 業務前半（5問）→ 昼休み → 業務後半（5問）→ 終業後 → 自宅（リザルト）
;------------------------------------------------------------
; 【朝】
;=========================================
[playbgm storage="bgm_walk.mp3" restart="false"]

;[bg storage="（オフィス（朝））" time="500"]
[bg storage="bg_office.gif" time="500"]

#ナレーション
第2章 2日目。今日は、初めての監視当番だ。[p]
#同期
今朝は、胃が痛ェ……[p]
#おまえ
僕も。緊張で、朝ごはんが、喉を通らなかった[p]
#同期
オデは、メシは食ったけど、自動ドアの前で30秒止まっちまった[p]
;（ツッコミ）
#おまえ
ドアは、止まらないで[p]

;[場面：先輩が登場]

#先輩
おはよう！ 今日は、デビュー戦だぜ！ 俺がずっと隣にいる！[p]
#おまえ
隣にいてくれるのは、ありがたいです[p]
#先輩
ただし、声がでかいのは、勘弁してくれよな！[p]
#おまえ
自覚、あったんですね[p]

;[場面：リーダーが、監視当番のルールを説明]

#リーダー
当番のルールは、3つだよ[p]
1つ目、慌てない。2つ目、一人で抱えない。3つ目、必ず記録を残す[p]
#おまえ
慌てない、抱えない、記録する[p]
#リーダー
そう。それさえ守れば、おkだね[p]

;[選択肢：1回目（信頼度）]
;選択肢1：先輩の信頼度＋1
;選択肢2：リーダーの信頼度＋1
;※どちらを選んでも、次の場面につながる
#ナレーション
当番の前に、何をしておく？
[glink  color="blue"  storage="ch1_3/scene2_2.ks"  size="26"  x="266"  width="640"  y="120"  text="先輩に、昨日の画面の見方を、もう一度確認する"  target="*c1_1"  ]
[glink  color="blue"  storage="ch1_3/scene2_2.ks"  size="26"  x="266"  width="640"  y="195"  text="リーダーに、連絡先と、報告のルールを確認する"  target="*c1_2"  ]
[s]

*c1_1
[cm]
[eval exp="f.t_senpai += 1"]
;◆1を選んだ場合
#先輩
いい心がけだぜ！ 試合前のミーティングは、大事だからな！[p]
#おまえ
（ミーティングの声も、大きい）[p]
@jump target="*c1_end"

*c1_2
[cm]
[eval exp="f.t_leader += 1"]
;◆2を選んだ場合
#リーダー
連絡先はこれ。迷ったら、夜中でも電話していいよ。……あ、大事な話の前に、ここで保存しとく？[p]
#おまえ
（何を保存するんだろう）[p]
;→ 次の場面へ
@jump target="*c1_end"

*c1_end

;=========================================
; 【業務前半】（問題5問）データベースの基礎
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]
[eval exp="f.correct_am = 0"]

;[場面：監視画面の前。まだ、何も起きていない]
[bg storage="bg_monitor.gif" time="500"]

#先輩
アラートが鳴るまで、勉強だぜ！ 今日は、データベースの話をする！[p]
データベースは、チームの選手名簿だ！ 誰がどこにいるか、整理して置いておく場所だぜ！[p]

;Q1 DBMS／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q1】[r]
情報システムに関する機能a〜dのうち、DBMSに備わるものを全て挙げたものはどれか。[r]
a　アクセス権管理　　b　障害回復　　c　同時実行制御　　d　ファイアウォール
[glink  color="blue"  storage="ch1_3/scene2_2.ks"  size="22"  x="640"  width="500"  y="240"  text="a、b、c"  target="*Q1_ok"  ]
[glink  color="blue"  storage="ch1_3/scene2_2.ks"  size="22"  x="640"  width="500"  y="340"  text="a、d"  target="*Q1_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_2.ks"  size="22"  x="640"  width="500"  y="440"  text="b、c"  target="*Q1_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_2.ks"  size="22"  x="640"  width="500"  y="540"  text="c、d"  target="*Q1_ng"  ]
[s]

*Q1_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#先輩
アクセス権も、障害回復も、同時実行の整理も、DBMSの仕事だ！ 名簿の管理人だな！[p]
#
【解説】DBMSは、データベースを管理するソフト。アクセス権の管理、障害からの回復、同時に使われたときの整理は、DBMSの仕事。ファイアウォールは、通信を守る別の仕組み。[p]
@jump target="*Q1_end"

*Q1_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
データを管理する管理人が、DBMSだ！ ファイアウォールは、別のゴールキーパーだぜ！[p]
#
【解説】DBMSは、データベースを管理するソフト。アクセス権の管理、障害からの回復、同時に使われたときの整理は、DBMSの仕事。ファイアウォールは、通信を守る別の仕組み。[p]
@jump target="*Q1_end"

*Q1_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q2 関係データベースの作り方／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=182 page=fore visible=true]
[font size=26]
#
【Q2】[r]
関係データベースの構築を、次のa〜cの工程で行うとき、実行順序として適切なものはどれか。[r]
a　管理するデータ項目の洗い出し　　b　対象業務の分析　　c　表の作成
[glink  color="blue"  storage="ch1_3/scene2_2.ks"  size="22"  x="40"  width="1109"  y="190"  text="a → b → c"  target="*Q2_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_2.ks"  size="22"  x="40"  width="1109"  y="251"  text="b → a → c"  target="*Q2_ok"  ]
[glink  color="blue"  storage="ch1_3/scene2_2.ks"  size="22"  x="40"  width="1109"  y="312"  text="b → c → a"  target="*Q2_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_2.ks"  size="22"  x="40"  width="1109"  y="373"  text="c → a → b"  target="*Q2_ng"  ]
[s]

*Q2_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#先輩
まず仕事を知って、項目を決めて、最後に表だ！ フォーメーションは、選手を見てから決めるんだぜ！[p]
#
【解説】まず、どんな仕事のデータかを調べ（業務の分析）、必要なデータ項目を洗い出してから、表を作る。[p]
@jump target="*Q2_end"

*Q2_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
表を作る前に、何を入れるか決める！ 順番が大事だぜ！[p]
#
【解説】まず、どんな仕事のデータかを調べ（業務の分析）、必要なデータ項目を洗い出してから、表を作る。[p]
@jump target="*Q2_end"

*Q2_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q3 SQL／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q3】[r]
関係データベースの操作を行うための言語はどれか。
[glink  color="blue"  storage="ch1_3/scene2_2.ks"  size="22"  x="640"  width="500"  y="240"  text="FAQ"  target="*Q3_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_2.ks"  size="22"  x="640"  width="500"  y="340"  text="SQL"  target="*Q3_ok"  ]
[glink  color="blue"  storage="ch1_3/scene2_2.ks"  size="22"  x="640"  width="500"  y="440"  text="SSL"  target="*Q3_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_2.ks"  size="22"  x="640"  width="500"  y="540"  text="UML"  target="*Q3_ng"  ]
[s]

*Q3_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#先輩
SQLは、データベースへの作戦指示だぜ！[p]
#
【解説】SQLは、関係データベースを操作するための言語。データの検索や追加などを、命令できる。[p]
@jump target="*Q3_end"

*Q3_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
データベースに話しかける言葉が、SQLだぜ！[p]
#
【解説】SQLは、関係データベースを操作するための言語。データの検索や追加などを、命令できる。[p]
@jump target="*Q3_end"

*Q3_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面転換：同期が、赤いランプを見つけて慌てる]

#同期
なあ……黄色いランプが、点滅してるぞ[p]
#おまえ
注意のランプだ。報告しないと[p]
#先輩
どれどれ。……ああ、これはいつものやつだ。毎日この時間に、バックアップが走るんだぜ[p]
#同期
よかったァ……[p]
#先輩
ただし、見つけたのは、えらいぜ！ ナイスセーブだ！[p]
;（少し嬉しそう）
#同期
ほめられたぜ……[p]

;Q4 主キー／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q4】[r]
関係データベースにおいて、主キーを設定する理由はどれか。
[glink  color="blue"  storage="ch1_3/scene2_2.ks"  size="22"  x="40"  width="1109"  y="151"  text="算術演算の対象とならないことが明確になる。"  target="*Q4_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_2.ks"  size="22"  x="40"  width="1109"  y="212"  text="主キーを設定した列が検索できるようになる。"  target="*Q4_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_2.ks"  size="22"  x="40"  width="1109"  y="273"  text="他の表からの参照を防止できるようになる。"  target="*Q4_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_2.ks"  size="22"  x="40"  width="1109"  y="334"  text="表中のレコードを一意に識別できるようになる。"  target="*Q4_ok"  ]
[s]

*Q4_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#先輩
背番号みたいなもんだぜ！[p]
#
【解説】主キーは、表の中のレコードを、1件ずつ見分けるための項目。重なってはいけない。[p]
@jump target="*Q4_end"

*Q4_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
同じ名前の選手がいても、背番号は、ひとつだぜ！[p]
#
【解説】主キーは、表の中のレコードを、1件ずつ見分けるための項目。重なってはいけない。[p]
@jump target="*Q4_end"

*Q4_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q5 当番の引き継ぎ／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q5】[r]
当番の交代のとき、前の当番から、何を引き継ぐべき？
[glink  color="blue"  storage="ch1_3/scene2_2.ks"  size="22"  x="640"  width="500"  y="240"  text="自分が、褒められた話"  target="*Q5_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_2.ks"  size="22"  x="640"  width="500"  y="340"  text="その日に起きたことと、気をつける点"  target="*Q5_ok"  ]
[glink  color="blue"  storage="ch1_3/scene2_2.ks"  size="22"  x="640"  width="500"  y="440"  text="特に何も引き継がなくていい"  target="*Q5_ng"  ]
[s]

*Q5_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1; f.correct_am += 1"]
#
【正解！】[l][r]
#先輩
引き継ぎは、チームのパス回しだぜ！[p]
@jump target="*Q5_end"

*Q5_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
パスをつなげ！ 次の人が困るぜ！[p]
@jump target="*Q5_end"

*Q5_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：業務前半の終わり]

#先輩
前半は、ここまで！ ハーフタイムだ！ 後半は、本番かもしれないぜ！[p]
#おまえ
本番かもしれない、って何ですか[p]
#先輩
アラートは、いつ鳴るかわからないからな！[p]

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
データベースの基礎は、バッチリだな！[p]
#先輩
後半の本番も、その調子でいけよ！[p]

[elsif exp="f.correct_am >= 2"]
;◆2〜3問正解のとき
#先輩
いい調子だぜ！ 後半も、集中していくぞ！[p]

[else]
;◆1問以下のとき
#先輩
ドンマイだぜ！ データベースは、用語が多い！ 後半は、実戦で覚えるぞ！[p]
[endif]

;[場面：同期との会話]

#同期
なあ、午後にアラートが鳴ったら、どうする？[p]
#おまえ
先輩が、そばにいるし、リーダーも、いるから[p]
#同期
だよな。でも念のため、電源コードだけは踏まねェようにするぜ[p]
#おまえ
ぜひ、そうして[p]

;=========================================
; 【業務後半】（問題5問）アラート対応
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]

;[場面：午後・監視画面の前]
[bg storage="bg_monitor.gif" time="500"]

#ナレーション
午後3時。静かな時間が、続いていた。[p]
;[効果音：アラート音]
[playse storage="se_alarm01.mp3" buf="1" loop="true"]
[playbgm storage="bgm_emergency.mp3" restart="false"]
#先輩
来たぞ！ アラートだぜ！[p]
#おまえ
えっ、本当に鳴った[p]
#同期
赤い！ 赤いぞ！ ウオォォォッ！[p]
#先輩
落ち着け！ 落ち着くんだ！ ……俺が、落ち着いてない！[p]
;（ツッコミ）
#おまえ
先輩が、一番、慌ててます[p]

[stopse buf="1"]
;[場面：リーダー登場]

#リーダー
おやおや。はい、みんな、深呼吸[p]
まず、何のアラートか、確認しようね[p]
……ディスクの使用率が、90%を超えてるね[p]
#おまえ
ディスクが、いっぱい、ということですか[p]
#リーダー
そうだね。放っておくと、サーバが止まるかもしれないよ[p]

;Q6 ディスク使用率／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
;※「慌てて消す」は、第3章の失敗への伏線
[position layer="message0" left=0 top=0 width=1280 height=143 page=fore visible=true]
[font size=26]
#
【Q6】[r]
サーバのディスク使用率が、90%を超えた。まず何をする？
[glink  color="blue"  storage="ch1_3/scene2_2.ks"  size="22"  x="40"  width="1109"  y="151"  text="気にせず、様子を見る"  target="*Q6_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_2.ks"  size="22"  x="40"  width="1109"  y="212"  text="何がディスクを使っているか、確認して、リーダーに報告する"  target="*Q6_ok"  ]
[glink  color="blue"  storage="ch1_3/scene2_2.ks"  size="22"  x="40"  width="1109"  y="273"  text="手当たり次第に、ファイルを消す"  target="*Q6_ng"  ]
[s]

*Q6_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#リーダー
そう、まず確認。慌てて消さないこと。おkだね[p]
@jump target="*Q6_end"

*Q6_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
消す前に、確認だよ。取り返しがつかなくなるからね[p]
@jump target="*Q6_end"

*Q6_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q7 ログの確認（コマンド）／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q7】[r]
ログファイルの、一番最後の部分を、確認するコマンドは？
[glink  color="blue"  storage="ch1_3/scene2_2.ks"  size="22"  x="640"  width="500"  y="240"  text="mkdir"  target="*Q7_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_2.ks"  size="22"  x="640"  width="500"  y="340"  text="cd"  target="*Q7_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_2.ks"  size="22"  x="640"  width="500"  y="440"  text="tail"  target="*Q7_ok"  ]
[glink  color="blue"  storage="ch1_3/scene2_2.ks"  size="22"  x="640"  width="500"  y="540"  text="pwd"  target="*Q7_ng"  ]
[s]

*Q7_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#リーダー
そう、tail。最新の状況が、わかるね[p]
#
【解説】tail は、ファイルの最後を表示する。ログの最新の動きを確認するときに使う。[p]
@jump target="*Q7_end"

*Q7_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
tail は、しっぽ（最後）だぜ！ ログは、後ろが新しい！[p]
#
【解説】tail は、ファイルの最後を表示する。ログの最新の動きを確認するときに使う。[p]
@jump target="*Q7_end"

*Q7_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：リーダーが、落ち着いて対応]

#リーダー
原因は、ログファイルが大きくなりすぎてたみたいだね[p]
古いログを、別の場所に移して、空きを作ろう[p]
#おまえ
消さなくていいんですか[p]
#リーダー
消すのは、最後の手段。まず、移すんだよ[p]
#同期
落ち着いてる……かっこいいぜ[p]
#先輩
さすが、リーダーっス！ 見習え、新人！[p]
;（ツッコミ）
#おまえ
先輩も、見習ってください[p]

;Q8 エスカレーション／3択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q8】[r]
自分では判断できないアラートが出た。どうする？
[glink  color="blue"  storage="ch1_3/scene2_2.ks"  size="22"  x="640"  width="500"  y="240"  text="自分で、なんとか、解決しようとする"  target="*Q8_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_2.ks"  size="22"  x="640"  width="500"  y="340"  text="黙って、無視する"  target="*Q8_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_2.ks"  size="22"  x="640"  width="500"  y="440"  text="上の人に、状況を伝えて、判断をあおぐ"  target="*Q8_ok"  ]
[s]

*Q8_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#リーダー
そう。抱え込まないのも、仕事のうちだね[p]
#
【解説】自分で判断できないときは、早めに上位者へ相談する（エスカレーション）。[p]
@jump target="*Q8_end"

*Q8_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
判断できないときは、早めに相談して。これも仕事だよ[p]
#
【解説】自分で判断できないときは、早めに上位者へ相談する（エスカレーション）。[p]
@jump target="*Q8_end"

*Q8_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q9 バックアップと復元／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
;※リーダーの口ぐせ（第5章のバックアップの伏線）
[position layer="message0" left=0 top=0 width=1280 height=338 page=fore visible=true]
[font size=26]
#
【Q9】[r]
毎週日曜日の業務終了後にフルバックアップファイルを取得し、月曜日〜土曜日の業務終了後には増分バックアップファイルを取得しているシステムがある。水曜日の業務中に故障が発生したので、バックアップファイルを使って火曜日の業務終了時点の状態にデータを復元することにした。データ復元に必要なバックアップファイルを全て挙げたものはどれか。ここで、増分バックアップファイルとは、前回のバックアップファイル（フルバックアップファイル又は増分バックアップファイル）の取得以降に変更されたデータだけのバックアップファイルを意味する。
[glink  color="blue"  storage="ch1_3/scene2_2.ks"  size="22"  x="40"  width="1109"  y="346"  text="日曜日のフルバックアップファイル、月曜日と火曜日の増分バックアップファイル"  target="*Q9_ok"  ]
[glink  color="blue"  storage="ch1_3/scene2_2.ks"  size="22"  x="40"  width="1109"  y="407"  text="日曜日のフルバックアップファイル、火曜日の増分バックアップファイル"  target="*Q9_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_2.ks"  size="22"  x="40"  width="1109"  y="468"  text="月曜日と火曜日の増分バックアップファイル"  target="*Q9_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_2.ks"  size="22"  x="40"  width="1109"  y="529"  text="火曜日の増分バックアップファイル"  target="*Q9_ng"  ]
[s]

*Q9_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#リーダー
備えが一番、大事だね[p]
#
【解説】復元には、土台になるフルバックアップと、そのあとの増分を、順番に全部使う。日曜日のフル、月曜日の増分、火曜日の増分、の3つが必要。[p]
@jump target="*Q9_end"

*Q9_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#リーダー
フルの土台に、増分を順番に重ねて戻すんだよ。全部、必要なんだ[p]
#
【解説】復元には、土台になるフルバックアップと、そのあとの増分を、順番に全部使う。日曜日のフル、月曜日の増分、火曜日の増分、の3つが必要。[p]
@jump target="*Q9_end"

*Q9_end
[resetfont]
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;Q10 復習（ping）／4択
[playse storage="se_quiz_question.mp3"]
[eval exp="f.term_q += 1"]
[position layer="message0" left=0 top=0 width=1280 height=200 page=fore visible=true]
#
【Q10】[r]
相手の機器と、通信できるか確かめるコマンドは？
[glink  color="blue"  storage="ch1_3/scene2_2.ks"  size="22"  x="640"  width="500"  y="240"  text="ls"  target="*Q10_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_2.ks"  size="22"  x="640"  width="500"  y="340"  text="rm"  target="*Q10_ng"  ]
[glink  color="blue"  storage="ch1_3/scene2_2.ks"  size="22"  x="640"  width="500"  y="440"  text="ping"  target="*Q10_ok"  ]
[glink  color="blue"  storage="ch1_3/scene2_2.ks"  size="22"  x="640"  width="500"  y="540"  text="cd"  target="*Q10_ng"  ]
[s]

*Q10_ok
[cm]
[playse storage="se_correct.mp3"]
[eval exp="f.term_ok += 1"]
#
【正解！】[l][r]
#先輩
昨日の復習も、バッチリだぜ！[p]
@jump target="*Q10_end"

*Q10_ng
[cm]
[playse storage="se_wrong.mp3"]
#
【不正解…】[l][r]
#先輩
ping は、呼びかけだ！ 昨日やっただろう！[p]
@jump target="*Q10_end"

*Q10_end
[position layer="message0" left=0 top=520 width=1280 height=200 page=fore visible=true]

;[場面：アラートが、収まる]

;[効果音：アラートが止まる]
[stopse buf="1"]
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]
#リーダー
はい、解決。みんな、よく頑張ったね[p]
#先輩
デビュー戦は、勝利だぜ！[p]
#同期
ほっとしたぜ……[p]
#おまえ
慌てなかったのは、リーダーだけでしたね[p]
#リーダー
おやおや、俺も内心はドキドキだったよ。sry[p]
#おまえ
そうは、見えませんでした。あと、謝るところじゃないです[p]
#リーダー
それが、大人の技術だね[p]

;=========================================
; 【終業後】（誰と過ごすか）
;=========================================
[playbgm storage="bgm_daily.mp3" html5="true" restart="false"]

;[場面：夕方・オフィス]
[bg storage="bg_office_evening.gif" time="500"]

#ナレーション
初めての監視当番が、終わった。[p]

;[選択肢：終業後（信頼度）]
;選択肢1：先輩の信頼度＋1
;選択肢2：同期の信頼度＋1
;選択肢3：リーダーの信頼度＋1
;選択肢4：営業の信頼度＋1
#ナレーション
今日の夕方、誰と過ごす？
[glink  color="blue"  storage="ch1_3/scene2_2.ks"  size="26"  x="266"  width="640"  y="120"  text="先輩と、アラートの振り返りをする"  target="*c2_1"  ]
[glink  color="blue"  storage="ch1_3/scene2_2.ks"  size="26"  x="266"  width="640"  y="195"  text="同期と、今日の怖かったところを、話す"  target="*c2_2"  ]
[glink  color="blue"  storage="ch1_3/scene2_2.ks"  size="26"  x="266"  width="640"  y="270"  text="リーダーに、落ち着いて対応するコツを聞く"  target="*c2_3"  ]
[glink  color="blue"  storage="ch1_3/scene2_2.ks"  size="26"  x="266"  width="640"  y="345"  text="営業に、お客様の件で、今日の状況を報告する"  target="*c2_4"  ]
[s]

*c2_1
[cm]
[eval exp="f.t_senpai += 1"]
;◆1を選んだ場合
#先輩
デビュー戦にしては、よくやったぜ！ 俺が、ほめてやる！[p]
#おまえ
ほめる声が、大きすぎます[p]

@jump target="*c2_end"

*c2_2
[cm]
[eval exp="f.t_douki += 1"]
;◆2を選んだ場合
#同期
あのとき、頭が真っ白になったぜ[p]
#おまえ
僕も。でも、リーダーが、一番落ち着いてた[p]
#同期
オデたちも、ああなれるかな[p]

@jump target="*c2_end"

*c2_3
[cm]
[eval exp="f.t_leader += 1"]
;◆3を選んだ場合
#リーダー
コツは、準備だね。何が起きるか、前もって考えておくこと[p]
それと、慌てたときは、手を動かさず、まず深呼吸。あとは魚肉ソーセージだね[p]
#おまえ
（最後のは、たぶん関係ない。でも、落ち着いた声が安心する）[p]

@jump target="*c2_end"

*c2_4
[cm]
[eval exp="f.t_eigyo += 1"]
;◆4を選んだ場合
#営業
……アラート。鳴ったらしいな[p]
#おまえ
はい。原因は、ログが大きくなりすぎたことでした[p]
#営業
……報告が早い。それが、一番大事[p]
#おまえ
（営業さんに、また、褒められた）[p]
@jump target="*c2_end"

*c2_end
;=========================================
; 【自宅】（リザルト）
;=========================================
[playbgm storage="bgm_walk.mp3" restart="false"]

;[bg storage="（自宅の部屋（夜））" time="500"]
[bg storage="bg_home_night.gif" time="500"]

#ナレーション
ベッドに、倒れ込む。長い一日だった。[p]

;[リザルト表示]
;・今日の正解数：○／10
;・スキル：＋○
;・信頼度の変化：（選んだキャラ）＋1

;[ナレーション]
#おまえ
慌てない、抱えない、記録する。リーダーの3つのルール[p]
明日は、少し、ゆるい日であってほしい[p]
#ナレーション
第2章 3日目へ。[p]

;=========================================
;■ 次回予告（第2章 3日目）
;AIの回答が、少し外れる（検証イベント・軽め）。気づけるかの練習。
;出題：ITパスポート（セキュリティ：マルウェア、ウイルス対策）
;■ 未決定
;・社長以外の名前
;・各問題の中身（仮。見直す前提）
;・Q6（ディスク使用率の初動）、Q9（バックアップ）は、あとの章の伏線。表現は、あとで調整する

;次のファイルへ
@jump storage="ch1_3/scene2_3.ks"
