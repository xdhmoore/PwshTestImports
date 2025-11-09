
Describe "Test Single psm1 Cleanup" {
   It "Module A Does Not Exist" {
      Get-Module A -ErrorAction SilentlyContinue | Should -BeNullOrEmpty
   }
   It "Alias Does Not Exist" {
      Get-Alias Test-AliasA -ErrorAction SilentlyContinue | Should -BeNullOrEmpty
   }
   It "Function Does Not Exist" {
      Get-Item "Function:Test-FunctionA" -ErrorAction SilentlyContinue | Should -BeNullOrEmpty
   }

}


