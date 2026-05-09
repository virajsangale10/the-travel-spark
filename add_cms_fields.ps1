<#
  THE TRAVEL SPARK — add_cms_fields.ps1
  Adds data-package-slug to <body> and cms-editable + data-field attributes
  to the price, duration, and package name on every individual package page.
  Skips listing pages (domestic.html, international.html, group-tours.html).
  Skips dubai.html (already done). Safe to re-run.
#>

$pkgDir = 'c:\Users\sai\Desktop\travelspark\packages'

# Map: filename → slug (kebab-case, unique per package)
$slugMap = @{
    'andaman-package.html'                = 'andaman-islands'
    'charming-singapore-with-malaysia.html' = 'singapore-malaysia'
    'do-dham-yatra-kedarnath.html'         = 'do-dham-yatra'
    'essence-of-kerala.html'              = 'essence-of-kerala'
    'europe.html'                          = 'europe-grand'
    'fascinating-gujarat.html'             = 'fascinating-gujarat'
    'georgia.html'                         = 'georgia-tour'
    'glorious-himachal.html'               = 'glorious-himachal'
    'goa-escape-neelam.html'               = 'goa-escape'
    'himalayan-triangle.html'              = 'himalayan-triangle'
    'japan.html'                           = 'japan-tour'
    'karnataka-explorer.html'              = 'karnataka-explorer'
    'kashmir-heaven-on-earth.html'         = 'kashmir-heaven'
    'ladakh-delight.html'                  = 'ladakh-delight'
    'maldives.html'                        = 'maldives-tour'
    'marvels-of-rajasthan.html'            = 'marvels-of-rajasthan'
    'northeast-odyssey.html'               = 'northeast-odyssey'
    'philippines.html'                     = 'philippines-tour'
    'short-break-coorg-mysore.html'        = 'coorg-mysore'
    'uttarakhand-06-nights.html'           = 'uttarakhand-6n'
    'vietnam.html'                         = 'vietnam-tour'
}

# Listing pages to skip (no individual package data)
$skipPages = @('domestic.html','international.html','group-tours.html','philippines_test.html','dubai.html')

foreach ($entry in $slugMap.GetEnumerator()) {
    $filename = $entry.Key
    $slug     = $entry.Value
    $path     = Join-Path $pkgDir $filename

    if (-not (Test-Path $path)) { Write-Host "SKIP (not found): $filename"; continue }

    $content = Get-Content $path -Raw -Encoding UTF8

    # 1. Add data-package-slug to <body> tag (if not already present)
    if ($content -notmatch 'data-package-slug') {
        $content = $content -replace '<body>', "<body data-package-slug=`"$slug`">"
        $content = $content -replace '<body\s+>', "<body data-package-slug=`"$slug`">"
    }

    # 2. Add cms-editable + data-field="name" to the package title h1
    #    Pattern: class="package-title" — add cms-editable and data-field if not present
    if ($content -notmatch 'data-field="name"') {
        $content = $content -replace 'class="package-title"', 'class="package-title cms-editable" data-field="name"'
    }

    # 3. Add cms-editable + data-field="price" to the price-amount div
    #    Pattern: class="price-amount" — add if not present
    if ($content -notmatch 'data-field="price"') {
        $content = $content -replace 'class="price-amount"', 'class="price-amount cms-editable" data-field="price"'
    }

    # 4. Duration is trickier — it's inside a meta-item span. 
    #    We look for the clock icon meta-item and wrap the text span.
    #    Only if no cms-editable with data-field=duration already
    if ($content -notmatch 'data-field="duration"') {
        # Pattern: <div class="meta-item"><span class="icon">&#128338;</span> X Nights / Y Days</div>
        # Replace the text node after the icon span with a cms-editable span
        $content = $content -replace '(<div class="meta-item"><span class="icon">&#128338;</span>\s*)([^<]+)(</div>)', '$1<span class="cms-editable" data-field="duration">$2</span>$3'
    }

    Set-Content $path -Value $content -Encoding UTF8 -NoNewline
    Write-Host "DONE: $filename (slug: $slug)"
}

Write-Host "`nCMS fields added to all package pages."
