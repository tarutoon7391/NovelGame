# こおりくんの大冒険 をノベルゲームに組み込む

元のリポジトリ: tarutoon7391/Koori-Slot（0fc1cce をコピー）

## ビルド

```
cd tools/koori-slot
npm ci
npm run build:novel   # play.html（1ファイル）を作って data/others/koori/index.html にコピーする
```

1ファイルにまとめているので、PC版（exe・file://）でもそのまま開ける。

## 元のリポジトリからの変更（演出側・内部処理側の約束 docs/events.md は変えていない）

- src/presentation/embed.js（新規）: `?embed=1&money=&setting=&vol=` を読む・親へ postMessage・所持金が足りないときにレバーを止める
  （台の窓口 `machine.lever()` / `machine.snapshot()` だけを使う。内部処理の中身は見ない）
- src/presentation/App.jsx: 組み込み中は デバッグ画面・確認用URL を使わない。所持金・投資・「精算して帰る」（Esc）を出す
- src/presentation/sound/sound.js: 全体の音量（setVolume）
- src/presentation/styles.css: 組み込み用の見た目（背景を透かす）
- package.json: build:novel を追加

## ティラノとのやりとり

- 開く: data/scenario/system/slot.ks の *sit_frame（f.slot_frame = 'koori'）
- 台 → ティラノ: `{ source: 'koori-slot', type: 'ready' }` / `{ source: 'koori-slot', type: 'close', result }`
- 台は座った時点で 50枚（1,000円）借りた状態から始まる（元の台の作り）
