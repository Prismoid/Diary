# Diary
## 2024年9月14日これはテスト日記です。

## GitHubを使う上で重要なこと
### commitでバージョンが確定。
```
git init
git add .
git commit -m "First Commit"
git remote add origin git@github.com:Prismoid/Diary #  Remoteのレポジトリを指定(認証が必須)
git push -u origin main # mainブランチとしてpush、更新する。
```

### pullでリモートレポジトリと同期（合流）。
```
git pull origin main
```

### gitでbranchの作成とcheckoutの行い方
```
git checkout issue1
git checkout -b issue1 # branchのcheckoutと作成を同時に行う
```
#### branch上でのcommitが可能
```
git add .
git commit -m "commit名"
```

### gitでbranchをmergeする方法
```
git checkout main # 元のmainのbranchに戻る
git merge issue1 # issue1で更新した内容でmainのbranchがアップデートされる。
```

### gitでbranchを削除する
```
git branch -d issue1 # issue1 branchを削除する
git branch # issue1 が無くなっていることが確認できる。
```

### gitで複数のbranchをmergeしていく(衝突解決)
```
git merge issue2
git merge issue3 # <- ここで競合が発生するので修正が必要
```
