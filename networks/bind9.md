# Ubuntu22.04でDNS(Bind9)を動かす
## 参考サイト: https://envader.plus/article/212
## bindのインストール(bind9utils, bind9-docは、BIND(Berkeley Internet Name Domain)を補助するパッケージ。学習用)
```
sudo apt-get install bind9 bind9utils bind9-doc
```
## 状態の確認
```
sudo systemctl status bind9
```
## サービスコマンド（起動、停止、再起動）
```
service named start
service named stop
service named restart
service named reload (キャッシュを削除せずに、設定変更を反映させたい時)
```
## スクリプト(起動、停止、リロードなど)
```
/etc/init.d/named start
/etc/init.d/named stop
/etc/init.d/named status
/etc/init.d/named reload (キャッシュを削除せずに、設定変更を反映させたい時)
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

## Zoneファイルの設定(Aレコードで単純な名前解決)。`/etc/bind/example.com.zone`を編集。(admin@example.comが連絡先となる)
```
$TTL 86400
@    IN  SOA  ns1.example.com. admin.example.com. (
            2023092101 ; Serial
            3600       ; Refresh (1 hour)
            1800       ; Retry (30 minutes)
            1209600    ; Expire (2 weeks)
            86400      ; Minimum TTL (1 day)
)

; ネームサーバの定義
@    IN  NS   ns1.example.com.

; Aレコード（ドメインを192.168.0.200に関連付け）
@    IN  A    192.168.0.200
ns1  IN  A    192.168.0.200
abc  IN  A    192.168.0.201 

; その他のAレコードやCNAMEを追加する場合はここに記述
```

## Zoneファイルの読込。BINDの設定ファイル`/etc/bind/named.conf.local`を編集
```
zone "example.com" {
    type master;
    file "/etc/bind/example.com.zone";
};
```
### 上記の設定後にリロードを忘れないようにする。すると、`nslookup`コマンドを利用して、以下のように名前解決できる。(192.168.0.200はDNSサーバが動いているマシンのアドレス)
```
nslookup abc.example.com 192.168.0.200
```

#### ※これらはドメイン毎にゾーンファイルを作成して管理する必要がある。(SOA(Start of Authority)がドメインに対して一意であるといった理由から)

## ゾーンファイルの書式の正しさの確認(第二引数はファイルへのパス)
### 問題がなければ下記コマンドを実行後にOKと出力される。
```
sudo named-checkzone example.com.zone /etc/bind/example.com.zone
```

## 名前管理の委任（ゾーンファイルへの記述）
```
$TTL 86400
@    IN  SOA  ns1.example.com. admin.example.com. (
            2023092101 ; Serial
            3600       ; Refresh (1 hour)
            1800       ; Retry (30 minutes)
            1209600    ; Expire (2 weeks)
            86400      ; Minimum TTL (1 day)
)

; ネームサーバの定義
@    IN  NS   ns1.example.com.
sub  IN  NS   ns1.sub.example.com.;サブドメインを管理する名前サーバ

; Aレコード（ドメインを192.168.0.200に関連付け）
@    IN  A    192.168.0.200
ns1  IN  A    192.168.0.200
abc  IN  A    192.168.0.201
ns1.sub.example.com IN A 192.168.1.200;別のNSに名前解決を依頼することを意味する

; その他のAレコードやCNAMEを追加する場合はここに記述
```
