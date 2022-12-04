function Unregister-AllExplorerQuickAccess {
  [OutputType([System.Void])]
  param()

  $QuickAccess = New-Object -ComObject "shell.application";
  $QuickAccess.Namespace("shell:::{679f85cb-0220-4080-b29b-5540cc05aab6}").Items() | ForEach-Object -Process { 
    $_.InvokeVerb("unpinfromhome");
  };
}
