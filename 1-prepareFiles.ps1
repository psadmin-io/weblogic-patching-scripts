# Copy custom files to prepare for patching

rename-item e:\oracle\registry.xml registry.xml.bkp
rename-item e:\oracle\utils\bsu\bsu.cmd bsu.cmd.bkp

copy-item -Path E:\installers\weblogic1036-2015-CVE-Patches\registry.xml    -Destination e:\oracle\registry.xml
copy-item -Path E:\installers\weblogic1036-2015-CVE-Patches\bsu.cmd         -Destination e:\oracle\utils\bsu\bsu.cmd
copy-item -Path E:\installers\weblogic1036-2015-CVE-Patches\jdk-1.7.0_79    -Destination e:\java\ -recurse

(get-content e:\oracle\registry.xml) | foreach-object {$_ -replace "hr-web-d2", $env:computername} | set-content e:\oracle\registry.xml
