# CADDE環境構築メモ
## CKAN(提供者)の環境設定
- CKAN_SITE_URL
  - `https://cadde-catalog-xxx.site02.dataspace.internal:8443`

## 再開・シャットダウンが必要なシステム一覧
### DNS
#### 開始
```
service named start
```
#### 終了
```
service named stop
```

### WireGuard
#### 開始
```
wg-quick up wg0
```
#### 終了
```
wg-quick down wg0
```

### CKAN
#### 開始
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
#### 開始
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
#### 開始
```
cd ${WORKDIR}/klab-connector-v4/misc/authorization
sh ./start.sh
```
#### 終了
```
cd ${WORKDIR}/klab-connector-v4/misc/authorization
sh ./stop.sh
```
