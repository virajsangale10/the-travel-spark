. .\generate_packages.ps1

Generate-Package -filename "karnataka-explorer.html" `
    -title "Karnataka Explorer" `
    -duration "9 Nights / 10 Days" `
    -region "Karnataka" `
    -places "Bangalore, Mysore, Hassan, Hospet, Badami" `
    -type "Heritage" `
    -bg "https://images.unsplash.com/photo-1600100397608-f010f41ab446?w=1800&q=80" `
    -overview "A comprehensive 10-day tour exploring the rich cultural heritage and magnificent ancient temples of Karnataka. From the grand Mysore Palace to the impressive ruins of Hampi and architectural marvels of Badami." `
    -price "On Request" `
    -price_tax "Per Person on Twin Sharing · Excl. 5% GST" `
    -departing "Bangalore" `
    -cities @(
        @{Name="Bangalore"; Nights="1 Night"},
        @{Name="Mysore"; Nights="2 Nights"},
        @{Name="Hassan"; Nights="2 Nights"},
        @{Name="Hospet"; Nights="2 Nights"},
        @{Name="Badami"; Nights="2 Nights"}
    ) `
    -itinerary @(
        @{Title="Arrival in Bangalore"; Dest="Bangalore"; Content="Arrive in Bangalore. Transfer to hotel. Afternoon sightseeing including Lal Bagh Botanical Gardens, Vidhana Soudha, and Tipu Sultan's Palace. Overnight in Bangalore."},
        @{Title="Bangalore to Mysore"; Dest="Mysore"; Content="Drive to Mysore. En route visit Srirangapatna. Check in to the hotel and later visit the majestic Mysore Palace. Overnight in Mysore."},
        @{Title="Mysore Sightseeing"; Dest="Mysore"; Content="Full day tour visiting Chamundi Hill, St. Philomena's Church, and Brindavan Gardens in the evening. Overnight in Mysore."},
        @{Title="Mysore to Hassan"; Dest="Hassan"; Content="Drive to Hassan. En route visit Shravanabelagola to see the Gommateshwara statue. Arrive and check in. Overnight in Hassan."},
        @{Title="Belur & Halebid Excursion"; Dest="Hassan"; Content="Visit the stunning Hoysala temples of Belur and Halebid, famous for their intricate carvings. Return to Hassan for overnight stay."},
        @{Title="Hassan to Hospet (Hampi)"; Dest="Hospet"; Content="Long scenic drive to Hospet, the gateway to Hampi. Check in and relax. Overnight in Hospet."},
        @{Title="Exploring Hampi Ruins"; Dest="Hospet"; Content="Full day exploring the UNESCO World Heritage site of Hampi. Visit the Virupaksha Temple, Vittala Temple (Stone Chariot), and Royal Enclosure. Overnight in Hospet."},
        @{Title="Hospet to Badami"; Dest="Badami"; Content="Drive to Badami. Check in to the hotel. Visit the famous rock-cut cave temples of Badami in the afternoon. Overnight in Badami."},
        @{Title="Pattadakal & Aihole Excursion"; Dest="Badami"; Content="Visit the ancient temple complexes of Aihole and Pattadakal (UNESCO site), showcasing early Chalukyan architecture. Overnight in Badami."},
        @{Title="Departure from Hubli/Belgaum"; Dest="Hubli"; Content="After breakfast, drive to Hubli or Belgaum airport/station for your onward journey."}
    )

Generate-Package -filename "kashmir-heaven-on-earth.html" `
    -title "Kashmir - Heaven on Earth" `
    -duration "5 Nights / 6 Days" `
    -region "Kashmir" `
    -places "Srinagar, Gulmarg, Pahalgam" `
    -type "Family & Romance" `
    -bg "https://images.unsplash.com/photo-1595815771614-ade9d652a65d?w=1800&q=80" `
    -overview "Experience the unparalleled beauty of Paradise on Earth. Enjoy a Shikara ride on Dal Lake, witness the snow-capped peaks of Gulmarg, and stroll through the lush green valleys of Pahalgam." `
    -price "On Request" `
    -price_tax "Per Person on Twin Sharing · Excl. 5% GST" `
    -departing "Srinagar" `
    -cities @(
        @{Name="Srinagar"; Nights="2 Nights"},
        @{Name="Pahalgam"; Nights="2 Nights"},
        @{Name="Srinagar (Houseboat)"; Nights="1 Night"}
    ) `
    -itinerary @(
        @{Title="Arrival in Srinagar"; Dest="Srinagar"; Content="Arrive at Srinagar airport. Meet our representative and transfer to the hotel. Later, visit the famous Mughal Gardens: Nishat Bagh and Shalimar Bagh. Overnight at Srinagar hotel."},
        @{Title="Srinagar to Pahalgam"; Dest="Pahalgam"; Content="Drive to Pahalgam (Valley of Shepherds) via saffron fields at Pampore and Avantipura Ruins. Arrive and check-in. Enjoy the scenic beauty. Overnight at Pahalgam."},
        @{Title="Pahalgam Sightseeing"; Dest="Pahalgam"; Content="Day at leisure to explore Pahalgam. Optionally visit Betaab Valley, Aru Valley, and Chandanwari (local union taxis required, cost extra). Overnight at Pahalgam."},
        @{Title="Pahalgam to Gulmarg Day Trip - Srinagar"; Dest="Srinagar"; Content="Drive to Gulmarg (Meadow of Flowers). Enjoy the famous Gondola ride (Tickets extra/pre-booking recommended). Later return to Srinagar for an overnight stay."},
        @{Title="Srinagar - Houseboat Stay"; Dest="Srinagar"; Content="Check into a traditional Houseboat on Dal Lake. In the afternoon, enjoy a relaxing Shikara Ride on the lake. Overnight in Houseboat."},
        @{Title="Departure"; Dest="Srinagar"; Content="After breakfast, transfer to Srinagar airport for your onward flight."}
    )

Generate-Package -filename "ladakh-delight.html" `
    -title "Ladakh Delight" `
    -duration "5 Nights / 6 Days" `
    -region "Ladakh" `
    -places "Leh, Nubra Valley, Pangong Tso" `
    -type "Adventure & Scenic" `
    -bg "https://images.unsplash.com/photo-1581793745862-99fde7fa73d2?w=1800&q=80" `
    -overview "A thrilling expedition to the land of high passes. Drive through Khardung La, the highest motorable road, ride the double-humped camels in Nubra Valley, and camp by the mesmerizing blue waters of Pangong Lake." `
    -price "On Request" `
    -price_tax "Per Person on Twin Sharing · Excl. inner line permits & GST" `
    -departing "Leh" `
    -cities @(
        @{Name="Leh"; Nights="3 Nights"},
        @{Name="Nubra Valley"; Nights="1 Night"},
        @{Name="Pangong"; Nights="1 Night"}
    ) `
    -itinerary @(
        @{Title="Arrival in Leh"; Dest="Leh"; Content="Arrive in Leh and transfer to hotel. Rest of the day is crucial for acclimatization to the high altitude. Late afternoon visit to Shanti Stupa. Overnight in Leh."},
        @{Title="Leh Local / Sham Valley"; Dest="Leh"; Content="Drive towards Sham Valley. Visit Hall of Fame, Magnetic Hill, Gurudwara Pathar Sahib, and Sangam (Confluence of Zanskar and Indus rivers). Overnight in Leh."},
        @{Title="Leh to Nubra Valley via Khardung La"; Dest="Nubra Valley"; Content="Drive to Nubra Valley via Khardung La Pass (highest motorable road). Arrive at Hunder. Check into camps. Enjoy a ride on the bactrian camel among the sand dunes. Overnight in Nubra."},
        @{Title="Nubra to Pangong Tso via Shyok"; Dest="Pangong"; Content="After breakfast, visit Diskit Monastery. Later drive to Pangong Lake via the Shyok river route. The mesmerizing multi-hued lake will leave you spellbound. Overnight in camps at Pangong."},
        @{Title="Pangong to Leh via Chang La"; Dest="Leh"; Content="Wake up to a beautiful sunrise at Pangong. Later drive back to Leh passing through Chang La pass. Arrive and relax. Evening free for shopping in Leh market. Overnight in Leh."},
        @{Title="Departure"; Dest="Leh"; Content="Early morning transfer to Leh airport to board your flight back home."}
    )

Generate-Package -filename "northeast-odyssey.html" `
    -title "Northeast Odyssey (Assam & Meghalaya)" `
    -duration "6 Nights / 7 Days" `
    -region "North-East" `
    -places "Guwahati, Shillong, Cherrapunjee" `
    -type "Nature & Culture" `
    -bg "https://images.unsplash.com/photo-1596788062835-263be0b82eb9?w=1800&q=80" `
    -overview "Explore the pristine beauty of Northeast India. Ascend into the clouds in Meghalaya, marvel at living root bridges in Cherrapunjee, and cruise the mighty Brahmaputra river in Assam." `
    -price "On Request" `
    -price_tax "Per Person on Twin Sharing · Excl. 5% GST" `
    -departing "Guwahati" `
    -cities @(
        @{Name="Guwahati"; Nights="2 Nights"},
        @{Name="Shillong"; Nights="3 Nights"},
        @{Name="Cherrapunjee"; Nights="1 Night"}
    ) `
    -itinerary @(
        @{Title="Arrival at Guwahati"; Dest="Guwahati"; Content="Arrive at Guwahati airport/station. Check-in to your hotel. Visit Kamakhya Temple and enjoy an evening sunset cruise on the Brahmaputra River (optional). Overnight in Guwahati."},
        @{Title="Guwahati to Shillong"; Dest="Shillong"; Content="Drive to Shillong (Scotland of the East). En route stop at Umiam Lake (Barapani) for water sports and scenic views. Check in at hotel in Shillong. Overnight stay."},
        @{Title="Day trip to Dawki & Mawlynnong"; Dest="Shillong"; Content="Full day excursion to Mawlynnong (Asia’s cleanest village) and Dawki (Umngot river with crystal clear waters near Bangladesh border). Return to Shillong. Overnight stay."},
        @{Title="Shillong to Cherrapunjee"; Dest="Cherrapunjee"; Content="Drive to Cherrapunjee. Visit Elephant Falls, Shillong Peak, Nohkalikai Falls, Mawsmai Caves, and Seven Sisters Falls. Check into hotel. Overnight at Cherrapunjee."},
        @{Title="Cherrapunjee to Guwahati"; Dest="Guwahati"; Content="Morning at leisure or hike to the Double Decker Living Root Bridge (Requires good fitness). Later drive back to Guwahati. Overnight in Guwahati."},
        @{Title="Departure"; Dest="Guwahati"; Content="After breakfast, transfer to Guwahati airport/station for your onward journey."}
    )

Generate-Package -filename "short-break-coorg-mysore.html" `
    -title "Short Break to Coorg & Mysore" `
    -duration "4 Nights / 5 Days" `
    -region "Karnataka" `
    -places "Mysore, Coorg" `
    -type "Wildlife & Plantations" `
    -bg "https://images.unsplash.com/photo-1623869680327-013baacf807e?w=1800&q=80" `
    -overview "Escape to the coffee estates of Coorg, known as the Scotland of India, combined with the royal heritage of Mysore. A relaxing getaway packed with greenery, waterfalls, and cultural spectacles." `
    -price "On Request" `
    -price_tax "Per Person on Twin Sharing · Excl. 5% GST" `
    -departing "Bangalore" `
    -cities @(
        @{Name="Mysore"; Nights="2 Nights"},
        @{Name="Coorg"; Nights="2 Nights"}
    ) `
    -itinerary @(
        @{Title="Bangalore to Mysore"; Dest="Mysore"; Content="Pick up from Bangalore. Drive to Mysore. En route visit Srirangapatna. Arrive in Mysore, check in, and visit the illuminated Brindavan Gardens in the evening. Overnight in Mysore."},
        @{Title="Mysore Sightseeing"; Dest="Mysore"; Content="After breakfast, visit the majestic Mysore Palace, Chamundi Hills, Nandi Bull, and St. Philomena’s Church. Overnight in Mysore."},
        @{Title="Mysore to Coorg (Madikeri)"; Dest="Coorg"; Content="Drive to Coorg via the Tibetan settlement of Bylakuppe (Golden Temple) and Nisargadhama. Check in to the hotel in Madikeri. Evening at leisure. Overnight in Coorg."},
        @{Title="Coorg Sightseeing"; Dest="Coorg"; Content="Visit Abbey Falls, Omkareshwara Temple, Madikeri Fort, and Raja’s Seat for a beautiful sunset viewing. Return to the hotel for a peaceful night stay."},
        @{Title="Departure to Bangalore"; Dest="Bangalore"; Content="Check out and drive back to Bangalore for your drop off at the airport/station."}
    )

Generate-Package -filename "himalayan-triangle.html" `
    -title "The Himalayan Triangle" `
    -duration "6 Nights / 7 Days" `
    -region "Himachal & Punjab" `
    -places "Shimla, Manali, Chandigarh" `
    -type "Mountains" `
    -bg "https://images.unsplash.com/photo-1593693397690-362bb9a11863?w=1800&q=80" `
    -overview "An extended trip covering the queen of hills, Shimla, the adventure hub of Manali, and the architectural wonder of Chandigarh. Enjoy snow points, historic sites, and amazing mountain passes." `
    -price "On Request" `
    -price_tax "Per Person on Twin Sharing · Excl. 5% GST" `
    -departing "Delhi / Chandigarh" `
    -cities @(
        @{Name="Shimla"; Nights="2 Nights"},
        @{Name="Manali"; Nights="3 Nights"},
        @{Name="Chandigarh"; Nights="1 Night"}
    ) `
    -itinerary @(
        @{Title="Arrival & Transfer to Shimla"; Dest="Shimla"; Content="Start your journey from Delhi/Chandigarh to Shimla. Check into your hotel. Evening walk on the Mall Road. Overnight in Shimla."},
        @{Title="Kufri Excursion"; Dest="Shimla"; Content="Full day excursion to Kufri for snow activities and local sights like Jakhoo Temple. Overnight in Shimla."},
        @{Title="Shimla to Manali"; Dest="Manali"; Content="Scenic drive to Manali via Kullu Valley. Stop at Kullu for shawl factories and optional river rafting. Check-in and overnight in Manali."},
        @{Title="Manali Local Sightseeing"; Dest="Manali"; Content="Visit Hadimba Temple, Vashisht Hot Springs, and Tibetan Monasteries. Evening free for Mall Road. Overnight in Manali."},
        @{Title="Solang Valley / Rohtang Pass"; Dest="Manali"; Content="Full day tour to Solang Valley for adventure sports or Rohtang Pass (subject to weather/permits/extra cost). Overnight in Manali."},
        @{Title="Manali to Chandigarh"; Dest="Chandigarh"; Content="Long drive back to the plains. Arrive in Chandigarh. Check-in and relax. Overnight in Chandigarh."},
        @{Title="Departure"; Dest="Chandigarh"; Content="Morning visit to the Rock Garden and Sukhna Lake. Later, transfer to Chandigarh airport/station or drive back to Delhi for drop-off."}
    )
