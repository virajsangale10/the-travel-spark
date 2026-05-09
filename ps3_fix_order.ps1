# STEP 3 - ensure variables.css is the FIRST stylesheet link in every page head
# Safe to re-run.

$root  = 'c:\Users\sai\Desktop\travelspark'
$files = Get-ChildItem $root -Filter '*.html' -Recurse | Where-Object { $_.FullName -notmatch '\\.git\\' }

$fixed   = 0
$already = 0

foreach ($f in $files) {
    $rel   = $f.FullName.Substring($root.Length + 1)
    $depth = ($rel.Split('\').Count - 1)
    $href  = if ($depth -eq 0) { 'assets/css/variables.css' } else { '../assets/css/variables.css' }

    $raw = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)

    if (-not $raw.Contains($href)) {
        Write-Host "SKIP (no variables.css): $rel"
        continue
    }

    $varsIdx = $raw.IndexOf($href)

    # Find any other assets/css stylesheet link that comes BEFORE variables.css
    $otherPattern = [regex]'href="(?:\.\.\/)?assets/css/(?!variables\.css)[^"]+"'
    $otherMatch   = $otherPattern.Match($raw)

    if ($otherMatch.Success -and $otherMatch.Index -lt $varsIdx) {
        # variables.css appears AFTER another stylesheet - extract and move to front

        # Match the full link tag for variables.css
        $varTagPat = [regex]'[ \t]*<link\s+rel="stylesheet"\s+href="(?:\.\.\/)?assets/css/variables\.css"[^>]*/?>[ \t]*(\r?\n)?'
        $varTagM   = $varTagPat.Match($raw)

        if (-not $varTagM.Success) {
            Write-Host "SKIP (tag shape unexpected): $rel"
            continue
        }

        $varTag  = $varTagM.Value.TrimEnd()
        # Remove from current position
        $raw = $raw.Remove($varTagM.Index, $varTagM.Length)

        # Find the first remaining stylesheet link and insert before it
        $firstLinkPat = [regex]'[ \t]*<link\s+rel="stylesheet"'
        $firstLinkM   = $firstLinkPat.Match($raw)

        if ($firstLinkM.Success) {
            $raw = $raw.Substring(0, $firstLinkM.Index) + "    " + $varTag.TrimStart() + "`n" + $raw.Substring($firstLinkM.Index)
        } else {
            # Fallback: after head open tag
            $headClose = $raw.IndexOf('>')
            $raw = $raw.Substring(0, $headClose + 1) + "`n    " + $varTag.TrimStart() + $raw.Substring($headClose + 1)
        }

        [System.IO.File]::WriteAllText($f.FullName, $raw, [System.Text.Encoding]::UTF8)
        Write-Host "Reordered: $rel"
        $fixed++
    } else {
        Write-Host "Order OK:  $rel"
        $already++
    }
}

Write-Host ""
Write-Host "--- SUMMARY ---"
Write-Host "$fixed files reordered, $already files already in correct order."
