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
#
# NOTE: The license notice and this comment will not be rendered. New line
#       begins with the first non-empty line below.




# 歡迎！

這是一個多章節的文件。它專門採用「業務需知」策略來縮小這龐大閱讀材料的範圍。

請查看以下內容！




## 快速指南

適用於只需快速複習的資深使用者：

* `[XUANQI] build` - 建構整個專案。
* `[XUANQI] create [類型] [值1] [值2] ...`   - 建立某些內容。
* `[XUANQI] purge` - 清理整個專案。

一些不應刪除的重要目錄：

* `configs`
  * 存放 XuanQi 的工作區配置。請勿刪除此處的內容。
  * 硬編碼為 `configs/` 目錄名。
* `components`
  * 存放所有外部模組化元件。
* `layouts`
  * 存放 XuanQi 工作區的所有頁面佈局，供路由器渲染。
* `public`
  * 按照 `routers` 定義的結構存放 XuanQi 的所有輸出檔案。
* `routers`
  * 映射專案的檔案結構和輸出渲染腳本。
* `tests`
  * 存放 XuanQi 工作區的所有自我測試腳本。




## 關於語言

XuanQi 透過 `$XUANQI_LANGUAGE` 環境變數支援以下語言，該變數可使用
`configs/xuanqi.conf` 配置檔案或系統 `$LANG` 環境變數設定。

* (de) Deutsch
* (en) English （默認和後備）
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

這會開啟 `build` 指令的說明索引部分，涵蓋其所有規範。




## Create

```
$ [XUANQI] help create
```

這會開啟 `create` 指令的說明索引部分，涵蓋其所有規範。




## Purge

```
$ [XUANQI] help purge
```

這會開啟 `purge` 指令的說明索引部分，涵蓋其所有規範。




## Test

```
$ [XUANQI] help test
```

這會開啟 `test` 指令的說明索引部分，涵蓋其所有規範。
