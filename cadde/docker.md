# CADDE環境構築中にA発生したエラーなどについて
## CKANのコンテナが上手く停止できなかった場合は、下記のコマンドで全てのコンテナを削除
```
cd ${WORKDIR}/ckan-docker
docker stop $(docker compose ps -a -q)
docker rm -f  $(docker compose ps -a -q)
```

## 再度Buildし、コンテナの立ち上げ
```
cd ${WORKDIR}/ckan-docker
docker compose build
docker compose up -d
```

## cannot stop container, permission deniedと表示されたら、以下コマンドでdocker systemの再起動をする
```
sudo systemctl restart docker.socket docker.service
```

## データベースなどの永続的なボリューム、孤立しているネットワーク設定も削除する場合
```
docker compose down --volumes --remove-orphans
```

## Dockerビルドキャッシュの削除
```
docker builder prune
```

## Docker未使用リソースの一括削除
```
docker system prune --volumes
```

## 不要なボリュームの削除
```
docker volume ls
docker volume rm <volume_name>
```

## 不要なネットワークの削除
```
docker network ls
docker network rm <network_name>
```

## ポートを使用しているプロセスの確認と削除
```
sudo lsof -i :8443
sudo kill <PID>
```

# 提供者コネクタのコンテナ立ち上げに失敗した場合、以下を実行してから`./start.sh`スクリプトを実行する。
```
docker compose down  --volumes --remove-orphans # --rmi all をオプションとしてつけると全てのコンテナが消える
sudo lsof -i :443
sudo kill <PID>
sudo lsof -i :80
sudo kill <PID>
sudo systemctl restart docker.socket docker.service
```

# CADDE環境構築を再度行う場合...

Dockerの再起動
```
sudo systemctl restart docker
```

DNSの再設定
```
sudo systemctl restart systemd-resolved
```