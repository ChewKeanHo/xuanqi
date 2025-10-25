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




# Bahagian Bantuan Penciptaan Komponen CSS

Ini adalah bahagian bantuan bagi mencipta komponen CSS sama ada
secara keseluruhan ataupun sebagai sebahagian daripada komponen
lain yang lebih besar. Untuk memasukkan bahagian CSS, hanya
masukkan `css` ke dalam nilai `[TYPES]`. Contoh:

```
# corak arahan
$ [XuanQi] create component [TYPES] [NAME]

# hanya komponen CSS
$ [XuanQi] create component css [NAME]

# dengan bahagian CSS dalam komponen komposit
$ [XuanQi] create component "...,css,..." [NAME]
```



## Tujuan

Komponen CSS terutamanya untuk mencipta fail output aset CSS
(cth. `page.css`). XuanQi mempunyai kedua-dua kemudahan
terbina dalam fungsi `Shell` atau menyalin fail CSS biasa.




## Struktur Fail

Komponen CSS mematuhi struktur fail lalai berikut:

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

* direktori komponen adalah `CSS`.
* skrip shell pengendali komponen ialah `CSS/xuanqi.sh`.
* skrip shell pengendali komponen dipanggil oleh pengimport
  komponen utama skrip shell `XuanQi/import.sh`.




## Skrip Utama `CSS/xuanqi.sh`

**Objektif utama anda ialah menulis fail output CSS ke dalam
`$XUANQI_CONTENT_PATH` dengan cara anda**. Cara perlaksanaannya
terpulang kepada anda sepenuhnya.

Berbilang-bilang skrip `routers` boleh memanggil komponen yang sama
untuk penghasilan fail-fail masing-masing (cth. sasaran media yang
berbeza seperti mudah alih, cetak, e-mel untuk kandungan yang sama).
Oleh itu, anda harus mereka bentuk pembolehubah persekitaran yang
diperlukan secara strategik untuk pengguna menyediakannya dalam skrip
`routers`.

Kemudian, semasa `CSS/xuanqi.sh` dilaksanakan, huraikan pembolehubah
persekitaran ini dan bertindak dengan sewajarnya.

Anda boleh merujuk `XuanQi/.internals/API` projek untuk API yang
sedia ada.




## Secara Pengaturcaraan atau Salin

XuanQi menyediakan fungsi boleh atur cara dan fungsi salinan secara
mentah bagi memudahkan penghasilan fail CSS. Keputusan
pilihan bergantung pada pasukan anda.

Jika pasukan anda tidak berpengalaman dengan penulisan skrip shell,
pilihan fungsi salinan secara mentah adalah lebih baik supaya
seluruh pasukan boleh bekerja pada pembekal fail `.css`
sementara XuanQi hanya menyalinnya ke `$XUANQI_CONTENT_PATH`.
Ini adalah pilihan bagus bagi mereka yang menggunakan perisian
ringan `Sass`.

Fungsi boleh atur cara penulisan skrip Shell XuanQi memudahkan
fleksibiliti dalaman yang lebih besar terhadap penghasilan fail
(fikirkan makro di atas penulisan CSS). Kelebihannya adalah tiada
kebergantungan apa-apa pun dan sangat fleksibel dengan penjana
kandungan CSS. Ini sesuai untuk pembangun CSS berpengalaman yang
merujuk `Sass` sebagai halangan.

Dalam apa-apa jua keadaan, anda berada dalam tangan yang baik.
Anda hanya cuba sesuaikan dari semasa ke semasa.




## Epilog

Itu sahaja untuk bahagian bantuan penciptaan komponen CSS.
