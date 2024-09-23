# CADDE環境構築メモ
## CKAN(提供者)の環境設定
- CKAN_SITE_URL
  - `https://cadde-catalog-xxx.site02.dataspace.internal:8443`

## 再開・シャットダウンが必要なシステム一覧
### DNS
#### 起動
```
service named start
```
#### 終了
```
service named stop
```

### WireGuard
#### 起動
```
wg-quick up wg0
```
#### 終了
```
wg-quick down wg0
```

### HTTPサーバ(提供者)
#### 起動
```
cd ${WORKDIR}/private-http-server
docker compose up -d
```
#### 終了
```
cd ${WORKDIR}/private-http-server
docker compose stop
```

### CKAN
#### 起動
```
cd ${WORKDIR}/ckan-docker
docker compose up -d
```
#### 終了
```
cd ${WORKDIR}/ckan-docker
docker compose stop
```

### 提供者コネクタ
#### 起動
```
cd ${WORKDIR}/klab-connector-v4/src/provider
sh ./start.sh
```
#### 終了
```
cd ${WORKDIR}/klab-connector-v4/src/provider
sh ./stop.sh
```

### 認可サーバ
#### 起動
```
cd ${WORKDIR}/klab-connector-v4/misc/authorization
sh ./start.sh
```
#### 終了
```
cd ${WORKDIR}/klab-connector-v4/misc/authorization
sh ./stop.sh
```

### 利用者フォワードプロキシ(利用者から提供者に向けて通信する際(squidを利用のための設定、初回のみ))
#### 起動
```
cd ${WORKDIR}/klab-connector-v4/src/consumer/squid
docker compose -f docker-compose_initial.yml up -d --build ## --buildは初回起動時のみ
docker compose -f docker-compose_initial.yml ps # 正常に稼働しているか確認
```
#### 終了
```
docker compose -f docker-compose_initial.yml down
```

### 利用者コネクタ
#### 起動
```
cd ${WORKDIR}/klab-connector-v4/src/consumer
sh start.sh
```
#### 終了
```
cd ${WORKDIR}/klab-connector-v4/src/consumer
sh ./stop.sh
```

### WebApp
#### 起動
```
cd ${WORKDIR}/ut-cadde_gui
docker compose build
docker compose up -d
```
#### 終了
```
cd ${WORKDIR}/ut-cadde_gui
docker compose down
```

