# DSC-Custom-QuickStart

## Files

### Run-MetaMofDeployment.ps1

PowerShell script to be modified for deployment within Intune PowerShell that tells the DSC agent to pull from and/or report to Azure Automation State Configuration.

### Win10Devices.ps1

Sample DSC Configuration file to be uploaded to Azure Automation. This file contains a number of configurations related to:

* HKLM Registry entries
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
  * One of the scheduled tasks is designed to apply local group policy settings on a recurring basis to configure HKCU registry keys. PowerShell DSC by itself was not designed to handle Current User registry keys. This may be an acceptable workaround.  Please see ApplyLockedLGPO.ps1 file for additional information.  

_Modify/Update and/or remove the Configurations as necessary to suit individual business purposes.  Preference is to use Intune to configure most policies applied to Windows 10 machines. Where Intune does not have the built-in capability to perform certain policies, DSC is used as a GPO-like policy engine without invoking GPOs from domain controllers. A perfect use case for this is Zero Trust Intune-managed machines that have no line-of-sight to a domain controller._

### ApplyLockedLGPO.ps1

PowerShell script to apply Local Group Policy settings for users during Scheduled Task at logon.  

### UserLockedLGPO.txt

Text file containing HKCU user settings to be applied by LGPO.exe, which is calledl by the ApplyLockedLGPO.ps1

### LGPO.exe

Executable file to apply UserLockedLGPO.txt file. This executable was extracted from [LGPO.zip](https://www.microsoft.com/en-us/download/details.aspx?id=55319). Information on use of LGPO.exe is located within the LGPO.pdf within the .zip file.  

### InstallSoftware.ps1

PowerShell script designed to install MSIs for users via Scheduled Task.  Modify as needed.  
