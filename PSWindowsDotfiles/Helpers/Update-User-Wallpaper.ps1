function Update-User-Wallpaper {
  [OutputType([System.Void])]
  param(
    [Parameter(Mandatory = $TRUE)]
    [String]
    $Path,

    [Parameter(Mandatory = $FALSE)]
    [ValidateSet('Fill', 'Fit', 'Stretch', 'Tile', 'Center', 'Span')]
    [String]
    $Style = "Fill"
  )
  
  $WallpaperStyle = Switch ($Style) {
    "Tile" { "0" }
    "Center" { "0" }
    "Stretch" { "2" }
    "Fit" { "6" }
    "Fill" { "10" }
    "Span" { "22" }
  }

  if (-not (Test-Path -Path "HKCU:\Control Panel\Desktop\")) {
    New-Item -Path "HKCU:\Control Panel\" -Name "Desktop";
  }
  if (-not (Test-PathRegistryKey -Path "HKCU:\Control Panel\Desktop\" -Name "WallPaper")) {
    New-ItemProperty -Path "HKCU:\Control Panel\Desktop\" -Name "WallPaper" -PropertyType "String";
  }
  if (-not (Test-PathRegistryKey -Path "HKCU:\Control Panel\Desktop\" -Name "WallpaperStyle")) {
    New-ItemProperty -Path "HKCU:\Control Panel\Desktop\" -Name "WallpaperStyle" -PropertyType "String";
  }

  Set-ItemProperty -Path "HKCU:\Control Panel\Desktop\" -Name "WallPaper" -Value $Path;
  Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "WallpaperStyle" -Value $WallpaperStyle;

  # Refresh wallpaper
  RUNDLL32.EXE user32.dll, UpdatePerUserSystemParameters 1 true;
}
