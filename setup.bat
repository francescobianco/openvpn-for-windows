@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

echo Update setup.sh file
copy setup.sh "C:\Program Files\OpenVPN\easy-rsa\setup.sh"
copy test.bat "C:\Program Files\OpenVPN\easy-rsa\test.bat"

xcopy /Y /E "C:\Program Files\OpenVPN\easy-rsa" .\easy-rsa\

cd .\easy-rsa\

echo. > passphrases.txt
echo ISTRUZIONI >> passphrases.txt
echo ========== >> passphrases.txt
echo. >> passphrases.txt
echo 1. Selezionare la finestra con il terminale EasyRSA Shell >> passphrases.txt
echo 2. Digitare ./setup.sh e premere [INVIO] >> passphrases.txt
echo 3. Inserire le seguenti chiavi man mano vengono richieste >> passphrases.txt
echo. >> passphrases.txt
set CA_PASSPHRASE=%RANDOM%%RANDOM%%RANDOM%%RANDOM%
echo Enter New CA Key Passphrase: %CA_PASSPHRASE%>> passphrases.txt
echo. >> passphrases.txt
set PEM_PASSPHRASE=%RANDOM%%RANDOM%%RANDOM%%RANDOM%
echo Enter PEM pass phrase: %PEM_PASSPHRASE%>> passphrases.txt
echo. >> passphrases.txt
set PEM_PASSPHRASE_1=%RANDOM%%RANDOM%%RANDOM%%RANDOM%
echo Client #1: Enter PEM pass phrase: %PEM_PASSPHRASE_1%>> passphrases.txt
echo. >> passphrases.txt
set PEM_PASSPHRASE_2=%RANDOM%%RANDOM%%RANDOM%%RANDOM%
echo Client #2: Enter PEM pass phrase: %PEM_PASSPHRASE_2%>> passphrases.txt
echo. >> passphrases.txt
set PEM_PASSPHRASE_3=%RANDOM%%RANDOM%%RANDOM%%RANDOM%
echo Client #3: Enter PEM pass phrase: %PEM_PASSPHRASE_3%>> passphrases.txt
echo. >> passphrases.txt
set PEM_PASSPHRASE_4=%RANDOM%%RANDOM%%RANDOM%%RANDOM%
echo Client #4: Enter PEM pass phrase: %PEM_PASSPHRASE_4%>> passphrases.txt

start notepad passphrases.txt

EasyRSA-Start.bat
