[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$skill = Join-Path $root 'skills/wechat-starter'
$errors = [System.Collections.Generic.List[string]]::new()

function Add-ValidationError {
    param([string]$Message)
    $errors.Add($Message)
}

$requiredFiles = @(
    'README.md',
    'AGENTS.md',
    'CONTRIBUTING.md',
    'SECURITY.md',
    'LICENSE',
    'skills/wechat-starter/SKILL.md',
    'skills/wechat-starter/LICENSE.txt',
    'skills/wechat-starter/agents/openai.yaml'
)

foreach ($relativePath in $requiredFiles) {
    if (-not (Test-Path -LiteralPath (Join-Path $root $relativePath) -PathType Leaf)) {
        Add-ValidationError "Missing required file: $relativePath"
    }
}

$allowedRootEntries = @(
    '.git',
    '.github',
    '.gitattributes',
    '.gitignore',
    'AGENTS.md',
    'CONTRIBUTING.md',
    'LICENSE',
    'README.md',
    'SECURITY.md',
    'scripts',
    'skills'
)

foreach ($entry in Get-ChildItem -LiteralPath $root -Force) {
    if ($entry.Name -notin $allowedRootEntries) {
        Add-ValidationError "Unexpected top-level entry in pure Skill repository: $($entry.Name)"
    }
}

$skillFile = Join-Path $skill 'SKILL.md'
if (Test-Path -LiteralPath $skillFile) {
    $skillText = Get-Content -Raw -Encoding UTF8 -LiteralPath $skillFile
    if ($skillText -notmatch '(?s)^---\s*\r?\nname:\s*wechat-starter\s*\r?\ndescription:\s*.+?\r?\n---') {
        Add-ValidationError 'SKILL.md frontmatter must contain only the expected name and a non-empty description.'
    }
    if ((Get-Content -Encoding UTF8 -LiteralPath $skillFile).Count -gt 500) {
        Add-ValidationError 'SKILL.md exceeds the 500-line progressive-disclosure limit.'
    }
}

if (Test-Path -LiteralPath (Join-Path $skill 'README.md')) {
    Add-ValidationError 'Do not place a README.md inside the installable Skill root.'
}

$referenceFiles = Get-ChildItem -LiteralPath (Join-Path $skill 'references') -File
foreach ($referenceFile in $referenceFiles) {
    $expectedLink = "references/$($referenceFile.Name)"
    if ($skillText -notmatch [regex]::Escape($expectedLink)) {
        Add-ValidationError "Reference is not linked directly from SKILL.md: $($referenceFile.Name)"
    }
}

$openaiYaml = Join-Path $skill 'agents/openai.yaml'
if (Test-Path -LiteralPath $openaiYaml) {
    $openaiText = Get-Content -Raw -Encoding UTF8 -LiteralPath $openaiYaml
    foreach ($requiredText in @('display_name: "WeChat Starter"', 'short_description:', 'default_prompt:', '$wechat-starter')) {
        if (-not $openaiText.Contains($requiredText)) {
            Add-ValidationError "agents/openai.yaml is missing required metadata: $requiredText"
        }
    }
}

$textExtensions = @('.md', '.txt', '.yaml', '.yml', '.json', '.js', '.mjs', '.cjs', '.ts', '.ps1', '.sh')
$githubOwnerPlaceholder = '<your-' + 'github-name>'
$textFiles = Get-ChildItem -LiteralPath $root -Recurse -File -Force |
    Where-Object {
        $_.FullName -notlike "*$([IO.Path]::DirectorySeparatorChar).git$([IO.Path]::DirectorySeparatorChar)*" -and
        $textExtensions -contains $_.Extension.ToLowerInvariant()
    }

foreach ($file in $textFiles) {
    $content = Get-Content -Raw -Encoding UTF8 -LiteralPath $file.FullName
    if ($content -match '\[TODO(?::|\])') {
        Add-ValidationError "Unresolved TODO in $($file.FullName.Substring($root.Length + 1))"
    }
    if ($content.Contains($githubOwnerPlaceholder)) {
        Add-ValidationError "Unresolved GitHub owner placeholder in $($file.FullName.Substring($root.Length + 1))"
    }
}

$allowedExtensions = @('.md', '.txt', '.yaml', '.yml', '.ps1')
$allowedExtensionlessNames = @('LICENSE', '.gitattributes', '.gitignore')
$publicFiles = Get-ChildItem -LiteralPath $root -Recurse -File -Force |
    Where-Object { $_.FullName -notlike "*$([IO.Path]::DirectorySeparatorChar).git$([IO.Path]::DirectorySeparatorChar)*" }

foreach ($file in $publicFiles) {
    if ($file.Extension.ToLowerInvariant() -notin $allowedExtensions -and $file.Name -notin $allowedExtensionlessNames) {
        Add-ValidationError "Unexpected file type; review repository purity and asset rights: $($file.FullName.Substring($root.Length + 1))"
    }
}

$markdownFiles = $publicFiles | Where-Object { $_.Extension -eq '.md' }
foreach ($file in $markdownFiles) {
    $content = Get-Content -Raw -Encoding UTF8 -LiteralPath $file.FullName
    foreach ($match in [regex]::Matches($content, '\[[^\]]+\]\(([^)]+)\)')) {
        $link = $match.Groups[1].Value
        if ($link -match '^(?:https?://|mailto:|#)') {
            continue
        }
        $relativePath = $link.Split('#')[0]
        $target = Join-Path $file.DirectoryName $relativePath
        if (-not (Test-Path -LiteralPath $target)) {
            Add-ValidationError "Broken local Markdown link in $($file.FullName.Substring($root.Length + 1)): $link"
        }
    }
}

$forbiddenFiles = Get-ChildItem -LiteralPath $root -Recurse -File -Force |
    Where-Object {
        $_.FullName -notlike "*$([IO.Path]::DirectorySeparatorChar).git$([IO.Path]::DirectorySeparatorChar)*" -and (
            $_.Name -eq '.env' -or
            $_.Name -like '.env.*' -or
            $_.Name -eq 'project.private.config.json' -or
            $_.Extension -in @('.pem', '.key', '.p12', '.pfx', '.jks')
        )
    }

foreach ($file in $forbiddenFiles) {
    Add-ValidationError "Forbidden private file: $($file.FullName.Substring($root.Length + 1))"
}

$secretPatterns = @(
    @{ Name = 'OpenAI-style API key'; Pattern = 'sk-[A-Za-z0-9_-]{20,}' },
    @{ Name = 'GitHub token'; Pattern = 'gh[pousr]_[A-Za-z0-9]{20,}' },
    @{ Name = 'AWS access key'; Pattern = 'AKIA[0-9A-Z]{16}' },
    @{ Name = 'Private key block'; Pattern = '-----BEGIN (?:RSA |EC |OPENSSH )?PRIVATE KEY-----' },
    @{ Name = 'Assigned secret value'; Pattern = '(?i)(?:appsecret|api[_-]?key|password|access[_-]?token)\s*[:=]\s*["''][A-Za-z0-9_./+=-]{8,}["'']' }
)

foreach ($file in $textFiles) {
    $content = Get-Content -Raw -Encoding UTF8 -LiteralPath $file.FullName
    foreach ($secretPattern in $secretPatterns) {
        if ($content -match $secretPattern.Pattern) {
            Add-ValidationError "$($secretPattern.Name) pattern found in $($file.FullName.Substring($root.Length + 1))"
        }
    }
}

Push-Location $root
try {
    $diffCheck = & git diff --check 2>&1
    if ($LASTEXITCODE -ne 0) {
        Add-ValidationError "git diff --check failed: $diffCheck"
    }
}
finally {
    Pop-Location
}

if ($errors.Count -gt 0) {
    $errors | ForEach-Object { Write-Error $_ }
    exit 1
}

Write-Host '[PASS] Repository structure, placeholders, whitespace, and secret patterns validated.'
