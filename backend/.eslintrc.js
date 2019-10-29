module.exports = {
    extends: [
        'eslint:recommended',
        'plugin:@typescript-eslint/recommended',
        'prettier/@typescript-eslint',
        'plugin:prettier/recommended',
    ],
    parser: '@typescript-eslint/parser',
    plugins: ['@typescript-eslint', 'prettier', 'import'],
    settings: {
        'import/parsers': {
            '@typescript-eslint/parser': ['.ts'],
        },
        'import/resolver': {
            typescript: {},
        },
    },
    parserOptions: {
        ecmaVersion: 2018,
        sourceType: 'module',
    },
    env: {
        node: true,
        mocha: true,
    },
    rules: {
        '@typescript-eslint/explicit-function-return-type': 0,
        '@typescript-eslint/no-use-before-define': 0,
        'no-unused-vars': 0,
        '@typescript-eslint/no-unused-vars': [
            2,
            {
                vars: 'all',
                args: 'after-used',
                argsIgnorePattern: '^_',
                ignoreRestSiblings: true,
            },
        ],
        'class-methods-use-this': 0,
        'default-case': 0,
        eqeqeq: [2, 'always', { null: 'ignore' }],
        'func-names': 0,
        'import/extensions': 2,
        'import/prefer-default-export': 0,
        'import/no-cycle': 0,
        'import/no-extraneous-dependencies': 0,
        'import/no-unresolved': 0,
        'import/no-named-as-default': 2,
        'no-fallthrough': 2,
        radix: [2, 'as-needed'],
        'no-plusplus': 1,
        'no-unused-expressions': 0,
        'no-shadow': 2,
    },
}
