function Pin-To-Windows-Explorer-QuickAccess {
  [OutputType([System.Void])]
  param(
    [Parameter( Mandatory = $TRUE)]
    [String]
    $Path
  )

  $QuickAccess = New-Object -ComObject "shell.application";
  $QuickAccess.Namespace($Path).Self.InvokeVerb("pintohome");
}
