// =====================================================================
// 画面全体 (筐体・デバッグ)
// =====================================================================

import React, { useEffect, useLayoutEffect, useMemo, useRef, useState } from 'react';
import { createGame } from './game.js';
import Cabinet from './components/Cabinet.jsx';
import DebugPanel from './components/DebugPanel.jsx';
import Zukan from './components/Zukan.jsx';
import { Sound } from './sound/sound.js';
import { EMBED, EMBED_MONEY, EMBED_SETTING, EMBED_VOLUME, YEN_PER_MEDAL, guardLending, postToParent } from './embed.js';

const CABINET_W = 560;   // 筐体のいちばん大きい幅
const MARGIN = 24;       // 画面の上下に空ける分

// 筐体がまるごと画面に収まるように縮める (2026-10-21 ユーザー指定: 開いたときに台が見切れないように)。
// 中身はいつも同じ幅で並べて、高さが画面より大きいときだけ全体を縮小する (ボタンの位置もそのまま縮む)
function useFitToScreen() {
    const inner = useRef(null);
    const [fit, setFit] = useState({ width: CABINET_W, scale: 1, height: null });
    useLayoutEffect(() => {
        const el = inner.current;
        const update = () => {
            const width = Math.min(CABINET_W, window.innerWidth - MARGIN);
            el.style.width = `${width}px`;
            const h = el.offsetHeight;
            const scale = Math.min(1, (window.innerHeight - MARGIN) / h);
            setFit(f => (f.width === width && f.scale === scale && f.height === h ? f : { width, scale, height: h }));
        };
        update();
        const ro = new ResizeObserver(update);
        ro.observe(el);
        window.addEventListener('resize', update);
        if (document.fonts) document.fonts.ready.then(update);
        return () => {
            ro.disconnect();
            window.removeEventListener('resize', update);
        };
    }, []);
    return { inner, fit };
}

const KEYS = { z: 0, x: 1, c: 2, 1: 0, 2: 1, 3: 2, ArrowLeft: 0, ArrowDown: 1, ArrowRight: 2 };

export default function App() {
    const game = useMemo(() => createGame({ setting: EMBED ? EMBED_SETTING : 1 }), []);
    const [broke, setBroke] = useState(false);
    const closed = useRef(false);
    // ノベルゲームに組み込み中: 所持金で借りられないときはレバーを止める・音量・親への合図
    useEffect(() => {
        if (!EMBED) return;
        document.documentElement.classList.add('embed');
        Sound.setVolume(EMBED_VOLUME);
        guardLending(game.machine, () => { setBroke(true); setTimeout(() => setBroke(false), 2500); });
        postToParent({ type: 'ready' });
    }, [game]);
    const [, setTick] = useState(0);
    const [showDebug, setShowDebug] = useState(() => {
        if (EMBED) return false;
        try { return localStorage.getItem('koori-slot-debug') !== '0'; } catch (e) { return true; }
    });
    const [muted, setMuted] = useState(Sound.muted);
    const [showZukan, setShowZukan] = useState(false);
    const [toasts, setToasts] = useState([]);
    const { inner, fit } = useFitToScreen();

    // 実績を解除したら、画面の上にお知らせを出す
    useEffect(() => game.collection.onAchievement(a => {
        const key = `${a.id}-${Date.now()}`;
        setToasts(list => [...list, { key, a }]);
        Sound.play('kakutei');
        setTimeout(() => setToasts(list => list.filter(x => x.key !== key)), 4000);
    }), [game]);

    useEffect(() => game.subscribe(() => setTick(t => t + 1)), [game]);
    // 確認用の URL 指定は、組み込み中は使わない (ボーナスを出すなどができてしまうので)
    useEffect(() => { if (!EMBED) game.applyQuery(window.location.search); }, [game]);
    // 確認用 (開発者ツールのコンソールから台をさわれるように)
    useEffect(() => { window.kooriGame = game; }, [game]);

    useEffect(() => {
        const onKey = e => {
            if (e.target.tagName === 'INPUT' || e.target.tagName === 'SELECT') return;
            if (document.querySelector('.zk-overlay')) return;   // 図鑑を開いているあいだは台を動かさない
            if (e.key === ' ' || e.key === 'Enter' || e.key === 'ArrowUp') {
                e.preventDefault();
                game.next();
            } else if (e.key in KEYS) {
                e.preventDefault();
                game.stop(KEYS[e.key]);
            } else if (e.key === 'b' || e.key === 'B') {
                if (!e.repeat) game.push();   // 押しっぱなしは長押し (離したら release)
            } else if ((e.key === 'd' || e.key === 'D') && !EMBED) {
                setShowDebug(s => !s);
            } else if (e.key === 'Escape' && EMBED) {
                settleRef.current();
            }
        };
        const onKeyUp = e => {
            if (e.key === 'b' || e.key === 'B') game.release();
        };
        window.addEventListener('keydown', onKey);
        window.addEventListener('keyup', onKeyUp);
        return () => {
            window.removeEventListener('keydown', onKey);
            window.removeEventListener('keyup', onKeyUp);
        };
    }, [game]);

    // 精算して帰る (リールが止まっていて、演出が終わっているときだけ)
    const snap = game.machine.snapshot();
    const settle = () => {
        if (closed.current) return;
        const s = game.machine.snapshot();
        if (s.spinning || !game.stopped.every(Boolean) || game.director.busy()) return;
        closed.current = true;
        Sound.setVolume(0);   // setMuted は保存されるので使わない
        const invest = s.invested * YEN_PER_MEDAL;
        const back = s.credit * YEN_PER_MEDAL;
        postToParent({
            type: 'close',
            result: { money: EMBED_MONEY - invest + back, invest, back, games: s.game, at: 0, maxGet: 0, setting: EMBED_SETTING }
        });
    };
    const settleRef = useRef(settle);
    settleRef.current = settle;

    useEffect(() => {
        if (EMBED) return;
        try { localStorage.setItem('koori-slot-debug', showDebug ? '1' : '0'); } catch (e) { /* 無視 */ }
    }, [showDebug]);

    const toggleMute = () => {
        Sound.unlock();
        Sound.setMuted(!muted);
        setMuted(!muted);
    };

    return (
        <div className="app">
            <div className="cab-fit" style={{ width: fit.width * fit.scale, height: fit.height ? fit.height * fit.scale : undefined }}>
                <div ref={inner} className="cab-fit-inner" style={{ transform: fit.scale < 1 ? `scale(${fit.scale})` : undefined }}>
                    <Cabinet game={game} />
                </div>
            </div>
            <aside className="side">
                {EMBED && (
                    <div className="embed-money">
                        <div>所持金 <b>{(EMBED_MONEY - snap.invested * YEN_PER_MEDAL).toLocaleString()}</b> 円</div>
                        <div>投資 {(snap.invested * YEN_PER_MEDAL).toLocaleString()} 円 ／ 1枚 20円（1,000円で50枚）</div>
                        {broke && <div className="embed-broke">所持金が足りないので、メダルを借りられない……</div>}
                        <button type="button" className="embed-settle" onClick={settle}>精算して帰る</button>
                    </div>
                )}
                <div className="side-buttons">
                    <button type="button" onClick={() => setShowZukan(true)}>★ 図鑑</button>
                    <button type="button" onClick={toggleMute}>{muted ? '音: OFF' : '音: ON'}</button>
                    {!EMBED && <button type="button" onClick={() => setShowDebug(s => !s)}>{showDebug ? 'デバッグを閉じる' : 'デバッグ'}</button>}
                </div>
                <p className="keys">
                    {EMBED
                        ? '操作: レバー・順に停止 = Space / 停止 = Z X C（← ↓ →）/ PUSH = B / 精算 = Esc'
                        : '操作: レバー・順に停止 = Space / 停止 = Z X C（← ↓ →）/ PUSH = B / デバッグ = D'}
                </p>
                {showDebug && !EMBED && <DebugPanel game={game} />}
            </aside>
            {showZukan && <Zukan collection={game.collection} onClose={() => setShowZukan(false)} />}
            <div className="toasts" aria-live="polite">
                {toasts.map(({ key, a }) => (
                    <div key={key} className="toast"><b>★ 実績解除</b>{a.name}<small>{a.desc}</small></div>
                ))}
            </div>
        </div>
    );
}
