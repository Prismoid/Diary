# CADDE環境構築メモ
## CKAN(提供者)の環境設定
- CKAN_SITE_URL
  - `https://cadde-catalog-xxx.site02.dataspace.internal:8443`

## 再起動時に再開すべきシステム一覧
### CKAN
```
cd ${WORKDIR}/ckan-docker
docker compose up -d
```
### 提供者コネクタ
```
cd ${WORKDIR}/klab-connector-v4/src/provider
sh ./start.sh
```

### DNS
```
service named start
```
### WireGuard
```
wg-quick up wg0
```

## シャットダウン時に停止すべきシステム一覧
### CKAN
```
cd ${WORKDIR}/ckan-docker
docker compose stop
```

### 提供者コネクタ
```
cd ${WORKDIR}/klab-connector-v4/src/provider
sh ./stop.sh
```

### DNS
```
service named stop
```

### WireGuard
```
wg-quick down wg0
```