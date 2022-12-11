function Update-DotnetTool {
  [OutputType([System.Void])]
  param(
    [Parameter(Mandatory = $TRUE)]
    [String]
    $DotnetToolName
  )
  
  dotnet tool update --global $DotnetToolName;
}
