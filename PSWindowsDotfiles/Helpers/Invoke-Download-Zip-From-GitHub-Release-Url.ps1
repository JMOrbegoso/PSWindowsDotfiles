function Invoke-Download-Zip-From-GitHub-Release-Url {
  param(
    [Parameter(Mandatory = $TRUE)]
    [string]
    $GitHubDirectDownloadUrl,

    [Parameter(Mandatory = $TRUE)]
    [string]
    $DestinationDirectory
  )

  # Create temp folder to download the file
  $dotfilesTempFolder = "$HOME\dotfiles_temp";
  mkdir -f $dotfilesTempFolder;

  $foldername = $DestinationDirectory | Split-Path -Leaf;
  $zipFilePath = "$dotfilesTempFolder\$foldername.zip";
  
  # Download zip file
  Invoke-WebRequest -Uri $GitHubDirectDownloadUrl -OutFile $zipFilePath;

  # Unzip file to destination directory
  Get-ChildItem $zipFilePath | Expand-Archive -DestinationPath $DestinationDirectory -Force;
  Get-ChildItem -Path "$DestinationDirectory\**" -Directory | ForEach-Object {
    Move-Item "$($_.FullName)\*" -Destination $_.Parent.FullName;
    Remove-Item $_.FullName -Force;
  }
}
