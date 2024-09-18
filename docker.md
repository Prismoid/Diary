# Dockerの使い方の備忘録です。
## 作業アカウントにdockerグループの権限を付与するには下記コマンドを実行してください。
```
$ sudo usermod -aG docker $USER
$ newgrp docker
```
## コンテナ、イメージ、ネットワーク関係まで一斉に削除するコマンド
```
docker stop $(docker ps -a -q)
docker rm -f $(docker ps -aq)
docker system prune -a
docker volume prune
docker ps -a
docker images -a
docker volume ls
```

## M3 MacBookでDocker Desktopを使っていて起きた問題一覧
### credentialsの問題 -> Docker Desktop (右上のSign inから再ログインする)
### 命令セットアーキテクチャ(Instruction Set Architecture)に対応していることが重要。Intel Macではamd64というアーキテクチャのCPUが載っている。一方、M1 MACではarm64と呼ばれる、スマホやタブレット向けの米ARM社仕様のCPUが載っている。イメージファイルもamd64、arm64の２種のCPUアーキテクチャに対応しているケースが多いが、片方にしか対応しないパターンも多い。このため、dockerは、マルチアーキテクチャサポート機能を持っている。下記のように、イメージをbuild前にCPUアーキテクチャを指定できるのである。
```
mysql:
  image: mysql:5.7
  platform: linux/amd64 #これを入れるだけで何とかなったりする
  build:
    context: . 
    dockerfile: ./docker/mysql/Dockerfile
  container_name: foo_project_mysql
  environment:
    - MYSQL_ROOT_PASSWORD=root
    - MYSQL_DATABASE=foo
    - MYSQL_USER=bar
    - MYSQL_PASSWORD=hogefuga1111
    - TZ=Asia/Tokyo
```