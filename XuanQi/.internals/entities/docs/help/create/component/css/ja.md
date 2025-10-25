# Copyright 2025 (Holloway) Chew, Kean Ho <hello@hollowaykeanho.com>
# Copyright 2024 (Holloway) Chew, Kean Ho <hello@hollowaykeanho.com>
# Copyright 2023 (Holloway) Chew, Kean Ho <hollowaykeanho@gmail.com>
# Copyright 2023 "Holloway" Chew, Kean Ho <kean.ho.chew@zoralab.com>
# Copyright 2023 ZORALab Enterprise <tech@zoralab.com>
#
#
# Licensed under (Holloway) Chew, Kean Ho's Liberal License (the 'License').
# You must comply with the license to use the content. Get the License at:
#
# https://doi.org/10.5281/zenodo.13770769
#
# You MUST ensure any interaction with the content STRICTLY COMPLIES with
# the permissions and limitations set forth in the license.




# CSSコンポーネントヘルプセクションの作成

これは、CSSコンポーネントを独立して、または他のより大きなコンポー
ネントの一部として作成するためのヘルプセクションです。CSS部分を含
めるには、`[TYPES]`値に`css`を入力するだけです。例：

```
# コマンドパターン
$ [XuanQi] create component [TYPES] [NAME]

# CSSコンポーネントのみ
$ [XuanQi] create component css [NAME]

# 複合コンポーネント内のCSS部分を含む
$ [XuanQi] create component "...,css,..." [NAME]
```



## 目的

CSSコンポーネントは主にCSSアセット出力ファイル（例：`page.css`）
を作成するためのものです。玄器には`Shell`関数の組み込み機能と
通常のCSSファイルのコピーの両方があります。




## ファイル構造

CSSコンポーネントは次のデフォルトのファイル構造に準拠します：

```
[XUANQI_PATH_COMPONENTS]
└── [XUANQI_COMPONENT_NAME]
       ├── CSS
       │    ├── sample.css
       │    ├── ...
       │    └── xuanqi.sh
       └── XuanQi
            └── import.sh
```

* コンポーネントディレクトリは`CSS`です。
* コンポーネントオペレーターシェルスクリプトは`CSS/xuanqi.sh`です。
* コンポーネントオペレーターシェルスクリプトはメインコンポーネント
  インポーターシェルスクリプト`XuanQi/import.sh`によって呼び出され
  ます。




## `CSS/xuanqi.sh`メインスクリプト

あなたの**最終的な目標は、CSS出力ファイルを`$XUANQI_CONTENT_PATH`に
独自の方法で書き込むことです**。どのように行うかは完全にあなた次第
です。

複数のルータースクリプトがファイルレンダリングのために同じコンポー
ネントを呼び出すことができます（例：同じコンテンツに対してモバイル、
印刷、メールなどの異なるメディアターゲット）。したがって、ルータース
クリプトでユーザーが設定できる必要な環境変数を戦略的に設計する必要が
あります。

その後、`CSS/xuanqi.sh`の実行中にこれらの環境変数を解析し、それに応じ
て反応します。

利用可能なAPIについては、プロジェクトの`XuanQi/.internals/API`を
参照できます。




## プログラムで作成またはコピー

玄器は、CSSファイルを簡単にレンダリングするために、プログラム可能な
関数と生のコピー関数の両方を提供します。決定はあなたのチーム次第です。

チームがシェルスクリプトに慣れていない場合は、後者が推奨されます。
これにより、玄器が`$XUANQI_CONTENT_PATH`にコピーする間、チーム全体
が提供された`.css`ファイルで作業できます。これは`Sass`コンパイラを使用
する人に最適です。

玄器のシェルスクリプトプログラマブル関数は、レンダリングに対するよ
り大きな社内の柔軟性を促進します（CSS記述に対するマクロと考えてく
ださい）。利点は、依存関係がなく、コンテンツジェネレーターと非常に柔軟
であることです。これは`Sass`を障害と見なす経験豊富なCSS開発者に適し
ています。

いずれにせよ、あなたは良い手に委ねられています。ただ試してみて、時間
の経過とともに適応してください。




## エピローグ

CSSコンポーネント作成ヘルプセクションについては以上です。
