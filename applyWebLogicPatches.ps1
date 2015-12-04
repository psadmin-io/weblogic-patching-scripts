# Apply 2 patches for WebLogic November 2015 CVE

Set-PSDebug -Trace 1

e:
cd \oracle\utils\bsu

.\bsu.cmd -install -patch_download_dir=e:\patches\cve-2015-4852 -patchlist=EJUW -prod_dir=e:\oracle\wlserver_10.3 -verbose
.\bsu.cmd -install -patch_download_dir=e:\patches\cve-2015-4852 -patchlist=ZLNA -prod_dir=e:\oracle\wlserver_10.3 -verbose