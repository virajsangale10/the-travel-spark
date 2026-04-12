$root = "c:\Users\sai\Desktop\travelspark"

function Find-ReplaceWhite {
    param([string]$dir)
    
    $items = Get-ChildItem -Path $dir
    foreach ($item in $items) {
        if ($item.PSIsContainer) {
            if ($item.Name -match "^(\.git|node_modules|\.gemini)$") { continue }
            Find-ReplaceWhite $item.FullName
        } else {
            if ($item.Extension -match "^\.(html|css)$") {
                $content = [IO.File]::ReadAllText($item.FullName)
                $original = $content

                $content = [System.Text.RegularExpressions.Regex]::Replace($content, "(class=`"tour-duration`"[\s\S]*?)color: white;?", "`$1color: var(--navy);", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
                
                # This regex above might be too complex or match too greedily. 
                # Alternative: Let's do a simple string replace for occurrences of standard inline style block elements.
                # Since the site seems to have a lot of inline CSS, let's just globally replace:
                # `color: white;` inside specific `.tour-duration { ... }` blocks which might exist in other files.
                $content = $content -replace "(\.tour-duration\s*\{[^}]*?)color:\s*white;?", "`$1color: var(--navy);"
                $content = $content -replace "(\.summer-tag\s*\{[^}]*?)color:\s*white;?", "`$1color: var(--navy);"
                $content = $content -replace "(\.promo-banner\s*\{[^}]*?)color:\s*white;?", "`$1color: var(--navy);"
                $content = $content -replace "(\.promo-banner\s*a\s*\{[^}]*?)color:\s*white;?", "`$1color: var(--navy);"
                
                if ($content -cne $original) {
                    [IO.File]::WriteAllText($item.FullName, $content, [System.Text.Encoding]::UTF8)
                    Write-Host "Updated $($item.FullName)"
                }
            }
        }
    }
}

Find-ReplaceWhite $root
Write-Host "Done replacing white texts."
