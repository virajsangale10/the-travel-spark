$root = "c:\Users\sai\Desktop\travelspark"

function Find-ReplaceColors {
    param([string]$dir)
    
    $items = Get-ChildItem -Path $dir
    foreach ($item in $items) {
        if ($item.PSIsContainer) {
            if ($item.Name -match "^(\.git|node_modules|\.gemini)$") { continue }
            Find-ReplaceColors $item.FullName
        } else {
            if ($item.Extension -match "^\.(html|css)$") {
                $content = [IO.File]::ReadAllText($item.FullName)
                $original = $content

                $content = [System.Text.RegularExpressions.Regex]::Replace($content, "rgba\(\s*26\s*,\s*42\s*,\s*108", "rgba(44, 54, 63", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
                $content = [System.Text.RegularExpressions.Regex]::Replace($content, "rgba\(\s*233\s*,\s*30\s*,\s*140", "rgba(0, 122, 94", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
                $content = [System.Text.RegularExpressions.Regex]::Replace($content, "rgba\(\s*91\s*,\s*200\s*,\s*216", "rgba(214, 64, 34", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
                
                $content = [System.Text.RegularExpressions.Regex]::Replace($content, "#9b0058", "#005B46", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
                $content = [System.Text.RegularExpressions.Regex]::Replace($content, "#0d1a47", "#1A2126", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)

                if ($content -cne $original) {
                    [IO.File]::WriteAllText($item.FullName, $content, [System.Text.Encoding]::UTF8)
                    Write-Host "Updated $($item.FullName)"
                }
            }
        }
    }
}

Find-ReplaceColors $root
Write-Host "Done replacing colors."
