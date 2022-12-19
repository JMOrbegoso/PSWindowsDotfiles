<#
 .Synopsis
  Install a Dotfiles project.

 .Description
  Install a Dotfiles project on the current system.

 .Parameter Path
  Path of the Dotfiles project.

  .Example
  Install-Dotfiles -Path "%USERPROFILE%\Dotfiles";
#>
function Install-Dotfiles {
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
    # Check if the host is Windows Terminal
    if (Test-WindowsTerminal) {
      throw "Do not run the command in Windows Terminal";
    }

    # Check if is admin
    if (-Not (Test-Admin)) {
      throw "Run the command as Admin";
    }

    # Set the DOTFILES_PATH environment variable
    $env:DOTFILES_PATH = $Path.ToString().TrimEnd("\");

    # Create a DOTFILES SymbolicLink in USERPROFILE
    New-Item -ItemType "SymbolicLink" -Path "$env:USERPROFILE\.dotfiles" -Target "$env:DOTFILES_PATH" -Force;

    Write-Host "Welcome to the Dotfiles installer" -ForegroundColor "Blue";

    Invoke-Expression "$env:DOTFILES_PATH\Dotfiles.ps1";

    Write-Host "Installation and configuration complete, please restart your device" -ForegroundColor "Blue";
  }
}
