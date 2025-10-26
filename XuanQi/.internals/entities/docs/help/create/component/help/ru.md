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




# Добро пожаловать в раздел справки по созданию компонентов XuanQi.

XuanQi в основном работает с использованием концепции компонентов.
Всё состоит из компонентов. Ниже приведена общая команда
для создания одного:

```
$ [XuanQi] create component [TYPES] [NAME]
```

где:

* `[TYPES]` — это список типов компонентов внутри
  компонента, который вы пытаетесь создать.
* `[NAME]` — относительный путь к имени компонента
  (например, `pages/root` для корневой страницы рендеринга).

Результат будет сохранен в каталоге `$XUANQI_PATH_COMPONENTS`
(производный от `$XUANQI_DIRECTORY_COMPONENTS`).




## Типы компонентов

Существует ряд типов компонентов, и каждый
из них имеет свою конкретную документацию. Вы можете узнать больше
о заинтересовавшем вас типе, выполнив следующую команду:




Поддерживаемые значения `[TYPE]`:
