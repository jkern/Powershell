Param($ComputerName=$env:COMPUTERNAME,[switch]$verbose)

if($verbose -eq $false)
    {
        $verbosepreference = "SilentlyContinue"
        $erroractionpreference = "SilentlyContinue"
    }
    
else
    {
        continue
    }
    
function Get-ComputerInfo{
    Param($ComputerName)
    
            Write-Verbose "   + Pinging $ComputerName"
            
            $query = "Select statuscode FROM Win32_PingStatus WHERE Address='$ComputerName'"
            $pingresult = Get-WmiObject -query $query
    
    if($pingresult.statuscode -eq 0)
        {
            Write-Verbose "     - Ping Success"
            
            Write-Verbose "   - Getting WMI Info from Win32_ComputerSystem"
            $CompInfo = Get-WmiObject Win32_ComputerSystem -ComputerName $ComputerName
            
            Write-Verbose "   - Getting WMI Info from Win32_OperatingSystem"
            $OSInfo = Get-WmiObject Win32_OperatingSystem -ComputerName $ComputerName
            
            Write-Verbose "   - Getting WMI Info from Win32_BIOS"
            $BiosInfo = Get-WmiObject Win32_BIOS -ComputerName $ComputerName
            
            Write-Verbose "   - Getting CPU Info from Win32_Processor"
            $CPUInfo = Get-WmiObject Win32_Processor -ComputerName $ComputerName
            
            Write-Verbose "   - Getting NIC Info from Win32_NetworkAdapte"
            $NetInfo = Get-WmiObject -Query "select * from Win32_NetworkAdapter" -ComputerName $ComputerName | 
                        Where-Object {$_.AdapterType -eq "Ethernet 802.3" -and $_.ServiceName -ne "VMnetAdapter" -and $_.ServiceName -ne "tmcfw"} |
                        Count-Object
                        
        # Create Object
        
            Write-Verbose "   + Creating Custom Object"
            $myobj = "" | Select-Object Name,Make,Model,SN,OS,CPUNumber,CPUspeed,MEM,Disk,Net
        
            $myobj.Name = $CompInfo.Name
            $myobj.Make = $CompInfo.Manufacturer
            $myobj.Model = $CompInfo.Model
            $myobj.SN = $BiosInfo.SerialNumber
            $myobj.OS = $OSInfo.Caption
            $myobj.CPUNumber = $CPUInfo | Count-Object
            $myobj.CPUspeed = $CPUInfo | %{$_.MaxClockSpeed}| Get-Unique
            $myobj.MEM = "{0:n2}GB" -f ($CompInfo.TotalPhysicalMemory/1gb)
            $myobj.Net = $NetInfo 
        
            Write-Verbose "     + Getting Drive Info"
            $myobj.Disk = GetDriveInfo $ComputerName
            
            Write-Verbose "   - Returning Custom Object"
            return $myobj
    }
 
        else
    {
            Write-Verbose "     - Ping Failed!"
            Write-Verbose "Error: $ComputerName not Pingable" -fore RED
    }

}


function GetDriveInfo{

    Param($ComputerName)
            
    Write-Verbose " - Getting Drive Info"
    $logicalDisk = Get-WmiObject Win32_LogicalDisk -Filter "DriveType=3" -ComputerName $ComputerName
    
    foreach($disk in $logicalDisk)
        {
            $diskObj = "" | Select-Object Disk,Size,FreeSpace
            $diskObj.Disk = $disk.DeviceID
            $diskObj.Size = "{0:n2}GB" -f ($($disk | Measure-Object -Property Size -Sum).sum/1gb)
            $diskObj.FreeSpace = "{0:n2}GB" -f ($($disk | Measure-Object -Property FreeSpace -Sum).sum/1gb)
        
            #$text = "`"{0},Size:{1},Free:{2}`"" -f $diskObj.Disk,$diskObj.size,$diskObj.Freespace
            $text = "`"{0},Size:{1}`"" -f $diskObj.Disk,$diskObj.size
            Write-Verbose " - Adding $text"
            $msg += $text + ";"

        }

            Write-Output $msg
}

function Count-Object {
    begin {
        $count = 0
    }
    process {
	# For each object in the pipeline
        $count += 1
    }
    end {
        $count
    }
}

foreach ($computer in $ComputerName)
    {
        Write-Verbose " + Processing Computer [$Computer]"
        Get-ComputerInfo $Computer
    }