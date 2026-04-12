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

                $content = [System.Text.RegularExpressions.Regex]::Replace($content, "#1a2a6c", "#2C363F", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
                $content = [System.Text.RegularExpressions.Regex]::Replace($content, "#e91e8c", "#007A5E", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)

                if ($content -cne $original) {
                    [IO.File]::WriteAllText($item.FullName, $content, [System.Text.Encoding]::UTF8)
                    Write-Host "Updated $($item.FullName)"
                }
            }
        }
    }
}

Find-ReplaceColors $root
Write-Host "Done replacing hex colors."
