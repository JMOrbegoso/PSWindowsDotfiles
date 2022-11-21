# Download installer (exe) file and store it on the dotfiles temp folder
function Invoke-Download-Installer-File {
  [CmdletBinding()]
  param(
    [Parameter(Mandatory = $TRUE)]
    [string]
    $DownloadUrl,

    [Parameter(Mandatory = $TRUE)]
    [string]
    $InstallerName
  )

  # Create temp folder to download the file
  $dotfilesTempFolder = "$HOME\dotfiles_temp";
  mkdir -f $dotfilesTempFolder;

  $installerFilePath = "$dotfilesTempFolder\$InstallerName";
  
  # Download installer file
  Invoke-WebRequest -Uri $DownloadUrl -OutFile $installerFilePath;
}
