function Unregister-ExplorerQuickAccess {
  [OutputType([System.Void])]
  param(
    [Parameter( Mandatory = $TRUE)]
    [String]
    $Path
  )

  $QuickAccess = New-Object -ComObject "shell.application";
  $ElementToUnpin = $QuickAccess.Namespace("shell:::{679f85cb-0220-4080-b29b-5540cc05aab6}").Items() | Where-Object { $_.Path -eq $Path };
  if ($ElementToUnpin) {
    $ElementToUnpin.InvokeVerb("unpinfromhome");
  }
}
