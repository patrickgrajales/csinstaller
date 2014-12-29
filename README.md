csinstaller: CommServe Installer using Vagrant
===========
## How To Use
* Make sure you have Vagrant and Virtualbox or your choice of other virtualisation software installed
* Make sure you checkout all 4 files
* Make sure you have a box that is already installed with Windows 2k8 and above along with necessary settings in place. If you don't know how to create a box:
  * Install Windows on a newly created Virtualbox system (I'd say use 40GB as your primary HDD)
  * Install all of the Guest Additions
  * Follow as:
    C:\>winrm quickconfig -q
    C:\>winrm set winrm/config/winrs @{MaxMemoryPerShellMB="300"}
    C:\>winrm set winrm/config @{MaxTimeoutms="1800000"}
    C:\>winrm set winrm/config/service @{AllowUnencrypted="true"}
    C:\>winrm set winrm/config/service/auth @{Basic="true"}
  * Make sure you enable RDP and relevant Firewall, IE ESC, etc...
  * Make sure the Administrator password is something simple (you can change it once it's been provisioned, don't worry)
  * Shutdown the VM
  * Then follow as:
    C:\>cd VMs\VagrantBoxes
    C:\VMs\VagrantBoxes>vagrant package --base w2k8_r2_base --output w2k8_r2_base.box
  * You may now use this box
* Remember to modify the Installcs.xml file and replace all your "HOSTNAME" with the right hostname that you will be setting inside Vagrantfile
* Make sure you have the CommVault Installer files located somewhere as a SMB / CIFS share. If you choose to zip it up and modify the shell provisioner, that is fine too.

### Now Enjoy a healthy CS in 30 minutes or less (on a SSD)
