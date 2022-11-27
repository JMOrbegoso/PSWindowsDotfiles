function Invoke-Download-Zip-From-GitHub-Release-Url {
  [OutputType([System.Void])]
  param(
    [Parameter(Mandatory = $TRUE)]
    [String]
    $GitHubDirectDownloadUrl,

    [Parameter(Mandatory = $TRUE)]
    [String]
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
