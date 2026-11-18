import type { Setting } from './shared/types.ts';

/**
 * ノベルゲーム（ティラノスクリプト）に組み込むときの設定
 *
 * ティラノ側（data/scenario/system/slot.ks）が iframe でこの画面を開く。
 *   index.html?embed=1&money=所持金&setting=設定&vol=音量(0〜1)
 *
 * 組み込み中の違い
 * - 保存データ（localStorage）は使わない。毎回まっさらな台に座る
 * - 最初のクレジットは 0 枚。メダルは「1,000円で50枚」借りる（1枚20円）
 * - 「やめる」は「精算して帰る」になり、結果を親（ティラノ）に postMessage で返す
 */

const params = new URLSearchParams(typeof location !== 'undefined' ? location.search : '');

export const EMBED = params.get('embed') === '1';

/** 座ったときの所持金（円） */
export const EMBED_MONEY = Math.max(0, Math.floor(Number(params.get('money')) || 0));

/** 台の設定（ティラノ側が決める。無ければこちらで抽選） */
export const EMBED_SETTING: Setting | null = (() => {
  const s = Number(params.get('setting'));
  return Number.isInteger(s) && s >= 1 && s <= 6 ? (s as Setting) : null;
})();

/** 音量（ティラノのコンフィグの効果音の音量。0〜1） */
export const EMBED_VOLUME = (() => {
  if (!params.has('vol')) return 1;
  const v = Number(params.get('vol'));
  return Number.isFinite(v) ? Math.max(0, Math.min(1, v)) : 1;
})();

/** 1枚あたりの金額（円）。ノベルゲーム側のパチスロと同じ */
export const YEN_PER_COIN = 20;
/** 1回の貸出 */
export const LEND_YEN = 1000;
export const LEND_COINS = LEND_YEN / YEN_PER_COIN;

/** 精算したときに親へ返す内容（slot.ks の f.slot_result と同じ形） */
export interface EmbedResult {
  money: number;
  invest: number;
  back: number;
  games: number;
  at: number;
  maxGet: number;
  big: number;
  reg: number;
  setting: Setting;
}

export function postToParent(msg: { type: 'ready' } | { type: 'close'; result: EmbedResult }): void {
  try {
    if (window.parent && window.parent !== window) window.parent.postMessage({ source: 'golden-slot', ...msg }, '*');
  } catch {
    // 親がいない（単体で開いた）ときは何もしない
  }
}
