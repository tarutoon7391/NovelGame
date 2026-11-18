// =====================================================================
// ノベルゲーム（ティラノスクリプト）に組み込むときの設定
// ---------------------------------------------------------------------
// ティラノ側（data/scenario/system/slot.ks の *sit_koori）が iframe で開く。
//   index.html?embed=1&money=所持金&setting=設定&vol=音量(0〜1)
//
// 組み込み中の違い
// - お金は「1枚20円」。台はクレジットが足りないと自動で50枚（1,000円）借りるが、所持金が足りなければ回せない
// - デバッグ画面は出さない。「精算して帰る」で結果を親（ティラノ）に postMessage で返す
// =====================================================================

const q = new URLSearchParams(typeof location !== 'undefined' ? location.search : '');

export const EMBED = q.get('embed') === '1';
export const EMBED_MONEY = Math.max(0, Math.floor(Number(q.get('money')) || 0));
export const EMBED_SETTING = (() => {
    const s = Number(q.get('setting'));
    return Number.isInteger(s) && s >= 1 && s <= 6 ? s : 1;
})();
export const EMBED_VOLUME = (() => {
    if (!q.has('vol')) return 1;
    const v = Number(q.get('vol'));
    return Number.isFinite(v) ? Math.max(0, Math.min(1, v)) : 1;
})();

export const YEN_PER_MEDAL = 20;
export const LEND_MEDALS = 50;   // 台が1回に借りる枚数（machine.js と同じ）
export const BET = 3;            // config.bet と同じ

export function postToParent(msg) {
    try {
        if (window.parent && window.parent !== window) window.parent.postMessage({ source: 'koori-slot', ...msg }, '*');
    } catch (e) {
        // 単体で開いたときは何もしない
    }
}

// 所持金が足りないときは、台が借りようとしたところでレバーを止める
export function guardLending(machine, onBroke) {
    const orig = machine.lever;
    machine.lever = function (...args) {
        const s = machine.snapshot();
        if (!s.free && s.credit < BET && EMBED_MONEY - (s.invested + LEND_MEDALS) * YEN_PER_MEDAL < 0) {
            onBroke();
            return false;
        }
        return orig.apply(machine, args);
    };
}
