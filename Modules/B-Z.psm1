
. $PSScriptRoot\..\Scripts\Z.ps1

if (Get-Item "Function:Test-FunctionB" -ErrorAction SilentlyContinue) {
   throw "Function:Test-FunctionB already exists"
}

Function Test-FunctionB() {
   echo "Running Test-B"
}

if (Get-Item "Alias:Test-AliasB" -ErrorAction SilentlyContinue) {
   throw "Alias:Test-AliasB already exists"
}

New-Alias -Name Test-AliasB -Value Test-FunctionB
