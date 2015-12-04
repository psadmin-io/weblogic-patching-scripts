# WebLogic Patching Scripts

A collecton of PowerShell scripts to automate WebLogic patching. 

## Script Overview

These scripts are writtin in PowerShell. If PowerShell scripts are not enabled on the server, run this command to allow PowerShell scripts to run: `set-executionpolicy unrestricted`

1. Install new SmartUpdate version (3.3.0)

        installSmartUpdate.ps1

    The `silent.xml` file is used for a silent install (no prompts). The installation directory is set to `e:\oracle`. If you want a different directory, change the value for "BEAHOME".

1. Stop all web servers running on the server

        stopPIAServices.ps1

    

1. Prepare and copy files from the `weblogic1036-2015-CVE-Patches` folder

        prepareFiles.ps1

    Two files needed updates to correctly run the Smart Update utility. `registry.xml` needed to remove a reference to Tuxedo; `bsu.cmd` needed an increase in memory to the Java Heap. 

1. Apply both WebLogic patches

        applyWebLogicPatches.ps1

    Both patches are applied to WebLogic using the `bsu` command.

1. Update the JAVA_HOME values

        updateJavaVersion.ps1

    The `JAVA_HOME` value in the `setEnv.cmd` script will be updated to the new path. **This script must be updated for each server. The paths in the script are hard-coded.**

1. Update Registry value for JAVA_HOME

        updateRegistryJavaVersion.ps1

    The `JAVA_HOME` value in the Registry for each web service will be updated. **This script must be updated for each server. The paths in the script are hard-coded.**

1. Start all web servers running on the server.

        startPIAServices.ps1


## Progress Chart

Use this chart to track the patch as you move it to each server and web instance.

|  Domain  |   Server  | WebLogic Patch | Java Patch | Note |
|----------|-----------|----------------|------------|------|
| hr92dmo  | hrweb-d1  | 12/1/2015      | 12/1/2015  |      |
| elm92dmo | elmweb-d1 | 12/2/2015      | 12/2/2015  |      |
| fs92dmo  | fsweb-d1  | 12/3/2015      | 12/3/2015  |      |

