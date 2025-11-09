
Describe "Test ps1, ps1 -> ps1" {
   BeforeAll {
      . $PSScriptRoot\..\..\Scripts\Z.ps1
   }

   It "Script fails to load due to already loaded aliases" {
      { . $PSScriptRoot\..\..\Scripts\X-Z.ps1 } | Should -Throw "Function:Test-FunctionZ already exists"
   }

   It "Alias Z Exists" {
      Get-Alias Test-AliasZ | Should -Not -BeNullOrEmpty
   }

   It "Function Z Exists" {
      Get-Item "Function:Test-FunctionZ" | Should -Not -BeNullOrEmpty
   }

   It "Alias X Does Not Exists - Wasn't Fully Loaded" {
      Get-Alias Test-AliasX -ErrorAction SilentlyContinue | Should -BeNullOrEmpty
   }

   It "Function X Does Not Exist - Wasn't Fully Loaded" {
      Get-Item "Function:Test-FunctionX" -ErrorAction SilentlyContinue | Should -BeNullOrEmpty
   }

   AfterAll {
      # NA
   }

}
