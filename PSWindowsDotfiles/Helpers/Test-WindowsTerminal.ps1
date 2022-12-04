function Test-WindowsTerminal {
  [OutputType([Boolean])]
  param()

  return Test-Path Env:WT_SESSION;
}
