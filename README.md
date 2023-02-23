# W10-Hibernate-Timer
Hibernate a Windows 10 machine with this simple timer.

# Requirement:

- Hibernation is enabled on your machine.  
  To enable:

  1. Run Command Prompt as Administrator.
  2. Put in "powercfg /h on" without the quotation marks.
  3. Press Enter.
  4. If it looks like nothing happened, then it typically means it is ready.

# Installation:

1. Download "Hibernate Timer.bat" only, and place it anywhere on your Windows computer. (ie. At a corner on your Desktop.)
2. Run it.

# What it does:
The program will ask for user input 3 times to set the timer - the hours, minutes and seconds respectively.  
After the 3rd user input, the time specified will be converted to seconds and a countdown to zero will begin.  
When zero is reached, an extra 5 seconds is counted for if the user change their mind.  
After that, the program will execute command prompt's hibernate command.

# Features:
* Input for the timer can be made concisely.
* Does not require Java; few, if any dependencies.
* Portable for Windows machines.
* Preset default timer. (10 seconds)
* Allows time to cancel.

# Potential Issues:
Q: My machine would randomly resume/wake up from the hibernation, why?  
A: By default, Windows 10 (or at least the Pro version) has the power to wake a machine through the "UpdateOrchestrator" tasks (Task Scheduler > Task Scheduler Library/Microsoft/Windows/UpdateOrchestrator) or the "Maintenance Activator". And there might be more that I am not aware of. You could try one of two things, or both. But note that I will not accept any responsibilities as a consequence caused by these instructions. **Delaying Windows update has the consequence of Windows being vulnerable to exploits.**  
1. You could try disabling wake timers. To do that:
   1. Open up your Power Options. ("Control Panel/Hardware and Sound/Power Options/Edit Power Plan". Then click on "Change advanced power settings".)
   2. In the new pop-up, under Sleep, there is "Allow wake timers".
   3. If it is Enabled, then disable it.
   4. Only proceed to the next option if this does not work. 
   

2. If you have been neglecting Windows updates for a while, then this could be caused by a behaviour set by Windows' default group policy. This should be fixed by simply installing the neglected update and restarting your machine. In extreme situation and for Windows 10 Pro only, you could do the following to stop this particular issue, but again, **you will be actively compromising the Security of your outdated Windows**:
   1. On Windows 10 Pro, open Local Group Policy Editor or run "gpedit.msc".
   2. Navigate to Local Computer Policy/Computer Configuration/Administrative Templates/Windows Components/Windows Update
   3. Double-click on "Enabling Windows Update Power Management to automatically wake up the system to install scheduled updates". (This policy's name is as of Windows 10 Pro version 21H2.) 
   4. In the new pop-up, at the top left, select Disabled and press OK. The "Help" section on this pop-up also gives a more detailed explanation for this policy.
   5. For the love of your machine's security, remember to finish that update at your soonest.


# Background:
Hibernate is a windows function that I have gotten used to since my own Windows 7 (and possibly XP too) + HDD days. It used to take a minute or more to boot from startup to windows, but hibernation shortened that, AND it lets me preserve a previous session.  
Hibernate is good. But hibernate WITH a timer is perfect. Whether it is a long installation, a slow download, or a large copy & paste job, a timer gotchu covered. Set a time, and off you go to enjoy life! No more sitting around and waiting for that 100% before hibernating your computer.
