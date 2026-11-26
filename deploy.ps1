# Publishes this folder to GitHub Pages. Run after: gh auth login
$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot
$user = gh api user --jq .login
gh repo create moonshine --public --source . --push
gh api -X POST "repos/$user/moonshine/pages" -f "source[branch]=main" -f "source[path]=/" | Out-Null
Write-Host "Live in ~1 minute at: https://$user.github.io/moonshine/"
