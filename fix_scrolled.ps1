$utf8 = New-Object System.Text.UTF8Encoding $false
$files = Get-ChildItem -Path "c:\Users\sai\Desktop\travelspark\packages\*.html" -Exclude "international.html", "domestic.html", "group-tours.html" | Select-Object -ExpandProperty FullName

foreach ($f in $files) {
    if (Test-Path $f) {
        $c = [System.IO.File]::ReadAllText($f, $utf8)
        $c = $c.Replace('<nav class="navbar" id="navbar">', '<nav class="navbar scrolled" id="navbar">')
        [System.IO.File]::WriteAllText($f, $c, $utf8)
        Write-Host "Fixed: $f"
    }
}
Write-Host "All done!"
