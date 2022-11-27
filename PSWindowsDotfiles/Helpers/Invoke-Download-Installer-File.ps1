# Download installer (exe) file and store it on the dotfiles temp folder
function Invoke-Download-Installer-File {
  [OutputType([System.Void])]
  param(
    [Parameter(Mandatory = $TRUE)]
    [String]
    $DownloadUrl,

    [Parameter(Mandatory = $TRUE)]
    [String]
    $InstallerName
  )

  # Create temp folder to download the file
  $dotfilesTempFolder = "$HOME\dotfiles_temp";
  mkdir -f $dotfilesTempFolder;

  $installerFilePath = "$dotfilesTempFolder\$InstallerName";
  
  # Download installer file
  Invoke-WebRequest -Uri $DownloadUrl -OutFile $installerFilePath;
}
