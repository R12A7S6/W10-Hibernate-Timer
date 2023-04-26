@ECHO OFF
SETLOCAL enabledelayedexpansion

::Default value for no input:
SET defaultValue=0

::Initial section flag. Will change to minute and second as the code runs.
SET section=hour
SET plural=s

::Hidden "cooling off" seconds for cancelling the timer:
SET extraTime=7

SET tempValue=0
SET timeUnit=0


::Information:
ECHO This program will accept an input to start a countdown to hibernate this computer.
ECHO There will be an extra 5 seconds at the end before Hibernation starts. (To change this, edit "extraTime")
ECHO You may cancel the countdown any time with Ctrl+C.
ECHO -------------------------
ECHO Note: Leave blank for 0.
ECHO -------------------------
ECHO.


::Prompts:
::>>Here<<
::Reuse a single prompt through flags?
:Prompt
ECHO Please input countdown length in %section%%plural%:
SET /p timeUnit= || SET timeUnit=defaultValue
GOTO Logic


::Misc Logics:
:Logic
IF %timeUnit%==defaultValue (
    SET tempValue=%defaultValue%
) ELSE (
    SET tempValue=%timeUnit%
)

IF "%section%"=="hour" (
    SET timeH=%timeUnit%
)
IF "%section%"=="minute" (
    SET timeM=%timeUnit%
)
IF "%section%"=="second" (
    SET timeS=%timeUnit%
)


:stringOut

::Code note: Below does not use AND/OR because they are unsupported by BAT
::           It's basically a nested IF at the moment.
:: Use EQU for == ?

IF NOT %tempValue%==1 IF NOT %tempValue%==0 (
    SET word=%section%%plural%
) ELSE (
    SET word=%section%
)

SET tempString=%string% %tempValue% %word%
SET string=%tempString%
ECHO Entered%string%.
ECHO.
ECHO.

IF "%section%"=="second" (
    GOTO Calculation
) ELSE (
    IF "%section%"=="hour" (
        SET section=minute
    ) ELSE (
        :: "%section%"=="minute"
        SET section=second
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