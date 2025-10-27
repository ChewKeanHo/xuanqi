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




# データコンポーネント作成ヘルプセクション

これは、独立したデータコンポーネントまたは他のより大きなコンポ
ーネントの一部としてデータコンポーネントを作成するためのヘルプ
セクションです。データ部分を含めるには、単に `data`を`[TYPES]`
値に投入してください。例：

```
# コマンドパターン
$ [XuanQi] create component [TYPES] [NAME]

# データコンポーネントのみ
$ [XuanQi] create component data [NAME]

# 複合コンポーネント内にデータ部分を含む
$ [XuanQi] create component "...,data,..." [NAME]
```




## 目的

データコンポーネントは、主にプロジェクトとコンポーネントに特定
のデータセットを提供するためにあります。これにより、同じファイ
ルレイアウトで変数レンダリング変更が可能になり、保守性を犠牲に
することなく出力選択が堅牢になります。玄器には、すべての設定フ
ァイル（`.conf`）とシェルスクリプト（`.sh`）関数をシームレスに
インポートする組み込み機能があります。

一般に、玄器はデータコンポーネントを**データベースなし**（`noDB`）
のデータストアとして扱います。




## ファイル構造

データコンポーネントは以下のデフォルトファイル構造に従います：

```
[XUANQI_PATH_COMPONENTS]
└── [XUANQI_COMPONENT_NAME]
       ├── Data
       │    ├── i18n
       │    │     ├── title.sh
       │    │     └── ...
       │    ├── sample.conf
       │    └── ...
       └── XuanQi
            └── import.sh
```

* コンポーネントディレクトリは `Data` です。
* コンポーネントオペレーターシェルスクリプトは`XuanQi/import.sh`
  内に直接あります。これはコンポーネント初期化の一部です。




## 主目的

あなたの **主目的は、変数データソースを抽象化し、プロジェクトまた
はコンポーネントのデータ機能を作成することです**。その方法は完全に
あなた次第です。

各コンポーネントの初期化時に、どのコンポーネントも内部または他のコ
ンポーネント間からデータコンポーネントを解析できます。したがって、
データディレクトリは常に柔軟で解析可能に **維持しなければなりません**。

利用可能なAPIについては、プロジェクトの`XuanQi/.internals/API`を参照
できます。




## 設定ファイルまたはシェルスクリプト

玄器はデータ管理に対処するための2つの主要な方法を提供します：

* 設定ファイル（`.conf`）
* シェルスクリプト関数ファイル（`.sh`）

`.conf` は、変数を素早く設定するのに適しており、ファイルレンダリング
にその値をすぐに使用できます。作成方法についてはサンプルファイル
（`Data/sample.conf`）が作成されます。**1つのファイルには1つのキーと
値のペアのみを含めるべきです**。

`.sh` は実際には、論理条件によってデータを提供する関数定義を含むシェ
ルスクリプトです。これは、データセットが1つ以上の条件を必要として出力
を異なる方法でレンダリングする場合（例：`i18n_` 関数は
`$XUANQI_CONTENT_LANGUAGE` フラグに依存して言語固有の文字列を返す）に最
も適しています。**注意：同じ名前の関数はインポート中に上書きされます**。
参照用にサンプルファイル（`Data/i18n/title.sh`）が作成されます。

最後のオプションは、ディレクトリ内の`.txt`ファイルを手動で読み取るこ
とです。玄器は`.conf`と `.sh` のみを解析するため、安全に使用できます。
これは、特定のデータセット名をディレクトリ名として整理し、ファイル名を
厳密にパラメーター名として残すことによって行われます。欠点は、この方法
がより多くのIO読み書きトラフィックを占有し、生産を遅くする可能性がある
ことです。ただし、*要件の満足は常に速度よりも優先される*ため、必要に応
じて使用を検討できます。テキストファイルベースのi18nアプローチの例：

```
[XUANQI_PATH_COMPONENTS]
└── [XUANQI_COMPONENT_NAME]
       ├── Data
       │    ├── names
       │    │     ├── de.txt
       │    │     ├── en.txt
       │    │     ├── es.txt
       │    │     └── ...
       │    └── ...
       └── ...

# 上記をシェルスクリプトで使用
____name="$( \\
    XuanQi_Data_Read_Raw \\
        "${XUANQI_COMPONENT_PATH}/Data/names/${XUANQI_CONTENT_LANGUAGE}.txt" \\
)"
```



### 選択方法

常にデフォルトで可能な限り `.conf` を使用してください。ロジック要件
（例：条件など）がある場合は、`.sh` を使用してください。




## メディアファイル

技術的にはメディアファイル（例：画像、オーディオ、ビデオなど）はデ
ータですが、**ここに配置するのは避けてください**。専用の処理機能を
持つ専用の `media` コンポーネントがあります。代わりにそれを使用して
ください。

データコンポーネントは常に**データベースなし**（`noDB`）として扱う
べきです。




## エピローグ

データコンポーネント作成ヘルプセクションは以上です。
