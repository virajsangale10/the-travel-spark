import urllib.request
import re
import time
import json

domestic = [
    "Mussoorie", "Rishikesh", "Haridwar", "Hampi", "Meghalaya", "Spiti Valley", 
    "Lakshadweep", "Malvan", "Konark", "Rann of Kutch", "Chikmagalur", 
    "Munnar", "Vrindavan", "Tirupati", "Amritsar", "Nainital", "Jim Corbett", 
    "Jaisalmer", "Udaipur", "Ziro Valley", "Majuli Island", "Auli", "Kabini", 
    "Khajuraho", "Vaishno Devi"
]

international = [
    "USA", "Canada", "Australia", "New Zealand", "Spain", "Portugal", "Croatia", 
    "Czech Republic", "Austria", "Iceland", "Bhutan", "Cambodia", "Malaysia", 
    "Egypt", "Morocco", "Oman", "Saudi Arabia", "Azerbaijan", "Uzbekistan", 
    "Kyrgyzstan", "Peru", "Mexico", "South Africa", "Jordan", "Taiwan", "South Korea", 
    "Armenia", "Fiji", "Hungary", "Poland"
]

def get_unsplash_img(query):
    try:
        url = "https://unsplash.com/s/photos/" + query.replace(" ", "-")
        req = urllib.request.Request(url, headers={'User-Agent': 'Mozilla/5.0'})
        html = urllib.request.urlopen(req, timeout=5).read().decode('utf-8')
        match = re.search(r'images\.unsplash\.com/photo-([a-zA-Z0-9\-]+)', html)
        if match:
            return "https://images.unsplash.com/photo-" + match.group(1) + "?w=400&q=80"
    except Exception as e:
        pass
    return "https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?w=400&q=80" # generic landscape

def generate_html(destinations):
    html = ""
    for dest in destinations:
        img = get_unsplash_img(dest)
        print(f"Got image for {dest}: {img}")
        html += f'''
        <div class="slc">
          <div class="slc-img"><img src="{img}" alt="{dest}" loading="lazy" /></div>
          <div class="slc-info">
            <h3>{dest}</h3>
            <div class="slc-hl">Explore {dest}</div>
            <div class="slc-desc">Custom-designed packages and curated experiences in {dest}.</div>
            <button class="slc-btn" data-state="{dest}">Enquire Now</button>
          </div>
        </div>
'''
        time.sleep(0.5)
    return html

print("Generating domestic...")
dom_html = generate_html(domestic)
with open("dom_gen.html", "w", encoding="utf-8") as f:
    f.write(dom_html)

print("Generating international...")
intl_html = generate_html(international)
with open("intl_gen.html", "w", encoding="utf-8") as f:
    f.write(intl_html)

print("Done!")
