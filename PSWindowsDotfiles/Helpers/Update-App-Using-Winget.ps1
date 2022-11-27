function Update-App-Using-Winget {
  [OutputType([System.Void])]
  param(
    [Parameter(Mandatory = $TRUE)]
    [String]
    $AppId,

    [Parameter(Mandatory = $TRUE)]
    [String]
    $Source
  )

  winget upgrade --exact --id $AppId --source $Source --accept-package-agreements --accept-source-agreements --silent;
}
