# W10-Hibernate-Timer
Set a timer and hibernate a Windows 10 machine through command prompt with this .bat program.

# Installation:
1. Place "Hibernate Timer.bat" anywhere on your Windows computer. (ie. At a corner on the Desktop.)

2. Run Command Prompt as Administrator.

3. Enter "powercfg /h on" and press "Enter".

4. If no error occurs, then proceed to use Hibernate Timer.bat

# Objectives:
The program will ask for user input 3 times for the timer - the hours, minutes and seconds respectively.  
After the 3rd user input, the timer will start to run until the time specified by the user input had passed.  
Then, the program will execute command prompt's hibernate command.

# Features:
* User input can be made concisely.     (Just put in numbers and press Enter, and repeat 2 more times.)
* Preset default timer.                 (Pressing Enter and not entering numbers for 3 times when prompted will default to a 10-second timer.)
* Few, if any dependencies on Windows.  (Requires enabling Hibernate.) (See Installation section.)
* Portable for Windows machines.
* Allows time to cancel.                (5 hidden seconds are always added after the timer ends.)

# Potential Issues:
Q: My machine would randomly resume/wake up from the hibernation, why?  
A: If you have been neglecting Windows updates for a while, then this is caused by a behaviour set by Windows' default group policy. This ~~could~~ should be fixed by simply restarting and installing the neglected update. In extreme situation and for Windows 10 Pro only, you could do the following to stop this particular issue, but you need to be aware that I do not accept any responsibilities as a consequence caused by you following these instructions, and that you are actively compromising the **Security of your outdated Windows**:  
1. On Windows 10 Pro, open Local Group Policy Editor or run "gpedit.msc".
2. Navigate to Local Computer Policy/Computer Configuration/Administrative Templates/Windows Components/Windows Update
3. Double-click on "Enabling Windows Update Power Management to automatically wake up the system to install scheduled updates". (This policy's name is as of Windows 10 Pro version 21H2.) 
4. In the new pop-up, at the top left, select Disabled and press OK. The "Help" section on this pop-up also gives a more detailed explanation for this policy.
5. For the love of your machine's security, remember to finish that update at your soonest.


# Background:
Hibernate is a windows function that I have gotten used to since my own Windows 7 (and possibly XP too) + HDD days. It used to take a minute or more to boot from startup to windows, but hibernation shortened that, AND it lets me preserve a previous session.  
Hibernate is good. But hibernate WITH a timer is perfect. Whether it is a long installation, a slow download, or a large copy & paste job, a timer gotchu covered. Set a time, and off you go to enjoy life! No more sitting around and waiting for that 100% before hibernating your computer.
