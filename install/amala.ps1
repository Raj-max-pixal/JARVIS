param(
    [string]$InstallRoot = (Join-Path $env:USERPROFILE ".dodaios")
)

$ErrorActionPreference = "Stop"
$repoRoot = Split-Path -Parent $PSScriptRoot
$configSource = Join-Path $repoRoot "amala.toml.example"
$configTarget = Join-Path $InstallRoot "dodaios.toml"
$exe = Join-Path $InstallRoot ".venv\Scripts\dodaios.exe"

if (-not (Test-Path -LiteralPath $exe)) {
    throw "Dodaios is not installed at $InstallRoot. Run install\install.ps1 first."
}

if (Test-Path -LiteralPath $configTarget) {
    $stamp = Get-Date -Format "yyyyMMdd-HHmmss"
    Copy-Item -LiteralPath $configTarget -Destination "$configTarget.backup-$stamp" -Force
}

Copy-Item -LiteralPath $configSource -Destination $configTarget -Force

$shortcutTarget = Join-Path $InstallRoot ".venv\Scripts\DodaiosApp.exe"
if (-not (Test-Path -LiteralPath $shortcutTarget)) {
    $shortcutTarget = $exe
}

$icon = Join-Path $InstallRoot "dodaios\assets\icons\dodaios.ico"
$shell = New-Object -ComObject WScript.Shell
$destinations = @(
    (Join-Path ([Environment]::GetFolderPath("Desktop")) "Amala.lnk"),
    (Join-Path ([Environment]::GetFolderPath("Startup")) "Amala.lnk")
)

foreach ($destination in $destinations) {
    $shortcut = $shell.CreateShortcut($destination)
    $shortcut.TargetPath = $shortcutTarget
    $shortcut.WorkingDirectory = $InstallRoot
    $shortcut.Description = "Amala voice assistant"
    if (Test-Path -LiteralPath $icon) {
        $shortcut.IconLocation = "$icon,0"
    }
    $shortcut.Save()
}

Start-Process -FilePath $exe
Write-Host "Amala configuration applied and the assistant launched."
Write-Host "Connect or enable a Windows microphone to use the wake phrase."
