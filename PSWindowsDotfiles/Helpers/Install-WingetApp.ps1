function Install-WingetApp {
  [OutputType([System.Void])]
  param(
    [Parameter(Mandatory = $TRUE)]
    [String]
    $AppId,

    [Parameter(Mandatory = $TRUE)]
    [String]
    $Source,

    [Parameter(Mandatory = $FALSE)]
    [String]
    $Parameters
  )

  if ($Parameters) {
    winget install --exact --id $AppId --source $Source --override $Parameters --accept-package-agreements --accept-source-agreements --silent;
  }
  else {
    winget install --exact --id $AppId --source $Source --accept-package-agreements --accept-source-agreements --silent;
  }
}
