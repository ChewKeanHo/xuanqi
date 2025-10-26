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




# 玄器のコンポーネント作成ヘルプセクションへようこそ

玄器は主にコンポーネントの概念を使用して動作しています。
すべてがコンポーネントで構成されています。以下はコンポ
ーネントを作成するための基本コマンドです：

```
$ [XuanQi] create component [TYPES] [NAME]
```

ここで：

* `[TYPES]` は作成しようとしているコンポーネント内のコン
  ポーネントタイプのリストです。
* `[NAME]` はコンポーネント名への相対パスです（例：ルート
  レンダリングページの場合は `pages/root`）。

出力は `$XUANQI_PATH_COMPONENTS` ディレクトリに保存されます
（`$XUANQI_DIRECTORY_COMPONENTS` から派生）。




## コンポーネントタイプ

いくつかのコンポーネントタイプがあり、それぞれに固有のドキ
ュメントがあります。興味のあるタイプについて詳しくは、次のコ
マンドを実行してください：

```
[XUANQI] help create component [TYPE]
```

サポートされている `[TYPE]` は次のとおりです：
