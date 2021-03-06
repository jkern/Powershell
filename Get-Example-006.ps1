#requires -version 2
<# 
.SYNOPSIS 
    Basic loops: Using ForEach-Object cmdlet and the while statement.
.DESCRIPTION 
    This example implements map and reduce with ForEach-Object cmdlet
    and the while statement. In this case there's little difference between
    the use of the ForEach-Object and the while statement. 
    
    Notice though that ForEach can take a pipe input while while[sic] cannot.
    
    Two approaches to the same problem. Use what works best.
    
.NOTES 
    Author     	: josephkern - jkern@semafour.net
	Requires	: Powershell V2
    
.LINK 
    `get-help about_while`
    `get-help about_for
    `get-help ForEach-Object
    `get-alias %`
    
.EXAMPLE
	Program will not output anything. Look at the source instead.
#> 


# for and foreach-object ARE NOT THE SAME. Syntactically they are very different.
# but their may be little to no difference in trivial scripts.
# Which one is better?
# "Premature optimization is the root of all evil." -- Knuth

$z = 1,2,3,4,5
$x = 2
$i = 0

$z | ForEach-Object { $z[$i] = $x + $z[$i]; $i++ }

# OR
#while ( $i -lt $z.Length ) { $z[$i] = $x + $z[$i]; $i++ }
# OR
#for ($i=0; $i -lt $z.Length; $i++ ) { $z[$i] = $x + $z[$i] }
#OR Bad example, but this works too.
#foreach ($y in $z) { $z[$i] = $x + $z[$i]; $i++}

$z = 1,2,3,4,5
$x = 0
$i = 0

$z | ForEach-Object { $x += $z[$i]; $i++ }

# OR
# while ( $i -lt $z.Length ) { $x += $z[$i]; $i++ }
# OR
#for ($i=0; $i -lt $z.Length; $i++ ) { $x += $z[$i] }
# OR Bad example, but this works too.
#foreach ($y in $z) { $x += $z[$i]; $i++ }

# ForEach-Object is also aliased to the '%' character.
# Example:

# $z = 1,2,3,4,5
# $x = 2
# $i = 0

# $z | % { $z[$i] = $x + $z[$i]; $i++ }