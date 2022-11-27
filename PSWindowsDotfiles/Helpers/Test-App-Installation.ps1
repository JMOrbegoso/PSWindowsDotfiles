function Test-App-Installation {
  [OutputType([Boolean])]
  param(
    [Parameter(Mandatory = $TRUE)]
    [String]
    $AppId
  )

  $InstallStatus = winget list --id $AppId --accept-source-agreements;
  
  if (-not ($InstallStatus[2] -contains "No installed package found matching input criteria.")) {
    return $TRUE;
  }
  return $FALSE;
}
