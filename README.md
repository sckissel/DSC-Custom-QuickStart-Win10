# DSC-Custom-QuickStart-Win10

## /PowerShell DSC/

### [Run-MetaMofDeployment.ps1](https://github.com/sckissel/DSC-Custom-QuickStart-Win10/blob/master/PowerShell%20DSC/Run-MetaMofDeployment.ps1)

PowerShell script to be modified for deployment within Intune PowerShell that tells the DSC agent to pull from and/or report to Azure Automation State Configuration.

### [Win10Devices.ps1](https://github.com/sckissel/DSC-Custom-QuickStart-Win10/blob/master/PowerShell%20DSC/Win10Devices.ps1)

Sample DSC Configuration file to be uploaded to Azure Automation. This file contains a number of configurations related to:

    * HKEY Local Machine registry entries
    * Services
    * Audit policies
    * User rights assignments
    * File/Directory creations
    * NTFS Permissions and inheritance
    * Environment variables
    * PowerShell execution policy
    * Robocopy-like synchronization with an Azure Storage account
    * Windows Optional Features
    * Scheduled Tasks  

_Modify/Update and/or remove the Configurations as necessary to suit individual business purposes.  Preference is to use Intune to configure most policies applied to Windows 10 machines. Where Intune does not have the built-in capability to perform certain policies, DSC is used as a GPO-like policy engine without invoking GPOs from domain controllers. A perfect (and intended) use case for this is Zero Trust Intune-managed machines that have no line-of-sight to a domain controller._

### [PowerShell_Logging.reg](https://github.com/sckissel/DSC-Custom-QuickStart-Win10/blob/master/PowerShell%20DSC/PowerShell_Logging.reg)  

Registry script to enable PowerShell Script Block logging as well as PowerShell Module logging for all modules.  Modify the first * in the file under ModuleNames if only specific module(s) are required to be logged. The .reg file should be locally available to the node.  

## /Scheduled Tasks/

### [InstallSoftware.ps1](https://github.com/sckissel/DSC-Custom-QuickStart-Win10/blob/master/Scheduled%20Tasks/InstallSoftware.ps1)

PowerShell script designed to install MSIs for users via Scheduled Task.  Modify as needed. MSIs to be installed should be locally available to the node.  

## /Scheduled Tasks/LGPO/

### [ApplyLockedLGPO.ps1](https://github.com/sckissel/DSC-Custom-QuickStart-Win10/blob/master/Scheduled%20Tasks/LGPO/ApplyLockedLGPO.ps1)

PowerShell script to apply Local Group Policy settings for users during Scheduled Task at logon and on a recurring basis to configure HKEY Current User registry keys. PowerShell DSC by itself was not designed to handle Current User registry keys. This may be an acceptable workaround. PowerShell script should be locally available to the node.  

### [LGPO.exe](https://github.com/sckissel/DSC-Custom-QuickStart-Win10/blob/master/Scheduled%20Tasks/LGPO/LGPO.exe)

Executable file to apply UserLockedLGPO.txt file. This executable was extracted from [LGPO.zip](https://www.microsoft.com/en-us/download/details.aspx?id=55319). Information on use of LGPO.exe is located within the LGPO.pdf within the .zip file.  

### [UserLockedLGPO.txt](https://github.com/sckissel/DSC-Custom-QuickStart-Win10/blob/master/Scheduled%20Tasks/LGPO/UserLockedLGPO.txt)

Text file containing HKEY Current User settings to be applied by LGPO.exe, which is called by the ApplyLockedLGPO.ps1. Text file should be locally available to the node.  
