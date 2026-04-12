$root = "c:\Users\sai\Desktop\travelspark"

function Find-ReplaceCoastal {
    param([string]$dir)
    
    $items = Get-ChildItem -Path $dir
    foreach ($item in $items) {
        if ($item.PSIsContainer) {
            if ($item.Name -match "^(\.git|node_modules|\.gemini)$") { continue }
            Find-ReplaceCoastal $item.FullName
        } else {
            if ($item.Extension -match "^\.(html|css)$") {
                $content = [IO.File]::ReadAllText($item.FullName)
                $original = $content

                $content = [System.Text.RegularExpressions.Regex]::Replace($content, "rgba\(\s*45\s*,\s*55\s*,\s*72", "rgba(51, 65, 85", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
                $content = [System.Text.RegularExpressions.Regex]::Replace($content, "rgba\(\s*226\s*,\s*232\s*,\s*240", "rgba(147, 197, 253", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
                $content = [System.Text.RegularExpressions.Regex]::Replace($content, "rgba\(\s*160\s*,\s*174\s*,\s*192", "rgba(56, 189, 248", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
                
                $content = [System.Text.RegularExpressions.Regex]::Replace($content, "#2D3748", "#334155", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
                $content = [System.Text.RegularExpressions.Regex]::Replace($content, "#E2E8F0", "#93C5FD", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
                $content = [System.Text.RegularExpressions.Regex]::Replace($content, "#CBD5E1", "#60A5FA", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)

                if ($content -cne $original) {
                    [IO.File]::WriteAllText($item.FullName, $content, [System.Text.Encoding]::UTF8)
                    Write-Host "Updated $($item.FullName)"
                }
            }
        }
    }
}

Find-ReplaceCoastal $root
Write-Host "Done replacing to Coastal Breeze."
