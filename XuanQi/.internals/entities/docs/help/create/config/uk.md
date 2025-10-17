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




# CLI Створення Файлу Конфігурації

Інтерфейс командного рядка (CLI) `create config` призначений для
створення одного файлу даних `.conf`, який можна використовувати
в усій програмі. Його повна команда виглядає так:

```
$ [XUANQI] create config [RELATIVE_PATH] [KEY] [VALUE]
```

* `[RELATIVE_PATH]`
  * **ОБОВ'ЯЗКОВО**
  * Відносний (від `$XUANQI_PATH_CONFIGS`) шлях до файлу, що
    закінчується розширенням `.conf`.
  * Якщо розширення `.conf` не вказано, XuanQi додасть його
    внутрішньо.
  * Якщо файл `.conf` знаходиться поза каталогом конфігурації
    проєкту або каталог просто не існує, буде викликано помилку.
  * Назва файлу на ваш розсуд. Вона не впливає на XuanQi.
* `[KEY]`
  * **ОБОВ'ЯЗКОВО**
  * Мітка `key` запису `key:value`.
  * Використовуйте підкреслення (`_`), оскільки ключ буде
    використовуватися як змінна середовища.
  * Переконайтеся, що значення унікальне. Інакше той самий ключ
    у кількох файлах конфігурації може спричинити непередбачувані
    наслідки (останній проаналізований файл перезаписує своїх
    попередників).
* `[VALUE]`
  * **ОПЦІЙНО**
  * Мітка `value` запису `key:value`.
  * Якщо залишити порожнім, буде замінено приклад тексту, який ви
    зможете оновити у файлі пізніше.




## Обмеження Шляхів

З міркувань безпеки XuanQi дозволяє створювати файл даних лише в
`$PROJECT_PATH_ROOT`. Інакше буде викликано помилку і нічого не
буде зроблено.

Лише для цього створення, він **СУВОРО** обмежений каталогом
`$XUANQI_PATH_CONFIGS` (який також знаходиться в
`$PROJECT_PATH_ROOT`).




## Відома Документація

Залежно від того, чи `[KEY]` відповідає підтримуваній змінній
середовища, згенерований файл конфігурації може мати свою власну
документацію. Дивіться:

```
$ [XUANQI] help variables
```

для списку підтримуваних змінних.




## Епілог

Ось і все для цього CLI.
