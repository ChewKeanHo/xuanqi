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




# 创建配置数据文件CLI

`create config`命令行界面（CLI）用于创建可在整个项目中使用
的单个条目`.conf` 数据文件。其完整命令如下：

```
$ [XUANQI] create config [RELATIVE_PATH] [KEY] [VALUE]
```

* `[RELATIVE_PATH]`
  * **必需**
  * 以`.conf`文件扩展名结尾的相对（从`$XUANQI_PATH_CONFIGS`开始）
    文件路径。
  * 如果未提供`.conf`文件扩展名，玄器将在内部附加它。
  * 如果`.conf`文件位于项目配置目录之外，或者目录根本不存在，
    则会引发错误。
  * 文件名字由您自由决定。它不影响玄器。
* `[KEY]`
  * **必需**
  * `key:value`条目的`key`标签。
  * 使用下划线（`_`），因为该键将作为环境变量运用。
  * 确保该值是唯一的。否则，跨多个配置文件的相同键可能导致
    不可预测的后果（最后解析的文件会覆盖其前面的文件）。
* `[VALUE]`
  * **隨和**
  * `key:value`条目的`value`标签。
  * 若留空时，它将被为示例文本替换。您可以在以后更新该文件。




## 路径限制

出于安全原因，玄器只允许在`$PROJECT_PATH_ROOT`文件夹内创建
数据文件。否则，它将引发错误并且不执行任何操作。

仅对于此创建功能，它**严格**限制只能在`$XUANQI_PATH_CONFIGS`
文件夹内创作（该目录也位于`$PROJECT_PATH_ROOT`内）。




## 已知文档

根据`[KEY]`是否与受支持的环境变量匹配，生成的配置文件可以拥有
自己专用的文档。请参阅：

```
$ [XUANQI] help variables
```

以获取受支持变量的列表。




## 结语

这就是此CLI的全部内容。
