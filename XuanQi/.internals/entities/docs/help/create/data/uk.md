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




# Створення файлу даних через CLI

Інтерфейс командного рядка (CLI) `create data` призначений для
створення одного файлу даних `.conf`, який можна використовувати в
усіх частинах проєкту. Його повна команда виглядає так:

```
$ [XUANQI] create data [RELATIVE_PATH] [KEY] [VALUE]
```

* `[RELATIVE_PATH]`
  * **ОБОВ'ЯЗКОВО**
  * Відносний (від `$PROJECT_PATH_ROOT`) шлях до файлу, що
    закінчується розширенням `.conf`.
  * Якщо розширення `.conf` не вказано, XuanQi додасть його
    внутрішньо.
  * Назва файлу — на ваш розсуд. Вона не впливає на XuanQi.
* `[KEY]`
  * **ОБОВ'ЯЗКОВО**
  * Мітка `key` для запису `key:value`.
  * Використовуйте підкреслення (`_`), оскільки ключ буде
    використовуватися як змінна оточення.
  * Переконайтеся, що значення унікальне. Інакше той самий ключ
    у кількох файлах конфігурації може спричинити непередбачувані
    наслідки (останній проаналізований файл перезапише попередні).
* `[VALUE]`
  * **ОПЦІЙНО**
  * Мітка `value` для запису `key:value`.
  * Якщо залишити порожнім, буде замінено на приклад тексту, який
    ви зможете оновити у файлі пізніше.




## Обмеження шляхів

З міркувань безпеки XuanQi дозволяє створювати файл даних лише
всередині `$PROJECT_PATH_ROOT`. Інакше буде виведено помилку і
нічого не буде зроблено.




## Епілог

Ось і все для цього CLI.
