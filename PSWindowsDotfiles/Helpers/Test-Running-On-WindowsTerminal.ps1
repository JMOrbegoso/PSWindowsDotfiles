function Test-Running-On-WindowsTerminal {
  [OutputType([Boolean])]
  param()

  return Test-Path Env:WT_SESSION;
}
