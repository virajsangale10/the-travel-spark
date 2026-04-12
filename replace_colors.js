const fs = require('fs');
const path = require('path');

const rootDir = __dirname;

function findReplaceFiles(dir) {
    const files = fs.readdirSync(dir);
    for (const file of files) {
        const fullPath = path.join(dir, file);
        if (fs.statSync(fullPath).isDirectory()) {
            if (file === '.git' || file === 'node_modules' || file === '.gemini') continue;
            findReplaceFiles(fullPath);
        } else if (fullPath.endsWith('.html') || fullPath.endsWith('.css')) {
            let content = fs.readFileSync(fullPath, 'utf8');
            let original = content;

            // RGBA replacements
            // Note: need to handle potential spaces after commas
            content = content.replace(/rgba\(\s*26\s*,\s*42\s*,\s*108/g, 'rgba(44, 54, 63');
            content = content.replace(/rgba\(\s*233\s*,\s*30\s*,\s*140/g, 'rgba(0, 122, 94');
            content = content.replace(/rgba\(\s*91\s*,\s*200\s*,\s*216/g, 'rgba(214, 64, 34');

            // Hex replacements
            content = content.replace(/#9b0058/ig, '#005B46');
            content = content.replace(/#0d1a47/ig, '#1A2126');

            if (content !== original) {
                fs.writeFileSync(fullPath, content, 'utf8');
                console.log('Updated: ' + fullPath);
            }
        }
    }
}

findReplaceFiles(rootDir);
console.log('Done replacing colors.');
