function Update-WingetApps {
  [OutputType([System.Void])]
  param()

  winget upgrade --accept-package-agreements --accept-source-agreements --silent;
};
