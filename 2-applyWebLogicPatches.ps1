# Apply 2 patches for WebLogic November 2015 CVE

Set-PSDebug -Trace 1

e:
cd \oracle\utils\bsu

.\bsu.cmd -install -patch_download_dir=e:\installers\weblogic1036-2015-CVE-Patches -patchlist=EJUW -prod_dir=e:\oracle\wlserver_10.3 -verbose
.\bsu.cmd -install -patch_download_dir=e:\installers\weblogic1036-2015-CVE-Patches -patchlist=ZLNA -prod_dir=e:\oracle\wlserver_10.3 -verbose
