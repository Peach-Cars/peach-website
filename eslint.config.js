export default {
  parser: '@typescript-eslint/parser',
  plugins: ['@typescript-eslint', 'react', 'prettier'],
  extends: [
    'eslint:recommended',
    'plugin:@typescript-eslint/recommended',
    'plugin:react/recommended',
    'plugin:prettier/recommended', 
  ],
  rules: {
    'prettier/prettier': 'error', 
  },
  settings: {
    react: {
      version: 'detect', 
    },
  },
  overrides: [
    {
      files: ['**/*.tsx', '**/*.jsx'], 
      rules: {
        'react/prop-types': 'off', 
      },
    },
  ],
};
