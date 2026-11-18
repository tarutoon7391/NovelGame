;一番最初に呼び出されるファイル

[title name="ティラノスクリプト解説"]

[stop_keyconfig]


;ティラノスクリプトが標準で用意している便利なライブラリ群
;コンフィグ、CG、回想モードを使う場合は必須
@call storage="tyrano.ks"

;ゲームで必ず必要な初期化処理はこのファイルに記述するのがオススメ

 [plugin name="theme_kopanda_16"]

;ゲーム全体の見た目：メッセージ欄・選択肢・クリックした所の演出（data/others/game_ui/ の中）
;テーマのプラグインより後に読み込んで、メッセージ欄と選択肢だけを上書きする
[loadcss file="./data/others/game_ui/game_ui.css"]
[loadjs storage="game_ui/click_effect.js"]
[call storage="system/ui_message.ks"]

; メッセージウィンドウ
; [position layer=message0 x=20 y=500 width=1240 height=200 color="0x06222D"]

;メッセージボックスは非表示
@layopt layer="message" visible=false

;最初は右下のメニューボタンを非表示にする
[hidemenubutton]

;タイトル画面へ移動
@jump storage="title.ks"

[s]


