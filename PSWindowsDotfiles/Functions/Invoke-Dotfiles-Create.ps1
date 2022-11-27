<#
 .Synopsis
  Initialize a Dotfiles project.

 .Description
  Create a new Dotfiles project on the selected path.

 .Parameter Path
  Path of the Dotfiles project, must not contain a folder named "Dotfiles".

  .Example
  Invoke-Dotfiles-Create -Path "%USERPROFILE%";
 .
#>
function Invoke-Dotfiles-Create {
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
    # Create the Dotfiles directory on the chosen path
    New-Item -Path "$Path" -Name "Dotfiles" -ItemType "Directory";

    # Copy the Dotfiles structure to the new Dotfiles directory
    Copy-Item -Path "$PSScriptRoot\..\DotfilesStructure\*" -Destination "$Path\Dotfiles" -Recurse;
  }
}
