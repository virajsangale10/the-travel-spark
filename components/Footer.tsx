import Link from "next/link";

export default function Footer() {
  return (
    <footer className="bg-primary-dark text-white">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        {/* CTA Section */}
        <div className="py-16 border-b border-white/10">
          <div className="bg-gradient-to-r from-accent/20 to-primary/20 rounded-2xl p-12 text-center">
            <h3 className="text-3xl md:text-4xl font-bold mb-4">
              Ready for Your Next Adventure?
            </h3>
            <p className="text-lg text-white/80 max-w-2xl mx-auto mb-8">
              Join thousands of travelers who've discovered unforgettable experiences with Travel Spark
            </p>
            <button className="px-8 py-3.5 bg-gradient-to-r from-accent to-accent-dark text-primary-dark font-bold rounded-lg hover:shadow-lg transition-smooth hover:-translate-y-1">
              Start Planning Now
            </button>
          </div>
        </div>

        {/* Main Footer */}
        <div className="py-16 grid grid-cols-1 md:grid-cols-4 gap-12 mb-12">
          {/* Brand */}
          <div>
            <div className="flex items-center gap-2 mb-6">
              <div className="w-10 h-10 bg-gradient-to-br from-accent to-primary rounded-lg flex items-center justify-center">
                <span className="text-primary-dark font-bold text-lg">TS</span>
              </div>
              <span className="text-xl font-bold">Travel Spark</span>
            </div>
            <p className="text-white/70 mb-6 leading-relaxed">
              Discover the world with confidence. Expert travel planning for unforgettable adventures.
            </p>
            <div className="flex gap-4">
              <a
                href="#"
                className="w-10 h-10 rounded-lg bg-white/10 hover:bg-accent transition-smooth flex items-center justify-center"
                aria-label="Facebook"
              >
                <svg className="w-5 h-5" fill="currentColor" viewBox="0 0 24 24">
                  <path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z" />
                </svg>
              </a>
              <a
                href="#"
                className="w-10 h-10 rounded-lg bg-white/10 hover:bg-accent transition-smooth flex items-center justify-center"
                aria-label="Twitter"
              >
                <svg className="w-5 h-5" fill="currentColor" viewBox="0 0 24 24">
                  <path d="M23.953 4.57a10 10 0 01-2.825.775 4.958 4.958 0 002.163-2.723c-.951.555-2.005.959-3.127 1.184a4.92 4.92 0 00-8.384 4.482C7.69 8.095 4.067 6.13 1.64 3.162a4.822 4.822 0 00-.666 2.475c0 1.71.87 3.213 2.188 4.096a4.904 4.904 0 01-2.228-.616v.06a4.923 4.923 0 003.946 4.827 4.996 4.996 0 01-2.212.085 4.936 4.936 0 004.604 3.417 9.867 9.867 0 01-6.102 2.105c-.39 0-.779-.023-1.17-.067a13.995 13.995 0 007.557 2.209c9.053 0 13.998-7.496 13.998-13.985 0-.21 0-.42-.015-.63A9.935 9.935 0 0024 4.59z" />
                </svg>
              </a>
              <a
                href="#"
                className="w-10 h-10 rounded-lg bg-white/10 hover:bg-accent transition-smooth flex items-center justify-center"
                aria-label="Instagram"
              >
                <svg className="w-5 h-5" fill="currentColor" viewBox="0 0 24 24">
                  <path d="M12 0C5.373 0 0 5.373 0 12s5.373 12 12 12 12-5.373 12-12S18.627 0 12 0m5.894 17.5h-1.35v-5.355c0-1.208-.43-2.038-1.522-2.038-.83 0-1.324.555-1.543 1.092-.08.164-.1.392-.1.62v5.68h-1.35s.018-9.21 0-10.158h1.35v1.44c.447-.69 1.246-1.67 3.032-1.67 2.213 0 3.873 1.446 3.873 4.56v5.828zM5.337 7.433c-.466 0-.769-.31-.769-.697s.303-.697.769-.697.768.31.768.697-.302.697-.768.697zm.541 10.065H4.817V7.71h1.061v9.788zM19.64 7.095c1.59 0 2.766 1.237 2.766 3.355v5.05h-1.35v-4.716c0-1.208-.43-2.038-1.522-2.038-.83 0-1.324.555-1.543 1.092-.08.164-.1.392-.1.62v5.042h-1.35V7.71h1.35v1.44c.447-.69 1.246-1.67 3.032-1.67l-.293-.485z" />
                </svg>
              </a>
            </div>
          </div>

          {/* Quick Links */}
          <div>
            <h4 className="font-bold text-lg mb-6">Explore</h4>
            <ul className="space-y-3">
              <li>
                <Link href="#" className="text-white/70 hover:text-accent transition-smooth">
                  Tours
                </Link>
              </li>
              <li>
                <Link href="#" className="text-white/70 hover:text-accent transition-smooth">
                  Blog
                </Link>
              </li>
              <li>
                <Link href="#" className="text-white/70 hover:text-accent transition-smooth">
                  Testimonials
                </Link>
              </li>
              <li>
                <Link href="#" className="text-white/70 hover:text-accent transition-smooth">
                  About Us
                </Link>
              </li>
            </ul>
          </div>

          {/* Support */}
          <div>
            <h4 className="font-bold text-lg mb-6">Support</h4>
            <ul className="space-y-3">
              <li>
                <Link href="#" className="text-white/70 hover:text-accent transition-smooth">
                  Contact Us
                </Link>
              </li>
              <li>
                <Link href="#" className="text-white/70 hover:text-accent transition-smooth">
                  FAQs
                </Link>
              </li>
              <li>
                <Link href="#" className="text-white/70 hover:text-accent transition-smooth">
                  Privacy Policy
                </Link>
              </li>
              <li>
                <Link href="#" className="text-white/70 hover:text-accent transition-smooth">
                  Terms of Service
                </Link>
              </li>
            </ul>
          </div>

          {/* Newsletter */}
          <div>
            <h4 className="font-bold text-lg mb-6">Newsletter</h4>
            <p className="text-white/70 mb-4">
              Subscribe for travel tips and special offers
            </p>
            <div className="space-y-3">
              <input
                type="email"
                placeholder="Your email"
                className="w-full px-4 py-2.5 rounded-lg bg-white/10 border border-white/20 text-white placeholder:text-white/50 focus:outline-none focus:ring-2 focus:ring-accent"
              />
              <button className="w-full px-4 py-2.5 bg-gradient-to-r from-accent to-accent-dark text-primary-dark font-semibold rounded-lg hover:shadow-md transition-smooth">
                Subscribe
              </button>
            </div>
          </div>
        </div>

        {/* Bottom Bar */}
        <div className="py-8 border-t border-white/10 flex flex-col md:flex-row items-center justify-between">
          <p className="text-white/60 text-sm mb-4 md:mb-0">
            &copy; 2024 The Travel Spark. All rights reserved.
          </p>
          <div className="flex gap-6 text-sm">
            <Link href="#" className="text-white/60 hover:text-accent transition-smooth">
              Privacy Policy
            </Link>
            <Link href="#" className="text-white/60 hover:text-accent transition-smooth">
              Terms of Service
            </Link>
            <Link href="#" className="text-white/60 hover:text-accent transition-smooth">
              Cookie Settings
            </Link>
          </div>
        </div>
      </div>
    </footer>
  );
}
