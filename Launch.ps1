# Launch.ps1 - start the iPad screen mirror together with the pen toolbar
$here = $PSScriptRoot
if (-not (Get-Process -Name 'uxplay-windows' -ErrorAction SilentlyContinue)) {
    Start-Process -FilePath (Join-Path $here 'uxplay-windows.exe') -WorkingDirectory $here
}
& (Join-Path $here 'PenOverlay.ps1') -FollowApp
