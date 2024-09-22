# WireGuardクライアントの設定方法

## Ubuntuでデバイス接続する場合:
### 最初にWireGuardソフトウェアをインストールする
```
$ sudo apt-get install wireguard
```

### 続いて /etc/wireguard/wg0.conf を以下のように編集する
```
[Interface]
PrivateKey = クライアントの秘密鍵
Address = 10.0.0.2 (クライアントのIPアドレス)

[Peer]
PublicKey = サーバーの公開鍵
EndPoint = サーバーのIPアドレス:51820
AllowedIPs = 10.0.0.0/24 (WireGuardを経由して通信する先のIPアドレス)
```

### 最後に、以下のコマンドでクライアントからVPNへ接続する。
```
$ wg-quick up wg0
```

#### ※ここでエラーが出た場合、以下のようなシンボリックリンクを作成することでエラーを回避できる。
```
sudo ln -s /usr/bin/resolvectl /usr/local/bin/resolvconf
```

### WireGuardのNIC(wg0)の停止方法
```
wg-quick down wg0
```

### WireGuardの状態を確認
```
wg show
```