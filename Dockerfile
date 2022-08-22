# ベースにpython 3.10 slimイメージを使用
FROM python:3.10-slim
# 環境変数設定
# APP_HOMEに/appをセット
ENV APP_HOME /app
# 作業ディレクトリを/appに設定
# ここからコンテナ内の/app内で実行される
WORKDIR $APP_HOME

# ビルドコンテキストのファイルをすべて/appへコピー
COPY . ./
# pythonの依存ライブラリインストール
RUN pip install --no-cache-dir -r requirements.txt
# アプリケーション実行コマンド
CMD exec gunicorn --bind :5000 main:app