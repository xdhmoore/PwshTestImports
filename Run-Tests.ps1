[CmdletBinding()]
param (
   [Parameter()]
   [Switch]
   $Integration
)

$global:ErrorActionPreference = 'Stop'
$global:InformationPreference = 'Continue'

#Requires -Modules @{ ModuleName="Pester"; ModuleVersion="5.7.1" }

Function Get-TestFile([Boolean]$Integration = $false) {
   $INTEG_REGEX = '.*\\Tests\\Integration\\.*\.Integ\.Tests\.ps1$'
   $UNIT_REGEX = '.*\\Tests\\Unit\\.*\.Tests\.ps1$'
   return Get-ChildItem -Recurse $PSScriptRoot\Tests `
   | ? {
      if ($Integration) {
         return $_.FullName -match $INTEG_REGEX;
      }
      else {
         return ($_.FullName -match $UNIT_REGEX) -and ($_.Name -notmatch $INTEG_REGEX);
      }
   }
}

$MyOptions = @{
   Run = @{ # Run configuration.
      Path = Get-TestFile -Integration $Integration
   }
   # Output = @{
   #    Verbosity = "None"
   # }
}

# Updated example based on https://github.com/pester/Pester/issues/797#issuecomment-314495326
# Based on https://pester.dev/docs/usage/mocking
Function Invoke-PesterJob() {
   [CmdletBinding()]
   param(
      [hashtable] $Options
   )

   $config = New-PesterConfiguration -Hashtable $Options

   Start-ThreadJob -ScriptBlock {
      Set-Location $using:pwd;

      Invoke-Pester -Configuration @using:config

      $null
   } | Receive-Job -Wait
}

try {
   Import-Module .\Tests\Helpers\Assertions.psm1
   Invoke-PesterJob -Options $MyOptions
   Assert-AllCleanedUp
}
finally {
   Remove-Module Assertions
}
