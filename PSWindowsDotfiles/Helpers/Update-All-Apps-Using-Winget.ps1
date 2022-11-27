function Update-All-Apps-Using-Winget {
  [OutputType([System.Void])]
  param()

  winget upgrade --accept-package-agreements --accept-source-agreements --silent;
};
