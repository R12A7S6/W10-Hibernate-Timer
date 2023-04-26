# Ver 1.2:
_26/04/2023_

Shaved some lines by reusing a single prompt for the hour, minute and second prompts.
Moved timeout before the ECHO in the finalCountdown section.
defaultSeconds and tempValue are no longer used.

# Ver 1.1:
_13/02/2023_

Hidden Timer (the final 5 seconds) now uses a loop for its ECHOes.  
This also allows it to be changed from 5 seconds to however long the user wants. But this requires manual editing the .bat .

# Ver 1.0:
_20/09/2021_

Release version.

Possible ToDo:
1) Revisit and clarify the Calculation section.
2) Check for non-numeric input and produce a warning if applicable.