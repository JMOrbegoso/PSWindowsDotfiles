function Enable-WindowsFeature {
  [OutputType([System.Void])]
  param(
    [Parameter(Mandatory = $TRUE)]
    [String]
    $FeatureKey,

    [Parameter(Mandatory = $TRUE)]
    [String]
    $FeatureName
  )

  if (-not (Test-WindowsFeature -FeatureKey $FeatureKey)) {
    Write-Host "Enabling" $FeatureName ":" -ForegroundColor "Green";
    Enable-WindowsOptionalFeature -FeatureName $FeatureKey -Online -All -NoRestart;
  }
  else {
    Write-Host $FeatureName "is already enabled." -ForegroundColor "Green";
  }
}
