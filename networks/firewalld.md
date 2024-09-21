# Firewallの設定について
## UbuntuでのFirewall動作確認
```
sudo ufw status
```
## ポート開放(IPv4/v6共に)
```
sudo ufw allow 80
```

## 任意のIPから特定のポートへのアクセスを許可する
```
sudo ufw allow proto tcp to 0.0.0.0/0 port <ポート番号>
```