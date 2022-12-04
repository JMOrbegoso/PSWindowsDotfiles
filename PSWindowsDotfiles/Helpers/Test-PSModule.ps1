# Return TRUE if the Module is installed and it version is higher than the ModuleMinimumVersion
function Test-PSModule {
  [OutputType([Boolean])]
  param(
    [Parameter(Mandatory = $TRUE)]
    [String]
    $ModuleName,

    [Parameter(Mandatory = $FALSE)]
    [String]
    $ModuleMinimumVersion
  )

  try {
    if (-not ([String]::IsNullOrEmpty($ModuleMinimumVersion))) {
      if ((Get-Module -ListAvailable -Name $ModuleName).Version -ge $ModuleMinimumVersion) {
        return $TRUE;
      }
      return $FALSE;
    }

    if (Get-Module -ListAvailable -Name $ModuleName) {
      return $TRUE;
    }
    else {
      return $FALSE;
    }
  }
  catch [Exception] {
    return $FALSE;
  }
}
