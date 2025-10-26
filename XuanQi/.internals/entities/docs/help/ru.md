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




# Добро пожаловать!

Это многосекционная документация. Она специально разработана с использованием
политики "Business Need-To-Know" для ограничения объема этого обширного
материала для чтения.

Ознакомьтесь с ней ниже!




## Краткое руководство

Для опытных пользователей, которым нужен быстрый повтор:

* `[XUANQI] build` - собрать весь проект.
* `[XUANQI] create [ТИП] [ЗНАЧЕНИЕ1] [ЗНАЧЕНИЕ2] ...`   - создать что-либо.
* `[XUANQI] purge` - очистить весь проект.

Некоторые важные каталоги, которые нельзя удалять:

* `configs`
  * содержит конфигурации рабочей области XuanQi. НЕ удаляйте здесь ничего.
  * Жестко заданное имя каталога `configs/`.
* `components`
  * содержит все внешние модульные компоненты.
* `layouts`
  * содержит все макеты страниц рабочей области XuanQi для рендеринга
    маршрутизатором.
* `public`
  * содержит все выходные файлы XuanQi в структурах, определенных `routers`.
* `routers`
  * сопоставляет файловые структуры проекта и скрипты рендеринга вывода.
* `tests`
  * содержит все тестовые скрипты рабочей области XuanQi для самопроверки.




## О языках

XuanQi поддерживает следующие языки через переменную окружения
`$XUANQI_LANGUAGE`, установленную с помощью файла конфигурации
`configs/xuanqi.conf` или системной переменной окружения `$LANG`.

* (de) Deutsch
* (en) English (по умолчанию и запасной)
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

Это открывает раздел индекса справки команды `build`, охватывающий все ее
спецификации.




## Create

```
$ [XUANQI] help create
```

Это открывает раздел индекса справки команды `create`, охватывающий все ее
спецификации.




## Purge

```
$ [XUANQI] help purge
```

Это открывает раздел индекса справки команды `purge`, охватывающий все ее
спецификации.




## Test

```
$ [XUANQI] help test
```

Это открывает раздел индекса справки команды `test`, охватывающий все ее
спецификации.
