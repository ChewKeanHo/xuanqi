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




# パージCLI

`パージ`コマンドラインインターフェース（CLI）は、プロジェクトワークスペ
ースを完全にクリーンアップするためのものです。

デフォルトで以下のパスを削除します：

```
$XUANQI_PATH_LOGS       # 以前のすべてのビルドログ
$XUANQI_PATH_PUBLIC     # すべての出力
$XUANQI_PATH_TEMPS      # 以前のビルドからの一時ファイル
```

サイレントパージとは異なり、このCLIは実際の削除前にターゲットの存在確認
を実行します。それ以外の場合、このCLIは何も行いません。




## 削除通知

XuanQiは実際に削除したターゲットのみを報告します。




## エピローグ

このCLIについては以上です。
