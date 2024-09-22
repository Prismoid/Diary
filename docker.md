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

### この際、cannot stop container, permission deniedと表示されたら、以下コマンドでdocker systemの再起動をする
```
sudo systemctl restart docker.socket docker.service
```

## 簡単なDockerコンテナ作成の例
### ファイルサーバを立ち上げる一例である。
```
services:
  nginx:
    image: nginx:alpine
    ports:
      - "8080:80"
    volumes:
      - ./data:/usr/share/nginx/html
```
### 次のコマンドでコンテナを起動(compose.ymlがデフォルト指定)
```
docker compose up -d
```
### コンテナを立ち上げた同一ディレクトリで以下コマンドで停止
```
docker compose stop
```
### 再開方法
```
docker compose start
```
### コンテナを削除する方法
```
docker compose down
```


### 次のcURLコマンドでdataディレクトリにあるファイル(例えばtest.txt)を確認可能
```
curl http://localhost:8080/test.txt
```


## M3 MacBookでDocker Desktopを使っていて起きた問題一覧
### credentialsの問題 -> Docker Desktop (右上のSign inから再ログインする)
### 命令セットアーキテクチャ(Instruction Set Architecture)に対応していることが重要。Intel Macではamd64というアーキテクチャのCPUが載っている。
### 一方、M1 MACではarm64と呼ばれる、スマホやタブレット向けの米ARM社仕様のCPUが載っている。イメージファイルもamd64、arm64の２種のCPUアーキテクチャに対応しているケースが多いが、片方にしか対応しないパターンも多い。
### このため、dockerは、マルチアーキテクチャサポート機能を持っている。下記のように、イメージをbuildする前にCPUアーキテクチャを指定できるのである。
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

## イメージファイルが見つからないエラーの対処法
```
=> ERROR [internal] load metadata for docker.io/library/python:3.10.7
```
上のようなエラーが出た場合、事前にイメージファイルをpullしておくと、上手くいくことがある。
```
docker pull docker.io/library/python:3.10.7
```