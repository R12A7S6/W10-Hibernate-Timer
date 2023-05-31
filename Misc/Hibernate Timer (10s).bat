@ECHO OFF
SETLOCAL enabledelayedexpansion

:: This one is a simpler 10 second Hibernator made through editing a pre-1.0
:: version of my Hibernate Timer, one of 3 variants I made.
:: I'm leaving everything below unchanged as a relic of the lessons I've learnt
:: along my way to Ver 1.0.
:: According to its File Properties, this was last modified on 2nd March, 2020.

ECHO This program will to hibernate this computer in 10 seconds with a countdown.
ECHO You may cancel the countdown any time with Ctrl+C.
ECHO.


SET /a timeS=10 
ECHO.

SET /a timeM=0
SET /a timeMa=0
SET /a timeSa=0

IF %timeS% GEQ 60 (
    SET /a timeMa+=%timeS%/60
    SET /a timeM+=!timeMa!
    SET /a timeSa=%timeS%-!timeMa!*60 
    SET /a timeS=!timeSa!
)

IF %timeS% LEQ 59 (
    SET /a timeM=!timeMa!
)

SET /a timeR=!timeM!*60+!timeS!


REM ECHO Inserting processes to Hibernate in %timeM% minutes and %timeS% seconds.
ECHO Inserting processes to Hibernate in %timeS% seconds.
ECHO.


ECHO Countdown has been initiated.
timeout /t %timeR% /nobreak
ECHO.


ECHO Hibernating (3)...
timeout /t 1 /nobreak >NUL
ECHO Hibernating (2)...
timeout /t 1 /nobreak >NUL
ECHO Hibernating (1)...
timeout /t 1 /nobreak >NUL
ECHO Hibernating (0)...
shutdown /h