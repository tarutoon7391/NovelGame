# ST機 約束書（内部 ⇄ 側）v0.1

内部（抽選・状態）と側（筐体・液晶・演出）をつなぐ約束です。側はここに書いた窓口とイベントだけを使ってください。名前やデータを変えるときは、先にこの書類を直して相手に知らせます。

- 内部: `data/others/st_slot/st_engine.js`（素のJS・ビルド不要）
- 仕様書: Claude Docs「ノベルゲーム用 ST機 仕様書 v0.1」
- リール配列と制御: `data/others/st_slot/st_reels.js`（こおりくんの大冒険 v1.0 の配列が土台。引き込み無制限）
- 仮の画面（ドット絵）: `data/others/st_slot/index.html`（`st_screen.js` と `st_art.js`）。側を作るときの参考に
- 中身の確認用デモ: `data/others/st_slot/demo.html`（文字だけの画面）
- 範囲: 今は **ST とボーナスだけ**。通常時・リール配列・最強ST・上位ATのCZ・オーバーキルの特化ゾーンは未実装

## 読み込み

```
[loadjs storage="st_slot/st_engine.js"]
[loadjs storage="st_slot/st_reels.js"]
```

## リールの止め方

```js
var r = machine.lever();                       // 抽選（レバー）
var ctl = StReels.createReelControl(r.shape);  // そのゲームの出目の形
var res = ctl.stop(reel, pressTop);            // 押したときの上段の位置 → { top, slip }。top まで滑らせて止める
```

リールは下方向に回ります（k コマ滑ると上段は `STRIPS[reel][top - k]`）。止まった3リールの図柄は `StReels.gridAt(ctl.tops)`、揃ったラインは `StReels.lineWin(grid)` で分かります。

```js
var machine = StSlot.createMachine({ seed: 123 });   // seed は省略可（省略するとランダム）
```

## 窓口

| 名前 | 説明 |
| --- | --- |
| `machine.lever()` | 1ゲーム回す（レバー〜全停止まで）。そのゲームの結果を返す。ST が終わっていたら `null` |
| `machine.snapshot()` | 今の状態（画面の表示用） |
| `machine.on(fn)` | イベントを受け取る。戻り値の関数を呼ぶと解除 |
| `machine.startST()` | ST をはじめからやり直す（通常時ができるまでの仮の入口） |
| `machine.config` | 数字の設定（読むだけ。演出の判断には使わない） |
| `machine.debug` | テスト用。演出の判断には使わない |

### `lever()` の戻り値

| キー | 説明 |
| --- | --- |
| `phase` | そのゲームの状態。`enemySelect`（敵決定ゲーム）/ `st` / `seven`（ボーナス当選後の7揃い・擬似遊技）/ `reveal`（隠していた小役の答え合わせ）/ `okzone`（オーバーキルの上乗せ特化ゾーン）/ `bonus` |
| `okzone` | 特化ゾーンのゲーム `{ add, total, cont, games }`。300枚に届くまでは毎ゲーム上乗せ、届いたら70%で継続 |
| `game` | 通算ゲーム数 |
| `role` | 役（`seven` のゲームでは `null`＝隠す）。`none` `bell3` `replay` `suika` `chance` `wcherry` `scherry` `mcherry`（ボーナス中は `bell15` も） |
| `upgraded` | チェリー変換が起きたか |
| `critical` | クリティカル役（弱点の役）だったか |
| `navi` | ST中: `bell3` / `replay`（レア役は `null`）。ボーナス中: `yellow`（15枚ベル）/ `white`（リプレイか3枚役） |
| `cutin` / `seven` | カットインの色（`blue` `red` `gold`）と、7が揃うか。カットインが出たゲームは擬似遊技・逆押し |
| `direct` | 直撃当選したか（ST中・バトル中） |
| `battleStart` | このゲームでバトルに入ったか |
| `battle.left` | バトルの残りゲーム数 |
| `weapon` | `seven`: `{ id, name }`（第3停止で見せる。枚数はまだ）/ `reveal`: `{ id, name, medals, presses, overkill }`（レバーで枚数を見せる） |
| `battleFx` | バトルの演出 `{ n, kind, aura, revive, overkill }`。1G `guard`/`hit`/`critical`、2G `hit`/`guard`/`counter`、3G `aura`=`blue`/`red`/`rainbow`、4G `victory`/`defeat`/`revive`（`revive`=`stopLock` 第3停止が押せない・`leverLock` 第3停止後レバーが効かない。2秒後に起き上がって勝利） |
| `stFx` | ST中（バトル外）の演出 `{ kind, color }`。`slash`（ボスに切りかかる）/ `minion`（色つきの雑魚敵。色＝`red`チェリー・`green`スイカ・`purple`チャンス目・`blue`リプレイ。揃わなければ激熱）/ `panel`（4分割の液晶。`white`→`blue`→`green`→`red` の順にチャンス。白はノーチャンス） |
| `bonus` | ボーナス中の `{ paid, target }` |
| `payout` | 払い出し枚数 |
| `naviOrder` | 押し順ナビ（例 `[1, 0, 2]` = 中→左→右）。ナビが出るゲームだけ。側は `createReelControl(shape, naviOrder)` に渡す。従わずベルを取りこぼしたら `machine.missLast()` を呼ぶ |
| `shape` | リールの出目の形（`st_reels.js` の `SHAPES` の名前）。`gase` はハズレのカットインで、押した順で外し方が決まる |

### `snapshot()`

| キー | 説明 |
| --- | --- |
| `phase` | 上と同じ。ST が終わると `end` |
| `enemy` | `{ id, name }` |
| `lamps` | 今ついている弱点ランプ（`cherry` `suika` `chance` `replay`）。バトルで増えたランプは、その ST のあいだずっと残る |
| `addedLamps` | 敵の弱点以外に増えたランプ（バトルで増えた分・最強ST の1つ） |
| `stGames` | ST の残りゲーム数 |
| `battle` | `{ left, extraLamps, final }` またはバトル外なら `null` |
| `vstock` | Vストックの数 |
| `points` / `extraLamps` | ポイントカウンタ（20で満タン）/ 次のバトルで増えるクリティカル役の数 |
| `chainMedals` / `totalNet` | 一連のSTの獲得枚数 / 差枚 |
| `ending` | エンディング到達後か |
| `bonus` | `{ weapon, target, paid }` |

超ツクヨミは画面に出さない決まりなので、`snapshot()` にもイベントにも載せていません。

## イベント

すべて `{ type, game, data }` の形で届きます。

| type | data | 出すタイミング |
| --- | --- | --- |
| `enemy` | `{ enemy, name, lamps, upper, games }` | 敵決定ゲームで相手が決まった（`upper`＝最強ST、`games`＝ST のゲーム数。逆鱗ハンニバルは50） |
| `battleStart` | `{ extraLamps, lamps, final }` | バトル開始。`final` はアマテラスの勝利確定バトル |
| `direct` | `{ inBattle, overkill }` | 直撃当選（勝ちの告知に使う） |
| `overkill` | `{ how }` | オーバーキル確定 |
| `battleEnd` | `{ win, overkill, upperCZ }` | バトル終了。`upperCZ` は逆鱗ハンニバル撃破 |
| `cutin` | `{ color, win }` | 7揃いカットイン（ハズレもある） |
| `vstock` | `{ count }` | 7が揃って Vストック獲得 |
| `vstockRevive` | `{ left }` | ST終了時に Vストックで復活 |
| `bonusWin` | `{ id, name }` | ボーナス当選後の7揃いのゲーム。第3停止で武器を見せる |
| `weapon` | `{ id, name, medals, presses, overkill }` | 答え合わせのゲームのレバー。ここで枚数を見せる。ミズチは `presses`（連打ごとの加算枚数の並び） |
| `battleFx` / `stFx` | 上の表と同じ | 演出の抽選結果（レバーで始めて、結果は止まってから見せる） |
| `upperCZ` | `{}` | 上位ATのCZへ（未実装） |
| `okZoneStart` / `okZoneAdd` / `okZoneEnd` | `{}` / `{ add, total, cont, games }` / `{ total, games }` | オーバーキルの上乗せ特化ゾーン（枚数決定画面のあと、ボーナスの前） |
| `bonusStart` | `{ target }` | ボーナス開始 |
| `points` / `pointsMax` | `{ points, max, added }` / `{ extraLamps }` | ポイント加算 / 満タン |
| `bonusEnd` | `{ medals, chainMedals }` | ボーナス終了 |
| `ending` | `{}` | エンディング到達 |
| `stEnd` | `{ chainMedals }` | ST終了 |
| `game` | `lever()` の戻り値と同じ | 毎ゲームの最後 |

## 側にお願いしたいこと（演出）

- 結果はリールが全部止まってから見せる。バトル4G目の復活は違和感だけで知らせ、液晶では言わない
- ボーナス当選後: 7揃いのゲームは押し順を出さない擬似遊技。第3停止で武器 → 次のゲームのレバーで枚数 → その出目で隠していた小役を見せる（液晶では言わない）
- 敵選択: 8個のクリスタル（上段 アイテール・ツクヨミ・テスカトリポカ・アマテラス／下段 ハンニバル・ヴィーナス・カリギュラ・ディアウス・ビター）。逆鱗ハンニバルはクリスタルを全部壊してから出る
- ボーナス中は敵を出さず、味方を真ん中に
- 枚数決定画面（答え合わせのゲームが止まったあと）: 一式＝ボタン1回 / ミズチ＝連打（`presses`）/ ベンディガー＝長押しでオーラが上がる（白→青300以上→緑510以上→赤750以上→虹1000以上）、上がり切ったら「離せ」で枚数 / 金ノ顎＝ボタンで開始、510→750→1000→2000→3000 を1つずつ自動で壊していく

- カットインが出たゲームは逆押しさせ、どこを押しても滑ってくる擬似遊技にする。押し順ごとの告知タイミングは仕様書の「押し順と告知」の表どおり
- 武器がミズチのときは「ボタンを連打しろ」で、`presses` を1回ずつ見せる
- ST中のナビは、3枚役とリプレイのどちらが揃うかで期待させる。ボーナス中の白ナビは、押すまでどちらか分からないように
