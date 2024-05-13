module.exports = {
    "env": {
        "browser": true,
        "es2021": true,
        "commonjs": true,

    },
    "extends": [
        "standard-with-typescript",
        "plugin:react/recommended",
        "airbnb-base"
    ],
    "overrides": [
        {
            "env": {
                "node": true
            },
            "files": [
                ".eslintrc.{js,cjs}"
            ],
            "parserOptions": {
                "sourceType": "script"
            }
        }
    ],
    "parserOptions": {
        "ecmaVersion": "latest",
        "sourceType": "module"
    },
    "plugins": [
        "react"
    ],
    "rules": {
    }
}
