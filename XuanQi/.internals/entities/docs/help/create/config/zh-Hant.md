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




# 建立設定資料檔案CLI

`create config`命令列介面（CLI）用於建立在整個專案中使用
的單一項目`.conf` 資料檔案。其完整指令如下：

```
$ [XUANQI] create config [RELATIVE_PATH] [KEY] [VALUE]
```

* `[RELATIVE_PATH]`
  * **必需**
  * 以`.conf`檔案副檔名結尾的相對（從`$XUANQI_PATH_CONFIGS`開始）
    檔案路徑。
  * 如果未提供`.conf`檔案副檔名，玄器將在內部附加它。
  * 如果`.conf`檔案位於專案設定目錄之外，或者目錄根本不存在，
    則會引發錯誤。
  * 檔案名字由您自由決定。它不影響玄器。
* `[KEY]`
  * **必需**
  * `key:value`項目的`key`標籤。
  * 使用底線（`_`），因為該鍵將作為環境變數運用。
  * 確保該值是唯一的。否則，跨多個設定檔案的相同鍵可能導致
    不可預測的後果（最後解析的檔案會覆蓋其前面的檔案）。
* `[VALUE]`
  * **隨和**
  * `key:value`項目的`value`標籤。
  * 若留空時，它將被為範例文字替換。您可以在以後更新該檔案。




## 路徑限制

出於安全原因，玄器只允許在`$PROJECT_PATH_ROOT`文件夾內建立
資料檔案。否則，它將引發錯誤並且不執行任何操作。

僅對於此建立功能，它**嚴格**限制只能在`$XUANQI_PATH_CONFIGS`
文件夾內創作（該目錄也位於`$PROJECT_PATH_ROOT`內）。




## 已知文件

根據`[KEY]`是否與受支援的環境變數匹配，產生的設定檔案可以擁有
自己專用的文件。請參閱：

```
$ [XUANQI] help variables
```

以取得受支援變數的清單。




## 結語

這就是此CLI的全部內容。
