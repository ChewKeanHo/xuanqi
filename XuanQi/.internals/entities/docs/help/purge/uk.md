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




# Purge CLI

Інтерфейс командного рядка (CLI) `Purge` призначений для повної очистки
робочого простору проекту.

За своєю природою він видаляє такі шляхи:

```
$XUANQI_PATH_LOGS       # усі попередні журнали збірки
$XUANQI_PATH_PUBLIC     # усі вихідні дані
$XUANQI_PATH_TEMPS      # усі тимчасові файли з попередніх збірок
```

На відміну від тихого очищення, цей CLI виконує перевірку існування
цілі перед фактичним видаленням. В іншому випадку цей CLI нічого не робить.




## Сповіщення про видалення

XuanQi повідомлятиме лише про ті цілі, які він фактично видаляє.




## Епілог

Це все для цього CLI.
