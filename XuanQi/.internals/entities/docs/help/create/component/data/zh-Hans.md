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




# 创建数据组件帮助部门

这是用于创建独立式或在更大组件里综合化的数据组件的帮助部门。
若要包含数据部分，您只需将`data`填入`[TYPES]`值。例：

```
# 命令模式
$ [XuanQi] create component [TYPES] [NAME]

# 仅数据组件
$ [XuanQi] create component data [NAME]

# 在综合组件里包含数据组件
$ [XuanQi] create component "...,data,..." [NAME]
```




## 目的

数据组件主要是为了方便处理项目和组件使用的特定数据集。
这允许您能在无需牺牲可维护性质里对相同的文件布局进行
数据变量渲染更改。玄器有可以无缝导入所有配置文件(`.conf`)
和Shell(`.sh`)代码文件内置功能。

在普天之下，玄器将数据组件视为**无数据库**(`noDB`)概念
来存储和处理数据。




## 文件结构

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

* 组件文件夹是`Data`。
* 组件操作Shell代码是位于`XuanQi/import.sh`内。
  它是组件初始化步骤的一部分。




## 主要目标

您的**主要目标是把所有能变量数据源抽象化为项目或组件可用
的数据设施**。如何实现就完全于您来决定。

在每个组件的初始步骤里，任何组件都可以从内部或跨过其他
组件的数据组件来解析需求。因此，您**必须**在任何情况下
始终保持数据文件的灵活性和可解析性。

您可以参考项目的`XuanQi/.internals/API`以获取可用的API。




## 配置文件或Shell代码

玄器提供了2种主要方式来处理数据管理：

* 配置文件(`.conf`)
* Shell 代码文件(`.sh`)

`.conf` 适用来快速设置变量好让您可以在文件渲染时立即使用。
玄器创建了一个示例文件(`Data/sample.conf`)给您提示建设构造。
**一个文件最好只包含一对键值而已**。

`.sh` 实际上是一个可以处理包含函数定义的Shell代码。它可以
过逻辑条件提供特定的数据。如果您的数据集需要一个或多个条件
来输出不同的数据（例如，`i18n_`代码依赖于
`$XUANQI_CONTENT_LANGUAGE`值来返回特定语言的字符），
这Shell代码方式对您是最好合适。
**请注意：同名的函数在导入期间将被覆盖**。玄器创建了一个
示例文件(`Data/i18n/title.sh`)供您参考建设构造。

最后一个选项是自己读取文件夹内的`.txt`文件。由于玄器只解析
`.conf`和`.sh`文件，您可以放心地去使用它。这个方法是运用特定
的数据集名称为文件夹的名称和运用参数名称来设定数据文件的名称。
这方法的缺点是占用更多的IO读/写流量而可能会减慢生产项目的出产
速度。由于*满足需求始终优先于速度的人生标准*，您仍然可以在
需要时考虑使用它。基于i18n方法例子如下：

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

# 在Shell代码里使用上述内容
____name="$( \\
    XuanQi_Data_Read_Raw \\
        "${XUANQI_COMPONENT_PATH}/Data/names/${XUANQI_CONTENT_LANGUAGE}.txt" \\
)"
```




### 如何选择

在尽可能始终和默认情况下使用`.conf`。如果有逻辑需求
（例如条件等），那则使用`.sh`。




## 媒体文件

虽然在技术上媒体文件（例如图片、音频、视频等）是数据，
**请您回避将它们放在此处**。玄器是有个媒体专用处理功能
的 `media`组件。请改用该组件。

您应始终将数据组件视为 **无数据库** (`noDB`)。




## 结语

这就是创建数据组件帮助部门的全部内容。
