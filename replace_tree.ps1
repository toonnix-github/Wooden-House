$files = @(
    "C:\Users\SDISMAN\.gemini\antigravity\scratch\Wooden-House\story\episode_1_that_wooden_house.md",
    "C:\Users\SDISMAN\.gemini\antigravity\brain\073d9f25-b163-43e7-ae71-dca94a29764b\book_1_episode_breakdown.md",
    "C:\Users\SDISMAN\.gemini\antigravity\brain\073d9f25-b163-43e7-ae71-dca94a29764b\series_lore_backstory.md",
    "C:\Users\SDISMAN\.gemini\antigravity\scratch\Wooden-House\story\episode_1_outline.md",
    "C:\Users\SDISMAN\.gemini\antigravity\scratch\Wooden-House\story\book_1_outline.md"
)

foreach ($file in $files) {
    if (Test-Path $file) {
        $content = Get-Content $file -Raw -Encoding UTF8
        
        $content = $content -replace 'ใบโพธิ์รูปหัวใจ', 'ใบไทร'
        $content = $content -replace 'ใบโพธิ์แห้งกรอบ', 'ใบไทรแห้งกรอบ'
        $content = $content -replace 'ใบโพธิ์ใบใหญ่', 'ใบไทร'
        $content = $content -replace 'ใบโพธิ์', 'ใบไทร'
        $content = $content -replace 'ต้นโพธิ์', 'ต้นไทร'
        $content = $content -replace 'ซอยต้นโพธิ์', 'ซอยต้นไทร'
        $content = $content -replace 'โพธิ์ใหญ่', 'ไทรใหญ่'
        $content = $content -replace 'กิ่งโพธิ์', 'กิ่งไทร'
        $content = $content -replace 'เงาโพธิ์', 'เงาไทร'
        
        # Save back with UTF8 to preserve Thai characters
        [System.IO.File]::WriteAllText($file, $content, [System.Text.Encoding]::UTF8)
    }
}
Write-Host "Replaced all instances."
