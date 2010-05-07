#requires -version 2
<# 
.SYNOPSIS 
    Basic reading and writing to a file.
.DESCRIPTION 
    This script creates a new directory and file. Then reads and writes to the disk.
.NOTES 
    Author     	: josephkern - jkern@semafour.net
    Requires	: Powershell V2
.LINK 

.EXAMPLE
	Another dumb-fire script, just execute.
	This will create a directory in C:\<CurrentDate>_Temp
#> 

# The " " allow for expansion of $vars and code-blocks ' ' do not.

$mypath = "C:\$(Get-Date -UFormat %Y%m%d)_Temp"

# The old way of doing this was so very painful in DOS.
# Copy and paste the following example into a dos prompt:

# set mydate=%date:~10,4%%date:~4,2%%date:~7,2%
# echo %mydate%

# I've been assured my Noble Prize is in the mail.


# Let's create a directory

New-Item -ItemType directory -Path $mypath


# Let's make a new file in our directory.

New-Item -ItemType file -Path "$mypath\Temp1.txt"


# Now let's use two cmdlets: Get-Process and Format-List 
# Then redirect the output to a file

Get-Process > "$mypath\Temp1.txt"

# Now let's get the content of the file

## $file = Get-Content "$mypath\Temp1.txt"

# $file is stored as an array.
# We can read specific lines from $file

## $file[4]

# Or multiple specific lines

## $file[2,4]

# Or ranges of lines (from the top of the file

## $file[2..9]

# Or a combination of the two (negative numbers start from the "bottom")

## $file[2], $file[-10..-1]S