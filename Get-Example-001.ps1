#requires -version 2

<# 
.SYNOPSIS 
    Creating a basic profile.
.DESCRIPTION 
    Using New-Item to create a basic profile.
.NOTES 
    Author     	: josephkern - jkern@semafour.net
	Requires	: Powershell V2
.LINK 
    Get-Help New-Item
    
.EXAMPLE
	Examples can be put here. The
#> 

Write-Host "`nThere are many built-in variables in powershell. All variables begin with a '$'."

Write-Host "`nYour `$profile is located at:`n $profile"

Write-Host "`nYour `$profile may contain any kind of well formed powershell code."

Write-Host "If you have not created a `$profile yet. Use the following commands:`n"

Write-Host -BackgroundColor Red -ForegroundColor White "Be careful, this will overwrite your current `$profile!"

Write-Host "`t New-Item -path `$profile -type file -force"