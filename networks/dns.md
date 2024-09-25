# クライアント側のDNSに関するメモ
## ドメイン名前解決時のサーバとIPアドレスを返すコマンド
```
nslookup example.com
```

## Ubuntuでローカルで動いているDNSサーバを参照するには `/etc/systemd/resolve.conf`を編集して以下のようにする。
### 上から順に該当する名前解決が可能であれば、実行する
```
DNS=127.0.0.1
DNS=10.250.1.2
DNS=8.8.8.8
DNS=1.1.1.1
```
### 注意点として、他のLinuxのように`/etc/resolve.conf`を編集しないこと。Ubuntuではこの設定は無視される模様。この設定読み込みのため、以下のコマンドを実行すること。
```
systemctl restart systemd-resolved
```