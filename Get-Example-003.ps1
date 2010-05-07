#requires -version 2

<# 
.SYNOPSIS 
    Covering Math operators and variable types and assignments.
.DESCRIPTION 
    Almost all of the math operators are standard. But some of these variables are crazy. Just sayin'.
.NOTES 
    Author     	: josephkern - jkern@semafour.net
	Requires	: Powershell V2
.LINK 
    More on Type Assignment
        http://technet.microsoft.com/en-us/magazine/2007.03.powershell.aspx
    Splatting in Powershell
        http://stackoverflow.com/questions/363884/what-does-the-symbol-do-in-powershell
        
.EXAMPLE
	Just run this script; don't forget to look at the source.
#> 

# All changes to $x and $y are local, even if you have an $x variable
# it will not change globally outside this script.

$x = 4
$y = 2
# or
#$x, $y = 4, 2

$z = 1,2,3,4,5,6
# $z = (1,2,3,4,5,6) # I like this form better.
# $z can be sliced with z[n] where n is a positive or negative int 

# Associated arrays, dictionaries to pythonistas
$z = @{"Key"="Value";"Key2"="Value2"}
# $z["Key"] will return "Value", 
# $z.Values will return all values
# $z.Keys will return all keys


$x + $y # Addition
$x - $y # Subtraction
$x / $y # Division
$x * $y # Multiplication
$x % $y # Modulo
$x ++ # Increment
$x -- # Decrement
$x += $y # Increment by n
$x -= $y # Decrement by n
$x /= $y # You get the idea ...
$x *= $y

$x + $z[$y] # Add $x to index $y of $z

"Hel" + "lo" # Concatenation
"Hello" * 3 # Multiple writes

# We can tell the type of a variable by using the GetType() method
# $z = 12
# $z.GetType()
# $y = "Hello"
# $y.GetType()

# Because variables are loosely typed we may have the need to cast them
# in a more specific manner

# Shortcut	 Data Type
# [datetime] Date or time
# [string]	 String of characters
# [char]	 Single character
# [double]	 Double-precision floating number
# [single]	 Single-precision floating number
# [int]	     32-bit integer
# [wmi]	     Windows Management Instrumentation (WMI) instance or collection
# [adsi]	 Active Directory Services object
# [wmiclass] WMI class
# [Boolean]	 True or False value

# This can lead to some weird values ... Observe:

[String]$a = 1
Write-Host $a + $a
[Int]$a = 1
Write-Host $a + $a
[Boolean]$a = 1
Write-Host $a + $a

# Sigh ... you can also use .Net assignments as well
# [System.Int32]$a = 1
# Consult your local .Net developers for more details.

# We can also format numbers as well

# N = Numeric
# C = Currency
# D = Decimal
# P = Percentage
# X = Hexadecimal

$x = 256 

"{0:N3}" -f $x
"{0:C2}" -f $x
"{0:D8}" -f $x
"{0:P0}" -f $x
"{0:X0}" -f $x

# AND we can do this:
$x = 1Kb
10GB/20MB
