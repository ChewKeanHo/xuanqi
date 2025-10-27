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




# Hjelpeseksjon for Oppretting av Datakomponent

Dette er hjelpeseksjonen for å opprette ein datakomponent anten
sjølvstendig eller som ein del av ein annan større komponent. For å
inkludere data-delen, berre legg inn `data` i `[TYPES]`-verdien.
Døme:

```
# kommandomønster
$ [XuanQi] create component [TYPES] [NAME]

# berre datakomponent
$ [XuanQi] create component data [NAME]

# med datadel inni ein samansett komponent
$ [XuanQi] create component "...,data,..." [NAME]
```




## Formål

Datakomponenten er hovudsakleg for å tilrettelegge for prosjektet og
komponenten med eit spesifikt datasett. Dette gjer variable rendering-
endringar mogelege for dei same filoppsetta, noko som gjer utvala for
utdata robuste utan å ofre vedlikehaldbarheit. XuanQi har innebygde
fasilitetar for å importere alle konfigurasjonsfiler (`.conf`) og
skallskript (`.sh`)-funksjonar sømlaust.

Generelt behandlar XuanQi datakomponenten som ein **databaselaus**
(`noDB`) datalager.




## Filstrukturar

Datakomponenten fylgjer følgjande standard filstruktur:

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

* komponentkatalogen er `Data`.
* komponentoperatøren sitt skallskript er direkte inni
  `XuanQi/import.sh`. Det er ein del av komponentinitialiseringa.




## Primært Mål

Ditt **primære mål er å abstrahere dei variable datakjeldene
og opprette datafasiliteten for prosjektet eller komponentane dine**.
Korleis du gjer det, er heilt opp til deg.

Ved kvar komponent sin initialisering kan kva som helst komponent parse
datakomponenten frå inni eller på tvers av andre komponentar. Derfor
**MÅ** du halde datakatalogen fleksibel og parserbar til alle tider.

Du kan referere til prosjektet sin `XuanQi/.internals/API` for
tilgjengelege API-ar.




## Konfigurasjonsfil eller Skallskript

XuanQi tilbyr 2 primære måtar å handtere datahandtering på:

* konfigurasjonsfil (`.conf`)
* skallskriptfunksjonsfil (`.sh`)

`.conf` er egna for rask variabeloppsett slik at du kan
umiddelbart bruke verdien for filrendering. Ein eksempelfil
(`Data/sample.conf`) vert oppretta for korleis du lager ein.
**Éin fil bør berre innehalde eitt nøkkel:verdi-par**.

`.sh` er faktisk eit skallskript som inneheld ein
funksjonsdefinisjon for å tilveiebringe data ved logisk betinging.
Dette er mest egna viss datasettet ditt krev ein eller fleire
betingelser for å rendre ein utdata annleis (t.d. `i18n_`-funksjonar
avheng av `$XUANQI_CONTENT_LANGUAGE`-flagget for å returnere ein
språkspesifikk streng). **VÆR FORSIKTIG: funksjonar med same namn
vil verta overstyrt under import**. Ein eksempelfil
(`Data/i18n/title.sh`) vert oppretta for di referanse.

Den siste opsjonen ville vore manuelt å lesa `.txt`-filer inni ein
katalog. XuanQi vil berre parse `.conf` og `.sh`, så du er trygg på
å bruke det. Dette vert gjort ved å organisere eit spesifikt
datasettnamn som katalognamn og la filnamnet strengt tatt vere
parameteren sitt namn. Ulempen er at denne metoden opptar meir
IO-lese/skrive-trafikk som kan senke produksjonen. Imidlertid er
*kravoppfyljing alltid før fart*, så du kan likevel vurdera å bruke
den når det krevst. Døme på tekstfilbasert i18n-tilnærming:

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

# bruke det ovanståande i skallskript
____name="$( \\
    XuanQi_Data_Read_Raw \\
        "${XUANQI_COMPONENT_PATH}/Data/names/${XUANQI_CONTENT_LANGUAGE}.txt" \\
)"
```



### Korleis Velje

Bruk alltid `.conf` som standard og når det er mogeleg.
Viss det er eit logisk krav (t.d. tilstand, etc.), så bruk `.sh`.




## Mediafiler

Sjølv om mediafiler (t.d. bilete, lyd, video, etc.)
teknisk sett er data, **ver så snill UNNGÅ å plassere dei her**.
Det finst ein dedikert `media`-komponent med dedikerte
prosesseringsfunksjonar for det. Ver venleg og bruk den i staden.

Du bør alltid behandla datakomponenten som ein **databaselaus**
(`noDB`).




## Epilog

Det er alt for hjelpeseksjonen for oppretting av datakomponent.
