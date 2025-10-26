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




# 创建数据文件CLI

`create data` 命令行界面（CLI）用于创建可在整个项目中使用的单个条目
`.conf` 数据文件。其完整命令如下：

```
$ [XUANQI] create data [RELATIVE_PATH] [KEY] [VALUE]
```

* `[RELATIVE_PATH]`
  * **必需**
  * 以 `.conf` 文件扩展名结尾的相对（从 `$PROJECT_PATH_ROOT` 开始）
    文件路径。
  * 如果未提供 `.conf` 文件扩展名，玄器会在内部追加它。
  * 文件名字由您自行决定。它不会影响玄器。
* `[KEY]`
  * **必需**
  * `key:value` 条目的 `key` 标签。
  * 使用下划线（`_`），因为该键将用作环境变量。
  * 确保该值是唯一的。否则，跨多个配置文件的相同键可能导致不可预测
    的后果（最后解析的文件将覆盖其前面的文件）。
* `[VALUE]`
  * **随和**
  * `key:value` 条目的 `value` 标签。
  * 留空时，将替换为示例文本，您可以在之后更新该文件。




## 路径限制

出于安全原因，玄器只允许在 `$PROJECT_PATH_ROOT` 内创建数据文件。
否则，它将引发错误并且不执行任何操作。




## 结语

此CLI的内容就到此为止。
