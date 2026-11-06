param(
    [Parameter(Mandatory = $true)]
    [ValidateSet("Codex", "OpenAI", "Gemini", "Ollama")]
    [string]$Provider,
    [string]$InstallRoot = (Join-Path $env:USERPROFILE ".dodaios")
)

$ErrorActionPreference = "Stop"
$repoRoot = Split-Path -Parent $PSScriptRoot
$profiles = @{
    Codex = Join-Path $repoRoot "amala.toml.example"
    OpenAI = Join-Path $repoRoot "profiles\amala-openai.toml.example"
    Gemini = Join-Path $repoRoot "profiles\amala-gemini.toml.example"
    Ollama = Join-Path $repoRoot "profiles\amala-ollama.toml.example"
}

$configSource = $profiles[$Provider]
$configTarget = Join-Path $InstallRoot "dodaios.toml"

if (-not (Test-Path -LiteralPath $configSource)) {
    throw "Profile not found: $configSource"
}
if (-not (Test-Path -LiteralPath $InstallRoot)) {
    throw "Dodaios is not installed at $InstallRoot."
}
if (Test-Path -LiteralPath $configTarget) {
    $stamp = Get-Date -Format "yyyyMMdd-HHmmss"
    Copy-Item -LiteralPath $configTarget -Destination "$configTarget.backup-$stamp" -Force
}

Copy-Item -LiteralPath $configSource -Destination $configTarget -Force
Write-Host "Amala provider profile changed to $Provider."

if ($Provider -eq "OpenAI") {
    Write-Host "Open Dodaios Settings > Providers and connect an OpenAI API key."
} elseif ($Provider -eq "Gemini") {
    Write-Host "Open Dodaios Settings > Providers and connect a Gemini API key."
} elseif ($Provider -eq "Ollama") {
    Write-Host "Make sure the Ollama server is installed, healthy, and has qwen3:1.7b."
} else {
    Write-Host "Make sure Codex CLI is logged in to the intended ChatGPT account."
}

Write-Host "Restart Dodaios from its desktop Restart action to load the new profile."
