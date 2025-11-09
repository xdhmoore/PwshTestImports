
Describe "Test ps1, ps1 w/double function" {

   It "Script loads despite already loaded function" {
      . $PSScriptRoot\..\..\Scripts\V.ps1
      { . $PSScriptRoot\..\..\Scripts\V.ps1 } | Should -Not -Throw
   }

}
