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




# XuanQi-ийн Component Үүсгэх тусламжийн хэсэгт тавтай морил.

XuanQi нь голчлон component-ийн үзэл баримтлалаар ажилладаг.
Бүх зүйл нь component-үүдээс бүрддэг. Доор нэгийг үүсгэх
ерөнхий команд байна:

```
$ [XuanQi] create component [TYPES] [NAME]
```

энд:

* `[TYPES]` нь таны үүсгэх гэж буй component-ийн доторх
  component төрлүүдийн жагсаалт.
* `[NAME]` component-ийн нэр хүртэлх харьцангуй замын байршил
  (жишээ нь: root rendering хуудасны тулд `pages/root`).

Гаралт нь `$XUANQI_PATH_COMPONENTS` директород хадгалагдана
(`$XUANQI_DIRECTORY_COMPONENTS`-аас үүссэн).




## Component-ийн Төрлүүд

Хэд хэдэн component-ийн төрлүүд байх бөгөөд тус бүр нь өөрийн
гэсэн баримт бичгүүдтэй. Та сонирхож буй төрлийн талаар дараах
командыг гүйцэтгэж мэдэж болно:

```
[XUANQI] help create component [TYPE]
```

Дэмжигддэг `[TYPE]` утгууд нь:
