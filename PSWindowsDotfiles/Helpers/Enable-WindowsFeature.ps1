function Enable-WindowsFeature {
  [OutputType([System.Void])]
  param(
    [Parameter(Mandatory = $TRUE)]
    [String]
    $FeatureKey
  )

  Enable-WindowsOptionalFeature -FeatureName $FeatureKey -Online -All -NoRestart;
}
