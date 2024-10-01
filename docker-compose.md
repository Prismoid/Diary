# Docker Composeの使い方についてメモOA

## サンプルとするHTTPサーバ(Flask実装、[こちらのWebsite](https://snowsystem.net/container/docker/python-flask-demo/#)を参考
### ディレクトリ構成(treeコマンドで表示。brewやaptでインストール可)

```txt
.
├── Dockerfile
├── app.py
└── templates
    ├── hello.html
    └── index.ht
```

### 各種ファイルについて解説

#### `app.py`

```python
from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/<name>')
def hello(name):
    return render_template('hello.html', title='呼び出し側でタイトル設定', name=name)

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=8000)
```

#### `templates/index.html`

```html
<html>
<title>docker demo flask</title>
<head></head>
<body>
トップページです。
</body>
</html>
```

#### `templates/hello.html`

```html
<html>
<head>
<title>{{ title }}</title>
</head>
<body>
Hello
{{ name }}さん。
</body>
</html>
```

#### `Dockerfile` (これをベースにイメージからビルド、コンテナを作成する)

```txt
# python 3.12 をベースにDockerイメージを作成
FROM python:3.12

# 作業ディレクトリを指定
WORKDIR /app

# カレントディレクトリのファイルをDockerコンテナの｢/app｣ ディレクトリにコピー
ADD . /app

# Flaskをインストール
RUN pip install Flask

# 外部に公開するポートを指定
EXPOSE 8000

# コンテナの実行コマンドを指定
CMD ["python", "app.py"]
```