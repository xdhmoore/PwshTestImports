
Describe "Test ps1, ps1 w/double functions" {

   It "Module V Does Not Exist" {
      Get-Module "V" -ErrorAction SilentlyContinue | Should -BeNullOrEmpty
   }

   It "Function V should be gone" {
      Get-Item "Function:Test-FunctionV" -ErrorAction SilentlyContinue | Should -BeNullOrEmpty
   }
}


