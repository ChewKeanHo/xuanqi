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




# 歡迎來到玄器的創建組件幫助部分

玄器的主要結構都是使用組件概念來進行操作。在這裡，一切
都是組件。以下是創建組件的總體命令：

```
$ [XuanQi] create component [TYPES] [NAME]
```

其中：

* `[TYPES]`是各種您想嘗試創建的組件的內部組件類型列表。
* `[NAME]`組件名稱的相對文件夾路徑。（例如，根渲染頁面的
  `pages/root`）。

結構輸出將會在`$XUANQI_PATH_COMPONENTS`（源自
`$XUANQI_DIRECTORY_COMPONENTS`）文件夾裡儲存。




## 組件類型

玄器有許多組件類型可供參考，每種類型都有其特定的文檔。
您可以通過執行以下命令來了解更多關於您感興趣的類型：

```
[XUANQI] help create component [TYPE]
```

支持的`[TYPE]`值有如下：
