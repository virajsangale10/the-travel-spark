const fs = require('fs');
const path = require('path');

const rootDir = __dirname;

function findReplaceFiles(dir) {
    const files = fs.readdirSync(dir);
    for (const file of files) {
        const fullPath = path.join(dir, file);
        if (fs.statSync(fullPath).isDirectory()) {
            if (file === '.git' || file === 'node_modules' || file === '.gemini' || file === 'assets') continue;
            findReplaceFiles(fullPath);
        } else if (fullPath.endsWith('.html')) {
            let content = fs.readFileSync(fullPath, 'utf8');
            let original = content;

            // Replace legacy var references to new vars
            content = content.replace(/var\(--navy\)/g, 'var(--color-forest)');
            content = content.replace(/var\(--navy-mid\)/g, 'var(--color-forest)');
            content = content.replace(/var\(--pink\)/g, 'var(--color-sage)');
            content = content.replace(/var\(--pink-dark\)/g, 'var(--color-forest)');
            content = content.replace(/var\(--orange\)/g, 'var(--color-sage)');
            content = content.replace(/var\(--orange-dark\)/g, 'var(--color-forest)');
            content = content.replace(/var\(--blue\)/g, 'var(--color-sage)');
            content = content.replace(/var\(--dark\)/g, 'var(--color-forest)');
            
            // Replace hardcoded Hex colors
            content = content.replace(/#E05A00/ig, 'var(--color-sage)');
            content = content.replace(/#c44f00/ig, 'var(--color-forest)');
            content = content.replace(/#1A2E1A/ig, 'var(--color-forest)');
            content = content.replace(/#0077B6/ig, 'var(--color-sage)');
            content = content.replace(/#0d1a47/ig, 'var(--color-forest)');
            
            // Replace legacy rgba shadow
            content = content.replace(/rgba\(233,\s*30,\s*140,\s*0\.25\)/g, 'var(--shadow-hover)');
            
            // Fonts
            content = content.replace(/Playfair Display/g, 'Cormorant Garamond');
            content = content.replace(/DM Sans/g, 'Jost');

            // Old font links (with + in URL)
            content = content.replace(/Playfair\+Display/g, 'Cormorant+Garamond');
            content = content.replace(/DM\+Sans/g, 'Jost');

            if (content !== original) {
                fs.writeFileSync(fullPath, content, 'utf8');
                console.log('Updated: ' + fullPath);
            }
        }
    }
}

// Update specific CSS files
function updateCSS(filePath) {
    if (fs.existsSync(filePath)) {
        let content = fs.readFileSync(filePath, 'utf8');
        let original = content;
        content = content.replace(/var\(--navy\)/g, 'var(--color-forest)');
        content = content.replace(/var\(--navy-mid\)/g, 'var(--color-forest)');
        content = content.replace(/var\(--pink\)/g, 'var(--color-sage)');
        content = content.replace(/var\(--pink-dark\)/g, 'var(--color-forest)');
        content = content.replace(/var\(--orange\)/g, 'var(--color-sage)');
        content = content.replace(/var\(--orange-dark\)/g, 'var(--color-forest)');
        content = content.replace(/var\(--blue\)/g, 'var(--color-sage)');
        content = content.replace(/var\(--dark\)/g, 'var(--color-forest)');
        content = content.replace(/#E05A00/ig, 'var(--color-sage)');
        content = content.replace(/#c44f00/ig, 'var(--color-forest)');
        content = content.replace(/#1A2E1A/ig, 'var(--color-forest)');
        content = content.replace(/#0077B6/ig, 'var(--color-sage)');
        content = content.replace(/#0d1a47/ig, 'var(--color-forest)');
        content = content.replace(/Playfair Display/g, 'Cormorant Garamond');
        content = content.replace(/DM Sans/g, 'Jost');
        
        if (content !== original) {
            fs.writeFileSync(filePath, content, 'utf8');
            console.log('Updated: ' + filePath);
        }
    }
}

findReplaceFiles(rootDir);
updateCSS(path.join(rootDir, 'assets/css/package-theme.css'));
updateCSS(path.join(rootDir, 'assets/css/cruises.css'));
console.log('Done applying Light Lime.');
