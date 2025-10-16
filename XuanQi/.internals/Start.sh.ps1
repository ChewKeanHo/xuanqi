echo \" <<'RUN_AS_BATCH' >/dev/null ">NUL "\" \`" <#"
@ECHO OFF
REM LICENSE CLAUSES HERE
REM ----------------------------------------------------------------------------




REM ############################################################################
REM # Windows BATCH Codes                                                      #
REM ############################################################################
REM execute
IF EXIST "%CD%\.internals\presenters\start.ps1" (
    powershell ^
        -ExecutionPolicy Bypass ^
        -Command ^
        ". '%CD%\.internals\presenters\start.ps1'; exit `$LASTEXITCODE" ^
        %*
    EXIT /B %ERRORLEVEL%
)

IF EXIST "%CD%\presenters\start.ps1" (
    powershell ^
        -ExecutionPolicy Bypass ^
        -Command ^
        ". '%CD%\presenters\start.ps1'; exit `$LASTEXITCODE" ^
        %*
    EXIT /B %ERRORLEVEL%
)

IF EXIST "%PROGRAMFILES%\chewkeanho\xuanqi\presenters\start.ps1" (
    powershell ^
        -ExecutionPolicy Bypass ^
        -Command ^
        ". '%PROGRAMFILES%\chewkeanho\xuanqi\presenters\start.ps1'; exit `$LASTEXITCODE" ^
        %*
    EXIT /B %ERRORLEVEL%
)




REM fail the default run
echo E: Failed to Locate Init File.
echo E: Contact Developer|Maintainer.
echo E: Bailing Out...
exit /b 1
REM ############################################################################
REM # Windows BATCH Codes                                                      #
REM ############################################################################
RUN_AS_BATCH
#> | Out-Null




echo \" <<'RUN_AS_POWERSHELL' >/dev/null # " | Out-Null
################################################################################
# Windows POWERSHELL Codes                                                     #
################################################################################
# execute
if (Test-Path "$(Get-Location)\.internals\presenters\start.ps1") {
        $_process = . "$(Get-Location)\.internals\presenters\start.ps1" $args
        exit $_process
}

if (Test-Path "$(Get-Location)\presenters\start.ps1") {
        $_process = . "$(Get-Location)\presenters\start.ps1" $args
        exit $_process
}

if (Test-Path "${env:PROGRAMFILES}\chewkeanho\xuanqi\presenters\start.ps1") {
        $_process = . "${env:PROGRAMFILES}\chewkeanho\xuanqi\presenters\start.ps1" $args
        exit $_process
}




# fail the default run
$null = Write-Error @"
E: Failed to Locate Init File.
E: Contact Developer|Maintainer.
E: Bailing Out...

"@
################################################################################
# Windows POWERSHELL Codes                                                     #
################################################################################
exit 1
<#
RUN_AS_POWERSHELL




################################################################################
# Unix Main Codes                                                              #
################################################################################
# execute
if [ -f "${PWD}/presenters/start.sh" ]; then
        . "${PWD}/presenters/start.sh" "$@"
        exit $?
fi

if [ -f "${PWD}/.internals/presenters/start.sh" ]; then
        . "${PWD}/.internals/presenters/start.sh" "$@"
        exit $?
fi

if [ -f "/usr/local/lib/chewkeanho/xuanqi/presenters/start.sh" ]; then
        . "/usr/local/lib/chewkeanho/xuanqi/presenters/start.sh" "$@"
        exit $?
fi




# fail the default run
1>&2 printf "%s" "\
E: Failed to Locate Init File.
E: Contact Developer|Maintainer.
E: Bailing Out...

"
################################################################################
# Unix Main Codes                                                              #
################################################################################
exit 1
#>
