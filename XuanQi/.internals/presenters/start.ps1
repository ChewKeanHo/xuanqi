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




# configure charset encoding
$PSDefaultParameterValues['*:Encoding'] = 'utf8'
$OutputEncoding = [console]::InputEncoding `
                = [console]::OutputEncoding `
                = New-Object System.Text.UTF8Encoding




# save original console color
$original_color = $Host.UI.RawUI.ForegroundColor




# write message in red
$Host.UI.RawUI.ForegroundColor = 'Red'
switch -WildCard ((Get-Culture).Name) {
de* {
        $null = Write-Host @"
E: PowerShell wird nicht unterstützt.
E: Bitte verwenden Sie "Windows Subsystem for Linux" und starten Sie mit der POSIX-Shell neu.
E: Danke.
E: Kann nicht fortfahren.
E: Abbruch...

"@
} es* {
        $null = Write-Host @"
E: PowerShell no es compatible.
E: Por favor, use "Subsistema de Windows para Linux" y reinicie con el Shell POSIX.
E: Gracias.
E: No se puede continuar.
E: Saliendo...

"@
} fr* {
        $null = Write-Host @"
E: PowerShell n'est pas pris en charge.
E: Veuillez utiliser "Sous-système Windows pour Linux" et redémarrer avec le shell POSIX.
E: Merci.
E: Impossible de continuer.
E: Abandon...

"@
} ja* {
        $null = Write-Host @"
E: PowerShellはサポートされていません。
E: 「Windows Subsystem for Linux」を使用し、POSIXシェルで再起動してください。
E: ありがとうございます。
E: 続行できません。
E: 終了します...

"@
} ko* {
        $null = Write-Host @"
E: PowerShell은 지원되지 않습니다.
E: "Windows Subsystem for Linux"를 사용하고 POSIX 셸로 다시 시작하십시오.
E: 감사합니다.
E: 진행할 수 없습니다.
E: 종료합니다...

"@
} mn-Cyrl* {
        $null = Write-Host @"
E: PowerShell дэмжигдэхгүй.
E: "Windows-ийн Linux дэд систем"-ийг ашиглан POSIX Shell-ээр дахин эхлүүлнэ үү.
E: Баярлалаа.
E: Үргэлжлүүлэх боломжгүй.
E: Гарах...

"@
} ms* {
        $null = Write-Host @"
E: PowerShell tidak disokong.
E: Sila gunakan "Windows Subsystem for Linux" dan mulakan semula dengan POSIX Shell.
E: Terima kasih.
E: Tidak dapat Diteruskan.
E: Keluar...

"@
} nb* {
        $null = Write-Host @"
E: PowerShell støttes ikke.
E: Vennligst bruk "Windows Subsystem for Linux" og restart med POSIX Shell.
E: Takk.
E: Kan ikke fortsette.
E: Avbryter...

"@
} nl* {
        $null = Write-Host @"
E: PowerShell wordt niet ondersteund.
E: Gebruik "Windows Subsystem for Linux" en herstart met POSIX Shell.
E: Dank u.
E: Kan niet doorgaan.
E: Afbreken...

"@
} nn* {
        $null = Write-Host @"
E: PowerShell er ikkje støtta.
E: Ver venleg og bruk "Windows Subsystem for Linux" og start på nytt med POSIX Shell.
E: Takk.
E: Kan ikkje halda fram.
E: Avbryt...

"@
} ru* {
        $null = Write-Host @"
E: PowerShell не поддерживается.
E: Пожалуйста, используйте "Подсистему Windows для Linux" и перезапустите в POSIX-оболочке.
E: Спасибо.
E: Невозможно продолжить.
E: Выход...

"@
} sv* {
        $null = Write-Host @"
E: PowerShell stöds inte.
E: Använd "Windows Subsystem for Linux" och starta om med POSIX Shell.
E: Tack.
E: Kan inte fortsätta.
E: Avbryter...

"@
} uk* {
        $null = Write-Host @"
E: PowerShell не підтримується.
E: Будь ласка, використовуйте "Підсистему Windows для Linux" та перезапустіть у POSIX-оболонці.
E: Дякую.
E: Неможливо продовжити.
E: Вихід...

"@
} zh-Hans* {
        $null = Write-Host @"
E: PowerShell不受支持。
E: 请使用“Windows 的 Linux 子系统”并使用 POSIX Shell 重新启动。
E: 谢谢。
E: 无法继续。
E: 退出...

"@
} zh-Hant* {
        $null = Write-Host @"
E: PowerShell不受支持。
E: 請使用「Windows 的 Linux 子系統」並使用POSIX Shell 重新啟動。
E: 謝謝。
E: 無法繼續。
E: 退出...

"@
} default {
        $null = Write-Host @"
E: PowerShell is unsupported.
E: Please use "Windows' Subsystems for Linux" and restart with POSIX Shell.
E: Thank You.
E: Unable to Proceed.
E: Bailing Out...

"@
}}




# restore original color
$Host.UI.RawUI.ForegroundColor = $original_color




# report status
return 1
