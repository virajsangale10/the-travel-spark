$items = Get-ChildItem packages/*.html
foreach($f in $items) {
    # Read as UTF8
    $c = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)
    
    # Specific replacements for the gobbledygook strings
    $c = $c.Replace('ðŸ•’', '&#128338;')   # Clock
    $c = $c.Replace('ðŸŒ ', '&#127757;')   # Globe
    $c = $c.Replace('ðŸ‘ª', '&#128106;')   # Family
    $c = $c.Replace('âœ¨', '&#10024;')    # Sparkle
    $c = $c.Replace('â†“', '&#8595;')    # Arrow
    $c = $c.Replace('ðŸ“…', '&#128197;') # Calendar
    $c = $c.Replace('â€”', '&mdash;')   # Em-dash
    $c = $c.Replace('âœ…', '&#10004;')    # Checkbox
    $c = $c.Replace('ðŸ“ ', '&#128205;')   # Pin (location)
    
    # Handle the complex family emoji ðŸ‘¨â€ ðŸ‘©â€ ðŸ‘§â€ ðŸ‘¦
    $c = $c.Replace('ðŸ‘¨â€ ðŸ‘©â€ ðŸ‘§â€ ðŸ‘¦', '&#128106;')
    
    # Write back as UTF8
    [System.IO.File]::WriteAllText($f.FullName, $c, [System.Text.Encoding]::UTF8)
}
