. .\generate_packages.ps1

Generate-Package -filename "andaman-package.html" `
    -title "Enchanting Andaman" `
    -duration "5 Nights / 6 Days" `
    -region "Andaman" `
    -places "Port Blair, Havelock" `
    -type "Beaches & Leisure" `
    -bg "https://images.unsplash.com/photo-1588602641570-5b5ea6c4bcba?w=1800&q=80" `
    -overview "Experience the pristine beaches, azure waters, and rich colonial history of the Andaman Islands. This 6-day tour covers the top attractions in Port Blair and the breathtaking Radhanagar Beach in Havelock Island." `
    -price "On Request" `
    -price_tax "Per Person on Twin Sharing · Excl. 5% GST" `
    -departing "Port Blair" `
    -cities @(
        @{Name="Port Blair"; Nights="3 Nights"},
        @{Name="Havelock"; Nights="2 Nights"}
    ) `
    -itinerary @(
        @{Title="Arrival at Port Blair & Cellular Jail"; Dest="Port Blair"; Content="Arrive in Port Blair, the capital city. Check into your hotel. In the afternoon, visit the historic Cellular Jail followed by the moving Light & Sound Show in the evening. Overnight at Port Blair."},
        @{Title="Port Blair to Havelock - Radhanagar Beach"; Dest="Havelock"; Content="Post breakfast, board a ferry to Havelock Island. Check-in to your hotel. Visit the world-famous Radhanagar Beach, known for its white sand and breathtaking sunset. Overnight at Havelock."},
        @{Title="Elephant Beach Excursion"; Dest="Havelock"; Content="Morning trip to Elephant Beach, famous for its coral reefs and water sports. Enjoy snorkeling (subject to availability/weather). Return to hotel. Overnight at Havelock."},
        @{Title="Return to Port Blair"; Dest="Port Blair"; Content="Check out from Havelock and board the ferry back to Port Blair. Evening at leisure for shopping or relaxing at the hotel. Overnight at Port Blair."},
        @{Title="Ross Island & North Bay"; Dest="Port Blair"; Content="Enjoy a full-day excursion to Ross Island (the erstwhile capital during the British regime) and North Bay (Coral Island) offering excellent snorkeling opportunities. Overnight at Port Blair."},
        @{Title="Departure"; Dest="Port Blair"; Content="After breakfast, check out from the hotel and proceed to the airport for your return flight with infinite memories of the islands."}
    )

Generate-Package -filename "do-dham-yatra-kedarnath.html" `
    -title "Do Dham Yatra with Kedarnath Helicopter" `
    -duration "5 Nights / 6 Days" `
    -region "Uttarakhand" `
    -places "Haridwar, Guptkashi, Kedarnath, Badrinath" `
    -type "Pilgrimage" `
    -bg "https://images.unsplash.com/photo-1627885233076-7cb058e5a31a?w=1800&q=80" `
    -overview "Embark on a divine spiritual journey to the sacred shrines of Kedarnath and Badrinath. Experience the majesty of the Himalayas while seeking blessings. Includes a premium helicopter ride to Kedarnath for convenience." `
    -price "On Request" `
    -price_tax "Per Person on Twin Sharing · Excl. 5% GST" `
    -departing "Haridwar / Dehradun" `
    -cities @(
        @{Name="Guptkashi"; Nights="2 Nights"},
        @{Name="Kedarnath"; Nights="1 Night"},
        @{Name="Badrinath"; Nights="1 Night"},
        @{Name="Rudraprayag"; Nights="1 Night"}
    ) `
    -itinerary @(
        @{Title="Haridwar - Guptkashi"; Dest="Guptkashi"; Content="Start your journey towards Guptkashi via Devprayag and Rudraprayag. Arrive, check-in to your hotel, and relax for the evening. Overnight stay at Guptkashi."},
        @{Title="Guptkashi - Kedarnath (By Helicopter)"; Dest="Kedarnath"; Content="Proceed to the Helipad for a flight to Kedarnath. Arrive at Kedarnath, check-in to your accommodation, and visit the sacred Kedarnath Temple for Darshan. Overnight stay at Kedarnath."},
        @{Title="Kedarnath - Guptkashi"; Dest="Guptkashi"; Content="After morning Darshan, return to the Helipad to fly back to Guptkashi. Spend the rest of the day at leisure reflecting on the spiritual experience. Overnight stay at Guptkashi."},
        @{Title="Guptkashi - Badrinath"; Dest="Badrinath"; Content="Drive to Badrinath via Joshimath. Upon arrival, check-in to the hotel. Take a holy dip in Tapt Kund followed by Darshan of Badrivishal. Overnight stay at Badrinath."},
        @{Title="Badrinath - Rudraprayag"; Dest="Rudraprayag"; Content="Visit Mana Village, Vyas Gufa, and Mata Murti Temple in the morning. Later, drive down to Rudraprayag / Srinagar for the night check-in. Overnight stay."},
        @{Title="Rudraprayag - Haridwar"; Dest="Haridwar"; Content="Drive back to Haridwar via Rishikesh. Visit Ram Jhula and Laxman Jhula if time permits. Tour concludes upon arrival in Haridwar."}
    )

Generate-Package -filename "essence-of-kerala.html" `
    -title "Essence of Kerala" `
    -duration "4 Nights / 5 Days" `
    -region "Kerala" `
    -places "Munnar, Thekkady, Alleppey" `
    -type "Family & Nature" `
    -bg "https://images.unsplash.com/photo-1602216056096-3b40cc0c9944?w=1800&q=80" `
    -overview "Discover the true essence of God's Own Country. Wind through the sprawling tea gardens of Munnar, experience the spice plantations and wildlife of Thekkady, and cruise the tranquil backwaters of Alleppey in your private houseboat." `
    -price "On Request" `
    -price_tax "Per Person on Twin Sharing · Excl. 5% GST" `
    -departing "Kochi (Cochin)" `
    -cities @(
        @{Name="Munnar"; Nights="2 Nights"},
        @{Name="Thekkady"; Nights="1 Night"},
        @{Name="Alleppey"; Nights="1 Night"}
    ) `
    -itinerary @(
        @{Title="Arrival at Cochin & Drive to Munnar"; Dest="Munnar"; Content="Arrive at Cochin Airport/Station. Meet our representative and drive to Munnar, enjoying scenic waterfalls and tea gardens en route. Check-in to the hotel. Overnight stay at Munnar."},
        @{Title="Munnar Sightseeing"; Dest="Munnar"; Content="Post breakfast, go for a full day sightseeing of Munnar. Visit Mattupetty Dam, Echo Point, Tea Museum, and Eravikulam National Park. Return to hotel for overnight stay."},
        @{Title="Munnar to Thekkady"; Dest="Thekkady"; Content="Drive to Thekkady (Periyar). Check-in to your hotel. Later, visit spice plantations or take an optional boat ride in Periyar Lake to spot wildlife. Overnight stay at Thekkady."},
        @{Title="Thekkady to Alleppey (Houseboat)"; Dest="Alleppey"; Content="Drive to Alleppey, the Venice of the East. Board your traditional houseboat at noon. Enjoy a scenic cruise through the backwaters, taking in village life. Meals served on board. Overnight stay in Houseboat."},
        @{Title="Departure from Cochin"; Dest="Cochin"; Content="After breakfast on the houseboat, disembark and drive back to Cochin for your return flight/train journey."}
    )

Generate-Package -filename "fascinating-gujarat.html" `
    -title "Fascinating Gujarat" `
    -duration "6 Nights / 7 Days" `
    -region "Gujarat" `
    -places "Ahmedabad, Dwarka, Somnath, Sasan Gir" `
    -type "Heritage & Wildlife" `
    -bg "https://images.unsplash.com/photo-1620612261623-0182fcff27a3?w=1800&q=80" `
    -overview "Experience the vibrant culture, rich heritage, and spiritual aura of Gujarat. Visit the magnificent temples of Dwarka and Somnath, explore Gandhi's ashram in Ahmedabad, and spot majestic Asiatic Lions in Gir National Park." `
    -price "On Request" `
    -price_tax "Per Person on Twin Sharing · Excl. 5% GST" `
    -departing "Ahmedabad" `
    -cities @(
        @{Name="Ahmedabad"; Nights="1 Night"},
        @{Name="Dwarka"; Nights="2 Nights"},
        @{Name="Somnath"; Nights="1 Night"},
        @{Name="Sasan Gir"; Nights="1 Night"},
        @{Name="Ahmedabad"; Nights="1 Night"}
    ) `
    -itinerary @(
        @{Title="Arrival in Ahmedabad"; Dest="Ahmedabad"; Content="Arrive at Ahmedabad and check in. Visit Gandhi Ashram, Akshardham Temple and Adalaj Stepwell. Overnight at Ahmedabad."},
        @{Title="Ahmedabad to Dwarka"; Dest="Dwarka"; Content="Drive to Dwarka. Upon arrival, check in and later attend the evening Aarti at the famous Dwarkadhish Temple. Overnight at Dwarka."},
        @{Title="Dwarka Sightseeing"; Dest="Dwarka"; Content="Visit Bet Dwarka, Nageshwar Jyotirlinga, and the Rukmini Temple. Spend the evening at Gomti Ghat. Overnight at Dwarka."},
        @{Title="Dwarka to Somnath via Porbandar"; Dest="Somnath"; Content="Drive to Somnath. En route stop at Porbandar to visit Kirti Mandir (Mahatma Gandhi's birthplace). Arrive at Somnath, visit the Somnath Temple and enjoy the evening Sound and Light show. Overnight at Somnath."},
        @{Title="Somnath to Sasan Gir"; Dest="Sasan Gir"; Content="Drive a short distance to Sasan Gir, the home of the Asiatic Lion. Check into your wildlife resort and relax or take an afternoon jungle safari (cost extra). Overnight at Gir."},
        @{Title="Sasan Gir to Ahmedabad"; Dest="Ahmedabad"; Content="Early morning safari (optional). After breakfast, drive back to Ahmedabad. Check in and relax for the evening. Overnight at Ahmedabad."},
        @{Title="Departure"; Dest="Ahmedabad"; Content="After breakfast, transfer to Ahmedabad airport/station for your onward journey."}
    )

Generate-Package -filename "goa-escape-neelam.html" `
    -title "Goa Escape (Neelam The Grand)" `
    -duration "3 Nights / 4 Days" `
    -region "Goa" `
    -places "North Goa" `
    -type "Leisure & Beaches" `
    -bg "https://images.unsplash.com/photo-1549893072-4bc678117f45?w=1800&q=80" `
    -overview "A rejuvenating short break in the party capital of India. Stay in a premium property, relax by the pool, explore pristine beaches of North Goa, and indulge in amazing coastal cuisine." `
    -price "On Request" `
    -price_tax "Per Person on Twin Sharing · Excl. 5% GST" `
    -departing "Goa (Dabolim/Mopa)" `
    -cities @(
        @{Name="Goa"; Nights="3 Nights"}
    ) `
    -itinerary @(
        @{Title="Arrival in Goa"; Dest="Goa"; Content="Arrive in Goa. Our representative will transfer you to your hotel (Neelam The Grand or similar). Rest of the day is at leisure to explore the nearby beaches. Overnight at hotel."},
        @{Title="North Goa Sightseeing"; Dest="Goa"; Content="Post breakfast, proceed for a half-day tour of North Goa visiting Fort Aguada, Calangute Beach, and Baga Beach. Evening at leisure. Overnight at hotel."},
        @{Title="Day at Leisure"; Dest="Goa"; Content="Enjoy a full day of leisure. Rent a two-wheeler, visit shacks, try water sports, or simply relax by the hotel pool. Overnight at hotel."},
        @{Title="Departure"; Dest="Goa"; Content="After breakfast, check out from the hotel and proceed to the Airport / Railway Station for your onward journey."}
    )
