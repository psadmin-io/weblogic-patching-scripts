# WebLogic Patching Scripts

A collecton of PowerShell scripts to automate WebLogic patching. 

## Script Overview

These scripts are writtin in PowerShell. If PowerShell scripts are not enabled on the server, run this command to allow PowerShell scripts to run: `set-executionpolicy unrestricted`

1. Install new SmartUpdate version (3.3.0)

        .\installSmartUpdate.ps1

    The `silent.xml` file is used for a silent install (no prompts). The installation directory is set to `e:\oracle`. If you want a different directory, change the value for "BEAHOME".

1. Stop all web servers running on the server

        .\stopPIAServices.ps1

    The script looks for any Windows service that containts "*-PIA" in the name. If you have any WebLogic domains were not created by the `installNTService` script, you may need to shut them down by hand.

1. Prepare and copy files from the `weblogic1036-2015-CVE-Patches` folder

        .\prepareFiles.ps1

    This script performs tasks to prepare different files for patching: 

    On our servers, two files needed updates to correctly run the Smart Update utility. `registry.xml` needed to remove a reference to Tuxedo; `bsu.cmd` needed an increase in memory to the Java Heap. The `registry.xml` file also contains a reference to the server is was installed. The script will modify that value based on the new server's name. The original files are backed up first and a `.bkp` extension is added to the file name.

    The script also copies `jdk-1.7.0_79` to our `e:\java` folder. If you want the new java version in a different location, you can modify the path in the file. 

1. Apply both WebLogic patches

        .\applyWebLogicPatches.ps1

    Both patches are applied to WebLogic using the `bsu` command. The script assumes your patches are in the folder `e:\patches\cve-2015-4852`.

    NOTE: On one of our servers, the second patch stalled during the "Checking for Conflicts" step. If the script stalls there for more than a few minutes, hit `Cntl-J`.

1. Update the JAVA_HOME values

        .\updateJavaVersion.ps1

    The `JAVA_HOME` value in the `setEnv.cmd` script will be updated to the new path. **This script must be updated for each server. The paths in the script are hard-coded.** (The hard coding is an obvious candidate to fix next. Should be able to use the Get-ChildItem cmdlet to find all the `setEnv.cmd` files.)

1. Update Registry value for JAVA_HOME

        .\updateRegistryJavaVersion.ps1

    The `JAVA_HOME` value in the Registry for each web service will be updated. **This script must be updated for each server. The paths in the script are hard-coded.** (The next place for improvement. Need to find a search cmdlet for the Registry. Could look for `-PIA` in the service name.)

1. Start all web servers running on the server.

        .\startPIAServices.ps1

    Again, this looks for all Windows services that have `*-PIA` in the name and starts them.

## Progress Chart

Use this chart to track the patch as you move it to each server and web instance.

|  Domain  |   Server  | WebLogic Patch | Java Patch | Note |
|----------|-----------|----------------|------------|------|
| hr92dmo  | hrweb-d1  | 12/1/2015      | 12/1/2015  |      |
| elm92dmo | elmweb-d1 | 12/2/2015      | 12/2/2015  |      |
| fs92dmo  | fsweb-d1  | 12/3/2015      | 12/3/2015  |      |

