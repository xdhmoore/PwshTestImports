
# This file doesnt contain the checks for alias existence -- lets the natural behavior for duplicate functions occur
# which is to fail
New-Alias -Name Test-AliasW -Value Get-ChildItem -ErrorAction Stop
