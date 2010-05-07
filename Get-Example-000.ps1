#requires -version 2
<# 
.SYNOPSIS 
    This is a basic template for all of your future scripting needs.
    As right now this documentation format is hard to find.
	Thankfully it isn't too complex. This is called an AutoHelp or
	in-line help header in powershell parlance.
.DESCRIPTION 
    Each of the following examples will contain code and a header
	to explain the use of the code and a link pointing to more
	information.
    
    This example also checks your execution policy ... 
    which is kind of pointless since you won't be able to execute this
    script until you've set your execution policy. Do as I say, not as I do.
.NOTES 
    Author     	: josephkern - jkern@semafour.net
	Requires	: Powershell V2
    
	PLEASE FOR ALL THAT IS GOOD IN THE WORLD USE A REQUIRES STATEMENT
    You have no idea how many hours I have wasted trying to execute
    incompatible versions of scripts ... 
.LINK 
    More information on Autohelp
	http://tfl09.blogspot.com/2008/12/powershell-ctp3-autohelp.html
    http://pshscripts.blogspot.com/2008/12/get-autohelpps1.html
	
	Lots of great (and complex) Powershell Scripts
	http://pshscripts.blogspot.com/
	
	Powershell Owner's Manual
	http://technet.microsoft.com/en-us/library/ee221100.aspx
    
    Execution Policy:
    http://technet.microsoft.com/en-us/library/ee176949.aspx
.EXAMPLE
	Examples can be put here.
#> 

if ($(Get-ExecutionPolicy) -ne "Unrestricted")
#if ($(Get-ExecutionPolicy) -eq "Unrestricted") # Testing
    {
        Write-Host "`nSTOP! You need to run in  'Set-ExecutionPolicy Unrestricted'"
        Write-Host "`nYou need to run this command in a powershell prompt that was started with 'Run as Administrator'"
    }

else 
    { 
        Write-Host "`nLooks good. Just be careful about the scripts you run."
    }