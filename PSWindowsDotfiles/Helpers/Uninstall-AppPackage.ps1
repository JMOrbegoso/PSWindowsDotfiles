function Uninstall-AppPackage {
  [CmdletBinding()]
  param (
    [Parameter(Mandatory = $TRUE)]
    [String]
    $Name
  )

  try {
    Get-AppxPackage -Name $Name -AllUsers | Remove-AppxPackage;

    Get-AppXProvisionedPackage -Online | Where-Object DisplayName -Like $Name | Remove-AppxProvisionedPackage -Online;    
  }
  catch {
    
  }  
}
