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




# Skapa CSS-komponent Hjälpavsnitt

Detta är hjälpavsnittet för att skapa en CSS-komponent antingen
oberoende eller som en del av en annan större komponent. För att
inkludera CSS-delen, mata helt enkelt in `css` i `[TYPES]`-värdet.
Exempel:

```
# kommandomönster
$ [XuanQi] create component [TYPES] [NAME]

# bara CSS-komponent
$ [XuanQi] create component css [NAME]

# med CSS-del inuti en sammansatt komponent
$ [XuanQi] create component "...,css,..." [NAME]
```




## Syfte

CSS-komponenten är främst för att skapa CSS-tillgångens utdatafil
(t.ex. `page.css`). XuanQi har båda inbyggda funktioner i
`Shell`-funktioner eller kopierar en vanlig CSS-fil.




## Filstrukturer

CSS-komponenten följer följande standard filstruktur:

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

* komponentkatalogen är `CSS`.
* komponentoperatörsskalskriptet är `CSS/xuanqi.sh`.
* komponentoperatörsskalskriptet anropas av huvudkomponentimportörens
  skalskript `XuanQi/import.sh`.




## `CSS/xuanqi.sh` Huvudskript

Ditt **ultimata mål är att skriva CSS-utdatafilen till
`$XUANQI_CONTENT_PATH` på ditt sätt**. Hur du gör det är helt
upp till dig.

Flera routerskript kan kalla på samma komponent för filrendering
(t.ex. olika mediamål som mobil, utskrift, e-post för samma innehåll).
Därför bör du strategiskt designa dina nödvändiga miljövariabler för
användare att ställa in i routerskriptet.

Sedan, när `CSS/xuanqi.sh` körs, tolkar du dessa miljövariabler
och reagerar därefter.

Du kan hänvisa till projektets `XuanQi/.internals/API` för
tillgängliga API:er.




## Programmatiskt eller Kopiera Över

XuanQi tillhandahåller både programmerbara funktioner och råa
kopieringsfunktioner för att enkelt rendera CSS-filen. Beslutet
beror på ditt team.

Om ditt team inte är bekant med skalskriptning är det senare att
föredra så att hela teamet kan arbeta på den tillhandahållna
`.css`-filen medan XuanQi bara kopierar den till
`$XUANQI_CONTENT_PATH`. Detta är bra för de som använder
`Sass`-kompilatorn.

XuanQis skalskript programmerbara funktioner underlättar en större
intern flexibilitet över renderingen (tänk makro över CSS-skrivande).
Fördelen är inget beroende och extremt flexibel med din
innehållsgenerator. Detta är lämpligt för erfarna CSS-utvecklare som
ser `Sass` som ett hinder.

I vilket fall som helst är du i goda händer. Bara prova och anpassa
dig med tiden.




## Epilog

Det är allt för att skapa CSS-komponent hjälpavsnitt.
