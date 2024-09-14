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

### branchを用いたチーム開発(並行作業)
#### 以下のコマンドで、2つのブランチを作成できる
```
git chekcout -b issue2
git checkout -b issue3
```
=======

### gitで複数branchをmergeしていく
#### 各々のbranchでcommit
```
git checkout issue2
git add .
git commit -m "upd2"
git checkout issue3
git add .
git commit -m "upd3"
```
#### mainブランチに移動して、
```
git checkout main
git merge issue2 # <- まずissue2のbranchから統合
git merge issue3 # <- 次にissue3のbranchを統合(衝突している旨がでた場合、その解決が必要)
```


>>>>>>> issue3
