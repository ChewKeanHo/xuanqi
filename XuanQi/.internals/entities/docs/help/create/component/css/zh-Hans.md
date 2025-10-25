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




# 创建CSS组件帮助部分

这是用于可以独立性或在另一个更大组件作为一部分创建CSS组件的
帮助部分。要包含CSS部分，只需将`css`输入到`[TYPES]`值中。
示例：

```
# 命令模式
$ [XuanQi] create component [TYPES] [NAME]

# 仅CSS组件
$ [XuanQi] create component css [NAME]

# 在复合组件中包含CSS部分
$ [XuanQi] create component "...,css,..." [NAME]
```




## 目的

CSS组件主要用于创建输出CSS资源文件（例如：`page.css`）。
玄器在`Shell`代码库具有内置功能和可复制已有的CSS文件功能。




## 文件结构

CSS组件遵循以下默认文件夹结构：

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

* 组件文件夹是 `CSS`。
* 组件操作器shell代码文件是 `CSS/xuanqi.sh`。
* 组件操作器shell代码文件会由`XuanQi/import.sh`主组件导入调用。




## `CSS/xuanqi.sh`主要代码文件

您的**最终主要目标是以您自己的方式将CSS文件给输出入
`$XUANQI_CONTENT_PATH`**。方式是由您来完全决定。

多个`routers`可以调用同一个组件进行它的文件渲染（例如：在相同的内容
有不同媒体目标如移动设备、打印、电子邮件等等）。因此，您应该以战略性
的设计技术来设计所需的环境变量供用户在`routers`里设置。

之后在执行`CSS/xuanqi.sh`时，您通过解析这些环境变量来做出回应。

您可以参考`XuanQi/.internals/API`文件夹以了解现有的API功能。




## 编程方式或复制

玄器提供可编制方式功能和原始性复制功能来轻松地渲染CSS文件。
至于如何决定就从您的团队开始。

如果您的团队不熟悉shell代码编写，那后者功能会比较合适。这样整个团队
可以在提供的`.css`文件上工作而玄器只需将其原始性复制入
`$XUANQI_CONTENT_PATH`。这对于使用`Sass`编译器的队员来说非常棒的选择。

玄器的Shell可编制方式功能能促进了渲染方面更大的内部灵活性
（考虑在CSS编写之上的宏层）。这功能优点是没有任何依赖性，并且与您的
内容生成器拥有极其灵活。这适和经验丰富开发者
（那些已经觉得`Sass`视为障碍者）。

无论如何，您都在好意里发展。您只需在时间允许里尝试并进行需要相应调整
就行了。




## 结语

这就是创建CSS组件帮助部分的全部内容。
