# CADDE環境構築中に発生したエラーなどについて
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