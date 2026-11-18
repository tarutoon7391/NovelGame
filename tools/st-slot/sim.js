// ST機のシミュレーション: node tools/st-slot/sim.js [回数]
// 新しい台で ST をはじめから回し、ST が終わるまでを「1連」として集計する。
const { createMachine } = require('../../data/others/st_slot/st_engine.js');

const N = Number(process.argv[2]) || 20000;
const enemyCount = {}, enemyWin = {};
let sts = 0, stWins = 0, bonuses = 0, bonusMedals = 0, chainTotal = 0, games = 0, vstocks = 0, endings = 0, overkills = 0;
const chains = [];
const weaponCount = {};

for (let i = 0; i < N; i++) {
  const m = createMachine({ seed: i + 1 });
  let cur = null, won = false, chain = 0;
  m.on((e) => {
    if (e.type === 'enemy') {
      if (cur) { sts++; if (won) stWins++; enemyWin[cur] = (enemyWin[cur] || 0) + (won ? 1 : 0); }
      cur = e.data.enemy; won = false; enemyCount[cur] = (enemyCount[cur] || 0) + 1;
    }
    if (e.type === 'weapon') { won = true; weaponCount[e.data.name] = (weaponCount[e.data.name] || 0) + 1; }
    if (e.type === 'bonusEnd') { bonuses++; bonusMedals += e.data.medals; }
    if (e.type === 'vstock') vstocks++;
    if (e.type === 'ending') endings++;
    if (e.type === 'battleEnd' && e.data.overkill) overkills++;
    if (e.type === 'stEnd') { sts++; enemyWin[cur] = (enemyWin[cur] || 0); chain = e.data.chainMedals; }
  });
  while (m.lever()) games++;
  chains.push(chain); chainTotal += chain;
}

chains.sort((a, b) => a - b);
const pct = (q) => chains[Math.floor(chains.length * q)];
const f = (x, d = 1) => x.toFixed(d);
console.log(`=== ${N}連 シミュレーション ===`);
console.log(`ST1回の継続率（ボーナスまで行く率）: ${f(100 * stWins / sts)}%`);
console.log(`1連の平均ボーナス回数: ${f(bonuses / N, 2)}回 / 平均獲得: ${f(chainTotal / N, 0)}枚`);
console.log(`1連の獲得 中央値 ${pct(0.5)}枚 / 上位10% ${pct(0.9)}枚 / 上位1% ${pct(0.99)}枚`);
console.log(`ボーナス1回の平均: ${f(bonusMedals / bonuses, 0)}枚 / オーバーキル: ボーナスの ${f(100 * overkills / bonuses)}%`);
console.log(`7揃い（Vストック）: 1連あたり ${f(vstocks / N, 3)}個 / エンディング到達: ${f(100 * endings / N, 2)}%`);
console.log(`1連の平均ゲーム数: ${f(games / N, 0)}G`);
console.log('敵ごと（出現数・そのSTでボーナスまで行った率）:');
for (const k of Object.keys(enemyCount).sort((a, b) => enemyCount[b] - enemyCount[a])) {
  console.log(`  ${k.padEnd(13)} ${String(enemyCount[k]).padStart(7)}  ${f(100 * (enemyWin[k] || 0) / enemyCount[k])}%`);
}
console.log('武器:', weaponCount);
