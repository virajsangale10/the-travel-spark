# STEP 2 - ensure Playfair Display + DM Sans font link is in every HTML file
# Safe to re-run.

$root  = 'c:\Users\sai\Desktop\travelspark'
$files = Get-ChildItem $root -Filter '*.html' -Recurse | Where-Object { $_.FullName -notmatch '\\.git\\' }

$injected = 0
$already  = 0

$block = "    <link rel=""preconnect"" href=""https://fonts.googleapis.com"" />`n    <link rel=""preconnect"" href=""https://fonts.gstatic.com"" crossorigin />`n    <link href=""https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,700;1,400&family=DM+Sans:wght@300;400;500&display=swap"" rel=""stylesheet"" />"

foreach ($f in $files) {
    $rel = $f.FullName.Substring($root.Length + 1)
    $raw = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)

    if ($raw.Contains('Playfair+Display')) {
        Write-Host "Already present: $rel"
        $already++
        continue
    }

    # Remove stale Fraunces/Nunito font links using regex
    $raw = [regex]::Replace($raw, '<link[^>]*(Fraunces|Nunito)[^>]*/?>', '')

    # Find the first meta charset tag and insert font block after it
    $metaPattern = [regex]'<meta\s+charset[^>]*/?>|<meta\s+charset[^>]*>'
    $metaMatch   = $metaPattern.Match($raw)

    if ($metaMatch.Success) {
        $insertAt = $metaMatch.Index + $metaMatch.Length
        $raw = $raw.Substring(0, $insertAt) + "`n" + $block + $raw.Substring($insertAt)
    } else {
        # Fallback: after opening head tag
        $headClose = $raw.IndexOf('>')
        if ($headClose -lt 0) { Write-Host "WARNING no head: $rel"; continue }
        $insertAt = $headClose + 1
        $raw = $raw.Substring(0, $insertAt) + "`n" + $block + $raw.Substring($insertAt)
    }

    [System.IO.File]::WriteAllText($f.FullName, $raw, [System.Text.Encoding]::UTF8)
    Write-Host "Injected: $rel"
    $injected++
}

Write-Host ""
Write-Host "--- SUMMARY ---"
Write-Host "$injected files updated, $already files already correct."
