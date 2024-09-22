# Linux Commandに関する備忘録です。
## 目的とする文字列を含むファイルを再帰的に検索する
### -type fはファイルのみを対象とすることを表す
```
find <ディレクトリ> -type f | xargs grep <検索する文字列>
```

## 特定のキーワードを含んでいる行を抽出
```
docker image ls | grep keycloak
```

