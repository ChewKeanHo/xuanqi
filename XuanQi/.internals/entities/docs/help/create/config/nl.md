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




# CLI voor het Maken van Configuratiebestanden

De `create config` commandoregelinterface (CLI) is voor het maken
van een enkel invoer `.conf` gegevensbestand dat bruikbaar is in
het hele project. De volledige opdracht is als volgt:

```
$ [XUANQI] create config [RELATIVE_PATH] [KEY] [VALUE]
```

* `[RELATIVE_PATH]`
  * **VERPLICHT**
  * Het relatieve (vanaf `$XUANQI_PATH_CONFIGS`) bestandspad
    eindigend met de bestandsextensie `.conf`.
  * Als de `.conf` bestandsextensie niet is opgegeven, voegt
    XuanQi deze intern toe.
  * Als het `.conf` bestand zich buiten de projectconfiguratiemap
    bevindt of de map eenvoudigweg niet bestaat, wordt een fout
    gegenereerd.
  * De bestandsnaam is naar uw goeddunken. Het heeft geen invloed
    op XuanQi.
* `[KEY]`
  * **VERPLICHT**
  * Het `key` label van de `key:value` invoer.
  * Gebruik onderstrepingsteken (`_`) omdat de sleutel wordt
    gebruikt als omgevingsvariabele.
  * Zorg ervoor dat de waarde uniek is. Anders kan dezelfde sleutel
    in meerdere configuratiebestanden onvoorspelbare gevolgen hebben
    (het laatst geparseerde bestand overschrijft zijn voorgangers).
* `[VALUE]`
  * **OPTIONEEL**
  * Het `value` label van de `key:value` invoer.
  * Wanneer leeg gelaten, wordt een voorbeeldtekst vervangen waar
    u het bestand later kunt bijwerken.




## Padbeperking

Om veiligheidsredenen staat XuanQi alleen het maken van het
gegevensbestand toe binnen `$PROJECT_PATH_ROOT`. Anders wordt een
fout gegenereerd en wordt er niets gedaan.

Alleen voor deze aanmaak, is het **STRENG** beperkt tot de
`$XUANQI_PATH_CONFIGS` map (die zich ook binnen
`$PROJECT_PATH_ROOT` bevindt).




## Bekende Documentatie

Afhankelijk van of `[KEY]` overeenkomt met de ondersteunde
omgevingsvariabele, kan het gegenereerde configuratiebestand zijn
eigen toegewijde documentatie hebben. Zie:

```
$ [XUANQI] help variables
```

voor de lijst met ondersteunde variabelen.




## Epiloog

Dat is alles voor deze CLI.
