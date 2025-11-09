
Describe "Test ps1, ps1 w/double alias" {

   It "Script fails to load due to already loaded aliases" {
      . $PSScriptRoot\..\..\Scripts\W.ps1
      { . $PSScriptRoot\..\..\Scripts\W.ps1 } | Should -Throw "*Test-AliasW*already exists.*"
   }

}
