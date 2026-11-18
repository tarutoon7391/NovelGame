;--------------------------------------------------------------------------------
; ティラノスクリプト テーマプラグイン theme_kopanda_16
; 作者:こ・ぱんだ
; https://kopacurve.blog.fc2.com/
;--------------------------------------------------------------------------------

[iscript]

mp.font_color    = mp.font_color    || "0x5C4949";
mp.name_color    = mp.name_color    || "0xAED674";
mp.frame_opacity = mp.frame_opacity || "255";
mp.font_color2   = mp.font_color2   || "0x5C4949";
mp.glyph         = mp.glyph         || "on";

if(TG.config.alreadyReadTextColor != "default") {
	TG.config.alreadyReadTextColor = mp.font_color2;
}

[endscript]

; 名前部分のメッセージレイヤ削除
[free name="chara_name_area" layer="message0"]

; メッセージウィンドウの設定
[position layer="message0" width="1160" height="193" top="522" left="60"]
[position layer="message0" frame="../others/plugin/theme_kopanda_16/image/frame_message.png" margint="55" marginl="140" marginr="140" opacity="&mp.frame_opacity" page="fore"]

; 名前枠の設定
[ptext name="chara_name_area" layer="message0" color="&mp.name_color" size="26" x="165" y="525" width="360" align="center"]
[chara_config ptext="chara_name_area"]

; デフォルトのフォントカラー指定
[font color="&mp.font_color"]
[deffont color="&mp.font_color"]

; クリック待ちグリフの設定（on設定時のみ有効）
[if exp="mp.glyph == 'on'"]
[glyph line="../../../data/others/plugin/theme_kopanda_16/image/system/nextpage.png"]
[endif]

;=================================================================================

; 機能ボタンを表示するマクロ

;=================================================================================

; 機能ボタンを表示したいシーンで[add_theme_button]と記述してください（消去は[clearfix]タグ）
[macro name="add_theme_button"]

; 歯車ボタン（メニューボタン）非表示
[hidemenubutton]

[iscript]

	tf.sysbtn_img_path   = '../others/plugin/theme_kopanda_16/image/button/'; // 画像のパス
	tf.sysbtn_posx       = [780, 834, 888, 942, 996, 1050, 1104]; // 配置するX座標
	tf.sysbtn_posy       = 518; // 配置するY座標

[endscript]

; クイックセーブ
[button name="role_button" role="quicksave" graphic="&tf.sysbtn_img_path + 'qsave.png'" enterimg="&tf.sysbtn_img_path + 'qsave2.png'" x="&tf.sysbtn_posx[0]" y="&tf.sysbtn_posy"]

; クイックロード
[button name="role_button" role="quickload" graphic="&tf.sysbtn_img_path + 'qload.png'" enterimg="&tf.sysbtn_img_path + 'qload2.png'" x="&tf.sysbtn_posx[1]" y="&tf.sysbtn_posy"]

; オート
[button name="role_button" role="auto" graphic="&tf.sysbtn_img_path + 'auto.png'" enterimg="&tf.sysbtn_img_path + 'auto2.png'" autoimg="&tf.sysbtn_img_path + 'auto4.png'" x="&tf.sysbtn_posx[2]" y="&tf.sysbtn_posy"]

; スキップ
[button name="role_button" role="skip" graphic="&tf.sysbtn_img_path + 'skip.png'" enterimg="&tf.sysbtn_img_path + 'skip2.png'" skipimg="&tf.sysbtn_img_path + 'skip4.png'" x="&tf.sysbtn_posx[3]" y="&tf.sysbtn_posy"]

; バックログ
[button name="role_button" role="backlog" graphic="&tf.sysbtn_img_path + 'log.png'" enterimg="&tf.sysbtn_img_path + 'log2.png'" x="&tf.sysbtn_posx[4]" y="&tf.sysbtn_posy"]

; メニュー
[button name="role_button" role="menu" graphic="&tf.sysbtn_img_path + 'menu.png'" enterimg="&tf.sysbtn_img_path + 'menu2.png'" x="&tf.sysbtn_posx[5]" y="&tf.sysbtn_posy"]

; 非表示
[button name="role_button" role="window" graphic="&tf.sysbtn_img_path + 'close.png'" enterimg="&tf.sysbtn_img_path + 'close2.png'" x="&tf.sysbtn_posx[6]" y="&tf.sysbtn_posy"]

[endmacro]


;=================================================================================

;　システムで利用するHTML,CSSの設定

;=================================================================================
; セーブ画面
[sysview type="save" storage="./data/others/plugin/theme_kopanda_16/html/save.html"]

; ロード画面
[sysview type="load" storage="./data/others/plugin/theme_kopanda_16/html/load.html"]

; バックログ画面
[sysview type="backlog" storage="./data/others/plugin/theme_kopanda_16/html/backlog.html"]

; メニュー画面
[sysview type="menu" storage="./data/others/plugin/theme_kopanda_16/html/menu.html"]

; CSS
[loadcss file="./data/others/plugin/theme_kopanda_16/ts16.css"]

; メニュー画面からコンフィグを呼び出すための設定ファイル
[loadjs storage="plugin/theme_kopanda_16/setting.js"]

;=================================================================================

;　テストメッセージ出力プラグインの読み込み

;=================================================================================
[loadjs storage="plugin/theme_kopanda_16/testMessagePlus/gMessageTester.js"]
[loadcss file="./data/others/plugin/theme_kopanda_16/testMessagePlus/style.css"]

[macro name="test_message_start"]
[eval exp="gMessageTester.create()"]
[endmacro]

[macro name="test_message_end"]
[eval exp="gMessageTester.destroy()"]
[endmacro]

[macro name="test_message_reset"]
[eval exp="gMessageTester.currentTextNumber=0;gMessageTester.next(true)"]
[endmacro]


[return]
