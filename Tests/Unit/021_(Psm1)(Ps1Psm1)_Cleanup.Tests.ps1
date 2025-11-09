
Describe "Test psm1, ps1 -> psm1 Cleanup" {
   It "Module Does Not Exist" {
      Get-Module A -ErrorAction SilentlyContinue | Should -BeNullOrEmpty
   }

   It "Alias Exists" {
      Get-Alias Test-AliasA -ErrorAction SilentlyContinue | Should -BeNullOrEmpty
   }
   It "Function Exists" {
      Get-Item "Function:Test-FunctionA" -ErrorAction SilentlyContinue | Should -BeNullOrEmpty
   }

   It "Module Y Does Not Exist" {
      Get-Module "Y-A" -ErrorAction SilentlyContinue | Should -BeNullOrEmpty
   }

   It "Y Alias Exists" {
      Get-Alias Test-AliasY -ErrorAction SilentlyContinue | Should -BeNullOrEmpty
   }

   It "Y Function Exists" {
      Get-Item "Function:Test-FunctionV" -ErrorAction SilentlyContinue | Should -BeNullOrEmpty
   }

}


