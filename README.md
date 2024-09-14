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
