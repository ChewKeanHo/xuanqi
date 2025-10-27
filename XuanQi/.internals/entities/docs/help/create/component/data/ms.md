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




# Bahagian Bantuan Penciptaan Komponen Data

Ini adalah bahagian bantuan penciptaan komponen data sama ada
secara keseluruhan ataupun sebagai sebahagian daripada komponen
lain yang lebih besar. Bagi memasukkan bahagian komponen data,
anda hanya masukkan `data` ke dalam nilai `[TYPES]`. Contoh:

```
# corak perintah
$ [XuanQi] create component [TYPES] [NAME]

# hanya komponen data
$ [XuanQi] create component data [NAME]

# dengan bahagian data di dalam komponen komposit
$ [XuanQi] create component "...,data,..." [NAME]
```




## Tujuan

Komponen data adalah untuk memudahkan projek dan komponen-komponen
dengan pemprosesan set data tertentu. Ini membolehkan anda
menggunakan pembolehubah data rendering untuk menghasilkan
banyak jenis fail-fail yang mempunyai susun atur yang sama tanpa
tanpa mengorbankan kebolehpenyelenggaraan yang senang. XuanQi
mempunyai kemudahan dalaman untuk mengimport kesemua fail-fail
konfigurasi (`.conf`) dan skrip-skrip shell (`.sh`) yang mempunyai
fungsi-fungsi process dengan lancar.

Secara amnya, XuanQi menganggap komponen data sebagai storan data
**tanpa pangkalan data** (`noDB`).




## Struktur Fail

Komponen data mematuhi struktur fail seperti berikut:

```
[XUANQI_PATH_COMPONENTS]
└── [XUANQI_COMPONENT_NAME]
       ├── Data
       │    ├── i18n
       │    │     ├── title.sh
       │    │     └── ...
       │    ├── sample.conf
       │    └── ...
       └── XuanQi
            └── import.sh
```

* direktori komponen adalah `Data`.
* skrip shell pengendali komponen berada terus di dalam
  `XuanQi/import.sh`. Ia adalah sebahagian daripada permulaan komponen.




## Objektif Utama

**Objektif utama anda ialah mengabstrakkan sumber data-data
pembolehubah lalu mencipta kemudahan set data untuk projek atau
komponen-komponen anda**. Cara perlaksanaan terpulang kepada anda.

Pada setiap permulaan komponen, mana-mana komponen boleh menghuraikan
komponen data dari dalaman ataupun merentas komponen-komponen lain.
Oleh itu, anda **MESTI** menyimpan direktori data secara fleksibel
dan sentiasa boleh dihuraikan pada setiap masa.

Anda boleh merujuk `XuanQi/.internals/API` projek untuk API yang
tersedia.




## Fail Konfigurasi atau Skrip Shell

XuanQi menyediakan 2 kaedah-kaedah utama untuk pengurusan data:

* fail konfigurasi (`.conf`)
* fail fungsi skrip shell (`.sh`)

`.conf` lebih sesuai untuk penyediaan pembolehubah pantas supaya
anda boleh menggunakan nilainya segera bagi penghasilan fail. Sampel
fail (`Data/sample.conf`) telah dicipta sebagai pertunjuk cara untuk
menciptanya. **Satu konfigurasi hanya and patut mengandungi satu
pasangan kunci:nilai sahaja**.

`.sh` sebenarnya adalah skrip shell yang mengandungi definisi fungsi
pemprosesan data melalui logik syarat. Ini paling sesuai bagi set
data yang perlu satu atau lebih syarat-syarat untuk menghasilkan
nilainya yang berbeza. (Contohnya fungsi `i18n_` bergantung kepada
`$XUANQI_CONTENT_LANGUAGE` untuk menghasilkan datanya berkhusus kepada
bahasa dipilih). **BERHATI-HATI: fungsi-fungsi dengan nama yang sama
akan diganti semasa import**. Sampel fail (`Data/i18n/title.sh`) telah
dicipta untuk rujukan anda.

Kaedah terakhir ialah membaca fail `.txt` secara manual dalam suatu
direktori. XuanQi hanya akan menghuraikan `.conf` dan `.sh` jadi
anda boleh menggunakannya dengan selamat. Ini dilakukan secara
menyusun nama set data tertentu sebagai nama direktori dan
menamakan fail sebagai nama parameter. Keburukannya kaedah ini ialah
ia mengambil lebih banyak trafik baca/tulis IO yang boleh memperlahankan
pengeluaran. Walau bagaimanapun, *pemenuhan keperluan sentiasa diutamakan
sebelum kelajuan*. Jadi anda masih boleh mempertimbangkan untuk
menggunakan kaedah apabila diperlukan. Contoh pemprosesan i18n
berdasarkan fail teks:

```
[XUANQI_PATH_COMPONENTS]
└── [XUANQI_COMPONENT_NAME]
       ├── Data
       │    ├── names
       │    │     ├── de.txt
       │    │     ├── en.txt
       │    │     ├── es.txt
       │    │     └── ...
       │    └── ...
       └── ...

# apabila menggunakannya di dalam skript shell
____name="$( \\
    XuanQi_Data_Read_Raw \\
        "${XUANQI_COMPONENT_PATH}/Data/names/${XUANQI_CONTENT_LANGUAGE}.txt" \\
)"
```



### Cara Pemilihan

Sentiasa gunakan `.conf` secara lalai and apabila boleh
digunakan. Jika ada keperluan logik syarats (contohnya keadaan,
dll), gunakan `.sh`.




## Fail Media

Walaupun secara teknikalnya fail media
(contohnya gambar, audio, video, dll) adalah data,
**sila ELAKKAN masukannya di sini**. XuanQi ada komponen `media`
dengan fungsi pemprosesan khusus untuknya. Sila gunakan itu sebaliknya.

Anda harus sentiasa menganggap komponen data sebagai
**tanpa pangkalan data** (`noDB`).




## Epilog

Itu sahaja untuk bahagian bantuan mencipta komponen data.
