const fs = require('fs');
const path = require('path');

const rootDir = __dirname;
const htmlFiles = [];

function findHtmlFiles(dir) {
    const files = fs.readdirSync(dir);
    for (const file of files) {
        const fullPath = path.join(dir, file);
        if (fs.statSync(fullPath).isDirectory()) {
            findHtmlFiles(fullPath);
        } else if (fullPath.endsWith('.html') && !fullPath.includes('components')) {
            htmlFiles.push(fullPath);
        }
    }
}

findHtmlFiles(rootDir);

const rootNavbar = `  <nav class="navbar" id="navbar">
    <div class="container">
      <div class="navbar-inner">
        <a href="index.html" class="navbar-logo">
          <img src="assets/images/Logo-TTS.png" alt="The Travel Spark" />
        </a>
        <ul class="navbar-links">
          <li><a href="index.html">Home</a></li>
          <li>
            <span>Holiday Packages <span class="chevron">▾</span></span>
            <ul class="dropdown">
              <li><a href="packages/international.html">🌍 International Holidays</a></li>
              <li><a href="packages/group-tours.html">👥 Group Tours</a></li>
              <li><a href="packages/domestic.html">🇮🇳 Explore India</a></li>
            </ul>
          </li>
          <li><a href="corporate-travel.html">Corporate Travel</a></li>
          <li><a href="blog.html">Blog</a></li>
          <li><a href="about.html">About</a></li>
          <li><a href="contact.html">Contact</a></li>
        </ul>
        <div class="navbar-cta">
          <a href="tel:+910000000000" class="navbar-phone hide-mobile">📞 +91 00000 00000</a>
          <a href="contact.html" class="navbar-enquire hide-mobile">Enquire Now</a>
          <button class="hamburger" id="hamburger"><span></span><span></span><span></span></button>
        </div>
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
    </div>
    <a href="corporate-travel.html">Corporate Travel</a>
    <a href="blog.html">Blog</a>
    <a href="about.html">About</a>
    <a href="contact.html">Contact</a>
    <br />
    <a href="tel:+910000000000" style="color:var(--pink);font-weight:700;">📞 +91 00000 00000</a>
  </div>`;

const subfolderNavbar = `    <nav class="navbar" id="navbar">
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
                    <a href="tel:+910000000000" class="navbar-phone hide-mobile">📞 +91 00000 00000</a>
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
        <a href="tel:+910000000000" style="color:var(--pink);font-weight:700;">📞 +91 00000 00000</a>
    </div>`;

const legalFolderNavbar = `    <nav class="navbar" id="navbar">
        <div class="container">
            <div class="navbar-inner">
                <a href="../index.html" class="navbar-logo"><img src="../assets/images/Logo-TTS.png" alt="The Travel Spark" /></a>
                <ul class="navbar-links">
                    <li><a href="../index.html">Home</a></li>
                    <li>
                        <span>Holiday Packages <span class="chevron">▾</span></span>
                        <ul class="dropdown">
                            <li><a href="../packages/international.html">🌍 International Holidays</a></li>
                            <li><a href="../packages/group-tours.html">👥 Group Tours</a></li>
                            <li><a href="../packages/domestic.html">🇮🇳 Explore India</a></li>
                        </ul>
                    </li>
                    <li><a href="../corporate-travel.html">Corporate Travel</a></li>
                    <li><a href="../blog.html">Blog</a></li>
                    <li><a href="../about.html">About</a></li>
                    <li><a href="../contact.html">Contact</a></li>
                </ul>
                <div class="navbar-cta">
                    <a href="tel:+910000000000" class="navbar-phone hide-mobile">📞 +91 00000 00000</a>
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
            <a href="../packages/international.html">🌍 International Holidays</a>
            <a href="../packages/group-tours.html">👥 Group Tours</a>
            <a href="../packages/domestic.html">🇮🇳 Explore India</a>
        </div>
        <a href="../corporate-travel.html">Corporate Travel</a>
        <a href="../blog.html">Blog</a>
        <a href="../about.html">About</a>
        <a href="../contact.html">Contact</a>
        <br />
        <a href="tel:+910000000000" style="color:var(--pink);font-weight:700;">📞 +91 00000 00000</a>
    </div>`;

const regex = /<nav class="navbar" id="navbar">[\s\S]*?<div class="mobile-menu" id="mobileMenu">[\s\S]*?<\/div>/;

let updatedCount = 0;

for (const file of htmlFiles) {
    let content = fs.readFileSync(file, 'utf8');
    
    // Choose which navbar logic to use
    let replacement = rootNavbar;
    if (file.includes('legal\\') || file.includes('legal/')) {
        replacement = legalFolderNavbar;
    } else if (file.includes('packages\\') || file.includes('packages/')) {
        replacement = subfolderNavbar;
    }

    if (regex.test(content)) {
        content = content.replace(regex, replacement);
        fs.writeFileSync(file, content, 'utf8');
        updatedCount++;
        console.log("Updated", file);
    }
}

console.log('Successfully updated', updatedCount, 'files.');
