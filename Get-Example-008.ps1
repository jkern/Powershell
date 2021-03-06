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

	

#> 



# Parsing Objects with Get-Member



Get-Help Get-Member

Get-Help | Get-Member



$(Get-Help Get-Help).Name

Get-Help Get-Help | % { Write-Host $_.Name }





# Filtering Objects with Where-Object

# Using the $_ for great justice

# The $_ is the current object/expression in the pipeline

# Expressions are only allowed as the first element of a pipeline!



Get-Process | Where-Object { $_.CPU -ne $null }





# Building new objects with New-Object "the right way"



$OutputNewObject = New-Object PSobject



$OutputNewObject | Add-Member -Name Date -MemberType NoteProperty -value $null

$OutputNewObject | Add-Member -Name Time -MemberType NoteProperty -value $null

$OutputNewObject | Add-Member -Name Name -MemberType NoteProperty -value $null



$OutputNewObject.Name = "TEST"





# Building new objects with Select-Object "the simple way"



$OutputSelectObject = "" | Select-Object Name,Date,Time



$OutputSelectObject.Name = "TEST2"





# Comparing Objects with Compare-Object



Compare-Object $OutputSelectObject.Name $OutputNewObject.Name