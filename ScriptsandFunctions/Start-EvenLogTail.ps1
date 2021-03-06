# This function replicates tail -f <logname>

function Start-EventLogTail {

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