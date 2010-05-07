#requires -version 2

<# 
.SYNOPSIS 
    Basic formatting and Write-Host commands.
.DESCRIPTION 
    The obligatory Hello World example. Sans "Hello World".
.NOTES 
    Author     	: josephkern - jkern@semafour.net
	Requires	: Powershell V2
.LINK 
    Even more backticking goodness:
    http://www.computerperformance.co.uk/powershell/powershell_backtick.htm
    
    
.EXAMPLE
	None to speak of; just run the script.
#> 

Write-Host "\n Are not newlines in powershell"

Write-Host "``n are used for newlines"

Write-Host "``r are used for returns"

Write-Host "``t are used for tabs"

Write-Host "``b are used for backspaces"

Write-Host "`` is used for word-wrapping commands"

Write-Host "ex.`n`tGet-Service `` `n`t| Sort-Object ServiceType"

Write-Host "`nThis is what happens when your filesystem uses \ instead of /"

Write-Host -ForegroundColor White -BackgroundColor Red "`nYou can use colors too."


$x = "{0} very {1}" -f "This is", "strange"

Write-Host $x