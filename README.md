# my-blog

Haskell (Yesod) で構築する個人ブログ。

## セットアップ

1. [Stack](https://haskell-lang.org/get-started) をインストール
   * POSIX 系: `curl -sSL https://get.haskellstack.org/ | sh`
2. `yesod` CLI をインストール: `stack install yesod-bin --install-ghc`
3. ライブラリのビルド: `stack build`

> **注意:** 初回は GHC のダウンロードと依存ライブラリのコンパイルが走るため、10〜30分程度かかることがある。

詳細は [Yesod Quickstart ガイド](https://www.yesodweb.com/page/quickstart) を参照。

## ディレクトリ構成

```
my-blog/
├── app/                          -- エントリーポイント（main関数）
├── config/
│   ├── models.persistentmodels   -- DB テーブル定義（スキーマ）
│   ├── routes.yesodroutes        -- URL ルーティング定義
│   ├── settings.yml              -- アプリ設定（ポート番号等）
│   └── keter.yml                 -- デプロイ設定
├── src/
│   ├── Foundation.hs             -- アプリの土台（型定義・認証・ミドルウェア）
│   ├── Model.hs                  -- DB モデル
│   ├── Application.hs            -- アプリの組み立て・初期化
│   ├── Settings.hs               -- settings.yml の読み込み
│   ├── Import.hs                 -- 共通 import をまとめたモジュール
│   └── Handler/                  -- リクエストハンドラー（Controller 相当）
├── templates/                    -- テンプレート（View 相当）
│   ├── *.hamlet                  -- HTML（Hamlet テンプレート）
│   ├── *.lucius                  -- CSS（Lucius テンプレート）
│   └── *.julius                  -- JS（Julius テンプレート）
├── static/                       -- 静的ファイル（CSS, フォント, 画像等）
├── test/                         -- テストコード
├── package.yaml                  -- 依存パッケージ定義
└── stack.yaml                    -- Stack のスナップショット設定
```

## 開発

開発サーバーの起動:

```
stack exec -- yesod devel
```

コードを変更すると自動でリコンパイル・再デプロイされる。

## テスト

```
stack test --flag my-blog:library-only --flag my-blog:dev
```

`yesod devel` は `library-only` と `dev` フラグを使うため、同じフラグを指定すると開発とテストで再コンパイルが不要になり、最適化も無効化されるためテストのコンパイルが速くなる。

## ドキュメント

* [Yesod Book](https://www.yesodweb.com/book) — オンラインで無料で読める
* [Stackage](http://stackage.org/) — LTS に含まれるパッケージのドキュメント。[Hoogle で検索](https://www.stackage.org/lts/hoogle?q=)も可能（LTS バージョンは `stack.yaml` に記載）
* ローカルドキュメント:
  * `stack haddock --open` — 依存パッケージの Haddock ドキュメントを生成してブラウザで開く
  * `stack hoogle <関数名, モジュール名, 型シグネチャ>` — Hoogle データベースを生成して検索
* [Yesod cookbook](https://github.com/yesodweb/yesod-cookbook) — 用途別のサンプルコード集
