# The DSC configuration that will generate metaconfigurations
[DscLocalConfigurationManager()]
Configuration DscMetaConfigs
{
     param
     (
        [Parameter(Mandatory=$True)]
        [String]$RegistrationUrl,
        [Parameter(Mandatory=$True)]
        [String]$RegistrationKey,
        [Parameter(Mandatory=$True)]
        [String[]]$ComputerName,
        [Int]$RefreshFrequencyMins,
        [Int]$ConfigurationModeFrequencyMins,
        [String]$ConfigurationMode,
        [String]$NodeConfigurationName,
        [Boolean]$RebootNodeIfNeeded,
        [String]$ActionAfterReboot,
        [Boolean]$AllowModuleOverwrite,
        [Boolean]$ReportOnly

     )

     if(!$NodeConfigurationName -or $NodeConfigurationName -eq '')
     {
         $ConfigurationNames = $null
     }
     else
     {
         $ConfigurationNames = @($NodeConfigurationName)
     }

     if($ReportOnly)
     {
         $RefreshMode = 'PUSH'
     }
     else
     {
         $RefreshMode = 'PULL'
     }

     Node $ComputerName
     {
         Settings
         {
             RefreshFrequencyMins           = $RefreshFrequencyMins
             RefreshMode                    = $RefreshMode
             ConfigurationMode              = $ConfigurationMode
             AllowModuleOverwrite           = $AllowModuleOverwrite
             RebootNodeIfNeeded             = $RebootNodeIfNeeded
             ActionAfterReboot              = $ActionAfterReboot
             ConfigurationModeFrequencyMins = $ConfigurationModeFrequencyMins
         }

         if(!$ReportOnly)
         {
         ConfigurationRepositoryWeb AzureAutomationStateConfiguration
             {
                 ServerUrl          = $RegistrationUrl
                 RegistrationKey    = $RegistrationKey
                 ConfigurationNames = $ConfigurationNames
             }

             ResourceRepositoryWeb AzureAutomationStateConfiguration
             {
             ServerUrl       = $RegistrationUrl
             RegistrationKey = $RegistrationKey
             }
         }

         ReportServerWeb AzureAutomationStateConfiguration
         {
             ServerUrl       = $RegistrationUrl
             RegistrationKey = $RegistrationKey
         }
     }
}

 # Create the metaconfigurations
 # NOTE: DSC Node Configuration names are case sensitive in the portal.
 # TODO: edit the below as needed for your use case
$Params = @{
     RegistrationUrl = 'https://<region>-agentservice-prod-1.azure-automation.net/accounts/<guid>'; # Copy from the Keys section in the Azure Automation account
     RegistrationKey = '<Automation_Account_Key>'; # Copy from the primary or secondary access key from the Keys section in the Azure Automation account
     ComputerName = @($env:COMPUTERNAME); #Leave this value as is for Intune PowerShell deployment
     NodeConfigurationName = 'Win10Devices.DSCConfig'; # The name of the configuration combined with the name of the node from the configuration .PS1 file with a period in between
     RefreshFrequencyMins = 30; # Minimum: 30; Maximum: 10080
     ConfigurationModeFrequencyMins = 15; # Minimum: 15; Maximum: 10080
     RebootNodeIfNeeded = $False; # Reboot the node if necessary when applying the configuration
     AllowModuleOverwrite = $True; # Specifies if new modules are downloaded and overwrite old ones.
     ConfigurationMode = 'ApplyAndAutoCorrect'; # Valid values: ApplyAndMonitor, ApplyAndAutoCorrect
     ActionAfterReboot = 'ContinueConfiguration'; # Valid values: ContinueConfiguration (continue config after reboot, default), or StopConfiguration (stop config after reboot).
     ReportOnly = $False;  # Set to $True to have machines only report to AA DSC but not pull from it
}

# Use PowerShell splatting to pass parameters to the DSC configuration being invoked
# For more info about splatting, run: Get-Help -Name about_Splatting
DscMetaConfigs @Params

# Quiet any errors in output and continue to enabling PSRemoting while skipping network checks, then re-enable errors in out
# This is necessary for deployment in Intune via PowerShell. 
$ErrorActionPreference = 'SilentlyContinue'
Enable-PSRemoting -Force -SkipNetworkProfileCheck
$ErrorActionPreference = 'Continue'

# Apply LCM settings to node, sleep to avoid use-lock issues, then cleanup the mof file from the computer
$LogDeployResult = Set-DscLocalConfigurationManager -Path .\DscMetaConfigs -ComputerName $env:COMPUTERNAME -verbose
Start-Sleep -Seconds 5
Remove-Item -Path $(-join(".\DscMetaConfigs\",$env:COMPUTERNAME,".Meta.Mof")) -Force

# Return result
Return $LogDeployResult