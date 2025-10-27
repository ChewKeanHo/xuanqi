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




# Helpgedeelte voor Het Maken van een Datacomponent

Dit is het helpgedeelte voor het maken van een datacomponent,
hetzij onafhankelijk of als onderdeel van een andere grotere
component. Om het datagedeelte op te nemen, voer eenvoudig
`data` in de `[TYPES]`-waarde. Voorbeeld:

```
# commandopatroon
$ [XuanQi] create component [TYPES] [NAME]

# alleen datacomponent
$ [XuanQi] create component data [NAME]

# met datagedeelte binnen een samengestelde component
$ [XuanQi] create component "...,data,..." [NAME]
```




## Doel

De datacomponent is voornamelijk om het project en de component te
voorzien van een specifieke dataset. Dit maakt variabele weergave-
veranderingen mogelijk voor dezelfde bestandslay-outs, waardoor
uitvoerkeuzes robuust worden zonder in te leveren op
onderhoudbaarheid. XuanQi heeft ingebouwde faciliteiten om alle
configuratiebestanden (`.conf`) en shellscript (`.sh`)-functies
naadloos te importeren.

Over het algemeen behandelt XuanQi de datacomponent als een
**database loos** (`noDB`) gegevensopslag.




## Bestandsstructuren

De datacomponent voldoet aan de volgende standaard
bestandsstructuur:

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

* de componentdirectory is `Data`.
* het shellscript van de componentoperator bevindt zich direct in
  `XuanQi/import.sh`. Het maakt deel uit van de componentinitialisatie.




## Primair Doel

Uw **primaire doel is het abstract maken van de variabele
gegevensbronnen en het creëren van de datafaciliteit voor uw
project of uw component(en)**. Hoe u dit doet, is geheel aan u.

Bij initialisatie van elke component kan elke component de
datacomponent van binnenuit of over andere componenten heen
parseren. Daarom **MOET** u de datadirectory te allen tijde
flexibel en parseerbaar houden.

U kunt verwijzen naar de `XuanQi/.internals/API` van het project
voor beschikbare API's.




## Configuratiebestand of Shellscript

XuanQi biedt 2 primaire manieren om gegevensbeheer af te handelen:

* configuratiebestand (`.conf`)
* shellscriptfunctiebestand (`.sh`)

`.conf` is geschikt voor het snel instellen van variabelen, zodat u
de waarde onmiddellijk kunt gebruiken voor het weergeven van
bestanden. Een voorbeeldbestand (`Data/sample.conf`) wordt gemaakt
om te laten zien hoe u er een maakt. **Eén bestand mag slechts één
sleutel:waarde-paar bevatten**.

`.sh` is eigenlijk een shellscript dat een functiedefinitie bevat
voor het verstrekken van de gegevens door logische conditionering.
Dit is het meest geschikt als uw gegevensset een of meer voorwaarden
vereist om een uitvoer anders weer te geven (bijv. `i18n_`-functies
zijn afhankelijk van de `$XUANQI_CONTENT_LANGUAGE`-vlag om een
taalspecifieke string terug te geven). **WEES VOORZICHTIG: functies
met dezelfde naam worden tijdens importeren overschreven**. Een
voorbeeldbestand (`Data/i18n/title.sh`) wordt gemaakt voor uw
referentie.

De laatste optie zou het handmatig lezen van `.txt`-bestanden in een
directory zijn. XuanQi zal alleen `.conf` en `.sh` parseren, dus u
kunt het veilig gebruiken. Dit wordt gedaan door een specifieke
gegevenssetnaam als directory naam te organiseren en de bestandsnaam
strikt als parameternaam te laten. Het nadeel is dat deze methode
meer IO-lees-/schrijfverkeer in beslag neemt, wat de productie kan
vertragen. Echter, *vereiste vervulling gaat altijd vóór snelheid*,
dus u kunt overwegen het te gebruiken wanneer dit nodig is.
Voorbeeld tekstbestanden gebaseerde i18n-aanpak:

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

# het bovenstaande gebruiken in shellscript
____name="$( \\
    XuanQi_Data_Read_Raw \\
        "${XUANQI_COMPONENT_PATH}/Data/names/${XUANQI_CONTENT_LANGUAGE}.txt" \\
)"
```



### Hoe te Kiezen

Gebruik standaard en wanneer mogelijk altijd `.conf`. Als er een
logische vereiste is (bijv. voorwaarde, etc.), gebruik dan `.sh`.




## Mediabeestanden

Hoewel mediabeestanden (bijv. afbeeldingen, audio, video, etc.)
technisch gezien gegevens zijn, **vermijd ze hier te plaatsen**. Er is
een speciale `media`-component met speciale verwerkingsfuncties
ervoor. Gebruik die in plaats daarvan.

U moet de datacomponent altijd behandelen als een **database loos**
(`noDB`).




## Epiloog

Dat is alles voor het helpgedeelte voor het maken van een datacomponent.
