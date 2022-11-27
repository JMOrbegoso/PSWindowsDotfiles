function Test-WindowsFeature-Installation {
  [OutputType([Boolean])]
  param(
    [Parameter(Mandatory = $TRUE)]
    [String]
    $FeatureKey
  )

  if ((Get-WindowsOptionalFeature -FeatureName $FeatureKey -Online).State -eq "Enabled") {
    return $TRUE;
  }
  else {
    return $FALSE;
  }
}
