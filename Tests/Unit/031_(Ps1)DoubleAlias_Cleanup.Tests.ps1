
Describe "Test ps1, ps1 w/double alias Cleanup" {

   It "Module W Does Not Exist" {
      Get-Module "W" -ErrorAction SilentlyContinue | Should -BeNullOrEmpty
   }

   It "Alias W Exists" {
      Get-Alias Test-AliasW -ErrorAction SilentlyContinue | Should -BeNullOrEmpty
   }
}


