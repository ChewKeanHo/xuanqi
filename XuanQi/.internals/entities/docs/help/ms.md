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




# Selamat Datang!

Ini adalah dokumentasi berbilang bahagian. Ia direka khas menggunakan
dasar "Bisnes Perlu-Tahu Sahaja" untuk mengecilkan skop bahan bacaan yang
besar ini.

Lihat di bawah!




## Panduan Pantas

Untuk pengguna berpengalaman yang hanya mahu penyegaran pantas:

* `[XUANQI] build` - bina keseluruhan projek.
* `[XUANQI] create [JENIS] [NILAI1] [NILAI2] ...`   - buat sesuatu.
* `[XUANQI] purge` - bersihkan keseluruhan projek.

Beberapa direktori penting yang tidak boleh dipadam:

* `configs`
  * menempatkan konfigurasi ruang kerja XuanQi. JANGAN padam barang di sini.
  * Nama direktori dikod keras kepada `configs/`.
* `components`
  * menempatkan semua komponen modular luaran.
* `layouts`
  * menempatkan semua susun atur halaman ruang kerja XuanQi untuk router render.
* `public`
  * menempatkan semua fail output XuanQi dalam struktur yang ditakrifkan oleh
    `routers`.
* `routers`
  * memetakan struktur fail projek dan skrip rendering output.
* `tests`
  * menempatkan semua skrip ujian ruang kerja XuanQi untuk ujian kendiri.




## Mengenai Bahasa

XuanQi menyokong bahasa berikut melalui pembolehubah persekitaran
`$XUANQI_LANGUAGE` yang ditetapkan menggunakan fail konfigurasi
`configs/xuanqi.conf` atau pembolehubah persekitaran sistem `$LANG`.

* (de) Deutsch
* (en) English (lalai dan sandaran)
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

Ini membuka bahagian indeks bantuan arahan `build` yang meliputi semua
spesifikasinya.




## Create

```
$ [XUANQI] help create
```

Ini membuka bahagian indeks bantuan arahan `create` yang meliputi semua
spesifikasinya.




## Purge

```
$ [XUANQI] help purge
```

Ini membuka bahagian indeks bantuan arahan `purge` yang meliputi semua
spesifikasinya.




## Test

```
$ [XUANQI] help test
```

Ini membuka bahagian indeks bantuan arahan `test` yang meliputi semua
spesifikasinya.
