# W10-Hibernate-Timer
Set a timer and hibernate a Windows 10 machine through command prompt with this .bat program.

# Installation:
Place "Hibernate Timer.bat" anywhere on your Windows computer. (ie. At a corner on the Desktop.)
Run Command Prompt as Administrator.
Enter "powercfg /h on" and press "Enter".
If no error occurs, then proceed to use Hibernate Timer.bat

# Objectives:
The program will ask for user input 3 times for the timer - the hours, minutes and seconds respectively.
After the 3rd user input, the timer will start to run until the time specified by the user input had passed.
Then, the program will execute command prompt's hibernate command.

# Features:
User input can be made concisely.     (Just put in numbers and press Enter, and repeat 2 more times.)
Preset default timer.                 (Pressing Enter and not entering numbers for 3 times when prompted will default to a 10-second timer.)
Few, if any dependencies on Windows.  (Requires enabling Hibernate.) (See Installation section.)
Portable for Windows machines.
Allows time to cancel.                (5 hidden seconds are always added after the timer ends.)


# Background:
Hibernate is a windows function that I have gotten used to since my own Windows 7 (and possibly XP too) + HDD days. It used to take a minute or more to boot from startup to windows, but hibernation shortened that, AND it lets me preserve a previous session. 
Hibernate is good. But hibernate WITH a timer is perfect. Whether it is a long installation, a slow download, or a large copy & paste job, a timer gotchu covered. Set a time, and off you go to enjoy life! No more sitting around and waiting for that 100% before hibernating your computer.
