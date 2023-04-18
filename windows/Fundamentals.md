

# RDP to windows machine
xfreerdp /u:administrator /v:target.ip


# windows client timeline
Windows 11      2021    Home Pro
Windows 10      2015    "
Windows 8       2012    "
Windows 7       2009    "
Windows Vista   2007    "
Windows XP      2001    "
Windows 98      1998    "
Windows 95      1995    "
Windows 3.1     1992    "


# windows server timeline
Windows Server  2022    Essentials, Standard, Datacenter
Windows Server  2019    "
Windows Server  2016    "
Windows Server  2012    "
Windows Server  2008    "
Windows Server  2003    "
Windows Server  2000    "
Windows NT 4.0  1996    "


# The Desktop (GUI) 
The Desktop
Start Menu
Search Box (Cortana)
Task View
Taskbar
Toolbars
Notification Area

# The File System 
NTFS        New Technology File System, journaling file system
Permissions:
    Full control
    Modify
    Read & Execute
    List folder contents
    Read
    Write
ADS, Alternate Data Streams

# Windows
C:\Windows      Folder which contains the Windows operating system.
%windir%        System variable for the Windows folder? 

# Windows\System32
The System32 folder holds the important files that are critical for the operating system.

#  User Accounts, Profiles, and Permissions
Administrator
Standard User

System Settings > Other
    Add Standard User <Max>             User Profile Folder C:\User\<Max>
Local User and Group Management
C:\>lusrmgr.msc

# User profile folder
User profile folders:
    Desktop
    Documents
    Downloads
    Music
    Pictures

#  User Account Control 
UAC Applied to Users belong to administrator group, work just like "sudo"


# Settings and the Control Panel
- Settings
- Control Panel       
Control Panel is the menu where you will access more complex settings and perform more complex actions.
In some cases, you can start in Settings and end up in the Control Panel.
If you're unclear which to open if you wish to change a setting, use the Start menu and search for it.

# Task Manager
- Applications
- processes 

# System Configuration
- Windows Administrative Tools/System Configuration
- C:\MSConfig

# Change UAC Settings 
- System Configuration panel -> Change UAC Settings
- C:\Windows\System32\UserAccountControlSettings.exe

# Computer Management 
- System Configuration panel -> Computer Management
- C:\Windows\System32\compmgmt.msc

# System Information
- System Configuration panel -> System Information
- C:\Windows\System32\msinfo32.exe
- msinfo32

# Resource Monitor
- System Configuration panel -> Resource Monitor
- C:\Windows\System32\resmon.exe
- resmon

# Command Prompt
- System Configuration panel -> Command Prompt
- C:\Windows\System32\cmd.exe
- cmd

# Registry Editor
- System Configuration panel -> Command Prompt
- C:\Windows\System32\regedt32.exe
- regedit

# Windows Update
Setting > Update & Security

# Windows Security
Setting > Update & Security > Windows Security

# Virus & threat protection 
Setting > Update & Security > Windows Security > Virus & threat protection

# Firewall & network protection 
Setting > Update & Security > Windows Security > Firewall & network protection 
- Domain - The domain profile applies to networks where the host system can authenticate to a domain controller. 
- Private - The private profile is a user-assigned profile and is used to designate private or home networks.
- Public - The default profile is the public profile, used to designate public networks such as Wi-Fi hotspots at coffee shops, airports, and other locations.

WF.msc Windows Defender Firewall

# App & browser control
In this section, you can change the settings for the Microsoft Defender SmartScreen.

# Device security
- Core isolation
    - Memory Integrity - Prevents attacks from inserting malicious code into high-security processes.
- TPM, Trusted Platform Module

# BitLocker
BitLocker Drive Encryption is a data protection feature that integrates with the operating system and addresses the threats of data theft or exposure from lost, stolen, or inappropriately decommissioned computers

# Volume Shadow Copy Service. VSS
- Create a restore point
- Perform system restore
- Configure restore settings
- Delete restore points