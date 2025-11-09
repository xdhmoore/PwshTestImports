
Describe "Test ps1, ps1 -> ps1 Cleanup" {

   It "Module Z Does Not Exist" {
      Get-Module "Z" -ErrorAction SilentlyContinue | Should -BeNullOrEmpty
   }

   It "Alias X Exists" {
      Get-Alias Test-AliasX -ErrorAction SilentlyContinue | Should -BeNullOrEmpty
   }
   It "Function X Exists" {
      Get-Item "Function:Test-FunctionX" -ErrorAction SilentlyContinue | Should -BeNullOrEmpty
   }

   It "Module X-Z Does Not Exist" {
      Get-Module "X-Z" -ErrorAction SilentlyContinue | Should -BeNullOrEmpty
   }

   It "Z Alias Exists" {
      Get-Alias Test-AliasZ -ErrorAction SilentlyContinue | Should -BeNullOrEmpty
   }

   It "Z Function Exists" {
      Get-Item "Function:Test-FunctionZ" -ErrorAction SilentlyContinue | Should -BeNullOrEmpty
   }

}


