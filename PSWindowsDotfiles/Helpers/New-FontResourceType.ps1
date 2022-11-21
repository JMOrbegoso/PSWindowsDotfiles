# File found in: $env:ChocolateyInstall/extensions/chocolatey-font-helpers/New-FontResourceType.ps1

<#
.SYNOPSIS
   Defines a font resource type.

.DESCRIPTION
   This private function defines a font resource type from C# code 
   with methods to add a font resource and to remove a font resource.

.EXAMPLE
   PS C:\> New-FontResourceType
   PS C:\> [FontResource.AddRemoveFonts]::AddFont($localfontPath)

.INPUTS
   none

.OUTPUTS
   none
.NOTES
   The C# code borrows heavily from the code downloadable here:
   https://blogs.technet.microsoft.com/deploymentguys/2010/12/04/adding-and-removing-fonts-with-windows-powershell/
   It does not appear to work with UNC paths.
#>
Function New-FontResourceType {
   $fontCSharpCode = @'
   using System;
   using System.Collections.Generic;
   using System.Text;
   using System.IO;
   using System.Runtime.InteropServices;

   namespace FontResource {
       public class AddRemoveFonts {
           private static IntPtr HWND_BROADCAST = new IntPtr(0xffff);

           [DllImport("gdi32.dll")]
           static extern int AddFontResource(string lpFilename);

           [DllImport("gdi32.dll")]
           static extern int RemoveFontResource(string lpFileName);

           [return: MarshalAs(UnmanagedType.Bool)]
           [DllImport("user32.dll", SetLastError = true)]
           private static extern bool PostMessage(IntPtr hWnd, WM Msg, IntPtr wParam, IntPtr lParam);

           public enum WM : uint {
               FONTCHANGE = 0x001D
           }

           public static int AddFont(string fontFilePath) {
               FileInfo fontFile = new FileInfo(fontFilePath);
               if (!fontFile.Exists) { throw new FileNotFoundException("Font file not found"); }
               try {
                   int retVal = AddFontResource(fontFilePath);
                   bool posted = PostMessage(HWND_BROADCAST, WM.FONTCHANGE, IntPtr.Zero, IntPtr.Zero);
                   return retVal;
               }
               catch { throw new System.ComponentModel.Win32Exception(Marshal.GetLastWin32Error()); }
           }

           public static int RemoveFont(string fontFileName) {
               try {
                   int retVal = RemoveFontResource(fontFileName);
                   bool posted = PostMessage(HWND_BROADCAST, WM.FONTCHANGE, IntPtr.Zero, IntPtr.Zero);
                   return retVal;
               }
               catch { throw new System.ComponentModel.Win32Exception(Marshal.GetLastWin32Error()); }
           }
       }
   }
'@
   Add-Type $fontCSharpCode
}
