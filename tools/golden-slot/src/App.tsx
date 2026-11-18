import { useCallback, useEffect, useMemo, useRef, useState } from 'react';
import { useGame, type GameApi } from './store/useGame.ts';
import { Cabinet } from './ui/Cabinet.tsx';
import { isDebugEnabled } from './debug/debugFlag.ts';
import { useDebugSettings } from './debug/useDebugSettings.ts';
import { DebugPanel } from './debug/DebugPanel.tsx';
import { EMBED, EMBED_MONEY, EMBED_VOLUME, LEND_COINS, LEND_YEN, YEN_PER_COIN, postToParent } from './embed.ts';
import { setMasterVolume, stopBgm } from './effects/audio.ts';
import './ui/cabinet.css';
import './debug/debug.css';

/**
 * アプリのルート。
 * ゲームの状態は useGame が持ち、筐体 UI（Cabinet）に渡すだけ。
 * `?debug=1` のときはデバッグパネルを筐体の下に出し、useGame に差し込み口を渡す。
 * `?embed=1` のときはノベルゲームに組み込む形（EmbedApp）で動く。
 */
const DEBUG = isDebugEnabled() && !EMBED;

export default function App() {
  return EMBED ? <EmbedApp /> : <StandaloneApp />;
}

function StandaloneApp() {
  const debug = useDebugSettings();
  const api = useGame(DEBUG ? debug.overridesRef : undefined);
  return (
    <Cabinet
      api={api}
      instantReels={DEBUG && debug.settings.skipAnimation}
      logoLamps={DEBUG ? debug.settings.logoLamps : undefined}
      debugFlash={DEBUG && debug.settings.testFlash ? { request: { id: debug.settings.testFlash.id }, startAt: debug.settings.testFlash.at } : null}
    >
      {DEBUG && <DebugPanel api={api} debug={debug} />}
    </Cabinet>
  );
}

/** ノベルゲームの店で、1台に座って遊ぶ形 */
function EmbedApp() {
  const base = useGame();
  const [money, setMoney] = useState(EMBED_MONEY);
  const [invest, setInvest] = useState(0);
  const closed = useRef(false);

  useEffect(() => {
    document.documentElement.classList.add('embed');
    setMasterVolume(EMBED_VOLUME);
    postToParent({ type: 'ready' });

    // 筐体をゲーム画面の高さに収める（ボーナス中の表示が増える分、少し余白を残す）
    const fit = () => {
      const el = document.querySelector<HTMLElement>('.cabinet');
      if (!el) return;
      el.style.zoom = '1';
      const z = Math.min((window.innerHeight * 0.96) / (el.scrollHeight + 36), window.innerWidth / el.scrollWidth, 1.3);
      el.style.zoom = String(z);
    };
    fit();
    window.addEventListener('resize', fit);
    return () => window.removeEventListener('resize', fit);
  }, []);

  const { state } = base;
  const idle = state.phase === 'idle' || state.phase === 'bet';

  /** メダルを借りる（1,000円で50枚） */
  const lend = useCallback(() => {
    if (closed.current || state.phase !== 'idle' || money < LEND_YEN) return;
    base.refillBy(LEND_COINS);
    setMoney((m) => m - LEND_YEN);
    setInvest((v) => v + LEND_YEN);
  }, [base, money, state.phase]);

  /** 精算して帰る（クレジットを1枚20円でお金に戻して、ティラノに結果を返す） */
  const settle = useCallback(() => {
    if (closed.current || !idle) return;
    closed.current = true;
    stopBgm();
    // ベットしただけでレバーを叩いていないメダルは返す（リプレイの自動ベットは元々引かれていない）
    const coins = state.coins + (state.phase === 'bet' && !state.replayBet ? state.bet : 0);
    const back = coins * YEN_PER_COIN;
    const c = state.counters;
    postToParent({
      type: 'close',
      result: {
        money: money + back,
        invest,
        back,
        games: c.totalGames,
        at: c.bigCount + c.regCount,
        maxGet: 0,
        big: c.bigCount,
        reg: c.regCount,
        setting: state.setting,
      },
    });
  }, [idle, invest, money, state]);

  const api: GameApi = useMemo(() => ({ ...base, refill: lend, quit: settle }), [base, lend, settle]);

  return <Cabinet api={api} embed={{ money, invest, canLend: state.phase === 'idle' && money >= LEND_YEN }} />;
}
