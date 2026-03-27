$filesToFix = @(
    "c:\Users\sai\Desktop\travelspark\packages\charming-singapore-with-malaysia.html",
    "c:\Users\sai\Desktop\travelspark\packages\dubai.html",
    "c:\Users\sai\Desktop\travelspark\packages\europe.html",
    "c:\Users\sai\Desktop\travelspark\packages\georgia.html",
    "c:\Users\sai\Desktop\travelspark\packages\japan.html",
    "c:\Users\sai\Desktop\travelspark\packages\maldives.html",
    "c:\Users\sai\Desktop\travelspark\packages\philippines.html",
    "c:\Users\sai\Desktop\travelspark\packages\vietnam.html"
)

$utf8 = New-Object System.Text.UTF8Encoding $false
$navHTML = [System.IO.File]::ReadAllText("c:\Users\sai\Desktop\travelspark\fixed_navbar.txt", $utf8)
$jsHTML = [System.IO.File]::ReadAllText("c:\Users\sai\Desktop\travelspark\fixed_js.txt", $utf8)

$cssString = @"
    <link rel="stylesheet" href="../assets/css/navbar.css" />
    <link rel="stylesheet" href="../assets/css/footer.css" />
"@

foreach ($file in $filesToFix) {
    if (Test-Path $file) {
        $content = [System.IO.File]::ReadAllText($file, $utf8)
        
        # 1. Clean up the double-quoted messes in CSS imports (I added earlier by accident)
        $content = $content -replace '<link href=""../assets/css/navbar.css"" rel=""stylesheet"" />', '<link rel="stylesheet" href="../assets/css/navbar.css" />'
        $content = $content -replace '<link href=""../assets/css/footer.css"" rel=""stylesheet"" />', '<link rel="stylesheet" href="../assets/css/footer.css" />'
        
        # 2. Replace the double-quoted dirty navbar entirely
        # The bad navbar had <nav class=""navbar"" id=""navbar""> up to </div> right before <!-- Hero
        # But let's just match any <nav> down to the section or Hero
        $navMatch = '(?is)<nav\b[^>]*>.*?(?=(?:<!--\s*Hero(?: Section)?\s*-->)|(?:<section\b[^>]*class="[^"]*package-hero[^"]*"))'
        $content = $content -replace $navMatch, "$navHTML`n`n"
        
        # 3. Fix the dirty double-quoted JS block if it existed
        $jsRegex = '(?is)<script[^>]*aos\.js[^>]*>.*?</script>.*?</body>'
        $content = $content -replace $jsRegex, $jsHTML
        
        [System.IO.File]::WriteAllText($file, $content, $utf8)
        Write-Host "Fixed Unicode & Quotes in $file"
    }
}
Write-Host "All Fixed."
