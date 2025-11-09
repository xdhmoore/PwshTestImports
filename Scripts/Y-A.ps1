
Import-Module $PSScriptRoot\..\Modules\A.psm1

if (Get-Item "Function:Test-FunctionY" -ErrorAction SilentlyContinue) {
   throw "Function:Test-FunctionY already exists"
}

Function Test-FunctionY() {
   echo "Running Test-Y"
}

if (Get-Item "Alias:Test-AliasY" -ErrorAction SilentlyContinue) {
   throw "Alias:Test-AliasY already exists"
}

New-Alias -Name Test-AliasY -Value Test-FunctionY
