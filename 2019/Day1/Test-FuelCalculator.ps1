Describe 'Test the fuel calculator'{
    BeforeAll {
        . .\Get-FuelForModule.ps1
    }
        It 'Passes examples' {
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
    
        It 'Sums up the total correctly' {
            @(0,12) | .\Get-FuelNeed.ps1 | Should -be 2
            @(14,12) | .\Get-FuelNeed.ps1 | Should -be 4
        }
    
        It 'Solves the problem' {           
            $Input = (Get-Content -Path ./input)
            $Answer = .\Get-FuelNeed.ps1 -Mass $Input
            $Script:Answer = .\Get-FuelNeed.ps1 -Mass $input
            $Script:Answer | Should -not -BeNullOrEmpty
        }
}

Write-Host "The answer is: $Answer" -ForegroundColor Magenta
