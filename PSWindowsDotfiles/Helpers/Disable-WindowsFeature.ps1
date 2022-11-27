function Disable-WindowsFeature {
  param (
    [Parameter(Mandatory = $TRUE)]
    [String]
    $FeatureKey,

    [Parameter(Mandatory = $TRUE)]
    [String]
    $FeatureName
  )
  
  if (Get-WindowsFeature-Installation-Status -FeatureKey $FeatureKey) {
    Write-Host "Disabling" $FeatureName ":" -ForegroundColor "Green";
    Disable-WindowsOptionalFeature -FeatureName $FeatureKey -Online -NoRestart;
  }
  else {
    Write-Host $FeatureName "is already disabled." -ForegroundColor "Green";
  }
}
