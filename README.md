# Gawain AI Video - WordPress Demo

[Gawain AI Video](https://github.com/nogeass/gawain-wordpress-plugin) プラグインの動作を確認するためのサンプル WordPress 環境です。
Docker Compose で WordPress + WooCommerce + プラグインが一発で立ち上がります。

## Prerequisites

- [Docker Desktop for Mac](https://www.docker.com/products/docker-desktop/) (Docker Compose v2 含む)
- [gawain-wordpress-plugin](https://github.com/nogeass/gawain-wordpress-plugin) が隣のディレクトリにクローンされていること

## Quick Start

```bash
# プラグイン本体を隣にクローン (まだなければ)
git clone https://github.com/nogeass/gawain-wordpress-plugin.git

git clone https://github.com/nogeass/gawain-sample-wordpress.git
cd gawain-sample-wordpress

# (任意) .env をカスタマイズ
cp .env.example .env

# 起動
docker compose up -d
```

初回は WordPress のインストール・WooCommerce の導入・サンプル商品の作成が自動で行われます。
ログに `Setup complete!` と表示されたら準備完了です。

```bash
# セットアップログを確認
docker compose logs wpcli
```

## Access

| URL | 用途 |
|---|---|
| http://localhost:8080 | WordPress サイト |
| http://localhost:8080/wp-admin | 管理画面 |

**管理者アカウント**: `admin` / `admin`

## Gawain AI Video の設定

1. 管理画面にログイン
2. **WooCommerce → Gawain AI** に移動
3. Settings タブで API キーを入力 (https://gawain.nogeass.com で取得)
4. 「External processing」の同意を有効化
5. Products タブから商品を選んで動画生成を実行

## Commands

```bash
# 起動
docker compose up -d

# 停止
docker compose down

# 停止 + データ削除 (DB・WordPress ファイルをリセット)
docker compose down -v

# WP-CLI を実行
docker compose run --rm wpcli wp plugin list
```

## Structure

```
../
├── gawain-wordpress-plugin/  # プラグイン本体 (別リポ、docker-compose でマウント)
└── gawain-sample-wordpress/  # ← このリポジトリ
    ├── docker-compose.yml    # WordPress + MySQL + WP-CLI
    ├── setup.sh              # 初回セットアップスクリプト (WP-CLI)
    ├── .env.example          # 環境変数テンプレート
    └── README.md
```

## License

This demo repository is provided under the [MIT License](https://opensource.org/licenses/MIT).
The Gawain AI Video plugin itself is licensed under GPLv2 or later.
