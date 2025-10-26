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

Antara muka baris perintah (CLI) `Purge` adalah untuk membersihkan
ruang kerja projek sepenuhnya.

Secara amnya, ia memadamkan laluan berikut:

```
$XUANQI_PATH_LOGS       # semua log binaan sebelumnya
$XUANQI_PATH_PUBLIC     # semua output
$XUANQI_PATH_TEMPS      # semua fail sementara dari binaan sebelumnya
```

Tidak seperti pembersihan secara senyap, CLI ini melakukan pemeriksaan
kewujudan sasaran sebelum pemadaman. Jika tidak, CLI ini tidak akan
melakukan apa-apa pun.




## Pemberitahuan Penghampusan

XuanQi akan melaporkan hanya sasaran yang benar-benar dipadamkannya.




## Epilog

Itu sahaja untuk CLI ini.
