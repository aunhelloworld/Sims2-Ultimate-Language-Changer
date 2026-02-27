@echo off
chcp 65001 >nul
mode con: cols=100 lines=45
color 0A
title [H4X0R MODE] Sims 2 Language - Aunhelloworld

:: Auto backup registry silently
reg export "HKLM\SOFTWARE\WOW6432Node\EA GAMES\The Sims 2" "%TEMP%\Sims2Backup.reg" /y >nul 2>&1
reg export "HKLM\SOFTWARE\WOW6432Node\EA GAMES" "%TEMP%\Sims2FullBackup.reg" /y >nul 2>&1

:: Auto check admin
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo [ALERT] Root access denied! Right-click ^> Run as administrator.
    timeout /t 5 >nul
    exit /b
)

:menu
cls
echo.
echo   ╔════════════════════════════════════════════════════════════════════════════╗
echo   ║                SIMS 2 LANGUAGE - H4X0R EDITION (24 Languages)              ║
echo   ║                          by Aunhelloworld                                  ║
echo   ╚════════════════════════════════════════════════════════════════════════════╝
echo.
echo   [SYS] Root confirmed. Backup saved to %TEMP%\Sims2Backup.reg
echo   [SYS] Select target language payload:
echo.
echo   1 English US     7 Finnish       		 13 Greek         	   19 English UK
echo   2 French         8 Dutch         		 14 Japanese      	   20 Polish
echo   3 German         9 Danish        		 15 Korean        	   21 Thai
echo   4 Italian       10 Brazilian Portuguese 	 16 Russian     	   22 Norwegian
echo   5 Spanish       11 Czech        		 17 Simplified Chinese 	   23 Portuguese
echo   6 Swedish       12 Hebrew       		 18 Traditional Chinese    24 Hungarian
echo.
echo   0 Restore backup and abort
echo.
set /p choice=Inject code (0-24): 
set "choice=%choice: =%"

if "%choice%"=="1"  set DW=1  & set LN=English US          & set LC=en     & goto inject
if "%choice%"=="2"  set DW=2  & set LN=French             & set LC=fr     & goto inject
if "%choice%"=="3"  set DW=3  & set LN=German             & set LC=de     & goto inject
if "%choice%"=="4"  set DW=4  & set LN=Italian            & set LC=it     & goto inject
if "%choice%"=="5"  set DW=5  & set LN=Spanish            & set LC=es     & goto inject
if "%choice%"=="6"  set DW=6  & set LN=Swedish            & set LC=sv     & goto inject
if "%choice%"=="7"  set DW=7  & set LN=Finnish            & set LC=fi     & goto inject
if "%choice%"=="8"  set DW=8  & set LN=Dutch              & set LC=nl     & goto inject
if "%choice%"=="9"  set DW=9  & set LN=Danish             & set LC=da     & goto inject
if "%choice%"=="10" set DW=10 & set LN=Brazilian Portuguese & set LC=pt-BR & goto inject
if "%choice%"=="11" set DW=11 & set LN=Czech              & set LC=cs     & goto inject
if "%choice%"=="12" set DW=12 & set LN=Hebrew             & set LC=he     & goto inject
if "%choice%"=="13" set DW=13 & set LN=Greek              & set LC=el     & goto inject
if "%choice%"=="14" set DW=14 & set LN=Japanese           & set LC=ja     & goto inject
if "%choice%"=="15" set DW=15 & set LN=Korean             & set LC=ko     & goto inject
if "%choice%"=="16" set DW=16 & set LN=Russian            & set LC=ru     & goto inject
if "%choice%"=="17" set DW=17 & set LN=Simplified Chinese & set LC=zh     & goto inject
if "%choice%"=="18" set DW=18 & set LN=Traditional Chinese& set LC=zh-TW  & goto inject
if "%choice%"=="19" set DW=19 & set LN=English UK         & set LC=en-GB  & goto inject
if "%choice%"=="20" set DW=20 & set LN=Polish             & set LC=pl     & goto inject
if "%choice%"=="21" set DW=21 & set LN=Thai               & set LC=th     & goto inject
if "%choice%"=="22" set DW=22 & set LN=Norwegian          & set LC=no     & goto inject
if "%choice%"=="23" set DW=23 & set LN=Portuguese         & set LC=pt     & goto inject
if "%choice%"=="24" set DW=24 & set LN=Hungarian          & set LC=hu     & goto inject
if "%choice%"=="0" goto restore

echo [ERROR] Invalid payload! Reloading matrix...
timeout /t 2 >nul
goto menu

:inject
cls
echo [HACK INIT] Deploying %LN% payload (0x%DW%)...
timeout /t 1 >nul
echo [SYS] Scanning registry... OK
set "base=HKLM\SOFTWARE\WOW6432Node\EA GAMES"
set count=0

for %%p in ("The Sims 2" "The Sims 2 University" "The Sims 2 Nightlife" "The Sims 2 Open for Business" "The Sims 2 Family Fun Stuff" "The Sims 2 Glamour Life Stuff" "The Sims 2 Pets" "The Sims 2 Seasons" "The Sims 2 Celebration Stuff" "The Sims 2 H&M Fashion Stuff" "The Sims 2 Bon Voyage" "The Sims 2 Teen Style Stuff" "The Sims 2 FreeTime" "The Sims 2 Kitchen & Bath Interior Design Stuff" "The Sims 2 IKEA Home Stuff" "The Sims 2 Apartment Life" "The Sims 2 Mansion and Garden Stuff") do (
    set /a count+=1
    echo [%count%/17] Injecting %%~p... DONE
    reg add "%base%\%%~p\1.0" /v Language /t REG_DWORD /d %DW% /f >nul 2>&1
    reg add "%base%\%%~p" /v Language /t REG_SZ /d "%LN%" /f >nul 2>&1
    timeout /t 1 /nobreak >nul
)
reg add "%base%\The Sims 2" /v Locale /t REG_SZ /d "%LC%" /f >nul 2>&1

echo [SYS] Payload deployed. Scanning for Legacy matrix...
if exist "C:\Program Files (x86)\Steam\steamapps\common\The Sims 2 Legacy Collection\EP9\TSBin\Sims2EP9.exe" (
    echo [LEGACY DETECTED] Add launch param in Steam: -l:%LC%
) else (
    echo [STANDARD DETECTED] Direct launch OK.
)
timeout /t 2 >nul

cls
color 0F
echo.
echo /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo ^|                  HACK COMPLETE - %LN% ACTIVE                ^|
echo ^|  Restart Sims 2 now. Verify regedit: Language = %DW%       ^|
echo ^|  Backup: %TEMP%\Sims2Backup.reg (import to revert)         ^|
echo ^|  If the language does not display correctly, install the %LN% system locale and font mod.  ^|
echo \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
color 0A
echo.
pause
exit /b

:restore
reg import "%TEMP%\Sims2FullBackup.reg" >nul 2>&1
echo [SYS] Matrix restored to original state.
pause
exit /b
