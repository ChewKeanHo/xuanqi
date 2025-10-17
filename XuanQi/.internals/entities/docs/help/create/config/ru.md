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




# CLI Создания Файла Конфигурации

Интерфейс командной строки (CLI) `create config` предназначен для
создания одного файла данных `.conf`, который можно использовать
во всем проекте. Его полная команда выглядит следующим образом:

```
$ [XUANQI] create config [RELATIVE_PATH] [KEY] [VALUE]
```

* `[RELATIVE_PATH]`
  * **ОБЯЗАТЕЛЬНО**
  * Относительный (от `$XUANQI_PATH_CONFIGS`) путь к файлу,
    оканчивающийся расширением `.conf`.
  * Если расширение `.conf` не указано, XuanQi добавит его внутренне.
  * Если файл `.conf` находится вне каталога конфигурации проекта
    или каталог просто не существует, будет вызвана ошибка.
  * Имя файла на ваше усмотрение. Оно не влияет на XuanQi.
* `[KEY]`
  * **ОБЯЗАТЕЛЬНО**
  * Метка `key` записи `key:value`.
  * Используйте подчеркивание (`_`), так как ключ будет
    использоваться в качестве переменной окружения.
  * Убедитесь, что значение уникально. В противном случае один и тот
    же ключ в нескольких файлах конфигурации может привести к
    непредсказуемым последствиям (последний проанализированный
    файл переопределяет своих предшественников).
* `[VALUE]`
  * **ОПЦИОНАЛЬНО**
  * Метка `value` записи `key:value`.
  * Если оставить пустым, будет заменен пример текста, который вы
    сможете обновить в файле позже.




## Ограничение Путей

По соображениям безопасности XuanQi разрешает создание файла данных
только внутри `$PROJECT_PATH_ROOT`. В противном случае будет вызвана
ошибка и ничего не будет сделано.

Только для этого создания он **СТРОГО** ограничен каталогом
`$XUANQI_PATH_CONFIGS` (который также находится внутри
`$PROJECT_PATH_ROOT`).




## Известная Документация

В зависимости от того, соответствует ли `[KEY]` поддерживаемой
переменной окружения, сгенерированный файл конфигурации может
иметь собственную посвященную документацию. См.:

```
$ [XUANQI] help variables
```

для списка поддерживаемых переменных.




## Эпилог

Это все для этого CLI.
