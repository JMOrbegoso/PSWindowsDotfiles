<#
 .Synopsis
  Initialize a Dotfiles project.

 .Description
  Create a new Dotfiles project on the selected path.

 .Parameter Path
  Path of the Dotfiles project, must not contain a folder named "Dotfiles".

 .Parameter Git
  Initialize a Git repository in the directory.

  .Example
  New-Dotfiles -Path "%USERPROFILE%";

  .Example
  New-Dotfiles -Path "%USERPROFILE%" -Git;
 .
#>
function New-Dotfiles {
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
    $Path,
    [ValidateScript({        
        if (-Not (Get-Command -Name "git" -ErrorAction "SilentlyContinue")) { 
          throw "Git must be installed and in your PATH";
        }
        return $TRUE;
      })]
    [Switch] $Git
  )
  
  Process {
    # Create the Dotfiles directory on the chosen path
    New-Item -Path "$Path" -Name "Dotfiles" -ItemType "Directory";

    # Copy the Dotfiles structure to the new Dotfiles directory
    Copy-Item -Path "$PSScriptRoot\..\DotfilesStructure\*" -Destination "$Path\Dotfiles" -Recurse;

    if ($Git.IsPresent) {
      # Init Git repo on the Dotfiles folder
      git init "$Path\Dotfiles";

      # Add changes
      git -C "$Path\Dotfiles" add .;

      # Make Git commit on the Dotfiles
      git -C "$Path\Dotfiles" commit -m "Initial commit";
    }
  }
}
