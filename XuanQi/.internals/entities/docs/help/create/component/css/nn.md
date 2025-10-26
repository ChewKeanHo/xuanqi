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




# Opprett CSS-komponent Hjelpeseksjon

Dette er hjelpeseksjonen for å opprette ein CSS-komponent anten
uavhengig eller som ein del av ein anna større komponent. For å
inkludere CSS-delen, berre legg `css` inn i `[TYPES]`-verdien.
Døme:

```
# kommandomønster
$ [XuanQi] create component [TYPES] [NAME]

# berre CSS-komponent
$ [XuanQi] create component css [NAME]

# med CSS-del inni ein samansett komponent
$ [XuanQi] create component "...,css,..." [NAME]
```




## Formål

CSS-komponenten er hovudsakleg for å opprette CSS-ressursutdatafila
(t.d. `page.css`). XuanQi har både innebygde fasilitetar i
`Shell`-funksjonar eller kopierer ein vanleg CSS-fil.




## Filstrukturar

CSS-komponenten følgjer følgjande standard filstruktur:

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
* komponentoperatør skallskriptet er `CSS/xuanqi.sh`.
* komponentoperatør skallskriptet vert kalla av
  hovudkomponentimportøren skallskript `XuanQi/import.sh`.




## `CSS/xuanqi.sh` Hovudskript

Ditt **ultimate mål er å skrive CSS-utdatafila
inn i `$XUANQI_CONTENT_PATH` på din måte**. Korleis du gjer det
er heilt opp til deg.

Fleire rutarskript kan tilkalle same komponenten for filgjengjering
(t.d. ulike mediemål som mobil, utskrift, e-post for same innhald).
Difor bør du strategisk designe dine naudsynte miljøvariablar for
brukarar å setje opp i rutarskriptet.

Deretter, medan `CSS/xuanqi.sh` vert utført, analyserer du desse
miljøvariablane og reagerer i samsvar med dei.

Du kan referere prosjektets `XuanQi/.internals/API` for
tilgjengelege API-ar.




## Programmatisk eller Kopier Over

XuanQi tilbyr både programmerbare funksjonar og rå
kopieringsfunksjonar for enkelt å gjengje CSS-fila. Avgjerda
avhenger av laget ditt.

Viss laget ditt ikkje er kjent med skallskripting, er sistnemnde
å føretrekke slik at heile laget kan jobbe med den leverte
`.css`-fila medan XuanQi berre kopierer henne over til
`$XUANQI_CONTENT_PATH`. Dette er flott for dei som brukar
`Sass`-kompilator for å få jobben gjort.

XuanQi sine skallskript programmerbare funksjonar fasiliterer
ein større indre fleksibilitet over gjengjeringa (tenk makro over
CSS-skriving). Fordelen er ingen avhengighet og ekstremt fleksibel
med innhaldsgeneratoren din. Dette er egna for erfarne CSS-utviklarar
som ser `Sass` som ei hindring.

Uansett er du i gode hender. Berre prøv det og tilpass deg over tid.




## Epilog

Det er alt for opprett CSS-komponent hjelpeseksjon.
