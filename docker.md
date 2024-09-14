# Dockerの使い方の備忘録です。
## 作業アカウントにdockerグループの権限を付与するには下記コマンドを実行してください。
$ sudo usermod -aG docker $USER
$ newgrp docker

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
