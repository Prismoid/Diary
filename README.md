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

