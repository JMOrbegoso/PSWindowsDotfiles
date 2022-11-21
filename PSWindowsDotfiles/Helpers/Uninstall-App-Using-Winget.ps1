function Uninstall-App-Using-Winget {
  [CmdletBinding()]
  param(
    [Parameter(Mandatory = $TRUE)]
    [string]
    $AppId
  )

  winget uninstall --id $AppId --exact --silent;
}
