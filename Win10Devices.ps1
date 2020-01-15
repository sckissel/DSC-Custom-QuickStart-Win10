Configuration Win10Devices # Name of the configuration
{

  Import-DSCResource -ModuleName 'xPSDesiredStateConfiguration'
  Import-DSCResource -ModuleName 'AuditPolicyDSC'
  Import-DSCResource -ModuleName 'SecurityPolicyDSC'
  Import-DscResource -ModuleName 'ComputerManagementDsc'
  Import-DscResource -ModuleName cNtfsAccessControl
  Import-DscResource -Module cAzureStorage
  # Module Not Found: Import-DSCResource -ModuleName 'PowerShellAccessControl'
  Node DSCConfig # Name of the Node
  {
         Registry 'Registry: HKLM:\SYSTEM\CurrentControlSet\Services\WebClient\Parameters\UseBasicAuth' # Disabled Basic Auth
         {
              ValueName = 'UseBasicAuth'
              ValueType = 'Dword'
              Key = 'HKLM:\SYSTEM\CurrentControlSet\Services\WebClient\Parameters'
              ValueData = 0
         }

         Registry 'Registry: HKLM:\SYSTEM\CurrentControlSet\Services\WebClient\Parameters\DisableBasicOverClearChannel' # Disasbles Basic Auth over Clear Channel
         {
              ValueName = 'DisableBasicOverClearChannel'
              ValueType = 'Dword'
              Key = 'HKLM:\SYSTEM\CurrentControlSet\Services\WebClient\Parameters'
              ValueData = 1
         }

         Registry 'Registry: HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System\CredSSP\Parameters\AllowEncryptionOracle' # Sets the Oracle Encryption communication level to 'Vulnerable' instead of the new default of 'Mitigated'. Required else users would not be able to RDP to certain servers.  Set in tandem with servers.
         {
              ValueName = 'AllowEncryptionOracle'
              ValueType = 'Dword'
              Key = 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System\CredSSP\Parameters'
              ValueData = 2
         }

         Registry 'Registry: HKLM:\SOFTWARE\Microsoft\Silverlight\UpdateMode' # Disallows Silverlight Update
         {
              ValueName = 'UpdateMode'
              ValueType = 'Dword'
              Key = 'HKLM:\SOFTWARE\Microsoft\Silverlight'
              ValueData = 2
         }

         Registry 'Registry: HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\SettingsPageVisibility' # Hide certain Settings pages from appearing
         {
              ValueName = 'SettingsPageVisibility'
              ValueType = 'String'
              Key = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer'
              ValueData = 'hide:autoplay;usb;gaming-broadcasting;gaming-gamebar;gaming-gamemode;gaming-gamedvr;gaming-trueplay;gaming-xboxnetworking;quietmomentsgame'
         }

         Registry 'Registry: HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Virus and threat protection\UILockdown' # Prevents manipulation of Microsoft Defender UI
         {
              ValueName = 'UILockdown'
              ValueType = 'Dword'
              Key = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Virus and threat protection'
              ValueData = 1
         }

         Registry 'Registry: HKLM:\Software\Policies\Microsoft\Windows\DeviceInstall\Restrictions\DenyDeviceClasses' # Deny certain device classes from being installed
         {
              ValueName = 'DenyDeviceClasses'
              ValueType = 'Dword'
              Key = 'HKLM:\Software\Policies\Microsoft\Windows\DeviceInstall\Restrictions'
              ValueData = 1
         }

         Registry 'Registry: HKLM:\Software\Policies\Microsoft\Windows\DeviceInstall\Restrictions\DenyDeviceClassesRetroactive' # Deny certain device classes from being installed retroactively
         {
              ValueName = 'DenyDeviceClassesRetroactive'
              ValueType = 'Dword'
              Key = 'HKLM:\Software\Policies\Microsoft\Windows\DeviceInstall\Restrictions'
              ValueData = 1
         }

         Registry 'Registry: HKLM:\Software\Policies\Microsoft\Windows\DeviceInstall\Restrictions\DenyDeviceIDs' # Deny certain device IDs from being installed 
         {
              ValueName = 'DenyDeviceIDs'
              ValueType = 'Dword'
              Key = 'HKLM:\Software\Policies\Microsoft\Windows\DeviceInstall\Restrictions'
              ValueData = 1
         }

         Registry 'Registry: HKLM:\Software\Policies\Microsoft\Windows\DeviceInstall\Restrictions\DenyDeviceIDsRetroactive' # Deny certain device IDs from being installed retroactively
         {
              ValueName = 'DenyDeviceIDsRetroactive'
              ValueType = 'Dword'
              Key = 'HKLM:\Software\Policies\Microsoft\Windows\DeviceInstall\Restrictions'
              ValueData = 1
         }

         Registry 'Registry: HKLM:\Software\Policies\Microsoft\Windows\DeviceInstall\Restrictions\DenyDeviceClasses\1' # Deny Device Class #1
         {
              ValueName = '1'
              ValueType = 'String'
              Key = 'HKLM:\Software\Policies\Microsoft\Windows\DeviceInstall\Restrictions\DenyDeviceClasses'
              ValueData = '{6bdd1fc1-810f-11d0-bec7-08002be2092f}'
         }

         Registry 'Registry: HKLM:\Software\Policies\Microsoft\Windows\DeviceInstall\Restrictions\DenyDeviceClasses\2' # Deny Device Class #2
         {
              ValueName = '2'
              ValueType = 'String'
              Key = 'HKLM:\Software\Policies\Microsoft\Windows\DeviceInstall\Restrictions\DenyDeviceClasses'
              ValueData = '{d48179be-ec20-11d1-b6b8-00c04fa372a7}'
         }

         Registry 'Registry: HKLM:\Software\Policies\Microsoft\Windows\DeviceInstall\Restrictions\DenyDeviceClasses\3' # Deny Device Class #3
         {
              ValueName = '3'
              ValueType = 'String'
              Key = 'HKLM:\Software\Policies\Microsoft\Windows\DeviceInstall\Restrictions\DenyDeviceClasses'
              ValueData = '{c06ff265-ae09-48f0-812c-16753d7cba83}'
         }

         Registry 'Registry: HKLM:\Software\Policies\Microsoft\Windows\DeviceInstall\Restrictions\DenyDeviceClasses\4' # Deny Device Class #4
         {
              ValueName = '4'
              ValueType = 'String'
              Key = 'HKLM:\Software\Policies\Microsoft\Windows\DeviceInstall\Restrictions\DenyDeviceClasses'
              ValueData = '{7ebefbc0-3200-11d2-b4c2-00a0C9697d07}'
         }

         Registry 'Registry: HKLM:\Software\Policies\Microsoft\Windows\DeviceInstall\Restrictions\DenyDeviceIDs\1' # Deny Device ID #1
         {
              ValueName = '1'
              ValueType = 'String'
              Key = 'HKLM:\Software\Policies\Microsoft\Windows\DeviceInstall\Restrictions\DenyDeviceIDs'
              ValueData = 'PCI\CC_0C0A'
         }

         Registry 'Registry: HKLM:\Software\Policies\Microsoft\Windows\DriverInstall\Restrictions\AllowUserDeviceClasses' # Allowed User device classes
         {
              ValueName = 'AllowUserDeviceClasses'
              ValueType = 'Dword'
              Key = 'HKLM:\Software\Policies\Microsoft\Windows\DriverInstall\Restrictions'
              ValueData = 1
         }

         Registry 'Registry: HKLM:\Software\Policies\Microsoft\Windows\DriverInstall\Restrictions\AllowUserDeviceClasses\1' # Allowed User device class #1
         {
              ValueName = '1'
              ValueType = 'String'
              Key = 'HKLM:\Software\Policies\Microsoft\Windows\DriverInstall\Restrictions\AllowUserDeviceClasses'
              ValueData = '{4D36E979-E325-11CE-BFC1-08002BE10318}'
         }

         Registry 'Registry: HKLM:\Software\Policies\Microsoft\Windows\DriverInstall\Restrictions\AllowUserDeviceClasses\2' # Allowed User device class #2
         {
              ValueName = '2'
              ValueType = 'String'
              Key = 'HKLM:\Software\Policies\Microsoft\Windows\DriverInstall\Restrictions\AllowUserDeviceClasses'
              ValueData = '{4658ee7e-f050-11d1-b6bd-00c04fa372a7}'
         }

         Registry 'Registry: HKLM:\Software\Policies\Microsoft\Windows\DriverInstall\Restrictions\AllowUserDeviceClasses\3' # Allowed User device class #3
         {
              ValueName = '3'
              ValueType = 'String'
              Key = 'HKLM:\Software\Policies\Microsoft\Windows\DriverInstall\Restrictions\AllowUserDeviceClasses'
              ValueData = '{49ce6ac8-6f86-11d2-ble5-0080c72e74a2}'
         }

         Registry 'Registry: HKLM:\Software\Policies\Microsoft\Windows\DriverInstall\Restrictions\AllowUserDeviceClasses\4' # Allowed User device class #4
         {
              ValueName = '4'
              ValueType = 'String'
              Key = 'HKLM:\Software\Policies\Microsoft\Windows\DriverInstall\Restrictions\AllowUserDeviceClasses'
              ValueData = '{4d36e97a-e325-11ce-bfc1-08002be10318}'
         }

         Registry 'Registry: HKLM:\Software\Policies\Microsoft\Windows\DriverInstall\Restrictions\AllowUserDeviceClasses\5' # Allowed User device class #5
         {
              ValueName = '5'
              ValueType = 'String'
              Key = 'HKLM:\Software\Policies\Microsoft\Windows\DriverInstall\Restrictions\AllowUserDeviceClasses'
              ValueData = '{51AC4581-3DEB-49E2-8C32-61410DBDEE6}'
         }

         Registry 'Registry: HKLM:\Software\Policies\Microsoft\Windows\Explorer\ShowHibernateOption' # Show Hibernation Option
         {
              ValueName = 'ShowHibernateOption'
              ValueType = 'Dword'
              Key = 'HKLM:\Software\Policies\Microsoft\Windows\Explorer'
              ValueData = 1
         }

         Registry 'Registry: HKLM:\Software\Policies\Microsoft\Windows\SmartCardCredentialProvider\AllowCertificatesWithNoEKU' # Dissalow SmartCard certificates with no EKU
         {
              ValueName = 'AllowCertificatesWithNoEKU'
              ValueType = 'Dword'
              Key = 'HKLM:\Software\Policies\Microsoft\Windows\SmartCardCredentialProvider'
              ValueData = 0
         }

         Registry 'Registry: HKLM:\Software\Policies\Microsoft\Windows\SmartCardCredentialProvider\EnumerateECCCerts' # Enumerate SmartCard ECC Certificates
         {
              ValueName = 'EnumerateECCCerts'
              ValueType = 'Dword'
              Key = 'HKLM:\Software\Policies\Microsoft\Windows\SmartCardCredentialProvider'
              ValueData = 1
         }

         Registry 'Registry: HKLM:\Software\Policies\Microsoft\Windows\SmartCardCredentialProvider\AllowIntegratedUnblock' # Allow SmartCard unlock
         {
              ValueName = 'AllowIntegratedUnblock'
              ValueType = 'Dword'
              Key = 'HKLM:\Software\Policies\Microsoft\Windows\SmartCardCredentialProvider'
              ValueData = 1
         }

         Registry 'Registry: HKLM:\Software\Policies\Microsoft\Windows\SmartCardCredentialProvider\AllowSignatureOnlyKeys' # Disallow Smart Card signature-only keys
         {
              ValueName = 'AllowSignatureOnlyKeys'
              ValueType = 'Dword'
              Key = 'HKLM:\Software\Policies\Microsoft\Windows\SmartCardCredentialProvider'
              ValueData = 0
         }

         Registry 'Registry: HKLM:\Software\Policies\Microsoft\Windows\SmartCardCredentialProvider\IntegratedUnblockPromptString' # Text to display when SmartCard is blocked
         {
              ValueName = 'IntegratedUnblockPromptString'
              ValueType = 'String'
              Key = 'HKLM:\Software\Policies\Microsoft\Windows\SmartCardCredentialProvider'
              ValueData = 'The system could not log you on. The smart card is blocked. Please contact the Help Desk for instructions on how to unblock your smart card.'
         }

         Registry 'Registry: HKLM:\Software\Policies\Microsoft\WindowsStore\DisableOSUpgrade' # Prevent OS Feature Updates
         {
              ValueName = 'DisableOSUpgrade'
              ValueType = 'Dword'
              Key = 'HKLM:\Software\Policies\Microsoft\WindowsStore'
              ValueData = 1
         }

         Registry 'Registry: HKLM:\SOFTWARE\Wow6432Node\Microsoft\CLM\v1.0\SmartCardClient\PinRules\MinPinLength' # Set minimum SmartCard PIN Length
         {
              ValueName = 'MinPinLength'
              ValueType = 'Dword'
              Key = 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\CLM\v1.0\SmartCardClient\PinRules'
              ValueData = 8
         }

         Registry 'Registry: HKLM:\SOFTWARE\Wow6432Node\Microsoft\CLM\v1.0\SmartCardClient\PinRules\MaxRepeatChar' # Set maximum number of SmartCard PIN repeating characters
         {
              ValueName = 'MaxRepeatChar'
              ValueType = 'Dword'
              Key = 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\CLM\v1.0\SmartCardClient\PinRules'
              ValueData = 2
         }

         Registry 'Registry: HKLM:\SOFTWARE\Wow6432Node\Microsoft\CLM\v1.0\SmartCardClient\PinRules\MaxSortedSequenceChar' # Set maximum number of SmartCard PIN characters in sequence
         {
              ValueName = 'MaxSortedSequenceChar'
              ValueType = 'Dword'
              Key = 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\CLM\v1.0\SmartCardClient\PinRules'
              ValueData = 2
         }

         Registry 'Registry: HKLM:\SOFTWARE\Wow6432Node\Microsoft\CLM\v1.0\SmartCardClient\PinRules\Filter' # Set allowed SmartCard PIN Characters
         {
              ValueName = 'Filter'
              ValueType = 'String'
              Key = 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\CLM\v1.0\SmartCardClient\PinRules'
              ValueData = '([a-zA-Z0-9]*)'
         }

         Registry 'Registry: HKLM:\SOFTWARE\Wow6432Node\Microsoft\CLM\v1.0\SmartCardClient\PinRules\MinNumeric' # Set minimum SmartCard PIN numerals
         {
              ValueName = 'MinNumeric'
              ValueType = 'Dword'
              Key = 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\CLM\v1.0\SmartCardClient\PinRules'
              ValueData = 1
         }

         Registry 'Registry: HKLM:\SOFTWARE\Wow6432Node\Microsoft\CLM\v1.0\SmartCardClient\PinRules\MinLowercase' # Set minimum SmartCard PIN lower case letters
         {
              ValueName = 'MinLowercase'
              ValueType = 'Dword'
              Key = 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\CLM\v1.0\SmartCardClient\PinRules'
              ValueData = 1
         }

         Registry 'Registry: HKLM:\SOFTWARE\Wow6432Node\Microsoft\CLM\v1.0\SmartCardClient\PinRules\MaxPinLength' # Set maximum SmartCard PIN length
         {
              ValueName = 'MaxPinLength'
              ValueType = 'Dword'
              Key = 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\CLM\v1.0\SmartCardClient\PinRules'
              ValueData = 14
         }

         Registry 'Registry: HKLM:\SOFTWARE\Wow6432Node\Microsoft\CLM\v1.0\SmartCardClient\SiteLock' # Set SmartCard Sites to unlock 
         {
              ValueName = 'SiteLock'
              ValueType = 'String'
              Key = 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\CLM\v1.0\SmartCardClient'
              ValueData = 'lab.demogods.com'
         }

         Registry 'Registry: HKLM:\SOFTWARE\Policies\Google\Update\DisableAutoUpdateChecksCheckboxValue' # Google Chrome: Prevent AutoUpdates from being disabled
         {
              ValueName = 'DisableAutoUpdateChecksCheckboxValue'
              ValueType = 'Dword'
              Key = 'HKLM:\SOFTWARE\Policies\Google\Update'
              ValueData = 0
         }

         Registry 'Registry: HKLM:\SOFTWARE\Policies\Google\Update\UpdateDefault' # Google Chrome: Allow updates by default
         {
              ValueName = 'UpdateDefault'
              ValueType = 'Dword'
              Key = 'HKLM:\SOFTWARE\Policies\Google\Update'
              ValueData = 1
         }

         Registry 'Registry: HKLM:\System\CurrentControlSet\Control\Session Manager\SubSystems\optional' # Sets a null value as the default of 'POSIX' is an audit risk/finding
         {
              ValueName = 'Optional'
              ValueType = 'String'
              Key = 'HKLM:\System\CurrentControlSet\Control\Session Manager\SubSystems'
              ValueData = ''
         }

         Registry 'Registry: HKLM:\System\CurrentControlSet\Control\Lsa\DisableDomainCreds' # Do not allow storage of passwords and credentials for network authentication
         {
              ValueName = 'DisableDomainCreds'
              ValueType = 'Dword'
              Key = 'HKLM:\System\CurrentControlSet\Control\Lsa'
              ValueData = '1'
         }

         Registry 'Registry: HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\WAU' # Prevents the Add Features wizard from running when enabled
         {
              ValueName = 'WAU'
              ValueType = 'Dword'
              Key = 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer'
              ValueData = '1'
         }

         Registry 'Registry: HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity\Enabled' # Disables Code Integrity
         {
              ValueName = 'Enabled'
              ValueType = 'Dword'
              Key = 'HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity'
              ValueData = '0'              
         }

         Registry 'Registry: HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard\HVCIMATRequired' # Disables Code Integrity
         {
              ValueName = 'HVCIMATRequired'
              ValueType = 'Dword'
              Key = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard'
              ValueData = '0'              
         }

         Registry 'Registry: HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\TestHooks\XamlCredUIAvailable' # Disables modern UAC prompt
         {
              ValueName = 'XamlCredUIAvailable'
              ValueType = 'Dword'
              Key = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\TestHooks'
              ValueData = '0'              
         }

         Registry 'Registry: HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SL\UserOperations' # Allows standard users to install product keys, activate, and re-arm computers
         {
              ValueName = 'UserOperations'
              ValueType = 'Dword'
              Key = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SL'
              ValueData = '1'              
         }

         Registry 'Registry: HKLM:\SYSTEM\CurrentControlSet\Services\NetBT\Parameters\NoNameReleaseOnDemand' # Ignore NetBIOS name release requests except from WINS servers.  Prevents Denial of Service attack.
         {
              ValueName = 'NoNameReleaseOnDemand'
              ValueType = 'Dword'
              Key = 'HKLM:\SYSTEM\CurrentControlSet\Services\NetBT\Parameters'
              ValueData = '1'              
         }

         Registry 'Registry: HKLM:\SYSTEM\CurrentControlSet\Services\EventLog\Application\Retention' # Set Event Log to overwrite as needed.
         {
              ValueName = 'Retention'
              ValueType = 'Dword'
              Key = 'HKLM:\SYSTEM\CurrentControlSet\Services\EventLog\Application'
              ValueData = '0'              
         }

         Registry 'Registry: HKLM:\SYSTEM\CurrentControlSet\Services\EventLog\Security\Retention' # Set Event Log to overwrite as needed.
         {
              ValueName = 'Retention'
              ValueType = 'Dword'
              Key = 'HKLM:\SYSTEM\CurrentControlSet\Services\EventLog\Security'
              ValueData = '0'              
         }

         Registry 'Registry: HKLM:\SYSTEM\CurrentControlSet\Services\EventLog\System\Retention' # Set Event Log to overwrite as needed.
         {
              ValueName = 'Retention'
              ValueType = 'Dword'
              Key = 'HKLM:\SYSTEM\CurrentControlSet\Services\EventLog\System'
              ValueData = '0'              
         }

         Registry 'Registry: HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\EncryptionContextMenu' # Encrypt/Decrypt option on the selections when you right-click a file/folder if using EFS
         {
              ValueName = 'EncryptionContextMenu'
              ValueType = 'Dword'
              Key = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
              ValueData = '2'              
         }

         Service 'Services: dot3svc' # Wired LAN 802.1x
         {
              Name = 'dot3svc'
              State = 'Running'
         }
         
         Service 'Services: WinRM' # WinRM is required for DSC to work
         {
              Name = 'WinRM'
              State = 'Running'
         }

         Service 'Services: SharedAccess' # Disables Internet Connection Sharing
         {
              Name = 'SharedAccess'
              State = 'Stopped'
              StartupType = 'Disabled'
         }

         Service 'Services: bthserv' # Disables Bluetooth Support Service
         {
              Name = 'bthserv'
              State = 'Stopped'
              StartupType = 'Disabled'
         }

         Service 'Services: p2psvc' # Disables Peer Networking Grouping
         {
              Name = 'p2psvc'
              State = 'Stopped'
              StartupType = 'Disabled'
         }

         <#
         Service 'Services: SCPolicySvc' # Sets Smart Card Removal Policy to Automatic
         {
              Name = 'SCPolicySvc'
              StartupType = 'Automatic'
         }
         #>

         Service 'Services: CertPropSvc' # Sets Certificate Propogation to Automatic
         {
              Name = 'CertPropSvc'
              StartupType = 'Automatic'
         }

         Service 'Services: TrkWks' # Disables Distributed Link Tracking Client
         {
              Name = 'TrkWks'
              State = 'Stopped'
              StartupType = 'Disabled'
         }

         Service 'Services: DiagTrack' # Enables Connected User Experiences and Telemetry
         {
              Name = 'DiagTrack'
              State = 'Running'
              StartupType = 'Automatic'
         }

         xGroup 'Restricted Users: Authenticated Users to Event Log Readers' # Add Authenticated Users to Event Log Readers group
         {
              GroupName = 'Event Log Readers'
              Ensure = 'Present'
              MembersToInclude = 'S-1-5-11'
         }

         xEnvironment 'Environmental Variable: Language = English' # Set environment varioble for language
         {
              Name   = 'Language'
              Value  = 'English'
              Ensure = 'Present'
              Path   = $false
              Target = 'Machine'
         }

         AuditPolicySubcategory 'Audit: LogonSuccess' # Audit Logon successes
         {
              Name      = 'Logon'
              AuditFlag = 'Success'
              Ensure    = 'Present' 
         } 

         AuditPolicySubcategory 'Audit: LogonFailure' # Audit Logon failures
         {
              Name      = 'Logon'
              AuditFlag = 'Failure'
              Ensure    = 'Present'
         }

         AuditPolicySubcategory 'Audit: AuditPolicyChangeSuccess' # Audit polcy change successes
         {
              Name      = 'Audit Policy Change'
              AuditFlag = 'Success'
              Ensure    = 'Absent' 
         } 

         AuditPolicySubcategory 'Audit: AuditPolicyChangeFailure' # Audit policy change failures
         {
              Name      = 'Audit Policy Change'
              AuditFlag = 'Failure'
              Ensure    = 'Present'
         }

         AuditPolicySubcategory 'Audit: AuditAccountManageSuccess' # Audit account management successes
         {
              Name      = 'User Account Management'
              AuditFlag = 'Success'
              Ensure    = 'Present' 
         } 

         AuditPolicySubcategory 'Audit: AuditAccountManageFailure' # Audit account management failures
         {
              Name      = 'User Account Management'
              AuditFlag = 'Failure'
              Ensure    = 'Present'
         }

         AuditPolicySubcategory 'Audit: AuditLogonEventsSuccess' # Audit logon event successes
         {
              Name      = 'Other Account Logon Events'
              AuditFlag = 'Success'
              Ensure    = 'Present' 
         } 

         AuditPolicySubcategory 'Audit: AuditLogonEventsFailure' # Audit logon event failures
         {
              Name      = 'Other Account Logon Events'
              AuditFlag = 'Failure'
              Ensure    = 'Present'
         }

         UserRightsAssignment 'User Rights Assignment: SeLoadDriverPrivilege'  # Assign user rights to Administrators to load drivers
         {
              Policy = 'Load_and_unload_device_drivers'
              Identity = 'BUILTIN\Administrators'
              Force = $True
         }

         UserRightsAssignment 'User Rights Assignment: SeNetworkLogonRight'  # Assign user rights to NETWORK SERVICE for network logon rights
         {
              Policy = 'Access_this_computer_from_the_network'
              Identity = 'NT AUTHORITY\NETWORK SERVICE'
              Force = $True
         }

         UserRightsAssignment 'User Rights Assignment: SeProfileSingleProcessPrivilege' # Assign user rights to Administrators and Users to profile a single process
         {
              Policy = 'Profile_single_process'
              Identity = 'BUILTIN\Administrators','BUILTIN\Users'
              Force = $True
         }

         UserRightsAssignment 'User Rights Assignment: SeRemoteInteractiveLogonRight' # Assign user rights to Remote Detkop Users to logon interactively
         {
              Policy = 'Allow_log_on_through_Remote_Desktop_Services'
              Identity = 'BUILTIN\Remote Desktop Users'
              Force = $True
         }

         UserRightsAssignment 'User Rights Assignment: SeSystemProfilePrivilege' # Assign user rights to Administrators and Users to profile system performance 
         {
              Policy = 'Profile_system_performance'
              Identity = 'BUILTIN\Administrators','BUILTIN\Users'
              Force = $True
         }

         UserRightsAssignment 'User Rights Assignment: SeSystemTimePrivilege' # Assign user rights to Administrators and LOCAL SERVICE to change the system time
         {
              Policy = 'Change_the_system_time'
              Identity = 'BUILTIN\Administrators','NT AUTHORITY\LOCAL SERVICE'
              Force = $True
         }

         File DEMO # Create C:\DEMO Directory
         {
            Type = 'Directory'
            DestinationPath = 'C:\DEMO'
            Ensure = 'Present'
         }

         File DEMOUtils # Create C:\DEMO\Utils Directory
         {
            Type = 'Directory'
            DestinationPath = 'C:\DEMO\Utils'
            Ensure = 'Present'
            DependsOn = '[File]DEMO'
         }

         File DEMOLogs # Create C:\DEMO\Logs Directory
         {
            Type = 'Directory'
            DestinationPath = 'C:\DEMO\Logs'
            Ensure = 'Present'
            DependsOn = '[File]DEMO'
         }

         File DEMOLogsUser # Create C:\DEMO\Logs\User Directory
         {
            Type = 'Directory'
            DestinationPath = 'C:\DEMO\Logs\User'
            Ensure = 'Present'
            DependsOn = '[File]DEMOLogs'
         }

         File DEMOLogsSystem # Create C:\DEMO\Logs\System Directory
         {
            Type = 'Directory'
            DestinationPath = 'C:\DEMO\Logs\System'
            Ensure = 'Present'
            DependsOn = '[File]DEMOLogs'
         }

         PowerShellExecutionPolicy ExecutionPolicyLocalMachine # Set Execution Policy to Remote Signed so other resources below work correctly and don't display false 'not compliant' messages
         {
            ExecutionPolicyScope = 'LocalMachine'
            ExecutionPolicy      = 'RemoteSigned'
         }

         cNtfsPermissionsInheritance DEMODisableInheritance # Disable ACL inheritance on C:\DEMO and all subdirs
         {
            Path = 'C:\DEMO'
            Enabled = $False
            PreserveInherited = $True
            DependsOn = '[File]DEMO','[PowerShellExecutionPolicy]ExecutionPolicyLocalMachine'
         }
         
         cNtfsPermissionEntry DEMOPermissionSet # Set permissions on C:\DEMO to remove 'Authenticated Users'
         {
            Ensure = 'Absent'
            Path = 'C:\DEMO'
            Principal = 'NT AUTHORITY\Authenticated Users'
            DependsOn = '[cNtfsPermissionsInheritance]DEMODisableInheritance'
         }             
        
         cAzureStorage DEMOUtilsSync # Sync files with an Azure Storage account into the C:\Utils directory
         {  
            Path = 'C:\DEMO\Utils'
            StorageAccountName = 'sademofileshare'
            StorageAccountKey = 'Jkg3i64cCeSozK4b6urtktrVTEPf6//JxtTu0KW38Jx9LJTuiS+DO14aqq5fFflrViwKOddEs4FcV+8dBefJ0A=='
            StorageAccountContainer = 'utils'
            Blob = $null
            DependsOn = '[File]DEMOUtils'
         }

         ScheduledTask 'ScheduledTask: \Contoso\ApplyUserLockedLGPOAtLogon' # Creates a scheduled task to run a PowerShell script at user login
         {            
            TaskName = 'ApplyUserLockedLGPOAtLogon'
            TaskPath = '\Contoso'
            ActionExecutable = 'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe'
            ActionArguments = 'C:\DEMO\Utils\ApplyLockedLGPO.ps1'
            ScheduleType = 'AtLogOn'
            LogonType = 'Interactive'
            RepeatInterval = '00:15:00'
            RepetitionDuration = 'Indefinitely'
            Enable = $True
            RunOnlyIfIdle = $False
            Priority = '7'
            Hidden = $True
            ExecutionTimeLimit = '01:00:00'
            RestartOnIdle = $True
            RestartCount = 0
            AllowStartIfOnBatteries = $True
            DontStopIfGoingOnBatteries = $True
            Ensure = 'Present'
            DependsOn = '[cAzureStorage]DEMOUtilsSync'
         }

         ScheduledTask 'ScheduledTask: \Contoso\InstallSoftware' # Creates a scheduled task to run a PowerShell script at user login
         {            
            TaskName = 'InstallSoftware'
            TaskPath = '\Contoso'
            ActionExecutable = 'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe'
            ActionArguments = 'C:\DEMO\Utils\DEMO-InstallSoftware.ps1'
            ScheduleType = 'Daily'
            StartTime = '16:00:00'
            LogonType = 'Interactive'
            RepetitionDuration = 'Indefinitely'
            Enable = $True
            RunOnlyIfIdle = $False
            Priority = '7'
            Hidden = $True
            ExecutionTimeLimit = '01:00:00'
            RestartOnIdle = $True
            RestartCount = 0
            AllowStartIfOnBatteries = $True
            DontStopIfGoingOnBatteries = $True
            Ensure = 'Present'
            DependsOn = '[cAzureStorage]DEMOUtilsSync'
         }

         #Commented out for now as it won't work on VMs
         <#
         xWindowsOptionalFeature 'Enable Hyper-V' # Enables Hyper-V for WDAG
         {
            Name    = 'Microsoft-Hyper-V'
            Ensure  = 'Present'
         }
         #>
  }
}