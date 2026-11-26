# Pushes your latest edits live. Usage:
#   .\update.ps1                       -> publish changes made in this folder
#   .\update.ps1 C:\path\to\new.html   -> replace the page with that file, then publish
param([string]$NewPage)
$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot
if ($NewPage) { Copy-Item $NewPage index.html -Force }
git add -A
git commit -m "Update site"
git push
Write-Host "Pushed. Live in ~1 minute at https://theandrejo.github.io/moonshine/"
