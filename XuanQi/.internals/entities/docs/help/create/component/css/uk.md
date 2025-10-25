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




# Створення розділу довідки CSS компонента

Це розділ довідки для створення CSS компонента або
незалежно, або як частину іншого більшого компонента. Щоб
включити CSS частину, просто введіть `css` у значення `[TYPES]`.
Приклад:

```
# шаблон команди
$ [XuanQi] create component [TYPES] [NAME]

# лише CSS компонент
$ [XuanQi] create component css [NAME]

# з CSS частиною всередині складеного компонента
$ [XuanQi] create component "...,css,..." [NAME]
```




## Призначення

CSS компонент призначений в основному для створення вихідного
файлу CSS ресурсу (наприклад, `page.css`). XuanQi має як вбудовані
засоби в функціях `Shell`, так і копіювання звичайного CSS файлу.




## Структури файлів

CSS компонент відповідає наступній стандартній структурі файлів:

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

* директорія компонента - `CSS`.
* shell-скрипт оператора компонента - `CSS/xuanqi.sh`.
* shell-скрипт оператора компонента викликається основним скриптом
  імпорту компонента `XuanQi/import.sh`.




## Основний скрипт `CSS/xuanqi.sh`

Ваша **кінцева мета - записати вихідний CSS файл
до `$XUANQI_CONTENT_PATH` своїм способом**. Як це зробити,
повністю залежить від вас.

Декілька скриптів маршрутизаторів можуть викликати той самий
компонент для відображення файлів (наприклад, різні медіа цілі,
такі як мобільні, друк, електронна пошта для того самого вмісту).
Тому ви повинні стратегічно спроектувати необхідні змінні середовища
для користувачів, щоб налаштувати їх у скрипті маршрутизатора.

Потім, під час виконання `CSS/xuanqi.sh`, проаналізуйте ці змінні
середовища та реагуйте відповідно.

Ви можете звернутися до `XuanQi/.internals/API` проекту для доступних
API.




## Програмно або Копіювання

XuanQi надає як програмовані функції, так і функції сирого копіювання
для легкого відображення CSS файлу. Рішення залежить від вашої команди.

Якщо ваша команда не знайома з shell-скриптингом, краще останнє,
щоб вся команда могла працювати з наданим файлом `.css`, поки XuanQi
просто копіює його до `$XUANQI_CONTENT_PATH`. Це чудово для тих,
хто використовує компілятор `Sass`.

Програмовані функції shell-скриптингу XuanQi забезпечують більшу
внутрішню гнучкість при відображенні (подумайте про макроси над
написанням CSS). Перевага в відсутності залежностей та надзвичайній
гнучкості з вашим генератором вмісту. Це підходить для досвідчених
розробників CSS, які вважають `Sass` перешкодою.

У будь-якому випадку, ви в хороших руках. Просто спробуйте та
адаптуйтеся з часом.




## Епілог

Це все для розділу довідки зі створення CSS компонента.
