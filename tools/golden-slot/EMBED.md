# GOLDEN をノベルゲームに組み込む

元のリポジトリ: tarutoon7391/golden-slot（018a316 をコピー）

## ビルド

```
cd tools/golden-slot
npm ci
npm run build   # → data/others/golden/ に書き出される
```

ティラノ側は data/others/golden/ だけを使う（この tools/ フォルダはゲームの実行には不要）。

## 元のリポジトリからの変更

- src/embed.ts（新規）: `?embed=1&money=&setting=&vol=` を読む・親へ postMessage
- src/App.tsx: embed のときは EmbedApp（貸出 1,000円=50枚・精算して帰る・画面に合わせて縮小）
- src/store/useGame.ts: embed のときは保存データを使わない・クレジット0枚で開始・refillBy を追加
- src/effects/audio.ts: 全体音量（setMasterVolume）
- src/ui/Cabinet.tsx / Controls.tsx / cabinet.css: 所持金・投資の表示と、組み込み用の見た目
- src/config/symbols.ts / index.html: 画像のパスを相対パスに
- vite.config.ts: base './'、出力先、file:// でも読めるよう普通のスクリプト1本で書き出し

## ティラノとのやりとり

- 開く: data/scenario/system/slot.ks の *sit_golden（iframe を .tyrano_base に重ねる）
- 台 → ティラノ: `{ source: 'golden-slot', type: 'ready' }` / `{ source: 'golden-slot', type: 'close', result }`
- result は f.slot_result と同じ形（money / invest / back / games ほか）
