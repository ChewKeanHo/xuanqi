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




# 創建CSS組件幫助部分

這是用於可以獨立性或在另一個更大組件作為一部分創建CSS組件的
幫助部分。要包含CSS部分，只需將`css`輸入到`[TYPES]`值中。
示例：

```
# 命令模式
$ [XuanQi] create component [TYPES] [NAME]

# 僅CSS組件
$ [XuanQi] create component css [NAME]

# 在複合組件中包含CSS部分
$ [XuanQi] create component "...,css,..." [NAME]
```




## 目的

CSS組件主要用於創建輸出CSS資源文件（例如：`page.css`）。
玄器在`Shell`代碼庫具有內置功能和可複製已有的CSS文件功能。




## 文件結構

CSS組件遵循以下默認文件夾結構：

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

* 組件文件夾是`CSS`。
* 組件操作器shell代碼文件是`CSS/xuanqi.sh`。
* 組件操作器shell代碼文件會由`XuanQi/import.sh`主組件導入調用。




## `CSS/xuanqi.sh`主要代碼文件

您的**最終主要目標是以您自己的方式將CSS文件給輸出入
`$XUANQI_CONTENT_PATH`。方式是由您來完全決定。

多個`routers`可以調用同一個組件進行它的文件渲染（例如：在相同的內容
有不同媒體目標如移動設備、打印、電子郵件等等）。因此，您應該以戰略性
的設計技術來設計所需的環境變量供用戶在`routers`里設置。

之後在執行`CSS/xuanqi.sh`時，您通過解析這些環境變量來做出回應。

您可以參考`XuanQi/.internals/API`文件夾以了解現有的API功能。




## 編程方式或複製

玄器提供可編製方式功能和原始性複製功能來輕鬆地渲染CSS文件。
至於如何決定就從您的團隊開始。

如果您的團隊不熟悉shell代碼編寫，那後者功能會比較合適。這樣整個團隊
可以在提供的`.css`文件上工作而玄器只需將其原始性複製入
`$XUANQI_CONTENT_PATH`。這對於使用`Sass`編譯器的隊員來說非常棒的選擇。

玄器的Shell可編製方式功能能促進了渲染方面更大的內部靈活性
（考慮在CSS編寫之上的宏層）。這功能優點是沒有任何依賴性，並且與您的
內容生成器擁有極其靈活。這適和經驗豐富開發者
（那些已經覺得`Sass`視為障礙者）。

無論如何，您都在好意里發展。您只需在時間允許里嘗試並進行需要相應調整
就行了。




## 結語

這就是創建CSS組件幫助部分的全部內容。
