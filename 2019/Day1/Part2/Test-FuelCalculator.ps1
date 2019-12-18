Describe 'Test the fuel calculator'{
    BeforeAll {
        . .\Get-FuelForModule.ps1
        . .\Get-FuelForFuel.ps1
    }
        It 'Passes examples for Part 1' {
            Get-FuelForModule -Mass 1969 | Should -be 654
            Get-FuelForModule -Mass 100756 | Should -be 33583
            Get-FuelForModule -Mass 12 | Should -be 2
            Get-FuelForModule -Mass 14 | Should -be 2
            Get-FuelForModule -Mass 11 | Should -be 1
            Get-FuelForModule -Mass 0 | Should -be 0
            Get-FuelForModule -Mass 2 | Should -be 0
            Get-FuelForModule -Mass 8 | Should -be 0
            Get-FuelForModule -Mass 9 | Should -be 1
            Get-FuelForModule -Mass "-1" | Should -be 0
        }

        It 'Passes examples for Part 2 - FuelForFuel' {
            Get-FuelForFuel -Mass 2 | Should -be 0
            Get-FuelForFuel -Mass 0 | Should -be 0
            Get-FuelForFuel -Mass 8 | Should -be 0
            Get-FuelForFuel -Mass 9 | Should -be 1
            Get-FuelForFuel -Mass 654 | Should -be 312
        }
    
        It 'Sums up the total correctly for Part 1 & 2' {
            @(0,12) | .\Get-FuelTotal.ps1 | Should -be 2
            @(14,12) | .\Get-FuelTotal.ps1 | Should -be 4
            .\Get-FuelTotal.ps1 -Mass 14 | Should -be 2
            .\Get-FuelTotal.ps1 -Mass 1969 | Should -be 966
            .\Get-FuelTotal.ps1 -Mass 100756 | Should -be 50346
        }
    
        It 'Solves the problem' {           
            $Input = (Get-Content -Path ./input)
            $Script:Answer = .\Get-FuelTotal.ps1 -Mass $Input
            $Script:Answer | Should -not -BeNullOrEmpty
        }
}

Write-Host "The answer is: $Script:Answer" -ForegroundColor Magenta