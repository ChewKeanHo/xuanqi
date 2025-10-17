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




# 創建數據文件CLI

`create data` 命令行介面（CLI）用於建立可在整個專案中使用的單一
項目`.conf` 數據文件。其完整指令如下：

```
$ [XUANQI] create data [RELATIVE_PATH] [KEY] [VALUE]
```

* `[RELATIVE_PATH]`
  * **必填**
  * 以 `.conf` 檔案副檔名結尾的相對（從 `$PROJECT_PATH_ROOT` 開始）
    檔案路徑。
  * 如果未提供 `.conf` 檔案副檔名，玄器會在內部附加它。
  * 檔案名稱由您自行決定。它不會影響玄器。
* `[KEY]`
  * **必填**
  * `key:value` 項目的 `key` 標籤。
  * 使用底線（`_`），因為該鍵將用作環境變數。
  * 確保該值是唯一的。否則，跨多個設定檔案的相同鍵可能導致不可
    預測的後果（最後解析的檔案將覆寫其前面的檔案）。
* `[VALUE]`
  * **隨和**
  * `key:value` 項目的 `value` 標籤。
  * 留空時，將替換為範例文字，您可以在之後更新該檔案。




## 路徑限制

出於安全原因，玄器只允許在 `$PROJECT_PATH_ROOT` 內建立資料檔案。
否則，它將引發錯誤並且不執行任何操作。




## 結語

此 CLI 的內容就到此爲止。
