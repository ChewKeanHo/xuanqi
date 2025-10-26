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




# CSS Компонент Тусламжийн Хэсгийг Үүсгэх

Энэ нь CSS компонентийг бие даан эсвэл өөр том компонентийн
нэг хэсэг болгон үүсгэх тусламжийн хэсэг юм. CSS хэсгийг
оруулахын тулд `[TYPES]` утгад `css` оруулахад хангалттай.
Жишээ:

```
# командны загвар
$ [XuanQi] create component [TYPES] [NAME]

# зөвхөн CSS компонент
$ [XuanQi] create component css [NAME]

# нийлмэл компонент дотор CSS хэсэгтэй
$ [XuanQi] create component "...,css,..." [NAME]
```



## Зорилго

CSS компонент нь голчлон CSS актив гаралтын файлыг (жишээ нь
`page.css`) үүсгэхэд зориулагдсан. XuanQi нь `Shell` функцууд
дотор суурилуулсан боломжууд болон ердийн CSS файлыг хуулах
аль аль нь байдаг.




## Файлын бүтэц

CSS компонент дараах анхны файлын бүтэцтэй нийцнэ:

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

* компонентийн директор нь `CSS` байна.
* компонентийн оператор shell скрипт нь `CSS/xuanqi.sh` байна.
* компонентийн оператор shell скрипт нь гол компонентийн импортлогч
  shell скрипт `XuanQi/import.sh` дуудагдана.




## `CSS/xuanqi.sh` Гол скрипт

Таны **эцсийн зорилго нь CSS гаралтын файлыг `$XUANQI_CONTENT_PATH`
руу таны аргаар бичих явдал юм**. Үүнийг хэрхэн хийх нь бүрэн танаас
хамаарна.

Олон router скриптүүд файл рендэрлэхэд ижил компонентийг дуудаж болно
(жишээ нь: ижил контентонд зориулсан мобайл, хэвлэх, имэйл гэх мэт
өөр өөр медиа зорилтууд). Тиймээс та router скрипт дотор хэрэглэгчид
тохируулах шаардлагатай орчны хувьсагчуудаа стратегийн төлөвлөсөн
байдлаар зохион бүтээх хэрэгтэй.

Дараа нь `CSS/xuanqi.sh` ажиллах үед эдгээр орчны хувьсагчуудыг задлан
шинжилж, үүний дагуу хариу үйлдэл үзүүлнэ.

Та боломжтой API-уудыг төсөлийн `XuanQi/.internals/API` дотроос харж
болно.




## Програмчлах эсвэл Хуулах

XuanQi нь CSS файлыг хялбархан рендэрлэхэд програмчлах болон түүхийн
хуулах функцуудыг хоёуланг нь өгдөг. Шийдвэр нь таны багнаас хамаарна.

Хэрэв таны баг shell скрипт бичихтэй танил биш бол сүүлийнх нь илүүдэж,
бүх баг нь өгөгдсөн `.css` файл дээр ажиллах боломжтой бол XuanQi нь
үүнийг зөвхөн `$XUANQI_CONTENT_PATH` руу хуулах болно. Энэ нь `Sass`
компайлер ашигладаг хүмүүст маш сайн.

XuanQi-ийн Shell скрипт програмчлах функцууд нь рендэрлэхэд илүү их
дотоод уян хатан байдлыг хангадаг (CSS бичих дээрх макрог бод). Давуу
тал нь хамааралгүй бөгөөд таны контент үүсгэгчтэй маш уян хатан байдаг.
Энэ нь `Sass`-г саад гэж үздэг туршлагатай CSS хөгжүүлэгчдэд тохиромжтой.

Ямар ч тохиолдолд та сайн гарт байна. Зүгээр л туршаад цаг хугацаа
өнгөрөхөд дасан зохицоорой.




## Эпилог

CSS компонент үүсгэх тусламжийн хэсгийн хувьд энэ бүхэн.
