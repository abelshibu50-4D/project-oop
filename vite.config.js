import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],
  server: {
    port: 5173,
    host: false,
    open: true
  },
  preview: {
    port: 4173,
    host: false,
    open: true
  },
  build: {
    chunkSizeWarningLimit: 1000,
    rollupOptions: {
      output: {
        manualChunks: {
          'vendor-recharts': ['recharts'],
          'vendor-icons': ['lucide-react']
        }
      }
    }
  }
});
