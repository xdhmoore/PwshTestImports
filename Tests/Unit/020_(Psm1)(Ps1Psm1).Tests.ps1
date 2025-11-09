
Describe "Test psm1, ps1 -> psm1" {
   BeforeAll {
      Import-Module $PSScriptRoot\..\..\Modules\A.psm1
      . $PSScriptRoot\..\..\Scripts\Y-A.ps1
   }

   It "Alias A Exists" {
      Get-Alias Test-AliasA | Should -Not -BeNullOrEmpty
   }

   It "Function A Exists" {
      Get-Item "Function:Test-FunctionA" | Should -Not -BeNullOrEmpty
   }

   It "Alias Y Exists" {
      Get-Alias Test-AliasY | Should -Not -BeNullOrEmpty
   }
   It "Function Y Exists" {
      Get-Item "Function:Test-FunctionY" | Should -Not -BeNullOrEmpty
   }

   AfterAll {
      Remove-Module A
   }

}
