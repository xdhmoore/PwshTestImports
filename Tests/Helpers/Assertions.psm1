
Function Assert-CleanedUp() {
   [CmdletBinding()]
   param (
      [Parameter(Mandatory=$true)]
      [String]
      $Letter
   )

   Write-Debug ""
   Write-Debug "## Looking for things called '$Letter':"

   foreach($type in @("Alias", "Function")) {
      $name="${type}:Test-${type}${Letter}"
      Write-Debug "looking for $name"
      if (Get-Item $name -ErrorAction SilentlyContinue) {
         Write-Error "$name was not cleaned up and lingers"
      }
   }

}

Function Assert-ModuleCleanedUp() {
   [CmdletBinding()]
   param (
      [Parameter(Mandatory=$true)]
      [String]
      $Name
   )
   Write-Debug "looking for module $Name"
   if (Get-Module $Name -ErrorAction SilentlyContinue) {
      Write-Error "module $Name was not cleaned up and lingers"
   }
   Write-Output $Name
}

Function Assert-AllCleanedUp() {
   Write-Debug "Final check that items are gone:"

   Get-ChildItem -Include '*.ps1','*.psm1' -Path '.\Modules\*','.\Scripts\*' |
      % { Assert-ModuleCleanedUp -Name $_.BaseName } |
      % { $_ -replace '-.*','' } |
      Sort-Object -Unique |
      % { Assert-CleanedUp -Letter $_ }

   Write-Output "Success! No lingering aliases, functions, or modules found."
}
