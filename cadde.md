# CADDE環境構築メモ
## CKAN(提供者)の環境設定
- CKAN_SITE_URL
  - `http://localhost:8443`

## シャットダウン時に再開すべきシステム一覧
```
cd ${WORKDIR}/ckan-docker
docker compose up -d
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

