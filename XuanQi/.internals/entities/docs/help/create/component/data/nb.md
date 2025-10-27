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




# Hjelpeseksjon for Opprettelse av Datakomponent

Dette er hjelpeseksjonen for å opprette en datakomponent enten
uavhengig eller som en del av en annen større komponent. For å
inkludere data-delen, legg bare inn `data` i `[TYPES]`-verdien.
Eksempel:

```
# kommandomønster
$ [XuanQi] create component [TYPES] [NAME]

# bare datakomponent
$ [XuanQi] create component data [NAME]

# med datadel inne i en sammensatt komponent
$ [XuanQi] create component "...,data,..." [NAME]
```




## Formål

Datakomponenten er hovedsakelig for å tilrettelegge for
prosjektet og komponenten med et spesifikt datasett. Dette
muliggjør variable rendering-endringer for de samme filoppsettene,
noe som gjør utdatavalg robuste uten å ofre vedlikeholdbarhet.
XuanQi har innebygde fasiliteter for å importere alle
konfigurasjonsfiler (`.conf`) og skallskript (`.sh`)-funksjoner
sømløst.

Generelt behandler XuanQi datakomponenten som en **databaseløs**
(`noDB`) datalager.




## Filstrukturer

Datakomponenten følger følgende standard filstruktur:

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
* komponentoperatørens skallskript er direkte inni
  `XuanQi/import.sh`. Den er en del av komponentinitialiseringen.




## Primært Mål

Ditt **primære mål er å abstrahere de variable datakildene
og opprette datafasiliteten for prosjektet eller komponentene dine**.
Hvordan du gjør det, er helt opp til deg.

Ved hver komponents initialisering kan enhver komponent parse
datakomponenten fra inni eller på tvers av andre komponenter. Derfor
**MÅ** du holde datakatalogen fleksibel og parserbar til enhver tid.

Du kan referere til prosjektets `XuanQi/.internals/API` for
tilgjengelige API-er.




## Konfigurasjonsfil eller Skallskript

XuanQi tilbyr 2 primære måter å håndtere datahåndtering på:

* konfigurasjonsfil (`.conf`)
* skallskriptfunksjonsfil (`.sh`)

`.conf` er egnet for rask variabeloppsett slik at du kan
umiddelbart bruke verdien for filrendering. En eksempelfil
(`Data/sample.conf`) opprettes for hvordan du lager en.
**Én fil bør bare inneholde ett nøkkel:verdi-par**.

`.sh` er faktisk et skallskript som inneholder en
funksjonsdefinisjon for å tilveiebringe data ved logisk betinging.
Dette er mest egnet hvis datasettet ditt krever en eller flere
betingelser for å rendre en utdata annerledes (f.eks.
`i18n_`-funksjoner avhenger av `$XUANQI_CONTENT_LANGUAGE`-flagget
for å returnere en språkspesifikk streng). **VÆR FORSIKTIG:
funksjoner med samme navn vil bli overstyrt under import**. En
eksempelfil (`Data/i18n/title.sh`) opprettes for din referanse.

Det siste alternativet ville være manuelt å lese `.txt`-filer inni en
katalog. XuanQi vil bare parse `.conf` og `.sh`, så du er trygg på
å bruke det. Dette gjøres ved å organisere et spesifikt datasettnavn
som katalognavn og la filnavnet strengt tatt være parameterens navn.
Ulempen er at denne metoden opptar mer IO-lese/skrive-trafikk som
kan senke produksjonen. Imidlertid er *kravoppfyllelse alltid
før hastighet*, så du kan likevel vurdere å bruke den når det kreves.
Eksempel på tekstfilbasert i18n-tilnærming:

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

# bruke det ovenstående i skallskript
____name="$( \\
    XuanQi_Data_Read_Raw \\
        "${XUANQI_COMPONENT_PATH}/Data/names/${XUANQI_CONTENT_LANGUAGE}.txt" \\
)"
```



### Hvordan Velge

Bruk alltid `.conf` som standard og når det er mulig. Hvis det er
et logisk krav (f.eks. tilstand, etc.), så bruk `.sh`.




## Mediafiler

Selv om mediafiler (f.eks. bilder, lyd, video, etc.)
teknisk sett er data, **vær så snill UNNGÅ å plassere dem her**.
Det finnes en dedikert `media`-komponent med dedikerte
prosesseringsfunksjoner for det. Vennligst bruk den i stedet.

Du bør alltid behandle datakomponenten som en **databaseløs**
(`noDB`).




## Epilog

Det er alt for hjelpeseksjonen for opprettelse av datakomponent.
