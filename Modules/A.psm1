

if (Get-Item "Function:Test-FunctionA" -ErrorAction SilentlyContinue) {
   throw "Function:Test-FunctionA already exists"
}

Function Test-FunctionA() {
   echo "Running Test-A"
}

if (Get-Item "Alias:Test-AliasA" -ErrorAction SilentlyContinue) {
   throw "Alias:Test-AliasA already exists"
}

New-Alias -Name Test-AliasA -Value Test-FunctionA
