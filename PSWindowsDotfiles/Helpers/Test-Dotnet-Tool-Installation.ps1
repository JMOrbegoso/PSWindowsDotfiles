function Test-Dotnet-Tool-Installation {
  [OutputType([Boolean])]
  param(
    [Parameter(Mandatory = $TRUE)]
    [String]
    $DotnetToolName
  )

  $InstallStatus = dotnet tool list --global;

  for ($i = 2; $i -lt $InstallStatus.Length; $i++) {
    if ($InstallStatus[$i].Contains($DotnetToolName)) {
      return $TRUE;
    }
  }

  return $FALSE;
}
