#requires -version 2
<# 
.SYNOPSIS 
    This is a basic template for all of your future scripting needs.
    As right now this documentation format is hard to find.
	Thankfully it isn't too complex. This is called an AutoHelp or
	inline help header in powershell parlance.
.DESCRIPTION 
    Functions are easy, but making them functional is a little more difficult.
    
    There are several ways in which powershell interperates script blocks and 
    inputs.
.NOTES 
    Author     	: josephkern - jkern@semafour.net
	Requires	: Powershell V2
    
	PLEASE FOR ALL THAT IS GOOD IN THE WORLD USE A REQUIRES STATEMENT
    You have no idea how many hours I have wasted trying to execute
    incompatible versions of scripts ... 
.LINK 
    
    Map and Reduce functions:
    http://blogs.msdn.com/powershell/archive/2006/08/02/JoelOnSoftware-on-the-power-of-a-good-language.aspx

.EXAMPLE
	Examples can be put here. The
#> 

# Functions can be stored directly in your $profile or loaded from
# a seperate file when needed.

# There are two seperate ways to write functions

function FunctionOne ($x) {

    Write-Output $x
}

# OR

function FunctionTwo {

    param ($x)
    
    Write-Output $x
}


# Return can be used in a function, but Write-Output will show all
# objects sent through a pipeline. Return will only show the first one.
# But for trivial matters they work the same. I just default to Write-Ouput

function FunctionThree {

    param ($x)
    
    return $x
}

# The special variable $args works the same way as Python's *args,
# Taking all arguments given. But it's implied.

function FunctionFour {

   $args | Write-Output
}

#function FunctionFour {

#    return $args
#}

# Using script blocks is a great way to abscract powershell code
# The ampersand will invoke stored script blocks
# example:
# $a = "Get-Service"
# $a # Will return a string
# BUT
# &$a # Will execute the string as code.
# BUT what if you want to pass other options?
# $a = "Get-Service -Name MSDTC"
# &$a # Will not work.
# BUT
# $a = { Get-Service -Name MSDTC }
# &$a # WILL work.
# Take-away: Code should be stored between { and }

# $( ) will take a series of statements (seperated by a ;) and execute them
# returning the result upon completion.

# Confused? Consider this example:

$a = $(Get-Date)
$b = {Get-Date}

Start-Sleep -Seconds 1
Compare-Object $a $(&$b)

# What's happening here is that $a is actually storing the output while
# $b is only storing the command.


# You may also pass an entire script block as an argument to a function.
# But you need to use the '&' character to execute. Example:

function map {

    param ($fn, $a)
    
    for ($i=0; $i -lt $a.Length; $i++) 
    {
        $a[$i] = &$fn $a[$i] # notice the & here? It's executing a {scriptblock}
    }
    return $a
}

# $a = 1,2,3,4,5
# map {param ($x) return $x * 2} 

function reduce {

    param ($fn, $a, $init)
    
    $s = $init # This is the inital value, try (0 vs "")
               # This dictates what the operators do.
    
    for ($i=0; $i -lt $a.Length; $i++) 
    {
        $s = &$fn $s $a[$i]
    }
    return $s 
}

# $a = 1,2,3,4,5
# reduce {param($a,$b) return $a + $b} $a ""
# reduce {param($a,$b) return $a + $b} $a 0

# Now for something completly inapproprate, functions
# can also act as the input to other functions
# the $(FUNCTION)

# $a = 1,2,3,4,5

# reduce {param ($x, $y) return $x + $y} $(map {param ($x) return $x * 2} $a) 0