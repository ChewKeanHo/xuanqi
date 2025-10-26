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




# Тавтай морил!

Энэ бол олон хэсгээс бүрдсэн баримт бичиг юм. Энэхүү том хэмжээний
унших материалыг хязгаарлах зорилгоор "Business Need-To-Know" бодлогыг
ашиглан тусгайлан зохион бүтээсэн.

Доороос харна уу!




## Түргэн Заавар

Зөвхөн түргэн шалгалт хийхийг хүсэж буй туршлагатай хэрэглэгчдэд зориулав:

* `[XUANQI] build` - төсөл бүтээх.
* `[XUANQI] create [ТӨРӨЛ] [УТГА1] [УТГА2] ...`   - ямар нэг зүйл үүсгэх.
* `[XUANQI] purge` - төслийг бүрэн цэвэрлэх.

Устгах ёсгүй чухал хавтсууд:

* `configs`
  * XuanQi-ийн ажлын орчны тохиргоог агуулдаг. ЭНД ЮМ УСТГАХГҮЙ.
  * `configs/` хавтсын нэр.
* `components`
  * бүх гадаад модуль бүрэлдэхүүн хэсгүүдийг агуулдаг.
* `layouts`
  * router-д рендер хийхэд зориулсан XuanQi-ийн ажлын орчны бүх хуудасны
    загварууд.
* `public`
  * `routers`-д тодорхойлсон бүтцээр XuanQi-ийн гаралтын файлууд.
* `routers`
  * төслийн файлын бүтэц, гаралтын рендер скриптүүдийг буулгана.
* `tests`
  * өөрийгөө шалгах XuanQi-ийн ажлын орчны бүх тестийн скриптүүд.




## Хэлний Тухай

XuanQi нь `configs/xuanqi.conf` тохиргооны файл эсвэл системийн `$LANG`
орчны хувьсагчаар тохируулсан `$XUANQI_LANGUAGE` орчны хувьсагчаар
дараах хэлүүдийг дэмждэг.

* (de) Deutsch
* (en) English (үндсэн ба нөөц)
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

Энэ нь `build` командын тусламжийн индекс хэсгийг нээж, бүх шаардлагыг харуулна.




## Create

```
$ [XUANQI] help create
```

Энэ нь `create` командын тусламжийн индекс хэсгийг нээж, бүх шаардлагыг харуулна.




## Purge

```
$ [XUANQI] help purge
```

Энэ нь `purge` командын тусламжийн индекс хэсгийг нээж, бүх шаардлагыг харуулна.




## Test

```
$ [XUANQI] help test
```

Энэ нь `test` командын тусламжийн индекс хэсгийг нээж, бүх шаардлагыг харуулна.
