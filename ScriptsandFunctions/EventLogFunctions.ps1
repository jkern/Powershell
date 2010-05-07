function Get-EventsFrom {

    param($LogName=("Application","System"),$Hours,$ComputerName=$env:COMPUTERNAME)
    
    $TimeFrom = (get-date) - (New-TimeSpan -Hours $Hours)
    
    foreach ($log in $LogName) {
         
        Get-EventLog -ComputerName $ComputerName -LogName $log |
        Where-Object { $_.TimeGenerated -gt $TimeFrom }
        
        }
}

function Get-EventsLike {

    param($LogName=("Application","System"),$regex="*",$ComputerName=$env:COMPUTERNAME)
    
    foreach ($log in $LogName) {
         
        Get-EventLog -ComputerName $ComputerName -LogName $log |
        Where-Object { $_.Message -match $regex}
        
        }
}

# This function replicates tail -f <logname>

function Get-EventLogTail {

    param ($LogName, $RefreshRate=1, $ComputerName=$env:COMPUTERNAME)
    
        
    $oldEvent = 0

    while ($true) {
        
        $newEvent = Get-EventLog -Newest 1 -LogName $LogName -ComputerName $ComputerName


        if ( $newEvent.Index -ne $oldEvent ) {
            
            $oldEvent = $newEvent.Index
            Write-Output $newEvent
        }
        
        else {
            
            Start-Sleep -Seconds $RefreshRate
            continue
        }
    }
}