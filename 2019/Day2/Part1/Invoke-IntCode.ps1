[CmdletBinding()]
    param (
        [int[]]$IntCode
    )

$OpcodePosition = 0

While ($OpcodePosition -lt ($IntCode.Length)) {
    $Param1Position = $OpcodePosition+1
    $Param2Position = $OpcodePosition+2
      
    Switch ($IntCode[$OpcodePosition]){
        1{
            $ResultIndex = $OpcodePosition+3
            $Result = ($IntCode[$IntCode[$Param1Position]]) + ($IntCode[$IntCode[$Param2Position]])
        }

        2{
            $ResultIndex = $OpcodePosition+3
            $Result = ($IntCode[$IntCode[$Param1Position]]) * ($IntCode[$IntCode[$Param2Position]])
        }
        
        default{Throw "Unknown Opcode!"}
    }

    $IntCode[$IntCode[$ResultIndex]] = $Result
    $OpcodePosition = ($OpcodePosition + 4)
    If ($IntCode[$OpcodePosition] -eq 99) {
        Write-Verbose "Opcode 99 encountered, ending program."
        Break
    }
}
Return $IntCode
