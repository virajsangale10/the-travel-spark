$filesToFix = @(
    "c:\Users\sai\Desktop\travelspark\packages\charming-singapore-with-malaysia.html",
    "c:\Users\sai\Desktop\travelspark\packages\georgia.html"
)

$subfolderNavbar = @'
    <nav class="navbar" id="navbar">
        <div class="container">
            <div class="navbar-inner">
                <a href="../index.html" class="navbar-logo"><img src="../assets/images/Logo-TTS.png" alt="The Travel Spark" /></a>
                <ul class="navbar-links">
                    <li><a href="../index.html">Home</a></li>
                    <li>
                        <span>Holiday Packages <span class="chevron">▾</span></span>
                        <ul class="dropdown">
                            <li><a href="international.html">🌍 International Holidays</a></li>
                            <li><a href="group-tours.html">👥 Group Tours</a></li>
                            <li><a href="domestic.html">🇮🇳 Explore India</a></li>
                        </ul>
                    </li>
                    <li><a href="../corporate-travel.html">Corporate Travel</a></li>
                    <li><a href="../blog.html">Blog</a></li>
                    <li><a href="../about.html">About</a></li>
                    <li><a href="../contact.html">Contact</a></li>
                </ul>
                <div class="navbar-cta">
                    <a href="tel:+919421189999" class="navbar-phone hide-mobile">📞 +91 9421189999</a>
                    <a href="../contact.html" class="navbar-enquire hide-mobile">Enquire Now</a>
                    <button class="hamburger" id="hamburger"><span></span><span></span><span></span></button>
                </div>
            </div>
        </div>
    </nav>

    <div class="menu-overlay" id="menuOverlay"></div>
    <div class="mobile-menu" id="mobileMenu">
        <a href="../index.html">Home</a>
        <div class="m-parent">Holiday Packages</div>
        <div class="sub-links">
            <a href="international.html">🌍 International Holidays</a>
            <a href="group-tours.html">👥 Group Tours</a>
            <a href="domestic.html">🇮🇳 Explore India</a>
        </div>
        <a href="../corporate-travel.html">Corporate Travel</a>
        <a href="../blog.html">Blog</a>
        <a href="../about.html">About</a>
        <a href="../contact.html">Contact</a>
        <br />
        <a href="tel:+919421189999" style="color:var(--pink);font-weight:700;">📞 +91 9421189999</a>
    </div>

'@

foreach ($file in $filesToFix) {
    if (Test-Path $file) {
        $content = Get-Content $file -Raw
        
        # We find everything from <nav class="navbar" to exactly BEFORE <section class="package-hero">
        $pattern = '(?s)<nav class="navbar"[^>]*>.*?(?=\s*<section class="package-hero">)'
        
        if ($content -match $pattern) {
            $updated = $content -replace $pattern, $subfolderNavbar
            Set-Content -Path $file -Value $updated -NoNewline
            Write-Host "Fixed $($file)"
        }
    }
}
Write-Host "Done"
