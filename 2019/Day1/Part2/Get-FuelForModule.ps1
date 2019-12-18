Function Get-FuelForModule{
    [CmdletBinding()]
    param (
        [parameter(Mandatory = $True)][int]$Mass
    )  
    $FuelForthisModule = ([Math]::Floor($Mass/3))-2
    If ($FuelForThisModule -gt 0){
        Return $FuelForThisModule
    }Else{Return 0}
}