#requires -version 2
<# 
.SYNOPSIS 
    A script to restart a computer at a given time and date.
.DESCRIPTION 
    
.NOTES 
    Author     	: josephkern - jkern@semafour.net
	Requires	: Powershell V2

.LINK 
    
.EXAMPLE
    Reboot the localcomputer in 12 hours:
        DelayRestart-Computer -Hours 12
    Reboot the computer 'DC1' in 12 hours:
	   DelayRestart-Computer -ComputerName DC1 -Hours 12
#> 


function DelayRestart-Computer {

    param ($ComputerName=$env:COMPUTERNAME, $Hours)
        
        # converting from hours to seconds. You can specify .5 hours this way.
        $seconds = (($Hours*60)*60)
		
        # Adding time to now
        $rebootTime = (get-date) + (New-TimeSpan -Seconds $seconds)
        
        if ($ComputerName -eq $env:COMPUTERNAME) {

                Write-Host "This computer will reboot at $rebootTime"
                Start-Sleep -Seconds $seconds
                Restart-Computer -Force
            }
        else {
                Write-Host "$ComputerName will reboot at $rebootTime"
                Restart-Computer -ComputerName $ComputerName -Force
            }
}