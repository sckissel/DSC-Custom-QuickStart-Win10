<#
Purpose: This script validates that necesary files in a directory exist, and then applies a local group policy.
This is accomplished using LGPO and a text file with the settings. 
Refer to ExportLGPO.ps1 for .txt file creation info and instructions on how to create and/or modify the .txt files 
#>

$lockFile = 'UserLockedLGPO.txt'

Try 
{
    #Get User
    #$user = $env:USERNAME
    $user = gwmi win32_computersystem | select username
    #Get Time
    $time = Get-Date

    #Verify Files
    $logsPathValid = Test-Path 'C:\DEMO\Logs\User\'
    $lgopPathValid = Test-Path 'C:\DEMO\Utils\LGPO.exe'
    $txtPathValid = Test-Path "c:\DEMO\Utils\$lockFile"
    if (($logsPathValid) -and ($lgopPathValid) -and ($txtPathValid)) #All exist
    {    
        #Apply Locked Policy
        .'C:\DEMO\Utils\LGPO.exe' /t 'C:\DEMO\Utils\UserLockedLGPO.txt' /q
        Write-Output "Locked User LGPOs for '$($user.username)' logged in: $time" | Out-File 'C:\DEMO\Logs\User\LockedLGPO.log' -Append
    }
    Else
    {
        Throw
    }
}
Catch
{
    $ErrorMessage = $error[0].Exception.ToString()
    Write-Output "$ErrorMessage for '$user' logged in: $time" | Out-File 'C:\DEMO\Logs\User\LockedLGPO.log' -Append
}