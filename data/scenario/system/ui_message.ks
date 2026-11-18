;=========================================
; メッセージ欄と名前欄の設定（first.ks から [call] で呼ぶ）
; 枠の画像は使わず、色・角丸・ふちで描く。
; → 枠と文字の場所がずれないので、文章が枠からはみ出さない（1回に3行まで入る）
;=========================================
*start

[position layer="message0" page="fore" left="20" top="488" width="1240" height="220" frame="none" color="0x10182a" opacity="225" radius="18" border_color="0xe2c48a" border_size="3"]
[position layer="message0" page="fore" marginl="56" margint="40" marginr="64" marginb="20"]

;名前欄：テーマが作った名前欄があれば消してから、メッセージ欄の左上に作り直す
;見た目（タブの形）は data/others/game_ui/game_ui.css の .chara_name_area
[free layer="message0" name="chara_name_area"]
[ptext layer="message0" name="chara_name_area" x="44" y="452" size="24" bold="true" color="0x10182a" text=""]
[chara_config ptext="chara_name_area"]

;文字の色：テーマは濃い茶色にしているので、紺のメッセージ欄で読める明るい色にする
;（既読の文章の色も、テーマの茶色から、少し青みのある明るい色に変える）
[deffont color="0xfdf6e3"]
[resetfont]
[iscript]
if (TG.config.alreadyReadTextColor != "default") {
  TG.config.alreadyReadTextColor = "0xc9d6ee";
}
[endscript]

[return]
