# Load Helpers
Get-ChildItem "$PSScriptRoot\Helpers" -Filter *.ps1 | Foreach-Object { . $_.FullName; }

# Load Functions
Get-ChildItem "$PSScriptRoot\Functions" -Filter *.ps1 | Foreach-Object { . $_.FullName; }

# Export functions
Export-ModuleMember "Invoke-Dotfiles-Create";
Export-ModuleMember "Install-Dotfiles";
