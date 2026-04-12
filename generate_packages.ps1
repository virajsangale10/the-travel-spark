$template = @"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="{{package_title}} — {{duration}} Tour." />
    <title>{{package_title}} — The Travel Spark</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,600;0,700;1,400&family=DM+Sans:opsz,wght@9..40,300;9..40,400;9..40,500;9..40,600&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" />
    <link rel="stylesheet" href="../assets/css/navbar.css" />
    <link rel="stylesheet" href="../assets/css/footer.css" />

    <style>
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
        :root {
            --navy: #334155; --pink: #93C5FD; --off-white: #f7f7f5;
            --text: #2d2d2d; --text-light: #6b7280; --gray-100: #f3f4f6;
            --gray-200: #e5e7eb; --gray-600: #4b5563;
            --font-display: 'Playfair Display', Georgia, serif;
            --font-body: 'DM Sans', sans-serif;
            --radius: 16px; --radius-sm: 10px;
            --shadow-sm: 0 1px 3px rgba(0, 0, 0, 0.07), 0 1px 2px rgba(0, 0, 0, 0.04);
            --shadow-md: 0 4px 16px rgba(0, 0, 0, 0.1), 0 2px 6px rgba(0, 0, 0, 0.06);
        }
        body { font-family: var(--font-body); color: var(--text); background: var(--off-white); line-height: 1.6; }
        a { text-decoration: none; color: inherit; }
        ul { list-style: none; }
        img { max-width: 100%; display: block; }
        .container { max-width: 1160px; margin: 0 auto; padding: 0 24px; }
        .btn { display: inline-flex; align-items: center; justify-content: center; padding: 12px 28px; border-radius: 100px; font-family: var(--font-body); font-size: 0.95rem; font-weight: 600; cursor: pointer; transition: all 0.22s ease; border: none; }
        .btn-primary { background: var(--pink); color: white; }
        .btn-primary:hover { background: #c91078; transform: translateY(-1px); box-shadow: 0 6px 20px rgba(147, 197, 253, 0.35); }
        .btn-outline { background: transparent; color: white; border: 2px solid rgba(255, 255, 255, 0.7); }
        .btn-outline:hover { background: rgba(255, 255, 255, 0.12); border-color: white; }
        .package-hero { position: relative; min-height: 60vh; display: flex; align-items: flex-end; padding-bottom: 60px; overflow: hidden; background: var(--navy); margin-top: 68px; }
        .package-hero-bg { position: absolute; inset: 0; background: url('{{bg_image}}') center/cover; opacity: 0.45; }
        .package-hero-overlay { position: absolute; inset: 0; background: linear-gradient(to top, rgba(51, 65, 85, 0.95) 0%, rgba(51, 65, 85, 0.4) 50%, rgba(51, 65, 85, 0.1) 100%); }
        .package-hero-content { position: relative; z-index: 2; width: 100%; }
        .crumb { color: rgba(255, 255, 255, 0.6); font-size: 0.82rem; margin-bottom: 16px; }
        .crumb a { color: var(--pink); font-weight: 500; }
        .package-title { font-family: var(--font-display); font-size: clamp(2.5rem, 5vw, 3.8rem); color: white; line-height: 1.1; margin-bottom: 24px; }
        .package-meta { display: flex; flex-wrap: wrap; gap: 20px; margin-bottom: 32px; }
        .meta-item { display: flex; align-items: center; gap: 8px; color: white; font-size: 0.95rem; font-weight: 500; }
        .meta-item .icon { color: var(--pink); font-size: 1.2rem; }
        .hero-actions { display: flex; gap: 16px; flex-wrap: wrap; }
        .package-content { padding: 60px 0; background: var(--off-white); }
        .content-grid { display: grid; grid-template-columns: 2fr 1fr; gap: 40px; }
        .detail-section { background: white; border-radius: var(--radius); padding: 36px; box-shadow: var(--shadow-sm); margin-bottom: 32px; border: 1px solid var(--gray-100); }
        .detail-section h2 { font-family: var(--font-display); font-size: 1.6rem; color: var(--navy); margin-bottom: 24px; display: flex; align-items: center; gap: 12px; }
        .detail-section h2 .icon { color: var(--pink); }
        .itinerary-list { display: flex; flex-direction: column; gap: 24px; }
        .itinerary-item { position: relative; padding-left: 36px; }
        .itinerary-item::before { content: ''; position: absolute; left: 11px; top: 32px; bottom: -24px; width: 2px; background: var(--gray-200); }
        .itinerary-item:last-child::before { display: none; }
        .day-marker { position: absolute; left: 0; top: 0; width: 24px; height: 24px; background: var(--pink); color: white; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 0.75rem; font-weight: 700; border: 4px solid white; box-shadow: 0 0 0 2px var(--pink); }
        .day-header { display: flex; align-items: center; justify-content: space-between; margin-bottom: 12px; flex-wrap: wrap; gap: 12px; }
        .day-title { font-size: 1.15rem; font-weight: 700; color: var(--navy); margin: 0; }
        .day-dest { font-size: 0.8rem; font-weight: 600; color: var(--pink); background: rgba(147, 197, 253, 0.1); padding: 4px 12px; border-radius: 100px; text-transform: uppercase; letter-spacing: 0.05em; }
        .day-content { font-size: 0.92rem; color: var(--text-light); line-height: 1.7; }
        .incl-grid, .excl-grid { display: grid; grid-template-columns: repeat(2, 1fr); gap: 16px; margin-bottom: 24px; }
        .incl-item, .excl-item { display: flex; align-items: flex-start; gap: 12px; }
        .incl-item .check { color: #10b981; font-weight: 700; margin-top: 2px; }
        .excl-item .cross { color: #ef4444; font-weight: 700; margin-top: 2px; }
        .incl-item .text, .excl-item .text { font-size: 0.88rem; color: var(--text); line-height: 1.5; }
        .sidebar { position: sticky; top: 100px; }
        .price-card { background: white; border-radius: var(--radius); padding: 32px; box-shadow: var(--shadow-md); text-align: center; border-top: 5px solid var(--pink); margin-bottom: 24px; }
        .price-card .price-label { font-size: 0.85rem; color: var(--gray-600); font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; margin-bottom: 8px; }
        .price-card .price-amount { font-family: var(--font-display); font-size: 2.4rem; font-weight: 700; color: var(--navy); margin-bottom: 8px; line-height: 1; }
        .price-card .price-tax { font-size: 0.75rem; color: var(--text-light); margin-bottom: 24px; }
        .price-card .btn { width: 100%; padding: 14px; font-size: 1rem; margin-bottom: 16px; }
        .price-card .help-text { font-size: 0.8rem; color: var(--text-light); }
        .price-card .help-text a { color: var(--pink); font-weight: 600; }
        .quick-info { background: white; border-radius: var(--radius); padding: 24px; box-shadow: var(--shadow-sm); border: 1px solid var(--gray-100); }
        .quick-info h3 { font-family: var(--font-display); font-size: 1.1rem; color: var(--navy); margin-bottom: 16px; border-bottom: 1px solid var(--gray-100); padding-bottom: 10px; }
        .info-row { display: flex; justify-content: space-between; margin-bottom: 12px; font-size: 0.85rem; }
        .info-row:last-child { margin-bottom: 0; }
        .info-lbl { color: var(--gray-600); }
        .info-val { font-weight: 600; color: var(--navy); text-align: right; }
        @media (max-width: 900px) { .content-grid { grid-template-columns: 1fr; } .sidebar { position: relative; top: 0; } .incl-grid, .excl-grid { grid-template-columns: 1fr; } }
        @media (max-width: 560px) { .detail-section { padding: 24px; } }
    </style>
</head>
<body>
    <div id="navbar-placeholder"></div>

    <section class="package-hero">
        <div class="package-hero-bg"></div>
        <div class="package-hero-overlay"></div>
        <div class="container package-hero-content" data-aos="fade-up">
            <p class="crumb"><a href="../index.html">Home</a> / <a href="domestic.html">Explore</a> / {{region}}</p>
            <h1 class="package-title">{{package_title}}</h1>
            <div class="package-meta">
                <div class="meta-item"><span class="icon">🕒</span> {{duration}}</div>
                <div class="meta-item"><span class="icon">🌍</span> {{places}}</div>
                <div class="meta-item"><span class="icon">👨‍👩‍👧‍👦</span> {{type}}</div>
                <div class="meta-item"><span class="icon">✨</span> Standard</div>
            </div>
            <div class="hero-actions">
                <a href="#itinerary" class="btn btn-primary">View Itinerary ↓</a>
                <a href="../contact.html" class="btn btn-outline">Enquire Now</a>
            </div>
        </div>
    </section>

    <section class="package-content">
        <div class="container">
            <div class="content-grid">
                <div class="content-main">

                    <div class="detail-section" data-aos="fade-up">
                        <h2><span class="icon">✨</span> Tour Overview</h2>
                        <p style="color: var(--text-light); line-height: 1.7;">{{overview}}</p>
                        <div style="display:flex; gap: 16px; margin-top:24px; padding: 20px; background: rgba(147, 197, 253,0.05); border-radius: var(--radius-sm); border: 1px solid rgba(147, 197, 253,0.1); flex-wrap: wrap;">
                            {{city_widgets}}
                        </div>
                    </div>

                    <div class="detail-section" id="itinerary" data-aos="fade-up">
                        <h2><span class="icon">📅</span> Detailed Itinerary</h2>
                        <div class="itinerary-list">
                            {{itinerary_html}}
                        </div>
                    </div>

                    <div class="detail-section" data-aos="fade-up">
                        <h2><span class="icon">✅</span> Inclusions & Exclusions</h2>
                        <h3 style="font-size: 1rem; color: var(--navy); margin-bottom: 16px;">What's Included</h3>
                        <div class="incl-grid">
                            <div class="incl-item"><span class="check">✔</span><div class="text">Accommodation on twin sharing basis.</div></div>
                            <div class="incl-item"><span class="check">✔</span><div class="text">Daily Breakfast & Dinner at the hotels.</div></div>
                            <div class="incl-item"><span class="check">✔</span><div class="text">All transfers & sightseeing by dedicated vehicle.</div></div>
                            <div class="incl-item"><span class="check">✔</span><div class="text">Toll tax, parking, and driver allowances.</div></div>
                        </div>
                        <h3 style="font-size: 1rem; color: var(--navy); margin-bottom: 16px; margin-top: 32px; border-top: 1px solid var(--gray-100); padding-top: 24px;">What's Not Included</h3>
                        <div class="excl-grid">
                            <div class="excl-item"><span class="cross">✘</span><div class="text">5% GST on the total package cost.</div></div>
                            <div class="excl-item"><span class="cross">✘</span><div class="text">Any Airfare / Train fare.</div></div>
                            <div class="excl-item"><span class="cross">✘</span><div class="text">Entrance fees to monuments, cameras fee.</div></div>
                            <div class="excl-item"><span class="cross">✘</span><div class="text">Personal expenses: Laundry, telephone calls, tips.</div></div>
                        </div>
                    </div>
                </div>

                <div class="content-sidebar">
                    <div class="sidebar">
                        <div class="price-card" data-aos="fade-up">
                            <div class="price-label">Net Payable Amount</div>
                            <div class="price-amount">{{price}}</div>
                            <div class="price-tax">{{price_tax}}</div>
                            <a href="../contact.html" class="btn btn-primary">Book This Package</a>
                            <div class="help-text">Need help? <a href="../contact.html">Contact Us</a></div>
                        </div>
                        <div class="quick-info" style="margin-top:24px;" data-aos="fade-up" data-aos-delay="100">
                            <h3>Tour Details</h3>
                            <div class="info-row"><span class="info-lbl">Departing From</span><span class="info-val">{{departing}}</span></div>
                            <div class="info-row"><span class="info-lbl">Price Category</span><span class="info-val">Standard</span></div>
                            <div class="info-row"><span class="info-lbl">Tour Type</span><span class="info-val">Private Tour</span></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div id="footer-placeholder"></div>

    <script src="../assets/js/components.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
    <script>
        AOS.init({ duration: 700, once: true, offset: 60 });
        document.querySelector('a[href="#itinerary"]')?.addEventListener('click', e => { e.preventDefault(); document.getElementById('itinerary')?.scrollIntoView({ behavior: 'smooth', block: 'start' }); });
    </script>
</body>
</html>
"@

Function Generate-Package {
    param($filename, $title, $duration, $region, $places, $type, $bg, $overview, $price, $price_tax, $departing, $cities, $itinerary)

    $city_widgets = ""
    foreach ($c in $cities) {
        $cName = $c.Name
        $cNights = $c.Nights
        $city_widgets += "<div style='flex:1; text-align:center; min-width:80px;'><div style='font-size:1.6rem; margin-bottom:6px;'>📍</div><div style='font-weight:700; color:var(--navy); font-size:0.9rem;'>$cName</div><div style='font-size:0.78rem; color:var(--text-light);'>$cNights</div></div>"
    }

    $itinerary_html = ""
    $day = 1
    foreach ($i in $itinerary) {
        $iTitle = $i.Title
        $iDest = $i.Dest
        $iContent = $i.Content
        $itinerary_html += "<div class='itinerary-item'><div class='day-marker'>$day</div><div class='day-header'><h3 class='day-title'>$iTitle</h3><span class='day-dest'>$iDest</span></div><div class='day-content'>$iContent</div></div>"
        $day++
    }

    $html = $template -replace '\{\{package_title\}\}', $title `
                      -replace '\{\{duration\}\}', $duration `
                      -replace '\{\{region\}\}', $region `
                      -replace '\{\{places\}\}', $places `
                      -replace '\{\{type\}\}', $type `
                      -replace '\{\{bg_image\}\}', $bg `
                      -replace '\{\{overview\}\}', $overview `
                      -replace '\{\{city_widgets\}\}', $city_widgets `
                      -replace '\{\{itinerary_html\}\}', $itinerary_html `
                      -replace '\{\{price\}\}', $price `
                      -replace '\{\{price_tax\}\}', $price_tax `
                      -replace '\{\{departing\}\}', $departing

    [System.IO.File]::WriteAllText("c:\Users\sai\Desktop\travelspark\packages\$filename", $html, [System.Text.Encoding]::UTF8)
    Write-Host "Created $filename"
}
