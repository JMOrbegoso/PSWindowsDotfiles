function Uninstall-WingetApp {
  [OutputType([System.Void])]
  param(
    [Parameter(Mandatory = $TRUE)]
    [String]
    $AppId
  )

  winget uninstall --id $AppId --exact --silent;
}
