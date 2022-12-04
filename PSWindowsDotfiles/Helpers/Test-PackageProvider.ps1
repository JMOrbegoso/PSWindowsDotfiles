function Test-PackageProvider {
  [OutputType([Boolean])]
  param(
    [Parameter(Mandatory = $TRUE)]
    [String]
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
