
[cm]

@clearstack
@bg storage ="title.png" time=100
@wait time = 200

*start 

[button x=135 y=230 graphic="title/button_start.png" enterimg="title/button_start2.png"  target="gamestart" keyfocus="1"]
[button x=135 y=320 graphic="title/button_load.png" enterimg="title/button_load2.png" role="load" keyfocus="2"]
[button x=135 y=410 graphic="title/button_cg.png" enterimg="title/button_cg2.png" storage="cg.ks" keyfocus="3"]
[button x=135 y=500 graphic="title/button_replay.png" enterimg="title/button_replay2.png" storage="replay.ks" keyfocus="4"]
[button x=135 y=590 graphic="title/button_config.png" enterimg="title/button_config2.png" role="sleepgame" storage="config.ks" keyfocus="5"]

;章セレクト（第2章を始めたことがあるときだけ出る）
[glink  color="black"  storage="system/chapter_select.ks"  size="22"  x="880"  width="260"  y="570"  text="章をえらぶ"  cond="sf.reach_ch2"  ]

;エンディング一覧（見たエンディングを確認する）
[glink  color="black"  storage="ending/list.ks"  size="22"  x="880"  width="260"  y="640"  text="エンディング一覧"  ]

[s]

*gamestart
;一番最初のシナリオファイルへジャンプする
@jump storage="ch1_3/scene1_1.ks"



