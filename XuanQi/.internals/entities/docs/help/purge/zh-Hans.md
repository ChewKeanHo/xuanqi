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




# Purge CLI

`Purge`命令行界面（CLI）用于完全清理项目工作区。

默认情况下，它会删除以下路径：

```
$XUANQI_PATH_LOGS       # 所有之前的构建日志
$XUANQI_PATH_PUBLIC     # 所有输出
$XUANQI_PATH_TEMPS      # 之前构建的所有临时文件
```

与静默清除不同的是此CLI在实际删除前先检查目标存在性。否则，
此CLI不会执行任何操作。




## 删除通知

XuanQi会在实际删除前先将仅报告目标。




## 结语

这就是此CLI的全部内容。
