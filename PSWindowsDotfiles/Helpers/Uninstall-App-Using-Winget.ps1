function Uninstall-App-Using-Winget {
  param(
    [Parameter(Mandatory = $TRUE)]
    [string]
    $AppId
  )

  winget uninstall --id $AppId --exact --silent;
}
