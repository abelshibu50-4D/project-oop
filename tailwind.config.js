/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  darkMode: 'class',
  theme: {
    extend: {
      colors: {
        blueprint: {
          paper: '#F7F6F2',
          'paper-muted': '#EFECE4',
          'paper-card': '#FFFFFF',
          border: '#DDD9CE',
          'border-subtle': '#E9E6DC',
          charcoal: '#1F2421',
          'charcoal-secondary': '#36403A',
          'charcoal-muted': '#5D6B63',
          forest: '#1B4332',
          'forest-hover': '#143326',
          'forest-dark': '#1F4D3A',
          teal: '#2D6A5F',
          'teal-light': '#E6F0ED',
          mint: '#4EA893',
          'mint-light': '#E9F5F1',
          darkbg: '#0E1411',
          darkcard: '#16201B',
          'darkcard-elevated': '#1D2A24',
          darkborder: '#233129',
          'darkborder-subtle': '#1B2620',
          warmwhite: '#F3F4F1',
          'warmwhite-secondary': '#C4CCC7',
          'warmwhite-muted': '#8A9991',
        },
        brand: {
          50: '#F2F7F4',
          100: '#E1EFE8',
          200: '#C2DFD2',
          300: '#95C7B3',
          400: '#64A990',
          500: '#3D8C71',
          600: '#2D6F56',
          700: '#1B4332',
          800: '#153628',
          900: '#102B20',
          950: '#091A13',
        }
      },
      fontFamily: {
        sans: ['Inter', 'system-ui', '-apple-system', 'BlinkMacSystemFont', 'Segoe UI', 'Roboto', 'sans-serif'],
        mono: ['JetBrains Mono', 'ui-monospace', 'SFMono-Regular', 'Menlo', 'Monaco', 'Consolas', 'monospace'],
      },
      keyframes: {
        fadeIn: {
          '0%': { opacity: '0', transform: 'translateY(4px)' },
          '100%': { opacity: '1', transform: 'translateY(0)' },
        },
      },
      animation: {
        'fade-in': 'fadeIn 0.2s ease-out forwards',
      }
    },
  },
  plugins: [],
}
