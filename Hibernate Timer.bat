@ECHO OFF
SETLOCAL enabledelayedexpansion

::Default values:
SET defaultValue=0
SET defaultSecondValue=10
SET section=init
SET tempValue=0
::Hidden "cooling off" time for cancelling the timer:
SET extraTime=3


::Information:
ECHO This program will accept an input to start a countdown to hibernate this computer.
ECHO There will be an extra 5 seconds at the end before Hibernation starts. (To change this, edit "extraTime")
ECHO You may cancel the countdown any time with Ctrl+C.
ECHO -------------------------
ECHO Note: Leave blank for 0.
ECHO -------------------------
ECHO.

::Prompts:
:Hour
ECHO Please input countdown length in hours: 
SET /p timeH= || Set timeH=defaultValue
SET section=h
GOTO Logic

:Minute
ECHO Please input countdown length in minutes:
SET /p timeM= || Set timeM=defaultValue
SET section=m
GOTO Logic

:Second
ECHO Please input countdown length in seconds: (Leaving this blank will add 10 seconds to the countdown)
SET /p timeS= || Set timeS=defaultSecondValue
SET section=s
GOTO Logic

::Misc Logics:
:Logic
IF "%section%"=="h" (
    IF %timeH%==defaultValue (
        SET tempValue=%defaultValue%
    ) ELSE (
        SET tempValue=%timeH%
    )
    SET word=hour
    GOTO stringOut
)

IF "%section%"=="m" (
    IF %timeM%==defaultValue (
        SET tempValue=%defaultValue%
    ) ELSE (
        SET tempValue=%timeM%
    )
    SET word=minute
    GOTO stringOut
)

IF "%section%"=="s" (
    IF %timeS%==defaultSecondValue (
        SET tempValue=%defaultSecondValue%
    ) ELSE (
        SET tempValue=%timeS%
    )
    SET word=second
    GOTO stringOut
)

SET "string="

:stringOut
SET plural=s

::Code note: Below does not use AND/OR because they are unsupported by BAT
::           It's basically a nested IF at the moment.
:: Use EQU for == ?
IF NOT %tempValue%==1 IF NOT %tempValue%==0 (
    SET word=%word%%plural%
)
SET tempString=%string% %tempValue% %word%
SET string=%tempString%
ECHO Entered%string%.
ECHO.
ECHO.

IF "%section%"=="h" (
    GOTO Minute
)
IF "%section%"=="m" (
    GOTO Second
)
IF "%section%"=="s" (
    GOTO :Calculation
)


::Calculations:
:Calculation
SET /a timeHa+=%timeM%/60
SET /a timeH+=!timeHa!
SET /a timeMa=%timeM%-!timeHa!*60
SET /a timeM=!timeMa!
SET /a timeMa=0
SET /a timeMa+=%timeS%/60
SET /a timeM+=!timeMa!
SET /a timeSa=%timeS%-!timeMa!*60 
SET /a timeS=!timeSa!


SET /a timeR=!timeH!*60*60+!timeM!*60+!timeS!

::Outputs:
ECHO.
ECHO.
ECHO.
ECHO -----------------------------------------------------------------------------------------------------
ECHO This computer will Hibernate in %timeH% hours, %timeM% minutes and %timeS% seconds (%timeR% seconds).
ECHO Countdown initialised:
timeout /t %timeR% /nobreak

::Final Countdown:
:finalCountdown
IF %extraTime% GEQ 0 (
    ECHO Hibernating in (%extraTime%^)...
    timeout /t 1 /nobreak >NUL
    SET /a extraTime=%extraTime%-1
    GOTO :finalCountdown
)
shutdown /h

::----------------------------------------
::Replaced by :finalCountdown
::ECHO Hibernating (4)...
::timeout /t 1 /nobreak >NUL
::ECHO Hibernating (3)...
::timeout /t 1 /nobreak >NUL
::ECHO Hibernating (2)...
::timeout /t 1 /nobreak >NUL
::ECHO Hibernating (1)...
::timeout /t 1 /nobreak >NUL
::ECHO Hibernating (0)...
::shutdown /h