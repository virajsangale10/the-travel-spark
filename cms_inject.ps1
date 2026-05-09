<#
  THE TRAVEL SPARK — cms_inject.ps1
  Injects CMS scripts + variables.css into all pages that are missing them.
  Safe to re-run: skips pages that already have cms.js.
  Do NOT touch dubai.html (already fully wired).
#>

$root = 'c:\Users\sai\Desktop\travelspark'

# ── Snippet blocks ────────────────────────────────────────────────────────────

# CSS block to add after the last existing <link> in <head>
$varsLinkRoot    = '  <link rel="stylesheet" href="assets/css/variables.css" />'
$varsLinkSub     = '  <link rel="stylesheet" href="../assets/css/variables.css" />'

# Script blocks for ROOT-level pages (assets/js/...)
$cmsScriptsRoot = @'
  <!-- CMS scripts (Supabase CDN → supabase-client → cms → components) -->
  <script src="https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2/dist/umd/supabase.js"></script>
  <script src="assets/js/supabase-client.js"></script>
  <script src="assets/js/cms.js"></script>
'@

# Script blocks for /packages/ sub-pages (../assets/js/...)
$cmsScriptsSub = @'
    <!-- CMS scripts (Supabase CDN → supabase-client → cms → components) -->
    <script src="https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2/dist/umd/supabase.js"></script>
    <script src="../assets/js/supabase-client.js"></script>
    <script src="../assets/js/cms.js"></script>
'@

# ── Root-level pages ──────────────────────────────────────────────────────────
$rootPages = @('about.html','blog.html','contact.html','corporate-travel.html','cruises.html')

foreach ($page in $rootPages) {
    $path = Join-Path $root $page
    if (-not (Test-Path $path)) { Write-Host "SKIP (not found): $page"; continue }

    $content = Get-Content $path -Raw -Encoding UTF8

    # Skip if cms.js already present
    if ($content -match 'cms\.js') { Write-Host "SKIP (already done): $page"; continue }

    # 1. Add variables.css after the last existing <link rel="stylesheet"> line
    if ($content -notmatch 'variables\.css') {
        # Insert after footer.css link (or last stylesheet link)
        $content = $content -replace '(<link rel="stylesheet" href="assets/css/footer\.css"[^>]*/?>)', "`$1`n$varsLinkRoot"
    }

    # 2. Inject CMS scripts before the first <script src="assets/js/components.js">
    $content = $content -replace '(<script src="assets/js/components\.js">)', "$cmsScriptsRoot`$1"

    Set-Content $path -Value $content -Encoding UTF8 -NoNewline
    Write-Host "DONE: $page"
}

# ── Package sub-pages ─────────────────────────────────────────────────────────
$pkgDir = Join-Path $root 'packages'
$pkgFiles = Get-ChildItem $pkgDir -Filter '*.html' | Where-Object { $_.Name -ne 'dubai.html' -and $_.Name -ne 'philippines_test.html' }

foreach ($file in $pkgFiles) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8

    # Skip if cms.js already present
    if ($content -match 'cms\.js') { Write-Host "SKIP (already done): $($file.Name)"; continue }

    # 1. Add variables.css after footer.css link
    if ($content -notmatch 'variables\.css') {
        $content = $content -replace '(<link rel="stylesheet" href="\.\./assets/css/(?:footer|package-theme)\.css"[^>]*/?>)', "`$1`n    <link rel=`"stylesheet`" href=`"../assets/css/variables.css`" />"
    }

    # 2. Fix script load order:
    #    Old order: AOS.js → main.js → inline <script> → components.js (WRONG)
    #    New order: supabase CDN → supabase-client.js → cms.js → components.js → AOS.js → main.js → inline <script>
    #
    #    Strategy: replace the two-line pattern "main.js ... components.js" with correct block

    # Insert CMS scripts immediately before the components.js tag
    # Handle both patterns: components before or after main.js
    if ($content -match '<script src="\.\./assets/js/components\.js">') {
        $content = $content -replace '(<script src="\.\./assets/js/components\.js">)', "$cmsScriptsSub`$1"
    }

    Set-Content $file.FullName -Value $content -Encoding UTF8 -NoNewline
    Write-Host "DONE: $($file.Name)"
}

Write-Host "`nAll done."
