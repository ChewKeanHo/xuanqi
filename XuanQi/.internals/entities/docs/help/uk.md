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




# Ласкаво просимо!

Це багатосекційна документація. Вона спеціально розроблена з використанням
політики "Business Need-To-Know" для обмеження обсягу цього величезного
матеріалу для читання.

Ознайомтесь з нею нижче!




## Швидкий посібник

Для досвідчених користувачів, яким потрібне лише швидке оновлення знань:

* `[XUANQI] build` - зібрати весь проект.
* `[XUANQI] create [ТИП] [ЗНАЧЕННЯ1] [ЗНАЧЕННЯ2] ...`   - створити щось.
* `[XUANQI] purge` - очистити весь проект.

Деякі важливі каталоги, які не слід видаляти:

* `configs`
  * містить конфігурації робочого простору XuanQi. НЕ видаляйте тут нічого.
  * Жорстко задана назва каталогу `configs/`.
* `components`
  * містить усі зовнішні модульні компоненти.
* `layouts`
  * містить усі макети сторінок робочого простору XuanQi для рендерингу
    маршрутизатором.
* `public`
  * містить усі вихідні файли XuanQi у структурах, визначених `routers`.
* `routers`
  * відображає файлові структури проекту та скрипти рендерингу виводу.
* `tests`
  * містить усі тестові скрипти робочого простору XuanQi для самотестування.




## Про мови

XuanQi підтримує такі мови через змінну середовища `$XUANQI_LANGUAGE`,
встановлену за допомогою файлу конфігурації `configs/xuanqi.conf` або
системної змінної середовища `$LANG`.

* (de) Deutsch
* (en) English (за замовчуванням та резервна)
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

Це відкриває розділ індексу довідки команди `build`, що охоплює всі її
специфікації.




## Create

```
$ [XUANQI] help create
```

Це відкриває розділ індексу довідки команди `create`, що охоплює всі її
специфікації.




## Purge

```
$ [XUANQI] help purge
```

Це відкриває розділ індексу довідки команди `purge`, що охоплює всі її
специфікації.




## Test

```
$ [XUANQI] help test
```

Це відкриває розділ індексу довідки команди `test`, що охоплює всі її
специфікації.
