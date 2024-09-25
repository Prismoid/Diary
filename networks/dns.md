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

## MACでローカルで名前解決する方法
### `/etc/hosts`ファイルを編集する。例えば、以下のようにする。
```
127.0.0.1    example.com
127.0.0.1    www.example.com
```

#### ※ この際、dig, nslookup, そして host コマンドは /etc/hosts を参照しない
#### 従って、ping コマンドやブラウザで適切に名前解決できているか確かめること。
```
ping example.com
```