
Describe "Test Single ps1" {
   BeforeAll {
      . $PSScriptRoot\..\..\Scripts\Z.ps1
   }

   It "Alias Exists" {
      Get-Alias Test-AliasZ | Should -Not -BeNullOrEmpty
   }
   It "Function Exists" {
      Get-Item "Function:Test-FunctionZ" | Should -Not -BeNullOrEmpty
   }

   AfterAll {
      # Seems that I don't need to remove a ps1 import
      # (and i can't anyway)
   }

}


