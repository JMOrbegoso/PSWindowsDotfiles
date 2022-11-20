function Pin-To-Windows-Explorer-QuickAccess {
  [CmdletBinding()]
  param (
    [Parameter( Mandatory = $TRUE)]
    [String]
    $Path
  )

  $QuickAccess = New-Object -ComObject "shell.application";
  $QuickAccess.Namespace($Path).Self.InvokeVerb("pintohome");
}
