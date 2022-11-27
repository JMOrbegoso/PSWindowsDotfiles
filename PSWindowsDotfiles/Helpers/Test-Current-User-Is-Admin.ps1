function Test-Current-User-Is-Admin {
  [OutputType([Boolean])]
  Param()

  $CurrentUser = [Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent();

  if ($CurrentUser.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    return $TRUE;
  }

  return $FALSE;
}
