Function Get-FuelForFuel{
    [CmdletBinding()]
    param (
        [parameter(Mandatory = $True)][int]$Mass
    )
    $Total = 0
    $FuelForFuel = ([Math]::Floor($Mass/3))-2
    while ($FuelforFuel -gt 0) {
        $Total += $FuelforFuel
        $FuelforFuel =  [math]::Floor($FuelforFuel / 3) - 2
    }
    Return $Total
}