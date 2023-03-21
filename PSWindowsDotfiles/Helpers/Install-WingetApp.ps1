function Install-WingetApp {
  [OutputType([System.Void])]
  param(
    [Parameter(Mandatory = $TRUE)]
    [String]
    $AppId,

    [Parameter(Mandatory = $TRUE)]
    [String]
    $Source,

    [Parameter(Mandatory = $FALSE)]
    [String]
    $Version,

    [Parameter(Mandatory = $FALSE)]
    [String]
    $Parameters
  )

  $Command = "winget install --exact --id $AppId --source $Source";

  if ($Version) {
    $Command += " --version $Version";
  }

  if ($Parameters) {
    $Command += " --override $Parameters";
  }

  $Command += " --accept-package-agreements --accept-source-agreements --silent;";

  Invoke-Expression $Command;
}
