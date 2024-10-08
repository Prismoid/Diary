# Diary
## 2024年9月14日これはテスト日記です。

## GitHubを使う上で重要なこと(参考:https://backlog.com/ja/git-tutorial/stepup/12/)
### まずリモートリポジトリの認証が必須！！(参考: https://www.kikagaku.co.jp/kikagaku-blog/github-access-token/)
#### ssh-keygenを使って、rsa暗号用秘密鍵を作成する
```
ssh-keygen -t rsa
```
#### id_rsa.pubに記載されている内容をGitHub右上の設定ページ(Settings)より、SSH and GPG keysの項目を探して、追加する。
#### 以下コマンドを実行して、問題ない旨の応答が返ってくればOK。
```
ssh -T git@github.com
```

#### また、commit時のエラーを防ぐため、以下のように適当なユーザ名を設定しておくと良い。
```
git config --global user.name someone
git config --global user.email someone@example.jp
```


### commitでバージョンが確定。
```
git init
git add .
git commit -m "First Commit"
git branch -M main # ブランチをmainで指定
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
git merge issue2 # <- まずissue2のbranchから統合(衝突している旨がでた場合、その解決が必要。それは手作業！！！)
git merge issue3 # <- 次にissue3のbranchを統合(衝突している旨がでた場合、その解決が必要。それは手作業！！！)
```

#### ファイルのバージョン履歴を維持した状態で、Gitのフォルダ構成やファイル・フォルダ名を変更する。
```
git mv <ファイルのパス> <変更先のパス>
```

#### ファイルの削除
```
git rm <ファイルのパス>
```

## 特定のリポジトリで共同開発する方法

前提として、そのリポジトリの管理者であることが必要。指定したbranchのリポジトリは以下コマンドでクローンできる。
```
git clone -b <ブランチ名> <リポジトリのURL>
```
特定のbranchへのチェックアウトは、以下コマンドでbranch一覧を確認し、
```
git branch -r
```
次のコマンドでチェックアウトする。
```
git checkout -b <ブランチ名> origin/<ブランチ名>
```
