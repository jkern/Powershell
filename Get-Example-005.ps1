#requires -version 2
<# 
.SYNOPSIS 
    Dealing with logic.
.DESCRIPTION 
    if, elseif, and else.
.NOTES
    Author     	: josephkern - jkern@semafour.net
	Requires	: Powershell V2
    
.LINK 
    Start here: 
        `get-help about_if`
        `get-help about_Comparison_Operators`
        
    Operator Syntax:
        http://www.computerperformance.co.uk/powershell/powershell_syntax.htm#Hyphen_-dash_-minus_
    
.EXAMPLE
	Fire and forget. But don't forget to look at the source. :-)
    
    Operators
    
    -lt	 Less than
    -le	 Less than or equal to
    -gt	 Greater than
    -ge	 Greater than or equal to
    -eq	 Equal to
    -ne	 Not Equal to
    -contains	 Determine elements in a group. 
        This always returns Boolean $True or $False.
    -notcontains	 Determine excluded elements in a group
        This always returns Boolean $True or $False.
    -like	 Like - uses wildcards for pattern matching
    -notlike	 Not Like - uses wildcards for pattern matching
    -match	 Match - uses regular expressions for pattern matching
    -notmatch	 Not Match - uses regular expressions for pattern matching
#> 

# Continue and break work as expected within the if statements

# Contrived example one

$val = 10

if ($val -lt 10) 
    {
        Write-Host "The number is less than 10."
    }
elseif ($val -gt 10)
    {
        Write-Host "The number is greater than 10."
    }
else
    {
        Write-Host "The number is 10!"
    }
    
# Contrived example two (better examples soon, we need loops, which are next!)

$text = "Hello"

if ($text -ne "Hello")
    {
        Write-Host "`nThat's not what I was expecting. Try again."
    }
else
    {
        Write-Host "`n$text"
    }
    
# Where-Object filters over a set of objects. Rather than just a single instance
# as the if statement does. Where-object is incredibly useful when using powershell
# interactively.

# The '$_' is used as a placeholder for the current object in the pipeline.
# You can address the properties and methods of each object as normal.

Get-Service | Where-Object {$_.Status -eq 'Stopped'}

# Where-Object is an excellent substitute for any for/if/else loop and check.