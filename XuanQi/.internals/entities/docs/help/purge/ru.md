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

Интерфейс командной строки (CLI) `Purge` предназначен для полной очистки
рабочей области проекта.

По своей природе он удаляет следующие пути:

```
$XUANQI_PATH_LOGS       # все предыдущие журналы сборки
$XUANQI_PATH_PUBLIC     # все выходные данные
$XUANQI_PATH_TEMPS      # все временные файлы из предыдущих сборок
```

В отличие от тихой очистки, этот CLI выполняет проверку существования цели
перед фактическим удалением. В противном случае этот CLI ничего не делает.




## Уведомление об удалении

XuanQi будет сообщать только о тех целях, которые он действительно удалил.




## Эпилог

Это всё для данного CLI.
