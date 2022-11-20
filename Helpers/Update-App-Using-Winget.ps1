function Update-App-Using-Winget {
  [CmdletBinding()]
  param(
    [Parameter(Mandatory = $TRUE)]
    [string]
    $AppId,

    [Parameter(Mandatory = $TRUE)]
    [string]
    $Source
  )

  winget upgrade --exact --id $AppId --source $Source --accept-package-agreements --accept-source-agreements --silent;
}
