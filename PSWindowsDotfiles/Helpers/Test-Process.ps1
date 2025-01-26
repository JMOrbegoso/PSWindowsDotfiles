# Return TRUE if the process is running
function Test-Process {
    [OutputType([Boolean])]
    param(
        [Parameter(Mandatory = $TRUE)]
        [String]
        $Name
    )

    $nameFilteredProcesses = Get-Process | Where-Object { $_.Name -match $Name } 

    if ($nameFilteredProcesses.Count -gt 0) {
        return $TRUE
    }

    return $FALSE
}
