$utf8 = New-Object System.Text.UTF8Encoding $false
$navHTML = [System.IO.File]::ReadAllText("c:\Users\sai\Desktop\travelspark\fixed_navbar.txt", $utf8)

function ReplaceNav($file) {
    if (Test-Path $file) {
        $content = [System.IO.File]::ReadAllText($file, $utf8)
        $navMatch = '(?is)<nav\b[^>]*>.*?(?=(?:<!--\s*Hero(?: Section)?\s*-->)|(?:<section\b[^>]*class="[^"]*(page-hero|india-pkgs|hero-content|states-section)[^"]*")|(?:<section\s+class="page-hero"))'
        
        # A safer replace for index.html, international.html and domestic.html
        if ($file -match 'index\.html') {
            # Since index is in root, paths in navHTML must be adjusted (e.g. ../index.html -> index.html)
            $localNav = $navHTML.Replace('href="../', 'href="').Replace('src="../', 'src="').Replace('href="international.html', 'href="packages/international.html').Replace('href="group-tours.html', 'href="packages/group-tours.html').Replace('href="domestic.html', 'href="packages/domestic.html')
            
            # Use regex to find <nav ... up to next <header> or <section
            $safeNavRegex = '(?is)<nav\b[^>]*>.*?</nav>\s*<div\b[^>]*id="menuOverlay"[^>]*></div>\s*<div\b[^>]*id="mobileMenu"[^>]*>.*?</div>'
            $content = $content -replace $safeNavRegex, $localNav
            
            # Fix links
            $content = $content.Replace('"destinations/europe.html"', '"packages/europe.html"')
            $content = $content.Replace('"destinations/japan.html"', '"packages/japan.html"')
            $content = $content.Replace('"destinations/dubai.html"', '"packages/dubai.html"')
            $content = $content.Replace('"destinations/maldives.html"', '"packages/maldives.html"')
            $content = $content.Replace('"destinations/georgia.html"', '"packages/georgia.html"')
            $content = $content.Replace('"destinations/singapore.html"', '"packages/charming-singapore-with-malaysia.html"')
        } else {
            # For packages/international.html and packages/domestic.html
            $safeNavRegex = '(?is)<nav\b[^>]*>.*?</nav>\s*<div\b[^>]*id="menuOverlay"[^>]*></div>\s*<div\b[^>]*id="mobileMenu"[^>]*>.*?</div>'
            $content = $content -replace $safeNavRegex, $navHTML
            
            if ($file -match 'international\.html') {
                $content = $content.Replace('href="../contact.html" class="pkg-btn">Book Now', 'class="pkg-btn">Book Now')
                $content = $content -replace '<h3>Flavours of Japan</h3>.*?class="pkg-price-lbl"', '<h3>Flavours of Japan</h3><p class="pkg-dest-list">Tokyo · Kyoto · Osaka</p><div class="pkg-tags"><span class="pkg-tag">Hotels</span><span class="pkg-tag">Bullet Train</span></div><div class="pkg-footer"><div><div class="pkg-price-lbl"'
                $content = $content -replace '<h3>European Jewels with London</h3>.*?class="pkg-price-lbl"', '<h3>European Jewels with London</h3><p class="pkg-dest-list">London · Paris · Swiss Alps · Cologne · Brussels · Amsterdam</p><div class="pkg-tags"><span class="pkg-tag">Flights Incl.</span><span class="pkg-tag">Meals</span></div><div class="pkg-footer"><div><div class="pkg-price-lbl"'
                $content = $content -replace '<h3>Spectacular Dubai</h3>.*?class="pkg-price-lbl"', '<h3>Spectacular Dubai</h3><p class="pkg-dest-list">Dubai City · Desert Safari · Burj Khalifa</p><div class="pkg-tags"><span class="pkg-tag">Flights Incl.</span><span class="pkg-tag">Transfers</span></div><div class="pkg-footer"><div><div class="pkg-price-lbl"'
                $content = $content -replace '<h3>Mesmerizing Maldives</h3>.*?class="pkg-price-lbl"', '<h3>Mesmerizing Maldives</h3><p class="pkg-dest-list">Male · Kandooma Island</p><div class="pkg-tags"><span class="pkg-tag">Speedboat</span><span class="pkg-tag">Water Villa</span></div><div class="pkg-footer"><div><div class="pkg-price-lbl"'
                $content = $content -replace '<h3>Classic Vietnam</h3>.*?class="pkg-price-lbl"', '<h3>Classic Vietnam</h3><p class="pkg-dest-list">Hanoi · Halong Bay · Da Nang · Ho Chi Minh City</p><div class="pkg-tags"><span class="pkg-tag">Cruise</span><span class="pkg-tag">Flights Incl.</span></div><div class="pkg-footer"><div><div class="pkg-price-lbl"'
                $content = $content -replace '<h3>Vibrant Philippines</h3>.*?class="pkg-price-lbl"', '<h3>Vibrant Philippines</h3><p class="pkg-dest-list">Manila · Boracay Island</p><div class="pkg-tags"><span class="pkg-tag">Island Hopping</span><span class="pkg-tag">Beach Resort</span></div><div class="pkg-footer"><div><div class="pkg-price-lbl"'
                $content = $content -replace '<h3>Jewels of Georgia</h3>.*?class="pkg-price-lbl"', '<h3>Jewels of Georgia</h3><p class="pkg-dest-list">Tbilisi · Kazbegi · Mtskheta · Kakheti</p><div class="pkg-tags"><span class="pkg-tag">Wine Tour</span><span class="pkg-tag">Mountains</span></div><div class="pkg-footer"><div><div class="pkg-price-lbl"'
                $content = $content -replace '<h3>Charming Singapore.*</h3>.*?class="pkg-price-lbl"', '<h3>Charming Singapore with Malaysia</h3><p class="pkg-dest-list">Singapore · Kuala Lumpur</p><div class="pkg-tags"><span class="pkg-tag">Theme Parks</span><span class="pkg-tag">City Tour</span></div><div class="pkg-footer"><div><div class="pkg-price-lbl"'
                
                # Replace the placeholder <a class="pkg-btn"> with correct hrefs
                $content = $content -replace 'class="pkg-price"([^>]*)</div></div><a \s*class="pkg-btn">Book Now</a></div></div>\s*</div>\s*(<div class="pkg-card">.*?)<h3>Classic Vietnam</h3>', 'class="pkg-price"$1</div></div><a href="vietnam.html" class="pkg-btn">Book Now</a></div></div></div>$2<h3>Classic Vietnam</h3>'
                # Just replace all book now buttons manually through precise replacing.
                
                $content = $content -replace '</div></div><a class="pkg-btn">Book Now</a></div></div>\s*</div>\s*<div class="pkg-card">\s*<div class="pkg-img">.*?<h3>European Jewels', '</div></div><a href="japan.html" class="pkg-btn">Book Now</a></div></div></div><div class="pkg-card"><div class="pkg-img"><img src="https://images.unsplash.com/photo-1499856871958-5b9627545d1a?w=600&q=80" alt="Europe" loading="lazy" /><span class="pkg-dur">14N / 15D</span><span class="pkg-inc">Flights Incl.</span></div><div class="pkg-body"><h3>European Jewels'
                $content = $content -replace '</div></div><a class="pkg-btn">Book Now</a></div></div>\s*</div>\s*<div class="pkg-card">\s*<div class="pkg-img">.*?<h3>Spectacular Dubai', '</div></div><a href="europe.html" class="pkg-btn">Book Now</a></div></div></div><div class="pkg-card"><div class="pkg-img"><img src="https://images.unsplash.com/photo-1512453979798-5ea266f8880c?w=600&q=80" alt="Dubai" loading="lazy" /><span class="pkg-dur">04N / 05D</span></div><div class="pkg-body"><h3>Spectacular Dubai'
                $content = $content -replace '</div></div><a class="pkg-btn">Book Now</a></div></div>\s*</div>\s*<div class="pkg-card">\s*<div class="pkg-img">.*?<h3>Mesmerizing Maldives', '</div></div><a href="dubai.html" class="pkg-btn">Book Now</a></div></div></div><div class="pkg-card"><div class="pkg-img"><img src="https://images.unsplash.com/photo-1514282401047-d79a71a590e8?w=600&q=80" alt="Maldives" loading="lazy" /><span class="pkg-dur">04N / 05D</span><span class="pkg-inc">Flights Incl.</span></div><div class="pkg-body"><h3>Mesmerizing Maldives'
                $content = $content -replace '</div></div><a class="pkg-btn">Book Now</a></div></div>\s*</div>\s*<div class="pkg-card">\s*<div class="pkg-img">.*?<h3>Classic Vietnam', '</div></div><a href="maldives.html" class="pkg-btn">Book Now</a></div></div></div><div class="pkg-card"><div class="pkg-img"><img src="https://images.unsplash.com/photo-1528127269322-539801943592?w=600&q=80" alt="Vietnam" loading="lazy" /><span class="pkg-dur">07N / 08D</span></div><div class="pkg-body"><h3>Classic Vietnam'
                $content = $content -replace '</div></div><a class="pkg-btn">Book Now</a></div></div>\s*</div>\s*<div class="pkg-card">\s*<div class="pkg-img">.*?<h3>Vibrant Philippines', '</div></div><a href="vietnam.html" class="pkg-btn">Book Now</a></div></div></div><div class="pkg-card"><div class="pkg-img"><img src="https://images.unsplash.com/photo-1518509562904-e7ef99cdcc86?w=600&q=80" alt="Philippines" loading="lazy" /><span class="pkg-dur">06N / 07D</span><span class="pkg-inc">Flights Incl.</span></div><div class="pkg-body"><h3>Vibrant Philippines'
                $content = $content -replace '</div></div><a class="pkg-btn">Book Now</a></div></div>\s*</div>\s*<div class="pkg-card">\s*<div class="pkg-img">.*?<h3>Jewels of Georgia', '</div></div><a href="philippines.html" class="pkg-btn">Book Now</a></div></div></div><div class="pkg-card"><div class="pkg-img"><img src="https://images.unsplash.com/photo-1549419137-0cfd63e9f6de?w=600&q=80" alt="Georgia" loading="lazy" /><span class="pkg-dur">05N / 06D</span></div><div class="pkg-body"><h3>Jewels of Georgia'
                $content = $content -replace '</div></div><a class="pkg-btn">Book Now</a></div></div>\s*</div>\s*<div class="pkg-card">\s*<div class="pkg-img">.*?<h3>Charming Singapore', '</div></div><a href="georgia.html" class="pkg-btn">Book Now</a></div></div></div><div class="pkg-card"><div class="pkg-img"><img src="https://images.unsplash.com/photo-1525625293386-3f8f99389edd?w=600&q=80" alt="Singapore" loading="lazy" /><span class="pkg-dur">05N / 06D</span></div><div class="pkg-body"><h3>Charming Singapore'
                $content = $content -replace '</div></div><a class="pkg-btn">Book Now</a></div></div>\s*</div>\s*</div>', '</div></div><a href="charming-singapore-with-malaysia.html" class="pkg-btn">Book Now</a></div></div></div></div>'
            }
        }
        
        [System.IO.File]::WriteAllText($file, $content, $utf8)
        Write-Host "Reconnected $file"
    }
}

ReplaceNav("c:\Users\sai\Desktop\travelspark\index.html")
ReplaceNav("c:\Users\sai\Desktop\travelspark\packages\international.html")
ReplaceNav("c:\Users\sai\Desktop\travelspark\packages\domestic.html")
