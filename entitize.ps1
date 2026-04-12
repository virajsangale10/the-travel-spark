$items = Get-ChildItem -Path packages/*.html
foreach($file in $items) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    $replacements = @{
        '✔' = '&#10004;'
        '✘' = '&#10008;'
        '🕒' = '&#128338;'
        '🌍' = '&#127757;'
        '👨‍👩‍👧‍👦' = '&#128106;'
        '✨' = '&#10024;'
        '📍' = '&#128205;'
        '📅' = '&#128197;'
        '✅' = '&#9989;'
        '↓' = '&#8595;'
    }
    foreach($key in $replacements.Keys) {
        $content = $content.Replace($key, $replacements[$key])
    }
    Set-Content $file.FullName $content -Encoding UTF8
}
