function Disable-WindowsFeature {
  [OutputType([System.Void])]
  param(
    [Parameter(Mandatory = $TRUE)]
    [String]
    $FeatureKey,

    [Parameter(Mandatory = $TRUE)]
    [String]
    $FeatureName
  )
  
  if (Test-WindowsFeature-Installation -FeatureKey $FeatureKey) {
    Write-Host "Disabling" $FeatureName ":" -ForegroundColor "Green";
    Disable-WindowsOptionalFeature -FeatureName $FeatureKey -Online -NoRestart;
  }
  else {
    Write-Host $FeatureName "is already disabled." -ForegroundColor "Green";
  }
}
