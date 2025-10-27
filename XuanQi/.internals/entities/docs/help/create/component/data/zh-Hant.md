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




# 創建數據元件幫助部門

這是用於創建獨立式或在更大元件裡綜合化的數據元件的幫助部門。
若要包含資料部分，您只需將`data`填入`[TYPES]`值。例：

```
# 命令模式
$ [XuanQi] create component [TYPES] [NAME]

# 僅數據元件
$ [XuanQi] create component data [NAME]

# 在綜合元件裡包含數據元件
$ [XuanQi] create component "...,data,..." [NAME]
```




## 目的

數據元件主要是為了方便處理專案和元件使用的特定資料集。
這允許您能在無需犧牲可維護性質裡對相同的檔案佈局進行
數據變數渲染更改。玄器有可以無縫匯入所有設定檔(`.conf`)
和Shell(`.sh`)代碼文件內置功能。

在普天之下，玄器將數據元件視為**無數據庫**(noDB)概念
來儲存和處理資料。




## 文件結構

数据组件遵循以下默认文件结构：

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

* 組件文件夾是`Data`。
* 組件操作Shell代碼是位於`XuanQi/import.sh`內。
  它是組建初始化步驟的一部分。




## 主要目標

您的**主要目標是把所有能變量數據源抽象化為項目或組件可用
的數據設施**。如何實現就完全於您來決定。

在每個組件的初始步驟裡，任何組件都可以從內部或跨過其他
組件的數據組件來解析需求。因此，您**必須**在任何情況下
始終保持數據文件的靈活性和可解析性。

您可以參考項目的`XuanQi/.internals/API`以獲取可用的API。




## 配置文件或Shell代碼

玄器提供了2種主要方式來處理數據管理：

* 配置文件(`.conf`)
* Shell代碼文件(`.sh`)

`.conf` 適用來快速設置變量好讓您可以在文件渲染時立即使用。
玄器創建了一個示例文件(`Data/sample.conf`)給您提示建設構造。
**一個文件最好只包含一對鍵值而已**。

`.sh` 實際上是一個可以處理包含函數定義的Shell代碼。它可以
過邏輯條件提供特定的數據。如果您的數據集需要一個或多個條件
來輸出不同的數據（例如，`i18n_`代碼依賴於
`$XUANQI_CONTENT_LANGUAGE`值來返回特定語言的字符），
這Shell代碼方式對您是最好合適。
**請注意：同名的函數在導入期間將被覆蓋**。玄器創建了一個
示例文件(`Data/i18n/title.sh`)供您參考建設構造。

最後一個選項是自己讀取文件夾內的`.txt`文件。由於玄器只解析
`.conf`和`.sh`文件，您可以放心地去使用它。這個方法是運用特定
的數據集名稱作為文件夾的名稱和運用參數名稱來設定數據文件的名稱。
這方法的缺點是佔用更多的IO讀/寫流量而可能會減慢生產項目的出產
速度。由於*滿足需求始終優先於速度的人生標準*，您仍然可以在
需要時考慮使用它。基於i18n方法例子如下：

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

# 在Shell代碼裡使用上述內容
____name="$( \\
    XuanQi_Data_Read_Raw \\
        "${XUANQI_COMPONENT_PATH}/Data/names/${XUANQI_CONTENT_LANGUAGE}.txt" \\
)"
```




### 如何選擇

在盡可能始終和默認情況下使用`.conf`。如果有邏輯需求
（例如條件等），那則使用`.sh`。




## 媒體文件

雖然在技術上媒體文件（例如圖片、音頻、視頻等）是數據，
**請您回避將它們放在此處**。玄器是有個媒體專用處理功能
的`media`組件。請改用該組件。

您應始終將數據組件視為**無數據庫**(`noDB`)。




## 結語

這就是創建數據組件幫助部門的全部內容。
