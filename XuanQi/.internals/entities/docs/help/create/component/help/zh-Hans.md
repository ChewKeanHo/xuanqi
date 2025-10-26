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




# 欢迎来到玄器的创建组件帮助部分

玄器的主要结构都是使用组件概念来进行操作。在这里，一切
都是组件。以下是创建组件的总体命令：

```
$ [XuanQi] create component [TYPES] [NAME]
```

其中：

* `[TYPES]`是各种您想尝试创建的组件的内部组件类型列表。
* `[NAME]`组件名称的相对文件夹路径。（例如，根渲染页面的
  `pages/root`）。

结构输出将会在`$XUANQI_PATH_COMPONENTS`（源自
`$XUANQI_DIRECTORY_COMPONENTS`）文件夹里储存。




## 组件类型

玄器有许多组件类型可供参考，每种类型都有其特定的文档。
您可以通过执行以下命令来了解更多关于您感兴趣的类型：

```
[XUANQI] help create component [TYPE]
```

支持的`[TYPE]`值有如以下：
