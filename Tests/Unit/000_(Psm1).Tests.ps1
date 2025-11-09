
Describe "Test Single psm1" {

   BeforeAll {
      Import-Module $PSScriptRoot\..\..\Modules\A.psm1
   }

   It "Alias Exists" {
      Get-Alias Test-AliasA | Should -Not -BeNullOrEmpty
   }
   It "Function Exists" {
      Get-Item "Function:Test-FunctionA" | Should -Not -BeNullOrEmpty
   }

   AfterAll {
      Remove-Module A
   }

}


