Describe 'Test IntCode'{
    BeforeAll {
        #. .\Invoke-IntCode.ps1
    }
        It 'Passes examples for Part 1' {
            . .\Invoke-IntCode.ps1 -IntCode 1,9,10,3,2,3,11,0,99,30,40,50 | Should -Be 3500,9,10,70,2,3,11,0,99,30,40,50
            . .\Invoke-IntCode.ps1 -IntCode 1,0,0,0,99 | Should -Be 2,0,0,0,99
            . .\Invoke-IntCode.ps1 -IntCode 2,3,0,3,99 | Should -Be 2,3,0,6,99
            . .\Invoke-IntCode.ps1 -IntCode 2,4,4,5,99,0 | Should -Be 2,4,4,5,99,9801
            . .\Invoke-IntCode.ps1 -IntCode 1,1,1,4,99,5,6,0,99 |Should -Be 30,1,1,4,2,5,6,0,99
        }
    
        It 'Solves the problem' {           
            $Input = ((Get-Content -Path ./input) -replace '/s' -split ",")
            $Script:Answer = .\Invoke-IntCode.ps1 -IntCode $Input
            $Script:Answer | Should -not -BeNullOrEmpty
        }    
           
}

Write-Host "The code is: $($Script:Answer[0])" -ForegroundColor Magenta