
Describe "Test psm1 -> ps1 Cleanup" {
   It "Module B Does Not Exist" {
      Get-Module B -ErrorAction SilentlyContinue | Should -BeNullOrEmpty
   }

   It "B Alias Exists" {
      Get-Alias Test-AliasB -ErrorAction SilentlyContinue | Should -BeNullOrEmpty
   }
   It "B Function Exists" {
      Get-Item "Function:Test-FunctionB" -ErrorAction SilentlyContinue | Should -BeNullOrEmpty
   }

   It "Module Z Does Not Exist" {
      Get-Module Z -ErrorAction SilentlyContinue | Should -BeNullOrEmpty
   }

   It "Z Alias Exists" {
      Get-Alias Test-AliasZ -ErrorAction SilentlyContinue | Should -BeNullOrEmpty
   }
   It "Z Function Exists" {
      Get-Item "Function:Test-FunctionZ" -ErrorAction SilentlyContinue | Should -BeNullOrEmpty
   }

}


