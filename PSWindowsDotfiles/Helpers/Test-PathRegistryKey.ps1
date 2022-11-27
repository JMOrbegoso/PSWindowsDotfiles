function Test-PathRegistryKey {
  [OutputType([Boolean])]
  param(
    [Parameter(Mandatory = $TRUE)]
    [String]
    $Path,

    [Parameter(Mandatory = $TRUE)]
    [String]
    $Name
  )

  try {
    $Reg = Get-ItemPropertyValue -Path $Path -Name $Name;
    Return $TRUE;
  }
  catch {
    Return $FALSE;
  }
}
