function Get-PackageProvider-Installation-Status {
  param(
    [Parameter(Mandatory = $TRUE)]
    [string]
    $PackageProviderName
  )

  try {
    Get-PackageProvider -Name $PackageProviderName;
    return $TRUE;
  }
  catch [Exception] {
    return $FALSE;
  }
}
