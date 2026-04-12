$targetFiles = Get-ChildItem -Path "c:\Users\sai\Desktop\travelspark" -Filter "*.html" -Recurse | Where-Object { $_.FullName -notmatch "components" }

$rootNavbar = @'
  <nav class="navbar" id="navbar">
    <div class="container">
      <div class="navbar-inner">
        <ul class="navbar-links" style="margin-right: auto;">
        <li><a href="index.html">Home</a></li>
        <li>
          <span>Holiday Packages <span class="chevron">▾</span></span>
          <ul class="dropdown">
            <li><a href="packages/international.html">🌍 International Holidays</a></li>
            <li><a href="packages/group-tours.html">👥 Group Tours</a></li>
            <li><a href="packages/domestic.html">🇮🇳 Explore India</a></li>
            <li><a href="cruises.html">🛳️ Luxury Cruises</a></li>
          </ul>
        </li>
        <li><a href="corporate-travel.html">Corporate Travel</a></li>
        <li><a href="blog.html">Blog</a></li>
        <li><a href="about.html">About</a></li>
        <li><a href="contact.html">Contact</a></li>
      </ul>
      <div class="navbar-cta">
        <a href="contact.html" class="navbar-phone hide-mobile" style="font-size: 1.25rem; text-decoration: none;" title="Contact Us">📞</a>
        <a href="contact.html" class="navbar-enquire hide-mobile">Enquire Now</a>
        <button class="hamburger" id="hamburger"><span></span><span></span><span></span></button>
      </div>
      <a href="index.html" class="navbar-logo">
        <span class="logo-text-new">The Travel<span class="spark-mix">Spark</span></span>
      </a>
      </div>
    </div>
  </nav>

  <div class="menu-overlay" id="menuOverlay"></div>
  <div class="mobile-menu" id="mobileMenu">
    <a href="index.html">Home</a>
    <div class="m-parent">Holiday Packages</div>
    <div class="sub-links">
      <a href="packages/international.html">🌍 International Holidays</a>
      <a href="packages/group-tours.html">👥 Group Tours</a>
      <a href="packages/domestic.html">🇮🇳 Explore India</a>
      <a href="cruises.html">🛳️ Luxury Cruises</a>
    </div>
    <a href="corporate-travel.html">Corporate Travel</a>
    <a href="blog.html">Blog</a>
    <a href="about.html">About</a>
    <a href="contact.html">Contact</a>
    <br />
    <a href="tel:+919421189999" style="color:var(--pink);font-weight:700;">📞 +91 9421189999</a>
  </div>
'@

$subfolderNavbar = @'
    <nav class="navbar" id="navbar">
        <div class="container">
            <div class="navbar-inner">
                <ul class="navbar-links" style="margin-right: auto;">
                    <li><a href="../index.html">Home</a></li>
                    <li>
                        <span>Holiday Packages <span class="chevron">▾</span></span>
                        <ul class="dropdown">
                            <li><a href="international.html">🌍 International Holidays</a></li>
                            <li><a href="group-tours.html">👥 Group Tours</a></li>
                            <li><a href="domestic.html">🇮🇳 Explore India</a></li>
                            <li><a href="../cruises.html">🛳️ Luxury Cruises</a></li>
                        </ul>
                    </li>
                    <li><a href="../corporate-travel.html">Corporate Travel</a></li>
                    <li><a href="../blog.html">Blog</a></li>
                    <li><a href="../about.html">About</a></li>
                    <li><a href="../contact.html">Contact</a></li>
                </ul>
                <div class="navbar-cta">
                    <a href="../contact.html" class="navbar-phone hide-mobile" style="font-size: 1.25rem; text-decoration: none;" title="Contact Us">📞</a>
                    <a href="../contact.html" class="navbar-enquire hide-mobile">Enquire Now</a>
                    <button class="hamburger" id="hamburger"><span></span><span></span><span></span></button>
                </div>
                <a href="../index.html" class="navbar-logo"><span class="logo-text-new">The Travel<span class="spark-mix">Spark</span></span></a>
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
            <a href="../cruises.html">🛳️ Luxury Cruises</a>
        </div>
        <a href="../corporate-travel.html">Corporate Travel</a>
        <a href="../blog.html">Blog</a>
        <a href="../about.html">About</a>
        <a href="../contact.html">Contact</a>
        <br />
        <a href="tel:+919421189999" style="color:var(--pink);font-weight:700;">📞 +91 9421189999</a>
    </div>
'@

$legalNavbar = @'
    <nav class="navbar" id="navbar">
        <div class="container">
            <div class="navbar-inner">
                <ul class="navbar-links" style="margin-right: auto;">
                    <li><a href="../index.html">Home</a></li>
                    <li>
                        <span>Holiday Packages <span class="chevron">▾</span></span>
                        <ul class="dropdown">
                            <li><a href="../packages/international.html">🌍 International Holidays</a></li>
                            <li><a href="../packages/group-tours.html">👥 Group Tours</a></li>
                            <li><a href="../packages/domestic.html">🇮🇳 Explore India</a></li>
                            <li><a href="../cruises.html">🛳️ Luxury Cruises</a></li>
                        </ul>
                    </li>
                    <li><a href="../corporate-travel.html">Corporate Travel</a></li>
                    <li><a href="../blog.html">Blog</a></li>
                    <li><a href="../about.html">About</a></li>
                    <li><a href="../contact.html">Contact</a></li>
                </ul>
                <div class="navbar-cta">
                    <a href="../contact.html" class="navbar-phone hide-mobile" style="font-size: 1.25rem; text-decoration: none;" title="Contact Us">📞</a>
                    <a href="../contact.html" class="navbar-enquire hide-mobile">Enquire Now</a>
                    <button class="hamburger" id="hamburger"><span></span><span></span><span></span></button>
                </div>
                <a href="../index.html" class="navbar-logo"><span class="logo-text-new">The Travel<span class="spark-mix">Spark</span></span></a>
            </div>
        </div>
    </nav>

    <div class="menu-overlay" id="menuOverlay"></div>
    <div class="mobile-menu" id="mobileMenu">
        <a href="../index.html">Home</a>
        <div class="m-parent">Holiday Packages</div>
        <div class="sub-links">
            <a href="../packages/international.html">🌍 International Holidays</a>
            <a href="../packages/group-tours.html">👥 Group Tours</a>
            <a href="../packages/domestic.html">🇮🇳 Explore India</a>
            <a href="../cruises.html">🛳️ Luxury Cruises</a>
        </div>
        <a href="../corporate-travel.html">Corporate Travel</a>
        <a href="../blog.html">Blog</a>
        <a href="../about.html">About</a>
        <a href="../contact.html">Contact</a>
        <br />
        <a href="tel:+919421189999" style="color:var(--pink);font-weight:700;">📞 +91 9421189999</a>
    </div>
'@

foreach ($file in $targetFiles) {
    if ($file.FullName -match "index.html" -and $file.FullName -notmatch "legal|packages") {
        continue 
    }

    $content = Get-Content $file.FullName -Raw
    
    $replacement = $rootNavbar
    if ($file.FullName -match "packages\\|packages/") {
        $replacement = $subfolderNavbar
    } elseif ($file.FullName -match "legal\\|legal/") {
        $replacement = $legalNavbar
    }
    
    # Check if the file has mobileMenu
    $patternFull = '(?s)<nav class="navbar"[^>]*>.*?<div class="mobile-menu"[^>]*>.*?</a>\s*</div>'
    $patternNavOnly = '(?s)<nav class="navbar"[^>]*>.*?</nav>'

    if ($content -match $patternFull) {
        $updated = $content -replace $patternFull, $replacement
        Set-Content -Path $file.FullName -Value $updated -NoNewline
        Write-Host "Updated full $($file.FullName)"
    } elseif ($content -match $patternNavOnly) {
        $updated = $content -replace $patternNavOnly, $replacement
        Set-Content -Path $file.FullName -Value $updated -NoNewline
        Write-Host "Updated nav-only $($file.FullName)"
    }
}
Write-Host "Done"
