# Gitで特定のディレクトリだけ除外する方法
## .gitignoreファイルを作成し、以下のようにディレクトリ名やファイル名を記述。
```
data/ # dataディレクトリとディレクトリ以下に含まれる全てのファイルをcommitしない。
data # dataという名前のファイルを全てcommitしない(再帰的に調査している間)
```

## 変更履歴とファイルを完全に消す方法
### まず消したいファイルの存在するブランチに移動
```
git checkout -b <ブランチ名>
```
### ファイルの履歴を先頭まで削除
```
git filter-branch --tree-filter 'rm -f common/key/id_rsa' HEAD
```

#### 全てのブランチを対象に行うことも可能
```
git filter-branch --tree-filter 'rm -f common/key/id_rsa' HEAD --all
```

### reflogの削除
```
git reflog expire --expire=now --all
```

### git gcの実行
```
git gc --aggressive --prune=now
```

### git push --forceを実行
```
git push --force origin main
```

#### ※ remote:error: denying non-fast-forward refs/headsmainr ... とエラーが出た場合は下記のようにreceive.denynonfastforwardsをfalseにする。
```
git config receive.denynonfastforwards false
```
