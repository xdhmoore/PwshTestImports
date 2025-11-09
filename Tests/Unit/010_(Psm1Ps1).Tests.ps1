
Describe "Test psm1 -> ps1" {
   BeforeAll {
      Import-Module $PSScriptRoot\..\..\Modules\B-Z.psm1
   }

   It "B Alias Exists" {
      Get-Alias Test-AliasB | Should -Not -BeNullOrEmpty
   }
   It "B Function Exists" {
      Get-Item "Function:Test-FunctionB" | Should -Not -BeNullOrEmpty
   }

   It "Z Alias Exists" {
      Get-Alias Test-AliasZ | Should -Not -BeNullOrEmpty
   }
   It "Z Function Exists" {
      Get-Item "Function:Test-FunctionZ" | Should -Not -BeNullOrEmpty
   }

   AfterAll {
      Remove-Module B-Z
   }

}


