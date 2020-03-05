<#
.SYNOPSIS
Calculates fuel needed for the Fuel Counter-Upper .

.DESCRIPTION
The Fuel Counter-Upper needs to know the total fuel requirement. 
Calculates the fuel needed for the mass of each module 
(your puzzle input), then adds all the fuel values together.

.PARAMETER Mass
The mass of each module.

.EXAMPLE
@(1969,100756) | .\Get-FuelNeed.ps1
Calculates the fuel needed for two modules.

.EXAMPLE
Get-Content input | .\Get-FuelNeed.ps1
Calculates the fuel needed for the module masses listed in the input file.

.OUTPUTS

.NOTES
Author: Peter Östman
History:	v1.0 Created script - 2019-12-18

#>

[CmdletBinding()]

param (
    [parameter(
        Mandatory = $True,
        ValueFromPipeline = $True
    )]
    [int[]]$Mass
)#Param

begin {
    . .\Get-FuelForModule.ps1
    [int]$Total = 0
}

process {
    ForEach($Value in $Mass) {
        $Total += Get-FuelForModule -Mass $Value
    }
}

end {
    Return $Total
}