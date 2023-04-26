@ECHO OFF
SETLOCAL enabledelayedexpansion

::Default value for no input:
SET defaultValue=0
SET timeValue=0

::Initial timeUnit flag. Will change to minute and second as the code runs.
SET timeUnit=hour
SET plural=s
SET "string="

::Hidden "cooling off" seconds for cancelling the timer:
SET extraTime=7


::Information:
ECHO This program will accept an input to start a countdown to hibernate this computer.
ECHO There will be an extra 5 seconds at the end before Hibernation starts. (To change this, edit "extraTime")
ECHO You may cancel the countdown any time with Ctrl+C.
ECHO -------------------------
ECHO Note: Leave blank for 0.
ECHO -------------------------
ECHO.


::Prompts:
:Prompt
ECHO Please input countdown length in %timeUnit%%plural%:
SET /p timeValue= || SET timeValue=%defaultValue%
GOTO Logic


::Misc Logics:
:Logic
IF "%timeUnit%"=="hour" (
    SET timeH=%timeValue%
)
IF "%timeUnit%"=="minute" (
    SET timeM=%timeValue%
)
IF "%timeUnit%"=="second" (
    SET timeS=%timeValue%
)


:stringOut
IF %timeValue% GTR 1 (
    SET word=%timeUnit%%plural%
) ELSE (
    SET word=%timeUnit%
)

SET tempString=%string% %timeValue% %word%
SET string=%tempString%
ECHO Entered%string%.
ECHO.
ECHO.

IF "%timeUnit%"=="second" (
    GOTO Calculation
) ELSE (
    IF "%timeUnit%"=="hour" (
        SET timeUnit=minute
    ) ELSE (
        ::"%timeUnit%"=="minute"
        SET timeUnit=second
    )
    GOTO Prompt
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
    timeout /t 1 /nobreak >NUL
    ECHO Hibernating in (%extraTime%^)...
    SET /a extraTime=%extraTime%-1
    GOTO :finalCountdown
)
shutdown /h