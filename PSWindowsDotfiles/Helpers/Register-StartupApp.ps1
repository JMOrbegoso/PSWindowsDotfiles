function Register-StartupApp {
  [OutputType([System.Void])]
  param(
    [Parameter(Mandatory)]
    [String]
    $Path
  )

  Process {
    $STARTUP_PATH = [environment]::getfolderpath("Startup");
    $WScriptShell = New-Object -ComObject WScript.Shell;
    $ShortcutName = Split-Path $Path -Leaf;
    $Shortcut = $WScriptShell.CreateShortcut("$STARTUP_PATH\$ShortcutName.lnk");
    $Shortcut.TargetPath = $Path;
    $Shortcut.Save();
  }
}
