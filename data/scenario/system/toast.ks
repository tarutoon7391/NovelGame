;=========================================
; 画面の上に、小さなお知らせを出して、自然に消す（[call] で呼ぶ）
; 会話の流れを止めない（待たずに次へ進む）。
;
; 呼び方（先に f.toast に文字を入れておく）
;   [eval exp="f.t_douki += 1; f.toast = '同期の信頼度が上がった！'"]
;   [call storage="system/toast.ks"]
;=========================================
*start
[layopt layer="2" visible="true"]
[mtext layer="2" text="&f.toast" x="40" y="24" size="26" bold="true" color="0xffe9a8" edge="3px 0x10182a" in_effect="fadeInDown" out_effect="fadeOut" time="1400" wait="false"]
[return]
