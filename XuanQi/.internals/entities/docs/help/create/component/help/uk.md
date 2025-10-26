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




# Ласкаво просимо до розділу довідки зі створення компонентів XuanQi.

XuanQi в основному працює з використанням концепції компонентів.
Все є компонентами. Нижче наведено загальну команду для
створення одного:

```
$ [XuanQi] create component [TYPES] [NAME]
```

де:

* `[TYPES]` — це список типів компонентів усередині
  компонента, який ви намагаєтеся створити.
* `[NAME]` — відносний шлях до імені компонента
  (наприклад, `pages/root` для кореневої сторінки рендерингу).

Результат буде збережено в каталозі `$XUANQI_PATH_COMPONENTS`
(похідний від `$XUANQI_DIRECTORY_COMPONENTS`).




## Типи компонентів

Існує низка типів компонентів, і кожен
з них має свою специфічну документацію. Ви можете дізнатися більше
про тип, що вас цікавить, виконавши таку команду:

```
[XUANQI] help create component [TYPE]
```

Підтримувані значення `[TYPE]`:
