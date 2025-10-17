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




# CLI Cipta Fail Data

`create data` command line interface (CLI) adalah untuk mencipta satu
fail data `.conf` bagi satu unit data. Arahan penuhnya adalah:

```
$ [XUANQI] create data [RELATIVE_PATH] [KEY] [VALUE]
```

* `[RELATIVE_PATH]`
  * **WAJIB**
  * Laluan relatif (dari `$PROJECT_PATH_ROOT`) fail berakhir
    dengan sambungan fail `.conf`.
  * Jika `.conf` sambungan fail tidak diberi, XuanQi akan menambahnya
    secara dalaman.
  * Nama fail adalah mengikuti budi bicara anda. It tidak menjejaskan
    XuanQi.
* `[KEY]`
  * **WAJIB**
  * Label `key` untuk entri `key:value`.
  * Guna garis bawah (`_`) atas sebab kekunci ini akan digunakan
    sebagai pembolehubah persekitaran.
  * Pastikan nilai kekunci ini adalah unik. Jikalau tidak, kekunci
    yang merentasi pelbagai fail-fail konfigurasi boleh mengakibatkan
    alaman yang tidak dijangka (data fail yang dihurai terakhir akan
    mengabaikan data fail yang terdahulunya).
* `[VALUE]`
  * **TIDAK WAJIB**
  * Label `value` untuk entri `key:value`.
  * Jika dibiar kosong, teks sampel akan digantikan dan anda boleh
    mengemaskini fail lepas ciptaan.



## Sekatan Laluan Fail

Atas sebab keselamatan, XuanQi hanya membenarkan penciptaan fail data
di dalam `$PROJECT_PATH_ROOT` sahaja. Jika tidak, ia akan melontar
ralat dan tidak melakukan apa-apa.




## Epilog

Itu sahaja untuk CLI ini.
