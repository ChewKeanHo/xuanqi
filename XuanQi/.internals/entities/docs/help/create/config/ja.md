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




# 設定ファイル作成CLI

`create config` コマンドラインインターフェース（CLI）は、プロジェクト
全体で使用可能な単一エントリの `.conf` データファイルを作成するための
ものです。完全なコマンドは以下のとおりです：

```
$ [XUANQI] create config [RELATIVE_PATH] [KEY] [VALUE]
```

* `[RELATIVE_PATH]`
  * **必須**
  * `$XUANQI_PATH_CONFIGS` からの相対パスで、`.conf` ファイル拡張子
    で終わるもの。
  * `.conf` ファイル拡張子が提供されていない場合、玄器は内部でそれ
    を追加します。
  * `.conf` ファイルがプロジェクト設定ディレクトリの外にある場合、ま
    たはディレクトリが存在しない場合、エラーが発生します。
  * ファイル名は任意です。玄器には影響しません。
* `[KEY]`
  * **必須**
  * `key:value` エントリの `key` ラベル。
  * キーは環境変数として使用されるため、アンダースコア（`_`）を使用
    してください。
  * 値が一意であることを確認してください。そうでない場合、複数の設定
    ファイルで同じキーを使用すると、予測できない結果（最後に解析され
    たファイルが前のものを上書き）を引き起こす可能性があります。
* `[VALUE]`
  * **任意**
  * `key:value` エントリの `value` ラベル。
  * 空のままにすると、後でファイルを更新できるサンプルテキストが置き
    換えられます。




## パス制限

セキュリティ上の理由から、玄器はデータファイルを `$PROJECT_PATH_ROOT`
内でのみ作成できます。それ以外の場合は、エラーが発生し何も行われません。

この作成のみ、**厳密に** `$XUANQI_PATH_CONFIGS` ディレクトリ（これも
`$PROJECT_PATH_ROOT`内にあります）に制限されています。




## 既知のドキュメント

サポートされている環境変数と一致する `[KEY]` に応じて、生成された設定
ファイルには独自の専用ドキュメントがある場合があります。以下を参照し
てください：

```
$ [XUANQI] help variables
```

サポートされている変数のリストについては。




## エピローグ

このCLIについては以上です。
