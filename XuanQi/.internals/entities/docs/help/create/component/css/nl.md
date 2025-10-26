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




# CSS Component Help Sectie Aanmaken

Dit is de helpsectie voor het aanmaken van een CSS-component, hetzij
onafhankelijk of als onderdeel van een andere grotere component. Om het
CSS-gedeelte op te nemen, voer eenvoudig `css` in de `[TYPES]`-waarde.
Voorbeeld:

```
# commando patroon
$ [XuanQi] create component [TYPES] [NAME]

# alleen CSS-component
$ [XuanQi] create component css [NAME]

# met CSS-gedeelte binnen een samengestelde component
$ [XuanQi] create component "...,css,..." [NAME]
```



## Doel

De CSS-component is voornamelijk voor het aanmaken van het CSS-asset
uitvoerbestand (bijv. `page.css`). XuanQi heeft zowel ingebouwde
faciliteiten in `Shell`-functies of kopieert een regulier CSS-bestand.




## Bestandsstructuren

De CSS-component voldoet aan de volgende standaard bestandsstructuur:

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

* de componentmap is `CSS`.
* het componentoperator shell-script is `CSS/xuanqi.sh`.
* het componentoperator shell-script wordt aangeroepen door het
  hoofdcomponent importeur shell-script `XuanQi/import.sh`.




## `CSS/xuanqi.sh` Hoofdscript

Uw **uiteindelijke doel is om het CSS-uitvoerbestand op uw manier
te schrijven naar `$XUANQI_CONTENT_PATH`**. Hoe u dit doet, is
geheel aan u.

Meerdere routerscripts kunnen dezelfde component oproepen voor
bestandsweergave (bijv. verschillende mediadoelen zoals mobiel,
print, e-mail voor dezelfde inhoud). Daarom moet u uw vereiste
omgevingsvariabelen strategisch ontwerpen voor gebruikers om in
te stellen in het routerscript.

Vervolgens, terwijl `CSS/xuanqi.sh` wordt uitgevoerd, parseert u
deze omgevingsvariabelen en reageert u dienovereenkomstig.

U kunt verwijzen naar de `XuanQi/.internals/API` van het project
voor beschikbare API's.




## Programmatisch of Kopiëren

XuanQi biedt zowel programmeerbare functies als ruwe kopieerfuncties
om het CSS-bestand eenvoudig weer te geven. De beslissing hangt af
van uw team.

Als uw team niet bekend is met shell-scripting, heeft de laatste de
voorkeur zodat het hele team kan werken aan het geleverde
`.css`-bestand terwijl XuanQi het eenvoudig kopieert naar
`$XUANQI_CONTENT_PATH`. Dit is geweldig voor degenen die de
`Sass`-compiler gebruiken.

XuanQi's shell-scripting programmeerbare functies faciliteren een
grotere interne flexibiliteit over de weergave (denk aan macro's over
CSS-schrijven). Het voordeel is geen afhankelijkheid en uiterst flexibel
met uw inhoudsgenerator. Dit is geschikt voor ervaren CSS-ontwikkelaars
die `Sass` als een belemmering zien.

In elk geval bent u in goede handen. Probeer het gewoon en pas u na
verloop van tijd aan.




## Epiloog

Dat is alles voor de helpsectie voor het aanmaken van CSS-componenten.
