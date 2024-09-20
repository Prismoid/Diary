# CADDE環境構築メモ
## CKAN(提供者)の環境設定
- CKAN_SITE_URL
  - `http://localhost:8443`

## 再起動時に再開すべきシステム一覧
### CKAN
```
cd ${WORKDIR}/ckan-docker
docker compose up -d
```
### DNS
```
service named start
```

## シャットダウン時に停止すべきシステム一覧
### CKAN
```
cd ${WORKDIR}/ckan-docker
docker compose stop
```

### DNS
```
service named stop
```

