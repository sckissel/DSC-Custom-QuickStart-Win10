# *******************************************
#
# Mod by: sckissel
# Mod on: 12.02.2019
# Mod purpose: Install Software for user
#
# *******************************************

# Log method
function Log { Param([string]$message) Write-Output $message; }

# Local Variables
$TranscriptPath = "C:\DEMO\Logs\User\orca.log"
$prodCode = "{FE01B6C5-85BF-4CA3-9B78-B44DEB8A4946}"
$path = "HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\$prodCode"
$time = Get-Date


Try
{
  Start-Transcript -Path $TranscriptPath -Append
  
  # Check if already installed, otherwise install
  $regRead = Get-ItemProperty $path -ErrorAction SilentlyContinue
  If (($regRead.DisplayName -eq 'EMprint Fonts') -and ($regRead.DisplayVersion -eq '1.0'))
  {
    Log 'Software already installed. Exiting Script.'
    Exit
  }
  Else
  {
    Log 'Software not installed. Installing now...'
      
    # Verify Files
    $msiPathValid = Test-Path 'C:\DEMO\Utils\orca.msi'
    if ($msiPathValid) #All exist
    {
      # Install MSI
      Start-Process msiexec.exe -Wait -ArgumentList '/I C:\DEMO\Utils\ora.msi /quiet'
      $regRead = Get-ItemProperty $path
      If (($regRead.DisplayName -eq 'Software') -and ($regRead.DisplayVersion -eq '1.0'))
      {
        Log 'Software is now installed. Exiting Script.'
        Exit
      }
      Else
      {
          Log 'An error occurred installing Software.'
          Throw
      }    
    }
    Else
    {
      Log "Invalid path appear as false: msiPathValid: ($msiPathValid)"    
      Throw
    }
  }
}
Catch
{
  $ErrorMessage = $error[0].Exception.ToString()
  Log $PSItem.ErrorID
  Log $PSItem.Exception.Message
  Log "$ErrorMessage at $time"
  break
}
Finally
{    
  Stop-Transcript
}