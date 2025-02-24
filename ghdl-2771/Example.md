# GHDL symlink problem

With initial GHDL winget minifest, GHDL does not find the included `openieee` libraries from the installation at runtime. This causes an error and the simulation does not complete. By default `winget` is creating a symlink to the `ghdl.exe` executable in the `Links` folder on the path. Running the same executable from the package installation path directly is successful.

## Without `ArchiveBinariesDependOnPath` field

```
PS > .\simulate.ps1
ghdl command runs C:\Users\mark_\AppData\Local\Microsoft\WinGet\Links\ghdl.exe
ghdl command is link to C:\Users\mark_\AppData\Local\Microsoft\WinGet\Packages\ghdl.ghdl.ucrt64_Microsoft.Winget.Source_8wekyb3d8bbwe\GHDL\bin\ghdl.exe

=== Run from path ===
C:\Users\mark_\AppData\Local\Microsoft\WinGet\Links\ghdl.exe:warning: ieee library directory '/GHDL\lib/ghdl\ieee\v08\' not found
C:\Users\mark_\AppData\Local\Microsoft\WinGet\Links\ghdl.exe:error: cannot find "std" library

=== Run link target ===
square_wave.vhd:30:9:@1ms:(report note): Ran successfully
simulation stopped @1ms
```

## With `ArchiveBinariesDependOnPath` field set to true ##

```
PS> .\simulate.ps1
ghdl command runs C:\Users\mark_\AppData\Local\Microsoft\WinGet\Packages\ghdl.ghdl.ucrt64__DefaultSource\GHDL/bin\ghdl.exe
ghdl command is not a symlink

=== Run from path ===
square_wave.vhd:30:9:@1ms:(report note): Ran successfully
simulation stopped @1ms
```