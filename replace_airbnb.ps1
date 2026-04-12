$root = "c:\Users\sai\Desktop\travelspark"

function Find-ReplaceAirbnb {
    param([string]$dir)
    
    $items = Get-ChildItem -Path $dir
    foreach ($item in $items) {
        if ($item.PSIsContainer) {
            if ($item.Name -match "^(\.git|node_modules|\.gemini)$") { continue }
            Find-ReplaceAirbnb $item.FullName
        } else {
            if ($item.Extension -match "^\.(html|css)$") {
                $content = [IO.File]::ReadAllText($item.FullName)
                $original = $content

                $content = [System.Text.RegularExpressions.Regex]::Replace($content, "rgba\(\s*44\s*,\s*54\s*,\s*63", "rgba(34, 34, 34", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
                $content = [System.Text.RegularExpressions.Regex]::Replace($content, "rgba\(\s*0\s*,\s*122\s*,\s*94", "rgba(255, 56, 92", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
                $content = [System.Text.RegularExpressions.Regex]::Replace($content, "rgba\(\s*214\s*,\s*64\s*,\s*34", "rgba(0, 166, 153", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
                
                $content = [System.Text.RegularExpressions.Regex]::Replace($content, "#2C363F", "#222222", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
                $content = [System.Text.RegularExpressions.Regex]::Replace($content, "#007A5E", "#FF385C", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
                $content = [System.Text.RegularExpressions.Regex]::Replace($content, "#005B46", "#D90B38", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
                $content = [System.Text.RegularExpressions.Regex]::Replace($content, "#1A2126", "#222222", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)

                if ($content -cne $original) {
                    [IO.File]::WriteAllText($item.FullName, $content, [System.Text.Encoding]::UTF8)
                    Write-Host "Updated $($item.FullName)"
                }
            }
        }
    }
}

Find-ReplaceAirbnb $root
Write-Host "Done replacing to Airbnb."
