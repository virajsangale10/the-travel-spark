# STEP 1 - ensure variables.css is linked in every HTML file
# Safe to re-run.

$root = 'c:\Users\sai\Desktop\travelspark'
$files = Get-ChildItem $root -Filter '*.html' -Recurse | Where-Object { $_.FullName -notmatch '\\.git\\' }

$injected = 0
$already  = 0

foreach ($f in $files) {
    $rel   = $f.FullName.Substring($root.Length + 1)
    $depth = ($rel.Split('\').Count - 1)
    $href  = if ($depth -eq 0) { 'assets/css/variables.css' } else { '../assets/css/variables.css' }
    $tag   = "    <link rel=""stylesheet"" href=""$href"" />"

    $raw = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)

    if ($raw.Contains($href)) {
        Write-Host "Already present: $rel"
        $already++
        continue
    }

    # Inject as the first link inside head - right after the opening head tag
    $headTag = '<head>'
    $headIdx = $raw.IndexOf($headTag)
    if ($headIdx -lt 0) {
        # Try with attributes
        $headTag = '<head '
        $headIdx = $raw.IndexOf($headTag)
    }
    if ($headIdx -lt 0) {
        Write-Host "WARNING no head found: $rel"
        continue
    }

    # Find the end of the opening head tag
    $closeIdx = $raw.IndexOf('>', $headIdx)
    if ($closeIdx -lt 0) { Write-Host "WARNING malformed head: $rel"; continue }

    $insertAt = $closeIdx + 1
    $raw = $raw.Substring(0, $insertAt) + "`n" + $tag + $raw.Substring($insertAt)

    [System.IO.File]::WriteAllText($f.FullName, $raw, [System.Text.Encoding]::UTF8)
    Write-Host "Injected: $rel"
    $injected++
}

Write-Host ""
Write-Host "--- SUMMARY ---"
Write-Host "$injected files updated, $already files already correct."
