# Return TRUE if the Module is installed and it version is higher than the ModuleMinimumVersion
function Test-Module-Installation {
  param(
    [Parameter(Mandatory = $TRUE)]
    [string]
    $ModuleName,

    [Parameter(Mandatory = $FALSE)]
    [string]
    $ModuleMinimumVersion
  )

  try {
    if (-not ([string]::IsNullOrEmpty($ModuleMinimumVersion))) {
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
