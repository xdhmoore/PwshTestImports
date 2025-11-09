
Describe "Test ps1, psm1 -> psm1" {
   BeforeAll {
      . $PSScriptRoot\..\..\Scripts\Z.ps1
      Import-Module $PSScriptRoot\..\..\Modules\B-Z.psm1
   }

   It "Alias Z Exists" {
      Get-Alias Test-AliasZ | Should -Not -BeNullOrEmpty
   }

   It "Function Z Exists" {
      Get-Item "Function:Test-FunctionZ" | Should -Not -BeNullOrEmpty
   }

   It "Module B Exists" {
      Get-Module "B-Z" | Should -Not -BeNullOrEmpty
   }

   It "Alias B Exists" {
      Get-Alias Test-AliasB | Should -Not -BeNullOrEmpty
   }
   It "Function B Exists" {
      Get-Item "Function:Test-FunctionB" | Should -Not -BeNullOrEmpty
   }

   AfterAll {
      Remove-Module "B-Z"
   }

}
