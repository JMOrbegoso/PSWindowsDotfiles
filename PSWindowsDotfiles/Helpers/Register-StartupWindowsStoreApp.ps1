<#
 .Synopsis
  Register a Windows Store app to launch on Windows startup.

 .Parameter Name
  Shortcut name.

 .Parameter Aumid
  Application User Model ID.

 .Example
  Register-StartupWindowsStoreApp -Name "Sticky Notes" -Aumid "Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe!App"

 .Example
  Register-StartupWindowsStoreApp -Name "Battery Percentage Icon" -Aumid "61867SoleonInnovation.BatteryPercentageIcon_d1gx98zh1khh8!App"
#>
function Register-StartupWindowsStoreApp {
  [OutputType([System.Void])]
  param(
    [Parameter(Mandatory)]
    [String]
    $Name,
    [Parameter(Mandatory)]
    [String]
    $Aumid
  )

  Process {
    $STARTUP_PATH = [environment]::getfolderpath("Startup");
    $WScriptShell = New-Object -ComObject WScript.Shell;
    $Shortcut = $WScriptShell.CreateShortcut("$STARTUP_PATH\$Name.lnk");
    $Shortcut.TargetPath = "$env:SystemRoot\explorer.exe";
    $Shortcut.Arguments = "shell:Appsfolder\$($Aumid)";
    $Shortcut.Save();
  }
}
