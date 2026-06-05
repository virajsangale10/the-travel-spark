const https = require('https');
const fs = require('fs');

const domestic = [
    "Mussoorie", "Rishikesh", "Haridwar", "Hampi", "Meghalaya", "Spiti Valley", 
    "Lakshadweep", "Malvan", "Konark", "Rann of Kutch", "Chikmagalur", 
    "Munnar", "Vrindavan", "Tirupati", "Amritsar", "Nainital", "Jim Corbett", 
    "Jaisalmer", "Udaipur", "Ziro Valley", "Majuli Island", "Auli", "Kabini", 
    "Khajuraho", "Vaishno Devi"
];

const international = [
    "USA", "Canada", "Australia", "New Zealand", "Spain", "Portugal", "Croatia", 
    "Czech Republic", "Austria", "Iceland", "Bhutan", "Cambodia", "Malaysia", 
    "Egypt", "Morocco", "Oman", "Saudi Arabia", "Azerbaijan", "Uzbekistan", 
    "Kyrgyzstan", "Peru", "Mexico", "South Africa", "Jordan", "Taiwan", "South Korea", 
    "Armenia", "Fiji", "Hungary", "Poland"
];

function getUnsplashImg(query) {
    return new Promise((resolve) => {
        const url = 'https://unsplash.com/s/photos/' + query.replace(/ /g, '-');
        https.get(url, { headers: { 'User-Agent': 'Mozilla/5.0' } }, (res) => {
            let data = '';
            res.on('data', chunk => data += chunk);
            res.on('end', () => {
                const match = data.match(/images\.unsplash\.com\/photo-([a-zA-Z0-9\-]+)/);
                if (match) {
                    resolve("https://images.unsplash.com/photo-" + match[1] + "?w=400&q=80");
                } else {
                    resolve("https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?w=400&q=80");
                }
            });
        }).on('error', () => resolve("https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?w=400&q=80"));
    });
}

async function generateHtml(destinations, file) {
    let html = "";
    for (const dest of destinations) {
        const img = await getUnsplashImg(dest);
        console.log("Got image for " + dest + ": " + img);
        html += \
        <div class="slc" data-aos="fade-up">
          <div class="slc-img"><img src="\" alt="\" loading="lazy" /></div>
          <div class="slc-info">
            <h3>\</h3>
            <div class="slc-hl">Explore \</div>
            <div class="slc-desc">Custom-designed packages and curated experiences in \.</div>
            <button class="slc-btn" data-state="\">Enquire Now</button>
          </div>
        </div>
\;
        await new Promise(r => setTimeout(r, 500));
    }
    fs.writeFileSync(file, html);
}

async function main() {
    console.log("Generating domestic...");
    await generateHtml(domestic, "dom_gen.html");
    console.log("Generating international...");
    await generateHtml(international, "intl_gen.html");
    console.log("Done!");
}

main();
