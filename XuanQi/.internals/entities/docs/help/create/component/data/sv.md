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




# Hjälpavsnitt för Att Skapa Datakomponent

Detta är hjälpavsnittet för att skapa en datakomponent antingen
oberoende eller som en del av en annan större komponent. För att
inkludera datadelen, mata helt enkelt in `data` i `[TYPES]`-värdet.
Exempel:

```
# kommandomönster
$ [XuanQi] create component [TYPES] [NAME]

# endast datakomponent
$ [XuanQi] create component data [NAME]

# med datadel inuti en sammansatt komponent
$ [XuanQi] create component "...,data,..." [NAME]
```




## Syfte

Datakomponenten är främst till för att underlätta projektet och
komponenten med en specifik dataset. Detta möjliggör variabel
renderings-förändringar för samma fillayouter vilket gör utdataval
robusta utan att offra underhållbarhet. XuanQi har inbyggda
funktioner för att importera alla konfigurationsfiler (`.conf`)
och shellskript (`.sh`)-funktioner sömlöst.

I allmänhet behandlar XuanQi datakomponenten som en **databaslös**
(`noDB`) datalagring.




## Filstrukturer

Datakomponenten följer följande standardfilstruktur:

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

* komponentkatalogen är `Data`.
* komponentoperatörens shellskript finns direkt inuti
  `XuanQi/import.sh`. Den är en del av komponentinitialiseringen.




## Primärt Mål

Ditt **primära mål är att abstrahera de variabla datakällorna
och skapa dataanläggningen för ditt projekt eller dina komponenter**.
Hur du gör det är helt upp till dig.

Vid varje komponents initialisering kan vilken komponent som helst tolka
datakomponenten inifrån eller över andra komponenter. Därför **MÅSTE**
du hålla datakatalogen flexibel och tolkningsbar till alla tider.

Du kan hänvisa till projektets `XuanQi/.internals/API` för tillgängliga
API:er.




## Konfigurationsfil eller Shellskript

XuanQi tillhandahåller 2 primära sätt att hantera datahantering:

* konfigurationsfil (`.conf`)
* shellskriptfunktionsfil (`.sh`)

`.conf` är lämplig för snabb variabelinställning så att du kan
omedelbart använda dess värde för filrendering. En exempelfil
(`Data/sample.conf`) skapas för hur man skapar en.
**En fil bör endast innehålla ett nyckel:värde-par**.

`.sh` är faktiskt ett shellskript som innehåller en
funktionsdefinition för att tillhandahålla data genom logisk
betingning. Detta är mest lämpligt om din dataset kräver ett eller
flera villkor för att rendera en utdata annorlunda (t.ex.
`i18n_`-funktioner beror på `$XUANQI_CONTENT_LANGUAGE`-flaggan för
att returnera en språkspecifik sträng). **VAR FORSIKTIG: funktioner
med samma namn kommer att åsidosättas under import**. En exempelfil
(`Data/i18n/title.sh`) skapas för din referens.

Det sista alternativet skulle vara att manuellt läsa `.txt`-filer
inuti en katalog. XuanQi kommer endast att tolka `.conf` och `.sh`
så du är säker på att använda det. Detta görs genom att organisera
ett specifikt datasetnamn som katalognamn och lämna filnamnet strikt
som parameterns namn. Nackdelen är att denna metod upptar mer
IO-läs-/skrivtrafik som kan sakta ner produktionen. Emellertid är
*kravuppfyllelse alltid före hastighet* så du kan fortfarande överväga
att använda det när det krävs. Exempel textfiler baserad
i18n-tillväggagångssätt:

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

# använda ovanstående i shellskript
____name="$( \\
    XuanQi_Data_Read_Raw \\
        "${XUANQI_COMPONENT_PATH}/Data/names/${XUANQI_CONTENT_LANGUAGE}.txt" \\
)"
```


### Hur man Väljer

Använd alltid `.conf` som standard och när det är möjligt. Om
det finns ett logiskt krav (t.ex. villkor, etc.), använd sedan `.sh`.




## Mediafiler

Även om mediafiler (t.ex. bilder, ljud, video, etc.)
tekniskt sett är data, **var snäll UNDVIK att placera dem här**.
Det finns en dedikerad `media`-komponent med dedikerade
bearbetningsfunktioner för det. Var snäll och använd den istället.

Du bör alltid behandla datakomponenten som en **databaslös**
(`noDB`).




## Epilog

Det är allt för hjälpavsnittet för att skapa datakomponent.
