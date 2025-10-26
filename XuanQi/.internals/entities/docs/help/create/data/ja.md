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




# データファイルCLIの作成

`create data` コマンドラインインターフェース（CLI）は、プロジェクト全体
で使用できる単一エントリの`.conf` データファイルを作成するためのもので
す。完全なコマンドは以下のとおりです：

```
$ [XUANQI] create data [RELATIVE_PATH] [KEY] [VALUE]
```

* `[RELATIVE_PATH]`
  * **必須**
  * `$PROJECT_PATH_ROOT` からの相対ファイルパスで、`.conf` ファイル拡
    張子で終わるもの。
  * `.conf` ファイル拡張子が提供されない場合、玄器は内部でそれを追加し
    ます。
  * ファイル名は任意です。玄器には影響しません。
* `[KEY]`
  * **必須**
  * `key:value` エントリの `key` ラベル。
  * キーは環境変数として使用されるため、アンダースコア（`_`）を使用し
    てください。
  * 値が一意であることを確認してください。そうでない場合、複数の設定フ
    ァイルで同じキーが使用されると、
    予測できない結果（最後に解析されたファイルが前のファイルを上書き）を
    引き起こす可能性があります。
* `[VALUE]`
  * **任意**
  * `key:value` エントリの `value` ラベル。
  * 空のままにすると、後でファイルを更新できるサンプルテキストが置き換
    えられます。




## パス制限

セキュリティ上の理由から、玄器はデータファイルを `$PROJECT_PATH_ROOT`
内でのみ作成することを許可しています。それ以外の場合、エラーが発生し、
何も行われません。




## エピローグ

この CLI については以上です。
