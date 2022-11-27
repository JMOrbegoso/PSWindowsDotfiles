function Test-WindowsFeature-Installation {
  param(
    [Parameter(Mandatory = $TRUE)]
    [string]
    $FeatureKey
  )

  if ((Get-WindowsOptionalFeature -FeatureName $FeatureKey -Online).State -eq "Enabled") {
    return $TRUE;
  }
  else {
    return $FALSE;
  }
}
