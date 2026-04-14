const fs = require('fs');
const path = require('path');

function processDir(dir) {
    if (!fs.existsSync(dir)) return;
    const files = fs.readdirSync(dir);
    for (let file of files) {
        const fullPath = path.join(dir, file);
        if (fs.statSync(fullPath).isDirectory()) {
            if (!fullPath.includes('node_modules') && !fullPath.includes('.git')) {
                processDir(fullPath);
            }
        } else if (fullPath.endsWith('.html')) {
            processFile(fullPath);
        }
    }
}

function processFile(fullPath) {
    let content = fs.readFileSync(fullPath, 'utf8');
    let original = content;

    // Replace navbar and mobile menu
    content = content.replace(/<nav class="navbar[\s\S]*?<\/nav>/, '<div id="navbar-placeholder"></div>');
    content = content.replace(/<div class="menu-overlay"[\s\S]*?<\/div>/, '');
    content = content.replace(/<div class="mobile-menu"[\s\S]*?<\/div>/, '');

    // Replace footer
    content = content.replace(/<footer class="footer">[\s\S]*?<\/footer>/, '<div id="footer-placeholder"></div>');
    
    // Replace whatsapp float
    content = content.replace(/<a href="https:\/\/wa\.me[^>]*class="whatsapp-float"[^>]*>[\s\S]*?<\/a>/, '');

    if (!content.includes('components.js')) {
        let prefix = (fullPath.includes('packages') || fullPath.includes('destinations') || fullPath.includes('legal')) ? '../' : '';
        content = content.replace(/<\/body>/, <script src=" + prefix + ssets/js/components.js"></script>\n</body>);
    }

    if (content !== original) {
        fs.writeFileSync(fullPath, content, 'utf8');
        console.log('Updated', fullPath);
    }
}

processDir('c:/Users/sai/Desktop/travelspark');
