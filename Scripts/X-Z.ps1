
. $PSScriptRoot\..\Scripts\Z.ps1

if (Get-Item "Function:Test-FunctionX" -ErrorAction SilentlyContinue) {
   throw "Function:Test-FunctionX already exists"
}

Function Test-FunctionX() {
   echo "Running Test-X"
}

if (Get-Item "Alias:Test-AliasX" -ErrorAction SilentlyContinue) {
   throw "Alias:Test-AliasX already exists"
}

New-Alias -Name Test-AliasX -Value Test-FunctionX
