function Disable-WindowsFeature {
  [OutputType([System.Void])]
  param(
    [Parameter(Mandatory = $TRUE)]
    [String]
    $FeatureKey
  )
  
  Disable-WindowsOptionalFeature -FeatureName $FeatureKey -Online -NoRestart;
}
