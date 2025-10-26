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




# Selamat datang ke Bahagian Bantuan Penciptaan Komponen XuanQi.

XuanQi beroperasi menggunakan konsep komponen secara keseluruhan.
Semuanya bahagian adalah komponen. Berikut adalah arahan umum untuk
mencipta satu:

```
$ [XuanQi] create component [TYPES] [NAME]
```

di mana:

* `[TYPES]` ialah senarai jenis komponen di dalam komponen yang
   anda nak cipta.
* `[NAME]` laluan relatif kepada nama komponen (contohnya
   `pages/root` untuk halaman web utama).

Output itu akan disimpan di dalam direktori `$XUANQI_PATH_COMPONENTS`
(diperoleh daripada `$XUANQI_DIRECTORY_COMPONENTS`).




## Jenis-jenis Komponen

Terdapat beberapa jenis komponen yang perlu dilihat dan setiap
satunya mempunyai dokumentasi khusus. Anda boleh mengetahui jenis
yang anda minati lebih lanjut dengan melaksanakan arahan berikut:

```
[XUANQI] help create component [TYPE]
```

`[TYPE]` yang disokong adalah seperti berikut:
