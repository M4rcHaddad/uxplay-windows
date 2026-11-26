# Install.ps1 - installs iPad Screen Mirror for the current user (no admin needed)
$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName PresentationFramework
$src  = $PSScriptRoot
$dest = Join-Path $env:LOCALAPPDATA 'Programs\iPad Screen Mirror'

try {
    if (-not (Test-Path -LiteralPath (Join-Path $src 'uxplay-windows.exe'))) {
        throw "Please extract the zip first (right-click the zip > Extract All), then run Install.bat from the extracted folder."
    }
    Write-Host 'Installing iPad Screen Mirror...'
    Get-Process -Name 'uxplay-windows', 'uxplay-bluetooth-beacon' -ErrorAction SilentlyContinue | Stop-Process -Force
    Start-Sleep -Milliseconds 500

    $srcFull = (Resolve-Path -LiteralPath $src).Path.TrimEnd('\')
    if ($srcFull -ne $dest.TrimEnd('\')) {
        [void](New-Item -ItemType Directory -Force -Path $dest)
        Write-Host "Copying files to $dest (this can take a minute)..."
        Copy-Item -Path (Join-Path $src '*') -Destination $dest -Recurse -Force
    }
    # files downloaded from the internet are "blocked" by Windows; unblock ours
    Get-ChildItem -LiteralPath $dest -Recurse -File | Unblock-File

    $ps   = Join-Path $env:WINDIR 'System32\WindowsPowerShell\v1.0\powershell.exe'
    $icon = Join-Path $dest 'resources\icon.ico'
    $wsh  = New-Object -ComObject WScript.Shell
    function New-Shortcut([string]$lnk, [string]$script, [string]$desc) {
        $s = $wsh.CreateShortcut($lnk)
        $s.TargetPath = $ps
        $s.Arguments = "-NoProfile -STA -ExecutionPolicy Bypass -WindowStyle Hidden -File `"$(Join-Path $dest $script)`""
        $s.WorkingDirectory = $dest
        $s.IconLocation = "$icon,0"
        $s.Description = $desc
        $s.WindowStyle = 7          # start minimized (hides the console flash)
        $s.Save()
    }
    $desktop = [Environment]::GetFolderPath('Desktop')
    $menu = Join-Path ([Environment]::GetFolderPath('Programs')) 'iPad Screen Mirror'
    [void](New-Item -ItemType Directory -Force -Path $menu)
    New-Shortcut (Join-Path $desktop 'iPad Screen Mirror.lnk')   'Launch.ps1'         'Mirror your iPad, with the pen toolbar'
    New-Shortcut (Join-Path $menu 'iPad Screen Mirror.lnk')      'Launch.ps1'         'Mirror your iPad, with the pen toolbar'
    New-Shortcut (Join-Path $menu 'Pen only.lnk')                'PenOverlay.ps1'     'Pen toolbar without starting the mirror'
    New-Shortcut (Join-Path $menu 'Mirror settings.lnk')         'MirrorSettings.ps1' 'Name, PIN, quality, rotation, audio delay'
    New-Shortcut (Join-Path $menu 'Uninstall iPad Screen Mirror.lnk') 'Uninstall.ps1' 'Remove iPad Screen Mirror'

    $answer = [System.Windows.MessageBox]::Show(
        "Installed!`n`nUse the 'iPad Screen Mirror' icon on your desktop or in the Start menu.`n`nOpen the settings now to set the name and PIN your iPad will use?",
        'iPad Screen Mirror', 'YesNo', 'Information')
    if ($answer -eq 'Yes') {
        Start-Process -FilePath $ps -ArgumentList "-NoProfile -STA -ExecutionPolicy Bypass -WindowStyle Hidden -File `"$(Join-Path $dest 'MirrorSettings.ps1')`""
    }
} catch {
    [void][System.Windows.MessageBox]::Show("Install failed:`n$($_.Exception.Message)", 'iPad Screen Mirror', 'OK', 'Error')
}
