function New-FolderAndSetLocation {
  [OutputType([System.Void])]
  param(
    [Parameter(Mandatory = $TRUE)]
    [String]
    $NewFolderName
  )

  New-Item $NewFolderName -ItemType "Directory";
  Set-Location -Path $NewFolderName;
}
