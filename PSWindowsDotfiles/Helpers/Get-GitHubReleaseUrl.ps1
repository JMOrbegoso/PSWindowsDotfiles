function Get-GitHubReleaseUrl {
  [OutputType([String])]
  param(
    [Parameter(Mandatory = $TRUE)]
    [String]
    $GitHubRepository,

    [Parameter(Mandatory = $TRUE)]
    [String]
    $FilenamePattern
  )

  $releasesUri = "https://api.github.com/repos/$GitHubRepository/releases/latest";
  $response = Invoke-RestMethod -Method "GET" -Uri $releasesUri;
  $assets = $response.assets;
  $lastRelease = $assets | Where-Object "name" -Match "$FilenamePattern";
  return $lastRelease.browser_download_url;
}
