function Test-PSRepository-Trusted {
  [OutputType([Boolean])]
  param(
    [Parameter(Mandatory = $TRUE)]
    [String]
    $PSRepositoryName
  )

  try {
    if (-not (Get-PSRepository -Name $PSRepositoryName -ErrorAction SilentlyContinue)) {
      return $FALSE;
    }

    if ((Get-PSRepository -Name $PSRepositoryName).InstallationPolicy -eq "Trusted") {
      return $TRUE;
    }
    return $FALSE;
  }
  catch [Exception] {
    return $FALSE;
  }
}
