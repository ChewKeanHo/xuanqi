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




# Opprett CSS-komponent Hjelpeseksjon

Dette er hjelpeseksjonen for å opprette en CSS-komponent enten
uavhengig eller som en del av en annen større komponent. For å
inkludere CSS-delen, legg bare til `css` i `[TYPES]`-verdien.
Eksempel:

```
# kommandomønster
$ [XuanQi] create component [TYPES] [NAME]

# bare CSS-komponent
$ [XuanQi] create component css [NAME]

# med CSS-del inne i en sammensatt komponent
$ [XuanQi] create component "...,css,..." [NAME]
```




## Formål

CSS-komponenten er hovedsakelig for å opprette CSS-ressursutdatafilen
(f.eks. `page.css`). XuanQi har både innebygde fasiliteter i
`Shell`-funksjoner eller kopierer en vanlig CSS-fil.




## Filstrukturer

CSS-komponenten overholder følgende standard filstruktur:

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

* komponentkatalogen er `CSS`.
* komponentoperatørs skallskript er `CSS/xuanqi.sh`.
* komponentoperatørs skallskript kalles av hovedkomponentimportørens
  skallskript `XuanQi/import.sh`.




## `CSS/xuanqi.sh` Hovedskript

Ditt **ultimate mål er å skrive CSS-utdatafilen
inn i `$XUANQI_CONTENT_PATH` på din måte**. Hvordan du gjør det er
helt opp til deg.

Flere ruterskript kan tilkalle den samme komponenten for
filgjengivelse (f.eks. forskjellige mediemål som mobil, utskrift,
e-post for samme innhold). Derfor bør du strategisk designe dine
nødvendige miljøvariabler for brukere å sette opp i ruterskriptet.

Deretter, mens `CSS/xuanqi.sh` utføres, analyserer du disse
miljøvariablene og reagerer i samsvar med dem.

Du kan referere prosjektets `XuanQi/.internals/API` for
tilgjengelige APIer.




## Programmatisk eller Kopier Over

XuanQi tilbyr både programmerbare funksjoner og rå
kopieringsfunksjoner for enkelt å gjengi CSS-filen. Beslutningen
avhenger av teamet ditt.

Hvis teamet ditt ikke er kjent med skallskripting, er sistnevnte
å foretrekke slik at hele teamet kan jobbe med den leverte
`.css`-filen mens XuanQi bare kopierer den over til
`$XUANQI_CONTENT_PATH`. Dette er flott for de som bruker
`Sass`-kompilator for å få jobben gjort.

XuanQis skallskript programmerbare funksjoner fasiliterer en
større indre fleksibilitet over gjengivelsen (tenk makro over
CSS-skriving). Fordelen er ingen avhengighet og ekstremt fleksibel
med innholdsgeneratoren din. Dette er egnet for erfarne CSS-utviklere
som ser `Sass` som en hindring.

Uansett er du i gode hender. Bare prøv det og tilpass deg over tid.




## Epilog

Det er alt for opprett CSS-komponent hjelpeseksjon.
