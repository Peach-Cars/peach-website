const defaultTheme = require('tailwindcss/defaultTheme');

module.exports = {
  mode: 'jit',
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/javascript/**/*.tsx',
    './app/views/**/*.{erb,haml,html,slim}',
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
        satoshi: ['Satoshi', ...defaultTheme.fontFamily.sans],
      },
      colors:{
        grayLight: '#F3F4F6',
        pinkDark: '#EE3877',
        pinkLight: '#FDEBF1',
        textGray: '#333333',
        darkBlueish: '#1F2937',
        lightGray: '#E5E7EB',
        placeholderGray: '#6B7280',
        darkBlue: '#374151',
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ],
};
