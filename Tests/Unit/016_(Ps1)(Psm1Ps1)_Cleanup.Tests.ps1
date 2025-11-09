
Describe "Test ps1, psm1 -> psm1 Cleanup" {
   It "Module Does Not Exist" {
      Get-Module "B-Z" -ErrorAction SilentlyContinue | Should -BeNullOrEmpty
   }

   It "Alias Exists" {
      Get-Alias Test-AliasB -ErrorAction SilentlyContinue | Should -BeNullOrEmpty
   }
   It "Function Exists" {
      Get-Item "Function:Test-FunctionB" -ErrorAction SilentlyContinue | Should -BeNullOrEmpty
   }

   It "Module Z Does Not Exist" {
      Get-Module Z -ErrorAction SilentlyContinue | Should -BeNullOrEmpty
   }

   It "Z Alias Exists" {
      if(Get-Alias Test-AliasZ -ErrorAction SilentlyContinue) {
         # TODO shouldnt have to do this. See my ticket:
         Write-Warning "Test-AliasZ still exists. Removing and skipping. See https://github.com/pester/Pester/issues/2666"
         Remove-Item -Force "Alias:Test-AliasZ"
      } else {
         Write-Warning "Test-AliasZ (correctly) not found. Remove this code"
      }
      Get-Alias Test-AliasZ -ErrorAction SilentlyContinue | Should -BeNullOrEmpty
   }
   It "Z Function Exists" {

      if(Get-Item "Function:Test-FunctionZ" -ErrorAction SilentlyContinue) {
         # TODO shouldnt have to do this. See my ticket:
         Write-Warning "Test-FunctionZ still exists. Removing and skipping. See https://github.com/pester/Pester/issues/2666"
         Remove-Item -Force "Function:Test-FunctionZ"
      } else {
         Write-Warning "Test-FunctionZ (correctly) not found. Remove this code"
      }
      Get-Item "Function:Test-FunctionZ" -ErrorAction SilentlyContinue | Should -BeNullOrEmpty
   }
}


