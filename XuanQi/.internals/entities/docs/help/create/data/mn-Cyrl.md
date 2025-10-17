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




# Өгөгдлийн Файл Үүсгэх CLI

`create data` команд мөрний интерфейс (CLI) нь төсөлд ашиглагдах
ганц бичлэгтэй `.conf` өгөгдлийн файлыг үүсгэхэд зориулагдсан. Түүний
бүтэн команд дараах байдалтай:

```
$ [XUANQI] create data [RELATIVE_PATH] [KEY] [VALUE]
```

* `[RELATIVE_PATH]`
  * **ЗААВАЛ БАЙХ ШААРДЛАГАТАЙ**
  * `$PROJECT_PATH_ROOT` -аас эхлэсэн харьцангуй зам бөгөөд
    `.conf` файлын өргөтгөлөөр төгсөнө.
  * Хэрэв `.conf` файлын өргөтгөлийг заагаагүй бол XuanQi дотор нь
    автоматаар нэмнэ.
  * Файлын нэрийг өөрийн хүсэл сонирхолын дагуу өөрчилж болно. Энэ
    нь XuanQi-д нөлөөлөхгүй.
* `[KEY]`
  * **ЗААВАЛ БАЙХ ШААРДЛАГАТАЙ**
  * `key:value` бичлэгийн `key` шошго.
  * Түлхүүр нь орчны хувьсагч болох учраас доогуур зураас (`_`)
    ашиглах хэрэгтэй.
  * Утга нь өвөрмөц байхыг баталгаажуулна уу. Эс тэгвээс олон
    тохируулгын файлд ижил түлхүүр байвал
    урьдчилан таамаглах боломжгүй үр дагавар (сүүлд уншисан файл
    нь өмнөхүүдийг дарна) үүсгэж болно.
* `[VALUE]`
  * **СОНГОЛТОЙ**
  * `key:value` бичлэгийн `value` шошго.
  * Хоосон үлдээвэл, дараа нь файлыг шинэчлэх боломжтой дээж текст
    орлуулагдана.




## Замын хязгаарлалт

Аюулгүй байдлын үүднээс XuanQi нь өгөгдлийн файлыг зөвхөн
`$PROJECT_PATH_ROOT` дотор үүсгэхийг зөвшөөрдөг. Эс бөгөөс алдаа өгч,
юу ч хийхгүй.




## Эпилог

Энэ CLI-ийн талаарх тайлбар дууслаа.
