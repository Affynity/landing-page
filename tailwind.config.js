/** @type {import('tailwindcss').Config} */
export default {
  content: ['./index.html', './src/**/*.{js,ts,jsx,tsx}'],
  theme: {
    extend: {
      colors: {
        ivory: '#FAF9F6',
        porcelain: '#F3F2ED',
        obsidian: '#1A1A1A',
        graphite: '#444444',
        stone: '#DADAD4',
        blush: '#EBDAD7',
        sage: '#CBDDC9',
        gold: '#E0D7BD',
        lilac: '#E5E1F0',
      },
      fontFamily: {
        sans: ['Inter', 'General Sans', 'sans-serif'],
      },
      borderRadius: {
        '2xl': '1.5rem',
      },
      boxShadow: {
        soft: '0 2px 12px rgba(0, 0, 0, 0.04)',
      },
    },
  },
  plugins: [],
};