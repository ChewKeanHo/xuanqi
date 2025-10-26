[//]: # Copyright 2025 (Holloway) Chew, Kean Ho <hello@hollowaykeanho.com>
[//]: # Copyright 2024 (Holloway) Chew, Kean Ho <hello@hollowaykeanho.com>
[//]: # Copyright 2023 (Holloway) Chew, Kean Ho <hollowaykeanho@gmail.com>
[//]: # Copyright 2023 "Holloway" Chew, Kean Ho <kean.ho.chew@zoralab.com>
[//]: # Copyright 2023 ZORALab Enterprise <tech@zoralab.com>
[//]: #
[//]: #
[//]: # Licensed under (Holloway) Chew, Kean Ho's Liberal License (the
[//]: # 'License'). You must comply with the license to use the content.
[//]: # Get the License at:
[//]: #
[//]: # https://doi.org/10.5281/zenodo.13770769
[//]: #
[//]: # You MUST ensure any interaction with the content STRICTLY COMPLIES
[//]: # with the permissions and limitations set forth in the license.




# ようこそ！

これは複数セクションからなるドキュメントです。この大量の読書資料の範囲を絞
るために、「ビジネスニーズに応じて知る必要がある」ポリシーを使用して特別に
設計されています。

以下をご覧ください！



## クイックガイド

簡単な復習が必要な熟練ユーザーのために：

* `[XUANQI] build` - プロジェクト全体をビルドします。
* `[XUANQI] create [タイプ] [値1] [値2] ...`   - 何かを作成します。
* `[XUANQI] purge` - プロジェクト全体をクリーンアップします。

削除してはいけない重要なディレクトリ：

* `configs`
  * XuanQiのワークスペース設定を格納しています。ここにあるものは削除しないで
    ください。
  * ディレクトリ名は `configs/` にハードコードされています。
* `components`
  * すべての外部モジュラーコンポーネントを格納しています。
* `layouts`
  * ルーターがレンダリングするためのXuanQiワークスペースのすべてのページレイ
    アウトを格納しています。
* `public`
  * `routers` で定義された構造で、XuanQiの出力ファイルをすべて格納しています。
* `routers`
  * プロジェクトのファイル構造と出力レンダリングスクリプトをマッピングします。
* `tests`
  * 自己テスト用のXuanQiワークスペースのすべてのテストスクリプトを格納してい
    ます。




## 言語について

XuanQiは、`configs/xuanqi.conf` 設定ファイルまたはシステムの `$LANG` 環境変数を
使用して設定された `$XUANQI_LANGUAGE` 環境変数を介して、以下の言語をサポートし
ています。

* (de) Deutsch
* (en) English （デフォルトおよびフォールバック）
* (es) Español
* (fr) Français
* (ja) 日本語
* (ko) 한국어
* (mn-Cyrl) Монгол
* (ms) Bahasa Melayu
* (nb) Norsk Bokmål
* (nl) Nederlands
* (nn) Norsk Nynorsk
* (ru) Pусский
* (sv) Svenska
* (uk) Yкраїнська
* (zh-Hans) 华语（简体）
* (zh-Hant) 華語（繁體）




## Build

```
$ [XUANQI] help build
```

これにより、`build` コマンドのヘルプインデックスセクションが開き、そのすべての
仕様が表示されます。




## Create

```
$ [XUANQI] help create
```

これにより、`create` コマンドのヘルプインデックスセクションが開き、そのすべての
仕様が表示されます。




## Purge

```
$ [XUANQI] help purge
```

これにより、`purge` コマンドのヘルプインデックスセクションが開き、そのすべての
仕様が表示されます。




## Test

```
$ [XUANQI] help test
```


これにより、`test` コマンドのヘルプインデックスセクションが開き、そのすべての
仕様が表示されます。
