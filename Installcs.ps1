# Define the Variables to be used. There are more, but this is to disable IE ESC on the server
$AdminKey = "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}"
$UserKey = "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}"


# We're mapping the SMB share with the CommVault Slipstream media - Currently SP9
# We also install .NET 3.5, 4.0 and ISS along with Disabling Windows Update that you may choose to enable if you wish
net use Z: \\share\public /user:smbguest smbguest /p:no | Out-Default
Import-Module ServerManager
Add-WindowsFeature as-net-framework
Add-WindowsFeature -Name Web-Common-Http,Web-Asp-Net,Web-Net-Ext,Web-ISAPI-Ext,Web-ISAPI-Filter,Web-Http-Logging,Web-Request-Monitor,Web-Basic-Auth,Web-Windows-Auth,Web-Filtering,Web-Performance,Web-Mgmt-Console,Web-Mgmt-Compat,RSAT-Web-Server,WAS -IncludeAllSubFeature
Set-ItemProperty -Path $AdminKey -Name "IsInstalled" -Value 0
Set-ItemProperty -Path $UserKey -Name "IsInstalled" -Value 0
New-Item "HKLM:\SOFTWARE\Policies\Microsoft\Windows" -Name WindowsUpdate
New-Item "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Name AU
New-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name NoAutoUpdate -Value 1
start-process Z:\Simpana\v10\Common\Bin\DotNetFramework\4.0\dotNetFx40_Full_x86_x64.exe -ArgumentList '/q' -Wait -verb RunAs | Out-Default
start-process Z:\Simpana\v10\WinX64\Setup.exe -ArgumentList '/silent /play "C:\Users\Administrator\Installcs.xml"' -verb RunAs -Wait | Out-Default
net use Z: /delete /Y | Out-Default
