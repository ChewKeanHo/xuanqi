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




# CLI Cipta Fail Konfigurasi

Antara muka barisan perintah-perintah (CLI) `create config`
adalah untuk mencipta satu fail data `.conf` yang boleh
digunakan merentas projek. Perintah penuhnya adalah seperti
berikut:

```
$ [XUANQI] create config [RELATIVE_PATH] [KEY] [VALUE]
```

* `[RELATIVE_PATH]`
  * **WAJIB**
  * Laluan fail relatif (dari `$XUANQI_PATH_CONFIGS`) yang
    berakhir dengan sambungan fail `.conf`.
  * Jika sambungan fail `.conf` tidak disediakan, XuanQi
    akan menambahkannya secara dalaman.
  * Jika fail `.conf` berada di luar direktori konfigurasi
    projek atau direktori tersebut tidak wujud, ralat akan
    dibangkitkan.
  * Nama fail adalah mengikut budi bicara anda. Ia tidak
    menjejaskan XuanQi.
* `[KEY]`
  * **WAJIB**
  * Label `key` bagi entri `key:value`.
  * Gunakan garis bawah (`_`) kerana kekunci akan digunakan
    sebagai pembolehubah persekitaran.
  * Pastikan nilai adalah unik. Jika tidak, kekunci yang sama
    merentas berbilang fail konfigurasi boleh menyebabkan
    akibat yang tidak dijangka (fail yang dihurai terakhir
    mengatasi pendahulunya).
* `[VALUE]`
  * **TIDAK WAJIB**
  * Label `value` bagi entri `key:value`.
  * Apabila dibiarkan kosong, teks sampel akan mengantikannya
    di mana anda boleh mengemas kini fail kemudian.




## Sekatan Laluan

Atas sebab keselamatan, XuanQi hanya membenarkan penciptaan
fail data dalam `$PROJECT_PATH_ROOT` sahaja. Jika tidak, ia
akan membangkitkan ralat dan tidak melakukan apa-apa.

Hanya untuk penciptaan ini, ia **SECARA KETAT** dihadkan
kepada direktori `$XUANQI_PATH_CONFIGS` (yang juga berada
di dalam `$PROJECT_PATH_ROOT`).




## Dokumentasi Diketahui

Bergantung pada `[KEY]` yang sepadan dengan pembolehubah
persekitaran yang disokong, fail konfigurasi yang dicipta
boleh mempunyai dokumentasi khususnya sendiri. Lihat:

```
$ [XUANQI] help variables
```

untuk senarai pembolehubah yang disokong.




## Epilog

Itu sahaja untuk CLI ini.
