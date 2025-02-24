# Get the locations for the symlnk and real file
$command = (Get-Command("ghdl")).Source
Write-Host "ghdl command runs $command"
$commandTarget = (Get-Item($command)).Target
Write-Host "ghdl command is link to $commandTarget"

# Setup the demo
$args = '-c', '--std=08', 'square_wave.vhd', '-r', 'square_wave'

Write-Host "`n=== Run symlink ==="
& $command $args

Write-Host "`n=== Run link target ==="
& $commandTarget $args