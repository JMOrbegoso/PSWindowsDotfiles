function Update-All-Apps-Using-Winget {
  winget upgrade --accept-package-agreements --accept-source-agreements --silent;
};
