$template = Get-Content -Raw "template.html"

$json = @"
[
  {
    "filename": "essence-of-kerala.html",
    "title": "Essence of Kerala",
    "duration": "4 Nights / 5 Days",
    "region": "Kerala",
    "places": "Munnar, Thekkady, Alleppey",
    "type": "Family & Nature",
    "bg": "https://images.unsplash.com/photo-1602216056096-3b40cc0c9944?w=1800",
    "overview": "Discover the true essence of God's Own Country. Wind through the sprawling tea gardens of Munnar, experience the spice plantations and wildlife of Thekkady, and cruise the tranquil backwaters of Alleppey in your private houseboat.",
    "price": "On Request",
    "price_tax": "Per Person on Twin Sharing",
    "departing": "Kochi (Cochin)",
    "cities": [
      {"Name": "Munnar", "Nights": "2 Nights"},
      {"Name": "Thekkady", "Nights": "1 Night"},
      {"Name": "Alleppey", "Nights": "1 Night"}
    ],
    "itinerary": [
      {"Title": "Arrival at Cochin", "Dest": "Munnar", "Content": "Arrive at Cochin Airport/Station. Meet our representative and drive to Munnar, enjoying scenic waterfalls and tea gardens en route. Check-in to the hotel. Overnight stay at Munnar."},
      {"Title": "Munnar Sightseeing", "Dest": "Munnar", "Content": "Post breakfast, go for a full day sightseeing of Munnar. Visit Mattupetty Dam, Echo Point, Tea Museum, and Eravikulam National Park. Return to hotel for overnight stay."},
      {"Title": "Munnar to Thekkady", "Dest": "Thekkady", "Content": "Drive to Thekkady. Check-in to your hotel. Later, visit spice plantations or take an optional boat ride in Periyar Lake. Overnight stay at Thekkady."},
      {"Title": "Thekkady to Alleppey (Houseboat)", "Dest": "Alleppey", "Content": "Drive to Alleppey. Board your traditional houseboat at noon. Enjoy a scenic cruise. Meals served on board. Overnight stay in Houseboat."},
      {"Title": "Departure from Cochin", "Dest": "Cochin", "Content": "After breakfast on the houseboat, disembark and drive back to Cochin for your return flight/train journey."}
    ]
  },
  {
    "filename": "fascinating-gujarat.html",
    "title": "Fascinating Gujarat",
    "duration": "6 Nights / 7 Days",
    "region": "Gujarat",
    "places": "Ahmedabad, Dwarka, Somnath, Sasan Gir",
    "type": "Heritage & Wildlife",
    "bg": "https://images.unsplash.com/photo-1620612261623-0182fcff27a3?w=1800",
    "overview": "Experience the vibrant culture, rich heritage, and spiritual aura of Gujarat. Visit the magnificent temples of Dwarka and Somnath, and spot majestic Asiatic Lions in Gir National Park.",
    "price": "On Request",
    "price_tax": "Per Person on Twin Sharing",
    "departing": "Ahmedabad",
    "cities": [
      {"Name": "Ahmedabad", "Nights": "1 Night"},
      {"Name": "Dwarka", "Nights": "2 Nights"},
      {"Name": "Somnath", "Nights": "1 Night"},
      {"Name": "Sasan Gir", "Nights": "1 Night"}
    ],
    "itinerary": [
      {"Title": "Arrival in Ahmedabad", "Dest": "Ahmedabad", "Content": "Arrive at Ahmedabad and check in. Visit Gandhi Ashram, Akshardham Temple and Adalaj Stepwell. Overnight at Ahmedabad."},
      {"Title": "Ahmedabad to Dwarka", "Dest": "Dwarka", "Content": "Drive to Dwarka. Upon arrival, check in and later attend the evening Aarti at the famous Dwarkadhish Temple. Overnight at Dwarka."},
      {"Title": "Dwarka Sightseeing", "Dest": "Dwarka", "Content": "Visit Bet Dwarka, Nageshwar Jyotirlinga, and the Rukmini Temple. Spend the evening at Gomti Ghat. Overnight at Dwarka."},
      {"Title": "Dwarka to Somnath via Porbandar", "Dest": "Somnath", "Content": "Drive to Somnath. En route stop at Porbandar to visit Kirti Mandir. Arrive at Somnath, visit the Temple and enjoy the evening Sound and Light show. Overnight at Somnath."},
      {"Title": "Somnath to Sasan Gir", "Dest": "Sasan Gir", "Content": "Drive a short distance to Sasan Gir. Check into your wildlife resort and relax or take an afternoon jungle safari. Overnight at Gir."},
      {"Title": "Sasan Gir to Ahmedabad", "Dest": "Ahmedabad", "Content": "After breakfast, drive back to Ahmedabad. Check in and relax for the evening. Overnight at Ahmedabad."},
      {"Title": "Departure", "Dest": "Ahmedabad", "Content": "After breakfast, transfer to Ahmedabad airport/station for your onward journey."}
    ]
  },
  {
    "filename": "goa-escape-neelam.html",
    "title": "Goa Escape (Neelam The Grand)",
    "duration": "3 Nights / 4 Days",
    "region": "Goa",
    "places": "North Goa",
    "type": "Leisure & Beaches",
    "bg": "https://images.unsplash.com/photo-1549893072-4bc678117f45?w=1800",
    "overview": "A rejuvenating short break in the party capital of India. Stay in a premium property, relax by the pool, explore pristine beaches of North Goa, and indulge in amazing coastal cuisine.",
    "price": "On Request",
    "price_tax": "Per Person on Twin Sharing",
    "departing": "Goa",
    "cities": [
      {"Name": "Goa", "Nights": "3 Nights"}
    ],
    "itinerary": [
      {"Title": "Arrival in Goa", "Dest": "Goa", "Content": "Arrive in Goa. Our representative will transfer you to your hotel. Rest of the day is at leisure to explore the nearby beaches. Overnight at hotel."},
      {"Title": "North Goa Sightseeing", "Dest": "Goa", "Content": "Post breakfast, proceed for a half-day tour of North Goa visiting Fort Aguada, Calangute Beach, and Baga Beach. Evening at leisure. Overnight at hotel."},
      {"Title": "Day at Leisure", "Dest": "Goa", "Content": "Enjoy a full day of leisure. Rent a two-wheeler, visit shacks, try water sports, or simply relax by the hotel pool. Overnight at hotel."},
      {"Title": "Departure", "Dest": "Goa", "Content": "After breakfast, check out from the hotel and proceed to the Airport for your onward journey."}
    ]
  },
  {
    "filename": "karnataka-explorer.html",
    "title": "Karnataka Explorer",
    "duration": "9 Nights / 10 Days",
    "region": "Karnataka",
    "places": "Bangalore, Mysore, Hassan, Hospet, Badami",
    "type": "Heritage",
    "bg": "https://images.unsplash.com/photo-1600100397608-f010f41ab446?w=1800",
    "overview": "A comprehensive 10-day tour exploring the rich cultural heritage and magnificent ancient temples of Karnataka. From the grand Mysore Palace to the impressive ruins of Hampi.",
    "price": "On Request",
    "price_tax": "Per Person on Twin Sharing",
    "departing": "Bangalore",
    "cities": [
      {"Name": "Bangalore", "Nights": "1 Night"},
      {"Name": "Mysore", "Nights": "2 Nights"},
      {"Name": "Hassan", "Nights": "2 Nights"},
      {"Name": "Hospet", "Nights": "2 Nights"},
      {"Name": "Badami", "Nights": "2 Nights"}
    ],
    "itinerary": [
      {"Title": "Arrival in Bangalore", "Dest": "Bangalore", "Content": "Arrive in Bangalore. Transfer to hotel. Afternoon sightseeing including Lal Bagh Botanical Gardens. Overnight in Bangalore."},
      {"Title": "Bangalore to Mysore", "Dest": "Mysore", "Content": "Drive to Mysore. En route visit Srirangapatna. Check in to the hotel and later visit the majestic Mysore Palace. Overnight in Mysore."},
      {"Title": "Mysore Sightseeing", "Dest": "Mysore", "Content": "Full day tour visiting Chamundi Hill, St. Philomenas Church, and Brindavan Gardens in the evening. Overnight in Mysore."},
      {"Title": "Mysore to Hassan", "Dest": "Hassan", "Content": "Drive to Hassan. En route visit Shravanabelagola. Arrive and check in. Overnight in Hassan."},
      {"Title": "Belur & Halebid Excursion", "Dest": "Hassan", "Content": "Visit the stunning Hoysala temples of Belur and Halebid, famous for their intricate carvings. Return to Hassan."},
      {"Title": "Hassan to Hospet", "Dest": "Hospet", "Content": "Long scenic drive to Hospet, the gateway to Hampi. Check in and relax. Overnight in Hospet."},
      {"Title": "Exploring Hampi Ruins", "Dest": "Hospet", "Content": "Full day exploring the UNESCO World Heritage site of Hampi. Visit the Virupaksha Temple, Vittala Temple. Overnight in Hospet."},
      {"Title": "Hospet to Badami", "Dest": "Badami", "Content": "Drive to Badami. Visit the famous rock-cut cave temples of Badami in the afternoon. Overnight in Badami."},
      {"Title": "Pattadakal & Aihole", "Dest": "Badami", "Content": "Visit the ancient temple complexes of Aihole and Pattadakal, showcasing early Chalukyan architecture. Overnight in Badami."},
      {"Title": "Departure", "Dest": "Hubli", "Content": "After breakfast, drive to Hubli airport/station for your onward journey."}
    ]
  },
  {
    "filename": "kashmir-heaven-on-earth.html",
    "title": "Kashmir - Heaven on Earth",
    "duration": "5 Nights / 6 Days",
    "region": "Kashmir",
    "places": "Srinagar, Gulmarg, Pahalgam",
    "type": "Family & Romance",
    "bg": "https://images.unsplash.com/photo-1595815771614-ade9d652a65d?w=1800",
    "overview": "Experience the unparalleled beauty of Paradise on Earth. Enjoy a Shikara ride on Dal Lake, witness the snow-capped peaks of Gulmarg, and stroll through the lush green valleys of Pahalgam.",
    "price": "On Request",
    "price_tax": "Per Person on Twin Sharing",
    "departing": "Srinagar",
    "cities": [
      {"Name": "Srinagar", "Nights": "2 Nights"},
      {"Name": "Pahalgam", "Nights": "2 Nights"},
      {"Name": "Srinagar", "Nights": "1 Night"}
    ],
    "itinerary": [
      {"Title": "Arrival in Srinagar", "Dest": "Srinagar", "Content": "Arrive at Srinagar airport. Meet our representative and transfer to the hotel. Later, visit the famous Mughal Gardens. Overnight at Srinagar hotel."},
      {"Title": "Srinagar to Pahalgam", "Dest": "Pahalgam", "Content": "Drive to Pahalgam via saffron fields at Pampore. Arrive and check-in. Enjoy the scenic beauty. Overnight at Pahalgam."},
      {"Title": "Pahalgam Sightseeing", "Dest": "Pahalgam", "Content": "Day at leisure to explore Pahalgam. Optionally visit Betaab Valley, Aru Valley, and Chandanwari. Overnight at Pahalgam."},
      {"Title": "Pahalgam to Gulmarg Day Trip", "Dest": "Srinagar", "Content": "Drive to Gulmarg. Enjoy the famous Gondola ride. Later return to Srinagar for an overnight stay."},
      {"Title": "Houseboat Stay", "Dest": "Srinagar", "Content": "Check into a traditional Houseboat on Dal Lake. In the afternoon, enjoy a relaxing Shikara Ride on the lake. Overnight in Houseboat."},
      {"Title": "Departure", "Dest": "Srinagar", "Content": "After breakfast, transfer to Srinagar airport for your onward flight."}
    ]
  },
  {
    "filename": "ladakh-delight.html",
    "title": "Ladakh Delight",
    "duration": "5 Nights / 6 Days",
    "region": "Ladakh",
    "places": "Leh, Nubra Valley, Pangong Tso",
    "type": "Adventure & Scenic",
    "bg": "https://images.unsplash.com/photo-1581793745862-99fde7fa73d2?w=1800",
    "overview": "A thrilling expedition to the land of high passes. Drive through Khardung La, the highest motorable road, ride the double-humped camels in Nubra Valley, and camp by the mesmerizing blue waters of Pangong Lake.",
    "price": "On Request",
    "price_tax": "Per Person on Twin Sharing",
    "departing": "Leh",
    "cities": [
      {"Name": "Leh", "Nights": "3 Nights"},
      {"Name": "Nubra Valley", "Nights": "1 Night"},
      {"Name": "Pangong", "Nights": "1 Night"}
    ],
    "itinerary": [
      {"Title": "Arrival in Leh", "Dest": "Leh", "Content": "Arrive in Leh and transfer to hotel. Rest of the day is crucial for acclimatization to the high altitude. Late afternoon visit to Shanti Stupa. Overnight in Leh."},
      {"Title": "Leh Local Sightseeing", "Dest": "Leh", "Content": "Drive towards Sham Valley. Visit Hall of Fame, Magnetic Hill, Gurudwara Pathar Sahib, and Sangam. Overnight in Leh."},
      {"Title": "Leh to Nubra Valley", "Dest": "Nubra Valley", "Content": "Drive to Nubra Valley via Khardung La Pass. Arrive at Hunder. Check into camps. Enjoy a ride on the bactrian camel. Overnight in Nubra."},
      {"Title": "Nubra to Pangong Tso", "Dest": "Pangong", "Content": "After breakfast, visit Diskit Monastery. Later drive to Pangong Lake via the Shyok river route. Overnight in camps at Pangong."},
      {"Title": "Pangong to Leh", "Dest": "Leh", "Content": "Wake up to a beautiful sunrise at Pangong. Later drive back to Leh passing through Chang La pass. Evening free for shopping in Leh market. Overnight in Leh."},
      {"Title": "Departure", "Dest": "Leh", "Content": "Early morning transfer to Leh airport to board your flight back home."}
    ]
  },
  {
    "filename": "northeast-odyssey.html",
    "title": "Northeast Odyssey",
    "duration": "6 Nights / 7 Days",
    "region": "North-East",
    "places": "Guwahati, Shillong, Cherrapunjee",
    "type": "Nature & Culture",
    "bg": "https://images.unsplash.com/photo-1596788062835-263be0b82eb9?w=1800",
    "overview": "Explore the pristine beauty of Northeast India. Ascend into the clouds in Meghalaya, marvel at living root bridges in Cherrapunjee, and cruise the mighty Brahmaputra river in Assam.",
    "price": "On Request",
    "price_tax": "Per Person on Twin Sharing",
    "departing": "Guwahati",
    "cities": [
      {"Name": "Guwahati", "Nights": "2 Nights"},
      {"Name": "Shillong", "Nights": "3 Nights"},
      {"Name": "Cherrapunjee", "Nights": "1 Night"}
    ],
    "itinerary": [
      {"Title": "Arrival at Guwahati", "Dest": "Guwahati", "Content": "Arrive at Guwahati airport. Check-in to your hotel. Visit Kamakhya Temple and enjoy an evening sunset cruise on the Brahmaputra River. Overnight in Guwahati."},
      {"Title": "Guwahati to Shillong", "Dest": "Shillong", "Content": "Drive to Shillong. En route stop at Umiam Lake for scenic views. Check in at hotel in Shillong. Overnight stay."},
      {"Title": "Dawki & Mawlynnong", "Dest": "Shillong", "Content": "Full day excursion to Mawlynnong and Dawki. Return to Shillong. Overnight stay."},
      {"Title": "Shillong to Cherrapunjee", "Dest": "Cherrapunjee", "Content": "Drive to Cherrapunjee. Visit Elephant Falls, Shillong Peak, Nohkalikai Falls, Mawsmai Caves, and Seven Sisters Falls. Overnight at Cherrapunjee."},
      {"Title": "Cherrapunjee to Guwahati", "Dest": "Guwahati", "Content": "Morning at leisure or hike to the Double Decker Living Root Bridge. Later drive back to Guwahati. Overnight in Guwahati."},
      {"Title": "Departure", "Dest": "Guwahati", "Content": "After breakfast, transfer to Guwahati airport/station for your onward journey."}
    ]
  },
  {
    "filename": "short-break-coorg-mysore.html",
    "title": "Short Break to Coorg",
    "duration": "4 Nights / 5 Days",
    "region": "Karnataka",
    "places": "Mysore, Coorg",
    "type": "Wildlife & Plantations",
    "bg": "https://images.unsplash.com/photo-1623869680327-013baacf807e?w=1800",
    "overview": "Escape to the coffee estates of Coorg, known as the Scotland of India, combined with the royal heritage of Mysore.",
    "price": "On Request",
    "price_tax": "Per Person on Twin Sharing",
    "departing": "Bangalore",
    "cities": [
      {"Name": "Mysore", "Nights": "2 Nights"},
      {"Name": "Coorg", "Nights": "2 Nights"}
    ],
    "itinerary": [
      {"Title": "Bangalore to Mysore", "Dest": "Mysore", "Content": "Pick up from Bangalore. Drive to Mysore. Arrive in Mysore, check in, and visit the illuminated Brindavan Gardens in the evening. Overnight in Mysore."},
      {"Title": "Mysore Sightseeing", "Dest": "Mysore", "Content": "After breakfast, visit the majestic Mysore Palace, Chamundi Hills, Nandi Bull, and St. Philomenas Church. Overnight in Mysore."},
      {"Title": "Mysore to Coorg", "Dest": "Coorg", "Content": "Drive to Coorg via the Tibetan settlement of Bylakuppe. Check in to the hotel in Madikeri. Evening at leisure. Overnight in Coorg."},
      {"Title": "Coorg Sightseeing", "Dest": "Coorg", "Content": "Visit Abbey Falls, Omkareshwara Temple, Madikeri Fort, and Rajas Seat for a beautiful sunset viewing. Return to the hotel. Overnight in Coorg."},
      {"Title": "Departure to Bangalore", "Dest": "Bangalore", "Content": "Check out and drive back to Bangalore for your drop off."}
    ]
  },
  {
    "filename": "himalayan-triangle.html",
    "title": "Himalayan Triangle",
    "duration": "6 Nights / 7 Days",
    "region": "Himachal",
    "places": "Shimla, Manali, Chandigarh",
    "type": "Mountains",
    "bg": "https://images.unsplash.com/photo-1593693397690-362bb9a11863?w=1800",
    "overview": "An extended trip covering the queen of hills, Shimla, the adventure hub of Manali, and the architectural wonder of Chandigarh. Enjoy snow points, historic sites, and amazing mountain passes.",
    "price": "On Request",
    "price_tax": "Per Person on Twin Sharing",
    "departing": "Delhi / Chandigarh",
    "cities": [
      {"Name": "Shimla", "Nights": "2 Nights"},
      {"Name": "Manali", "Nights": "3 Nights"},
      {"Name": "Chandigarh", "Nights": "1 Night"}
    ],
    "itinerary": [
      {"Title": "Transfer to Shimla", "Dest": "Shimla", "Content": "Start your journey from Delhi/Chandigarh to Shimla. Check into your hotel. Evening walk on the Mall Road. Overnight in Shimla."},
      {"Title": "Kufri Excursion", "Dest": "Shimla", "Content": "Full day excursion to Kufri for snow activities and local sights like Jakhoo Temple. Overnight in Shimla."},
      {"Title": "Shimla to Manali", "Dest": "Manali", "Content": "Scenic drive to Manali via Kullu Valley. Stop at Kullu for shawl factories and optional river rafting. Check-in and overnight in Manali."},
      {"Title": "Manali Sightseeing", "Dest": "Manali", "Content": "Visit Hadimba Temple, Vashisht Hot Springs, and Tibetan Monasteries. Evening free for Mall Road. Overnight in Manali."},
      {"Title": "Solang Valley", "Dest": "Manali", "Content": "Full day tour to Solang Valley for adventure sports or Rohtang Pass. Overnight in Manali."},
      {"Title": "Manali to Chandigarh", "Dest": "Chandigarh", "Content": "Long drive back to the plains. Arrive in Chandigarh. Check-in and relax. Overnight in Chandigarh."},
      {"Title": "Departure", "Dest": "Chandigarh", "Content": "Morning visit to the Rock Garden and Sukhna Lake. Later, transfer to Chandigarh airport/station."}
    ]
  }
]
"@

$data = $json | ConvertFrom-Json

foreach ($item in $data) {
    Write-Host "Processing $($item.filename)..."
    
    $city_widgets = ""
    foreach ($c in $item.cities) {
        $cName = $c.Name
        $cNights = $c.Nights
        $city_widgets += "<div style='flex:1; text-align:center; min-width:80px;'><div style='font-size:1.6rem; margin-bottom:6px;'>&#128205;</div><div style='font-weight:700; color:var(--navy); font-size:0.9rem;'>$cName</div><div style='font-size:0.78rem; color:var(--text-light);'>$cNights</div></div>"
    }

    $itinerary_html = ""
    $day = 1
    foreach ($i in $item.itinerary) {
        $iTitle = $i.Title
        $iDest = $i.Dest
        $iContent = $i.Content
        $itinerary_html += "<div class='itinerary-item'><div class='day-marker'>$day</div><div class='day-header'><h3 class='day-title'>$iTitle</h3><span class='day-dest'>$iDest</span></div><div class='day-content'>$iContent</div></div>"
        $day++
    }

    $html = $template
    $html = $html.Replace("{{package_title}}", $item.title)
    $html = $html.Replace("{{duration}}", $item.duration)
    $html = $html.Replace("{{region}}", $item.region)
    $html = $html.Replace("{{places}}", $item.places)
    $html = $html.Replace("{{type}}", $item.type)
    $html = $html.Replace("{{bg_image}}", $item.bg)
    $html = $html.Replace("{{overview}}", $item.overview)
    $html = $html.Replace("{{city_widgets}}", $city_widgets)
    $html = $html.Replace("{{itinerary_html}}", $itinerary_html)
    $html = $html.Replace("{{price}}", $item.price)
    $html = $html.Replace("{{price_tax}}", $item.price_tax)
    $html = $html.Replace("{{departing}}", $item.departing)

    [System.IO.File]::WriteAllText("c:\Users\sai\Desktop\travelspark\packages\$($item.filename)", $html, [System.Text.Encoding]::UTF8)
}
Write-Host "Done!"
