<#
  Fix remaining issues:
  1. dubai.html — add variables.css link
  2. charming-singapore-with-malaysia.html, domestic.html, group-tours.html, international.html
     — add Playfair Display font link
#>

$pkgDir = 'c:\Users\sai\Desktop\travelspark\packages'

# Fix dubai.html variables.css
$dubaiPath = Join-Path $pkgDir 'dubai.html'
$content = Get-Content $dubaiPath -Raw -Encoding UTF8
if ($content -notmatch 'variables\.css') {
    $content = $content -replace '(<link rel="stylesheet" href="\.\./assets/css/package-theme\.css"[^>]*/?>)', '$1' + "`n    <link rel=`"stylesheet`" href=`"../assets/css/variables.css`" />"
    Set-Content $dubaiPath -Value $content -Encoding UTF8 -NoNewline
    Write-Host "DONE: dubai.html (added variables.css)"
}

# Font link to add for sub-pages missing Playfair
$playfairLink = '    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,700;1,400&family=DM+Sans:wght@300;400;500&display=swap" rel="stylesheet" />'

$missingFont = @('charming-singapore-with-malaysia.html','domestic.html','group-tours.html','international.html')
foreach ($fn in $missingFont) {
    $path = Join-Path $pkgDir $fn
    if (-not (Test-Path $path)) { Write-Host "SKIP (not found): $fn"; continue }
    $content = Get-Content $path -Raw -Encoding UTF8
    if ($content -notmatch 'Playfair') {
        # Insert after the <link rel="preconnect"> block
        $content = $content -replace '(<link rel="preconnect" href="https://fonts\.gstatic\.com"[^>]*/?>)', "`$1`n$playfairLink"
        Set-Content $path -Value $content -Encoding UTF8 -NoNewline
        Write-Host "DONE: $fn (added Playfair font)"
    } else {
        Write-Host "SKIP (Playfair already present): $fn"
    }
}

Write-Host "`nAll remaining fixes done."
