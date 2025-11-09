
Describe "Test Single ps1 Cleanup" {
   It "Module Does Not Exist" {
      Get-Module Z -ErrorAction SilentlyContinue | Should -BeNullOrEmpty
   }
   It "Alias Does Not Exist" {
      Get-Alias Test-AliasZ -ErrorAction SilentlyContinue | Should -BeNullOrEmpty
   }
   It "Function Does Not Exist" {
      Get-Item "Function:Test-FunctionZ" -ErrorAction SilentlyContinue | Should -BeNullOrEmpty
   }

}


