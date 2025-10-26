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




# Создание файла данных через CLI

Интерфейс командной строки (CLI) `create data` предназначен для
создания одного файла данных `.conf`, который можно использовать во
всём проекте. Его полная команда выглядит следующим образом:

```
$ [XUANQI] create data [RELATIVE_PATH] [KEY] [VALUE]
```

* `[RELATIVE_PATH]`
  * **ОБЯЗАТЕЛЬНО**
  * Относительный (от `$PROJECT_PATH_ROOT`) путь к файлу,
    заканчивающийся расширением `.conf`.
  * Если расширение `.conf` не указано, XuanQi добавит его внутренне.
  * Имя файла на ваше усмотрение. Оно не влияет на XuanQi.
* `[KEY]`
  * **ОБЯЗАТЕЛЬНО**
  * Метка `key` для записи `key:value`.
  * Используйте подчёркивание (`_`), так как ключ будет использоваться
    в качестве переменной окружения.
  * Убедитесь, что значение уникально. В противном случае один и тот
    же ключ в нескольких файлах конфигурации может привести к
    непредсказуемым последствиям (последний проанализированный файл
    переопределяет своих предшественников).
* `[VALUE]`
  * **ОПЦИОНАЛЬНО**
  * Метка `value` для записи `key:value`.
  * Если оставить пустым, будет заменено на пример текста, который
    вы сможете обновить в файле позже.




## Ограничение путей

В целях безопасности XuanQi разрешает создание файла данных только
внутри `$PROJECT_PATH_ROOT`. В противном случае будет выдана ошибка
и ничего не произойдёт.




## Эпилог

Это всё для данного CLI.
