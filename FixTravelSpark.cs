using System;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;

namespace FixTravelSpark
{
    class Program
    {
        static void Main(string[] args)
        {
            string baseDir = @"c:\Users\sai\Desktop\travelspark";
            string[] filesToFix = {
                @"index.html",
                @"packages\international.html",
                @"packages\domestic.html",
                @"packages\group-tours.html",
                @"packages\charming-singapore-with-malaysia.html",
                @"packages\dubai.html",
                @"packages\europe.html",
                @"packages\georgia.html",
                @"packages\japan.html",
                @"packages\maldives.html",
                @"packages\philippines.html",
                @"packages\vietnam.html"
            };

            Encoding utf8 = new UTF8Encoding(false); // No BOM

            foreach (string relFile in filesToFix)
            {
                string fullPath = Path.Combine(baseDir, relFile);
                if (!File.Exists(fullPath)) continue;

                string content = File.ReadAllText(fullPath, utf8);
                bool modified = false;

                // 1. Fix broken Emojis / Characters caused by previous bad script
                string[] broken = { "â–¾", "ðŸŒ ", "ðŸ‘¥", "ðŸ‡®ðŸ‡³", "ðŸ“ž", "A ", ",1", "dYO?", "dY`""??dY`c??dY` ??dY`", "o^,?", "dY`", "dYrdY3", "dY""z" };
                string[] fixedCh = { "▾", "🌍 ", "👥 ", "🇮🇳 ", "📞", "· ", "₹", "🌍", "👨‍👩‍👧‍👦", "✨", "👥", "🇮🇳", "📞" };

                for (int i = 0; i < broken.Length; i++)
                {
                    if (content.Contains(broken[i]))
                    {
                        content = content.Replace(broken[i], fixedCh[i]);
                        modified = true;
                    }
                }

                // 2. Fix the link connections in index.html and international.html
                if (relFile == "index.html")
                {
                    string m1 = content;
                    content = content.Replace("\"destinations/europe.html\"", "\"packages/europe.html\"");
                    content = content.Replace("\"destinations/japan.html\"", "\"packages/japan.html\"");
                    content = content.Replace("\"destinations/dubai.html\"", "\"packages/dubai.html\"");
                    content = content.Replace("\"destinations/maldives.html\"", "\"packages/maldives.html\"");
                    content = content.Replace("\"destinations/georgia.html\"", "\"packages/georgia.html\"");
                    content = content.Replace("\"destinations/singapore.html\"", "\"packages/charming-singapore-with-malaysia.html\"");
                    content = content.Replace("\"group-tours.html\"", "\"packages/group-tours.html\"");
                    content = content.Replace("\"domestic.html\"", "\"packages/domestic.html\"");
                    content = content.Replace("\"international.html\"", "\"packages/international.html\"");
                    if (m1 != content) modified = true;
                }

                if (relFile == @"packages\international.html")
                {
                    // Book Now buttons should link to the individual pages, not contact.html
                    // We can just regex replace the "Book Now" links based on the package heading
                    string m1 = content;
                    content = Regex.Replace(content, @"<h3>Flavours of Japan</h3>.*?<a href=""../contact.html""", "<h3>Flavours of Japan</h3><p class=\"pkg-dest-list\">Tokyo · Kyoto · Osaka</p><div class=\"pkg-tags\"><span class=\"pkg-tag\">Hotels</span><span class=\"pkg-tag\">Bullet Train</span></div><div class=\"pkg-footer\"><div><div class=\"pkg-price-lbl\">From</div><div class=\"pkg-price\">₹75,000</div></div><a href=\"japan.html\"");
                    content = Regex.Replace(content, @"<h3>European Jewels with London</h3>.*?<a href=""../contact.html""", "<h3>European Jewels with London</h3><p class=\"pkg-dest-list\">London · Paris · Swiss Alps · Cologne · Brussels · Amsterdam</p><div class=\"pkg-tags\"><span class=\"pkg-tag\">Flights Incl.</span><span class=\"pkg-tag\">Meals</span></div><div class=\"pkg-footer\"><div><div class=\"pkg-price-lbl\">From</div><div class=\"pkg-price\">₹1,32,000</div></div><a href=\"europe.html\"");
                    content = Regex.Replace(content, @"<h3>Spectacular Dubai</h3>.*?<a href=""../contact.html""", "<h3>Spectacular Dubai</h3><p class=\"pkg-dest-list\">Dubai City · Desert Safari · Burj Khalifa</p><div class=\"pkg-tags\"><span class=\"pkg-tag\">Flights Incl.</span><span class=\"pkg-tag\">Transfers</span></div><div class=\"pkg-footer\"><div><div class=\"pkg-price-lbl\">From</div><div class=\"pkg-price\">₹45,000</div></div><a href=\"dubai.html\"");
                    content = Regex.Replace(content, @"<h3>Mesmerizing Maldives</h3>.*?<a href=""../contact.html""", "<h3>Mesmerizing Maldives</h3><p class=\"pkg-dest-list\">Male · Kandooma Island</p><div class=\"pkg-tags\"><span class=\"pkg-tag\">Speedboat</span><span class=\"pkg-tag\">Water Villa</span></div><div class=\"pkg-footer\"><div><div class=\"pkg-price-lbl\">From</div><div class=\"pkg-price\">₹85,000</div></div><a href=\"maldives.html\"");
                    content = Regex.Replace(content, @"<h3>Classic Vietnam</h3>.*?<a href=""../contact.html""", "<h3>Classic Vietnam</h3><p class=\"pkg-dest-list\">Hanoi · Halong Bay · Da Nang · Ho Chi Minh City</p><div class=\"pkg-tags\"><span class=\"pkg-tag\">Cruise</span><span class=\"pkg-tag\">Flights Incl.</span></div><div class=\"pkg-footer\"><div><div class=\"pkg-price-lbl\">From</div><div class=\"pkg-price\">₹52,000</div></div><a href=\"vietnam.html\"");
                    content = Regex.Replace(content, @"<h3>Vibrant Philippines</h3>.*?<a href=""../contact.html""", "<h3>Vibrant Philippines</h3><p class=\"pkg-dest-list\">Manila · Boracay Island</p><div class=\"pkg-tags\"><span class=\"pkg-tag\">Island Hopping</span><span class=\"pkg-tag\">Beach Resort</span></div><div class=\"pkg-footer\"><div><div class=\"pkg-price-lbl\">From</div><div class=\"pkg-price\">₹42,900</div></div><a href=\"philippines.html\"");
                    content = Regex.Replace(content, @"<h3>Jewels of Georgia</h3>.*?<a href=""../contact.html""", "<h3>Jewels of Georgia</h3><p class=\"pkg-dest-list\">Tbilisi · Kazbegi · Mtskheta · Kakheti</p><div class=\"pkg-tags\"><span class=\"pkg-tag\">Wine Tour</span><span class=\"pkg-tag\">Mountains</span></div><div class=\"pkg-footer\"><div><div class=\"pkg-price-lbl\">From</div><div class=\"pkg-price\">₹38,000</div></div><a href=\"georgia.html\"");
                    content = Regex.Replace(content, @"<h3>Charming Singapore.*</h3>.*?<a href=""../contact.html""", "<h3>Charming Singapore with Malaysia</h3><p class=\"pkg-dest-list\">Singapore · Kuala Lumpur</p><div class=\"pkg-tags\"><span class=\"pkg-tag\">Theme Parks</span><span class=\"pkg-tag\">City Tour</span></div><div class=\"pkg-footer\"><div><div class=\"pkg-price-lbl\">From</div><div class=\"pkg-price\">₹58,000</div></div><a href=\"charming-singapore-with-malaysia.html\"");
                    if (m1 != content) modified = true;
                }

                if (modified)
                {
                    File.WriteAllText(fullPath, content, utf8);
                    Console.WriteLine("Fixed: " + relFile);
                }
            }
            Console.WriteLine("Done");
        }
    }
}
