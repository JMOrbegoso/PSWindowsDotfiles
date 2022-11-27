function Test-Dotnet-Tool-Installation {
  param(
    [Parameter(Mandatory = $TRUE)]
    [string]
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
