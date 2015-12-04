# updateRegistryJavaVersion.ps1


$name="JavaHome"
$value="e:\java\jdk-1.7.0_79"

set-itemproperty -Path "HKLM:\SYSTEM\CurrentControlSet\services\hr92dmo-PIA\Parameters" -Name $name -Value $value
