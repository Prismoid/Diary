# Bitcoin関連コマンドやプログラム。
## bitcoindの起動。-txindex=1 -prune=0 オプションで、ブロックチェーンに含まれた全トランザクション情報にアクセスできるように。
```
sh st-btc.sh
```
## bitcoinのTX情報を再インデックスするオプション -reindex （結構時間がかかる）
```
sh reindex-btc.sh
```

## bitcoindの終了
```
bitcoin-cli stop
```

## ブロックの情報を取得
```
bitcoin-cli help # ヘルプ
bitcoin-cli getblockcount # ブロック高取得
bitcoin-cli getblockchaininfo # ブロックチェーンの情報を取得
```
## 設定ファイルは"/home/<ユーザ名>/.bitcoin/bitcoin.conf"にある
## db4はBerkleyDB4.8をコンパイルするためのディレクトリ


