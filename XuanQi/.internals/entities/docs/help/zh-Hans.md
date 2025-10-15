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
#
# NOTE: The license notice and this comment will not be rendered. New line
#       begins with the first non-empty line below.




# 欢迎！

这是一个多章节的文档。它专门采用"业务需知"策略来缩小这庞大阅读材料的范围。

请查看以下内容！




## 快速指南

适用于只需快速复习的资深用户：

* `[XUANQI] build` - 构建整个项目。
* `[XUANQI] create [类型] [值1] [值2] ...`   - 创建某些内容。
* `[XUANQI] purge` - 清理整个项目。

一些不应删除的重要目录：

* `configs`
  * 存放 XuanQi 的工作区配置。请勿删除此处的内容。
  * 硬编码为 `configs/` 目录名。
* `components`
  * 存放所有外部模块化组件。
* `layouts`
  * 存放 XuanQi 工作区的所有页面布局，供路由器渲染。
* `public`
  * 按照 `routers` 定义的结构存放 XuanQi 的所有输出文件。
* `routers`
  * 映射项目的文件结构和输出渲染脚本。
* `tests`
  * 存放 XuanQi 工作区的所有自测试脚本。




## 关于语言

XuanQi 通过 `$XUANQI_LANGUAGE` 环境变量支持以下语言，该变量可使用
`configs/xuanqi.conf` 配置文件或系统 `$LANG` 环境变量设置。

* (de) Deutsch
* (en) English （默认和后备）
* (es) Español
* (fr) Français
* (ja) 日本語
* (ko) 한국어
* (mn-Cyrl) Монгол
* (ms) Bahasa Melayu
* (nb) Norsk Bokmål
* (nl) Nederlands
* (nn) Norsk Nynorsk
* (ru) Pусский
* (sv) Svenska
* (uk) Yкраїнська
* (zh-Hans) 华语（简体）
* (zh-Hant) 華語（繁體）




## Build

```
$ [XUANQI] help build
```

这将打开 `build` 命令的帮助索引部分，涵盖其所有规范。




## Create

```
$ [XUANQI] help create
```

这将打开 `create` 命令的帮助索引部分，涵盖其所有规范。




## Purge

```
$ [XUANQI] help purge
```

这将打开 `purge` 命令的帮助索引部分，涵盖其所有规范。




## Test

```
$ [XUANQI] help test
```

这将打开 `test` 命令的帮助索引部分，涵盖其所有规范。
