function Get-SvcHost {

    Get-WmiObject win32_service |
    
    Where-Object {$_.Pathname -like "*svchost*"`
                  -and $_.State -eq "Running"} # Backtick!
}