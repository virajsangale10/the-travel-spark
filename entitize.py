import os

replacements = {
    '✔': '&#10004;',
    '✘': '&#10008;',
    '🕒': '&#128338;',
    '🌍': '&#127757;',
    '👨‍👩‍👧‍👦': '&#128106;',
    '✨': '&#10024;',
    '📍': '&#128205;',
    '📅': '&#128197;',
    '✅': '&#9989;',
    '↓': '&#8595;'
}

packages_dir = 'packages'
for filename in os.listdir(packages_dir):
    if filename.endswith('.html'):
        filepath = os.path.join(packages_dir, filename)
        try:
            with open(filepath, 'r', encoding='utf-8') as f:
                content = f.read()
            
            for char, entity in replacements.items():
                content = content.replace(char, entity)
                
            with open(filepath, 'w', encoding='utf-8') as f:
                f.write(content)
        except Exception as e:
            print(f"Error processing {filename}: {e}")
