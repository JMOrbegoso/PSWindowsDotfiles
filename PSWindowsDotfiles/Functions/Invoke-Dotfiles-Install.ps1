<#
 .Synopsis
  Install a Dotfiles project.

 .Description
  Install a Dotfiles project on the current system.

 .Parameter Path
  Path of the Dotfiles project.

  .Example
  Invoke-Dotfiles-Install -Path "%USERPROFILE%\Dotfiles";
#>
function Invoke-Dotfiles-Install {
  param(
    [Parameter(Mandatory)]
    [ValidateScript({
        if (-Not ($_ | Test-Path)) {
          throw "Folder does not exist";
        }
        if (-Not ($_ | Test-Path -PathType "Container")) {
          throw "The Path must be a folder";
        }
        return $TRUE;
      })]
    [System.IO.FileInfo]
    $Path
  )
  
  Process {
    # Set the DOTFILES_PATH environment variable
    $env:DOTFILES_PATH = "$Path";

    # Create a DOTFILES SymbolicLink in USERPROFILE
    New-Item -ItemType "SymbolicLink" -Path "$env:USERPROFILE\.dotfiles" -Target "$env:DOTFILES_PATH" -Force;

    Write-Host "Welcome to the Dotfiles installer" -ForegroundColor "Blue";

    Invoke-Expression "$env:DOTFILES_PATH\Dotfiles.ps1";

    Write-Host "Installation and configuration complete, please restart your device" -ForegroundColor "Blue";
  }
}
