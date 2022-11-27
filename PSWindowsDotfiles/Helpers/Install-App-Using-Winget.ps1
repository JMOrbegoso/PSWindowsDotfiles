function Install-App-Using-Winget {
  param(
    [Parameter(Mandatory = $TRUE)]
    [string]
    $AppId,

    [Parameter(Mandatory = $TRUE)]
    [string]
    $Source,

    [Parameter(Mandatory = $FALSE)]
    [string]
    $Parameters
  )

  if ($Parameters) {
    winget install --exact --id $AppId --source $Source --override $Parameters --accept-package-agreements --accept-source-agreements --silent;
  }
  else {
    winget install --exact --id $AppId --source $Source --accept-package-agreements --accept-source-agreements --silent;
  }
}
