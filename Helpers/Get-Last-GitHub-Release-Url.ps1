function Get-Last-GitHub-Release-Url {
  [CmdletBinding()]
  param(
    [Parameter(Mandatory = $TRUE)]
    [string]
    $GitHubRepository,

    [Parameter(Mandatory = $TRUE)]
    [string]
    $FilenamePattern
  )

  $releasesUri = "https://api.github.com/repos/$GitHubRepository/releases/latest";
  $response = Invoke-RestMethod -Method "GET" -Uri $releasesUri;
  $assets = $response.assets;
  $lastRelease = $assets | Where-Object "name" -Match "$FilenamePattern";
  return $lastRelease.browser_download_url;
}
