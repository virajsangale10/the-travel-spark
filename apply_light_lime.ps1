$root = "c:\Users\sai\Desktop\travelspark"

function Apply-LightLime {
    param([string]$dir)
    
    $items = Get-ChildItem -Path $dir
    foreach ($item in $items) {
        if ($item.PSIsContainer) {
            if ($item.Name -match "^(\.git|node_modules|\.gemini|assets)$") { continue }
            Apply-LightLime $item.FullName
        } else {
            if ($item.Extension -match "^\.(html)$") {
                $content = [IO.File]::ReadAllText($item.FullName)
                $original = $content

                $content = [System.Text.RegularExpressions.Regex]::Replace($content, "var\(--navy\)", "var(--color-forest)", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
                $content = [System.Text.RegularExpressions.Regex]::Replace($content, "var\(--navy-mid\)", "var(--color-forest)", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
                $content = [System.Text.RegularExpressions.Regex]::Replace($content, "var\(--pink\)", "var(--color-sage)", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
                $content = [System.Text.RegularExpressions.Regex]::Replace($content, "var\(--pink-dark\)", "var(--color-forest)", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
                $content = [System.Text.RegularExpressions.Regex]::Replace($content, "var\(--orange\)", "var(--color-sage)", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
                $content = [System.Text.RegularExpressions.Regex]::Replace($content, "var\(--orange-dark\)", "var(--color-forest)", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
                $content = [System.Text.RegularExpressions.Regex]::Replace($content, "var\(--blue\)", "var(--color-sage)", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
                $content = [System.Text.RegularExpressions.Regex]::Replace($content, "var\(--dark\)", "var(--color-forest)", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
                
                $content = [System.Text.RegularExpressions.Regex]::Replace($content, "#E05A00", "var(--color-sage)", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
                $content = [System.Text.RegularExpressions.Regex]::Replace($content, "#c44f00", "var(--color-forest)", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
                $content = [System.Text.RegularExpressions.Regex]::Replace($content, "#1A2E1A", "var(--color-forest)", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
                $content = [System.Text.RegularExpressions.Regex]::Replace($content, "#0077B6", "var(--color-sage)", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
                $content = [System.Text.RegularExpressions.Regex]::Replace($content, "#0d1a47", "var(--color-forest)", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
                
                $content = [System.Text.RegularExpressions.Regex]::Replace($content, "rgba\(\s*233\s*,\s*30\s*,\s*140\s*,\s*0\.25\s*\)", "var(--shadow-hover)", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
                
                $content = [System.Text.RegularExpressions.Regex]::Replace($content, "Playfair Display", "Cormorant Garamond", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
                $content = [System.Text.RegularExpressions.Regex]::Replace($content, "DM Sans", "Jost", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
                $content = [System.Text.RegularExpressions.Regex]::Replace($content, "Playfair\+Display", "Cormorant+Garamond", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
                $content = [System.Text.RegularExpressions.Regex]::Replace($content, "DM\+Sans", "Jost", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)

                if ($content -cne $original) {
                    [IO.File]::WriteAllText($item.FullName, $content, [System.Text.Encoding]::UTF8)
                    Write-Host "Updated $($item.FullName)"
                }
            }
        }
    }
}

function Update-CSS {
    param([string]$filePath)
    if (Test-Path $filePath) {
        $content = [IO.File]::ReadAllText($filePath)
        $original = $content
        
        $content = [System.Text.RegularExpressions.Regex]::Replace($content, "var\(--navy\)", "var(--color-forest)", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
        $content = [System.Text.RegularExpressions.Regex]::Replace($content, "var\(--navy-mid\)", "var(--color-forest)", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
        $content = [System.Text.RegularExpressions.Regex]::Replace($content, "var\(--pink\)", "var(--color-sage)", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
        $content = [System.Text.RegularExpressions.Regex]::Replace($content, "var\(--pink-dark\)", "var(--color-forest)", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
        $content = [System.Text.RegularExpressions.Regex]::Replace($content, "var\(--orange\)", "var(--color-sage)", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
        $content = [System.Text.RegularExpressions.Regex]::Replace($content, "var\(--orange-dark\)", "var(--color-forest)", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
        $content = [System.Text.RegularExpressions.Regex]::Replace($content, "var\(--blue\)", "var(--color-sage)", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
        $content = [System.Text.RegularExpressions.Regex]::Replace($content, "var\(--dark\)", "var(--color-forest)", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
        $content = [System.Text.RegularExpressions.Regex]::Replace($content, "#E05A00", "var(--color-sage)", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
        $content = [System.Text.RegularExpressions.Regex]::Replace($content, "#c44f00", "var(--color-forest)", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
        $content = [System.Text.RegularExpressions.Regex]::Replace($content, "#1A2E1A", "var(--color-forest)", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
        $content = [System.Text.RegularExpressions.Regex]::Replace($content, "#0077B6", "var(--color-sage)", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
        $content = [System.Text.RegularExpressions.Regex]::Replace($content, "#0d1a47", "var(--color-forest)", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
        $content = [System.Text.RegularExpressions.Regex]::Replace($content, "Playfair Display", "Cormorant Garamond", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
        $content = [System.Text.RegularExpressions.Regex]::Replace($content, "DM Sans", "Jost", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
        
        if ($content -cne $original) {
            [IO.File]::WriteAllText($filePath, $content, [System.Text.Encoding]::UTF8)
            Write-Host "Updated $filePath"
        }
    }
}

Apply-LightLime $root
Update-CSS "$root\assets\css\package-theme.css"
Update-CSS "$root\assets\css\cruises.css"
Write-Host "Done applying Light Lime."
