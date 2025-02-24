# Get the locations for the symlnk and real file
$commandInPath = (Get-Command("ghdl")).Source
Write-Host "ghdl command runs $commandInPath"
$commandSymlinkTarget = (Get-Item($commandInPath)).Target
if ($commandSymlinkTarget) {
    Write-Host "ghdl command is link to $commandSymlinkTarget"
} else {
    Write-Host "ghdl command is not a symlink"
}

# Setup the demo
$args = '-c', '--std=08', 'square_wave.vhd', '-r', 'square_wave'

if ($commandInPath) {
    Write-Host "`n=== Run from path ==="
    & $commandInPath $args
}

if ($commandSymlinkTarget) {
    Write-Host "`n=== Run link target ==="
    & $commandSymlinkTarget $args
}