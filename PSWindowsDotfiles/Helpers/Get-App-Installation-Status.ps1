function Get-App-Installation-Status {
  param(
    [Parameter(Mandatory = $TRUE)]
    [string]
    $AppId
  )

  $InstallStatus = winget list --id $AppId --accept-source-agreements;
  
  if (-not ($InstallStatus[2] -contains "No installed package found matching input criteria.")) {
    return $TRUE;
  }
  return $FALSE;
}
