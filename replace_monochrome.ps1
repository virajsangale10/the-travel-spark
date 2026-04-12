$root = "c:\Users\sai\Desktop\travelspark"

function Find-ReplaceMonochrome {
    param([string]$dir)
    
    $items = Get-ChildItem -Path $dir
    foreach ($item in $items) {
        if ($item.PSIsContainer) {
            if ($item.Name -match "^(\.git|node_modules|\.gemini)$") { continue }
            Find-ReplaceMonochrome $item.FullName
        } else {
            if ($item.Extension -match "^\.(html|css)$") {
                $content = [IO.File]::ReadAllText($item.FullName)
                $original = $content

                $content = [System.Text.RegularExpressions.Regex]::Replace($content, "rgba\(\s*34\s*,\s*34\s*,\s*34", "rgba(45, 55, 72", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
                $content = [System.Text.RegularExpressions.Regex]::Replace($content, "rgba\(\s*255\s*,\s*56\s*,\s*92", "rgba(226, 232, 240", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
                $content = [System.Text.RegularExpressions.Regex]::Replace($content, "rgba\(\s*0\s*,\s*166\s*,\s*153", "rgba(160, 174, 192", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
                
                $content = [System.Text.RegularExpressions.Regex]::Replace($content, "#222222", "#2D3748", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
                $content = [System.Text.RegularExpressions.Regex]::Replace($content, "#FF385C", "#E2E8F0", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
                $content = [System.Text.RegularExpressions.Regex]::Replace($content, "#D90B38", "#CBD5E1", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)

                # Fix text color for elements with pink background (now faint)
                if ($item.Extension -eq ".html") {
                    $content = $content -replace "\.tour-duration \{(.*?)(color:\s*white;?)(.*?)\}","`$1color: var(--navy);`$3"
                    $content = $content -replace "#promoBanner \{(.*?)(color:\s*white;?)(.*?)\}","`$1color: var(--navy);`$3"
                    $content = $content -replace "#promoBanner a \{(.*?)(color:\s*white;?)(.*?)\}","`$1color: var(--navy);`$3"
                    $content = $content -replace "#promoBanner \.cls \{(.*?)(color:\s*white;?)(.*?)\}","`$1color: var(--navy);`$3"
                    $content = $content -replace "\.summer-tag \{(.*?)(color:\s*white;?)(.*?)\}","`$1color: var(--navy);`$3"
                    $content = $content -replace "\.promo-banner \{(.*?)(color:\s*white;?)(.*?)\}","`$1color: var(--navy);`$3"
                    $content = $content -replace "\.promo-banner a \{(.*?)(color:\s*white;?)(.*?)\}","`$1color: var(--navy);`$3"
                    $content = $content -replace "\.promo-banner \.close-banner \{(.*?)(color:\s*white;?)(.*?)\}","`$1color: var(--navy);`$3"
                    
                    # Also replace standard white to navy for inline components if they are specifically hardcoded with white text over pink.
                }

                if ($content -cne $original) {
                    [IO.File]::WriteAllText($item.FullName, $content, [System.Text.Encoding]::UTF8)
                    Write-Host "Updated $($item.FullName)"
                }
            }
        }
    }
}

Find-ReplaceMonochrome $root
Write-Host "Done replacing to Monochrome Ice."
