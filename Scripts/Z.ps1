
if (Get-Item "Function:Test-FunctionZ" -ErrorAction SilentlyContinue) {
  throw "Function:Test-FunctionZ already exists"
}

Function Test-FunctionZ() {
   echo "Running Test-Z"
}

if (Get-Item "Alias:Test-AliasZ" -ErrorAction SilentlyContinue) {
   throw "Alias:Test-AliasZ already exists"
}

New-Alias -Name Test-AliasZ -Value Test-FunctionZ
