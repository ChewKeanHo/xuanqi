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




# Тохиргооны Файл Үүсгэх CLI

`create config` команд мөрний интерфейс (CLI) нь төсөлд нэгдсэн
ашиглагдах боломжтой ганц бичлэгтэй `.conf` өгөгдлийн файлыг
үүсгэхэд зориулагдсан. Түүний бүтэн команд дараах байдалтай:

```
$ [XUANQI] create config [RELATIVE_PATH] [KEY] [VALUE]
```

* `[RELATIVE_PATH]`
  * **ЗААВАЛ ШААРДЛАГАТАЙ**
  * `$XUANQI_PATH_CONFIGS` эх сурвалжаас харьцангуй зам бөгөөд
    `.conf` файлын өргөтгөлөөр төгсөнө.
  * Хэрэв `.conf` файлын өргөтгөл өгөгдөөгүй бол XuanQi дотооддоо
    нэмнэ.
  * Хэрэв `.conf` файл нь төслийн тохиргооны хавтаснаас гадуур
    байвал эсвэл хавтас байхгүй бол алдаа мэдээлнэ.
  * Файлын нэрийг өөрөө сонгоно. Энэ нь XuanQi-д нөлөөлөхгүй.
* `[KEY]`
  * **ЗААВАЛ ШААРДЛАГАТАЙ**
  * `key:value` бичлэгийн `key` шошго.
  * Түлхүүр нь орчны хувьсагч болгон ашиглагдах тул доогуур
    зураас (`_`) ашиглана.
  * Утга нь өвөрмөц байхыг баталгаажуулна. Үгүй бол олон тохиргооны
    файлд ижил түлхүүр байх боломжтой бөгөөд урьдчилан хэлж болохгүй
    үр дагаварт хүргэж болно (сүүлийн задлан шинжлэл хийгдсэн файл
    нь өмнөхүүдийг дарна).
* `[VALUE]`
  * **СОНГОМОЛ**
  * `key:value` бичлэгийн `value` шошго.
  * Хоосон үлдээсэн тохиолдолд дурьдсан текст солигдож, дараа нь
    файлыг шинэчилж болно.




## Замын Хязгаарлалт

Аюулгүй байдлын шалтгаанаар XuanQi нь өгөгдлийн файлыг зөвхөн
`$PROJECT_PATH_ROOT` дотор үүсгэхийг зөвшөөрнө. Үгүй бол алдаа
мэдээлж, юу ч хийхгүй.

Зөвхөн энэ үүсгэх үйлдлийн хувьд энэ нь **ЧАНАР**
`$XUANQI_PATH_CONFIGS` хавтас (энэ нь мөн `$PROJECT_PATH_ROOT`
дотор байрладаг) руу хязгаарлагдана.




## Мэдэгдэл Баримтжуулалтууд

Дэмжигдсэн орчны хувьсагчтай тохирч буй `[KEY]`-ээс хамааран
үүсгэгдсэн тохиргооны файл нь өөрийн гэсэн баримтжуулалттай
байж болно. Үзнэ үү:

```
$ [XUANQI] help variables
```

дэмжигдсэн хувьсагчдын жагсаалтыг харах.




## Эпилог

Энэ CLI-ийн хувьд энэ бүхэн.
