/// <reference types="vitest/config" />
import react from '@vitejs/plugin-react'
import { defineConfig } from 'vite'

// https://vite.dev/config/
export default defineConfig({
  plugins: [
    react(),
    {
      // 書き出した index.html の type="module" / crossorigin を外す（file:// でも読めるように）
      name: 'classic-script-for-file-protocol',
      apply: 'build',
      enforce: 'post',
      transformIndexHtml(html) {
        return html
          .replace(/<script type="module" crossorigin src="([^"]+)"><\/script>/g, '<script defer src="$1"></script>')
          .replace(/ crossorigin(?=[ >])/g, '');
      },
    },
  ],
  // ノベルゲームの data/others/golden/ に書き出す（iframe で開くので相対パスにする）
  base: './',
  build: {
    outDir: '../../data/others/golden',
    emptyOutDir: true,
    // PC版（exe）は file:// で開くので、type="module" のスクリプトが読めない。普通のスクリプト1本にする
    modulePreload: false,
    rollupOptions: { output: { format: 'iife', inlineDynamicImports: true } },
  },
  test: {
    // src 配下と test 配下の *.test.ts を対象にする
    include: ['src/**/*.test.ts', 'test/**/*.test.ts'],
    // 停止制御の総当たり（21^3 × 6 押し順）や制御込みシミュレーションは数秒かかる
    testTimeout: 60_000,
  },
})
