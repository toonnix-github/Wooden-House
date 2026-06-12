param (
    [string]$FilePath
)

if (-not $FilePath) {
    Write-Host "Usage: .\check_style.ps1 <path_to_draft.md>"
    exit 1
}

if (-not (Test-Path $FilePath)) {
    Write-Host "Error: File not found at $FilePath" -ForegroundColor Red
    exit 1
}

$content = [System.IO.File]::ReadAllText($FilePath, [System.Text.Encoding]::UTF8)
$lines = $content -split "`r?`n"

$wordCount = ($content -split '\s+' | Where-Object { $_.Length -gt 0 }).Count
$passiveCount = ([regex]::Matches($content, '\u0e16\u0e39\u0e01')).Count

Write-Host "=== Style Report for: $(Split-Path $FilePath -Leaf) ===" -ForegroundColor Cyan
Write-Host "Total Words (approx): $wordCount"
Write-Host "Passive voice marker ('thook' / \u0e16\u0e39\u0e01) frequency: $passiveCount times`n"

$issues = [System.Collections.Generic.List[string]]::new()
$lineNum = 1

# Unicode expressions for Thai patterns
# Pattern for 'mai mee' (repetitive negative construct)
$patternRepetitiveNeg = '\u0e44\u0e21\u0e48\u0e21\u0e35.*\u0e44\u0e21\u0e48\u0e21\u0e35.*\u0e44\u0e21\u0e48\u0e21\u0e35'

# Patterns for AI-like clichés/adverbs:
# tun-the-tun-dai, yahng-ruad-rew, doy-aut-ta-no-mat, pen-yahng-ying, yahng-sin-wang
$patternAiCliches = '(\u0e17\u0e31\u0e19\u0e17\u0e35\u0e17\u0e31\u0e19\u0e43\u0e14|\u0e2d\u0e22\u0e48\u0e32\u0e07\u0e23\u0e27\u0e14\u0e40\u0e23\u0e47\u0e27|\u0e42\u0e14\u0e22\u0e31\u0e15\u0e42\u0e19\u0e21\u0e31\u0e15\u0e34|\u0e40\u0e1b\u0e47\u0e19\u0e2d\u0e22\u0e48\u0e32\u0e07\u0e22\u0e34\u0e48\u0e07|\u0e2d\u0e22\u0e48\u0e32\u0e07\u0e2a\u0e34\u0e49\u0e19\u0e2b\u0e27\u0e31\u0e07)'

foreach ($line in $lines) {
    $trimmed = $line.Trim()
    if ($trimmed.Length -eq 0) {
        $lineNum++
        continue
    }

    # Repetitive negative pattern
    if ($trimmed -match $patternRepetitiveNeg) {
        $snippet = $trimmed.Substring(0, [Math]::Min(60, $trimmed.Length))
        $issues.Add("Line ${lineNum}: Repetitive negative pattern ('mai mee...') detected. Try writing more active description.`n    Snippet: '${snippet}...'")
    }

    # AI clichés
    if ($trimmed -match $patternAiCliches) {
        $matches = [regex]::Matches($trimmed, $patternAiCliches)
        $wordsList = [System.Collections.Generic.List[string]]::new()
        foreach ($m in $matches) {
            $wordsList.Add($m.Value)
        }
        $words = $wordsList | Select-Object -Unique
        $snippet = $trimmed.Substring(0, [Math]::Min(60, $trimmed.Length))
        $issues.Add("Line ${lineNum}: AI-like clichés/adverbs detected. Consider simplifying or showing action.`n    Snippet: '${snippet}...'")
    }

    # Paragraph length
    if ($trimmed.Length -gt 1200) {
        $snippet = $trimmed.Substring(0, [Math]::Min(60, $trimmed.Length))
        $issues.Add("Line ${lineNum}: Very long paragraph ($($trimmed.Length) chars). Consider breaking it up for pacing.`n    Snippet: '${snippet}...'")
    }

    $lineNum++
}

# Check moralizing endings near the end of the file
# rian-roo and chee-wit
$totalLines = $lines.Count
for ($i = [Math]::Max(0, $totalLines - 5); $i -lt $totalLines; $i++) {
    $line = $lines[$i]
    if ($line -match '\u0e40\u0e23\u0e35\u0e22\u0e19\u0e23\u0e39\u0e49' -and $line -match '\u0e0a\u0e35\u0e27\u0e34\u0e15') {
        $trimmedEnd = $line.Trim()
        $snippet = $trimmedEnd.Substring(0, [Math]::Min(60, $trimmedEnd.Length))
        $issues.Add("Line $($i+1): Possible moralizing/summarizing tone at the end. Keep ending open and sensory.`n    Snippet: '${snippet}...'")
    }
}

if ($issues.Count -eq 0) {
    Write-Host "SUCCESS: No obvious style issues detected! The draft fits the guidelines well." -ForegroundColor Green
} else {
    Write-Host "WARNING: Potential style warnings:" -ForegroundColor Yellow
    $displayCount = [Math]::Min(20, $issues.Count)
    for ($i = 0; $i -lt $displayCount; $i++) {
        Write-Host "  $($issues[$i])"
    }
    
    if ($issues.Count -gt 20) {
        Write-Host "  ...and $($issues.Count - 20) more style suggestions." -ForegroundColor DarkGray
    }
}
