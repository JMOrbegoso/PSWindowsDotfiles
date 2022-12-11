function Install-DotnetTool {
  [OutputType([System.Void])]
  param(
    [Parameter(Mandatory = $TRUE)]
    [String]
    $DotnetToolName
  )
  
  dotnet tool install --global $DotnetToolName;  
}
