/**
 * THE TRAVEL SPARK — Centralized Components
 * This script injects the Navbar and Footer into pages dynamically.
 * usage: <div id="navbar-placeholder"></div> ... <div id="footer-placeholder"></div>
 */

(function () {
    // Detect prefix based on current file location
    const isSubfolder = window.location.pathname.includes('/packages/') || 
                        window.location.pathname.includes('/destinations/') || 
                        window.location.pathname.includes('/legal/');
    const prefix = isSubfolder ? '../' : '';

    const navbarHTML = `
    <nav class="navbar" id="navbar">
      <div class="container">
        <div class="navbar-inner">
          <ul class="navbar-links" style="margin-right: auto;">
            <li><a href="${prefix}index.html">Home</a></li>
            <li>
              <span>Holiday Packages <span class="chevron">&#9662;</span></span>
              <ul class="dropdown">
                <li><a href="${prefix}packages/international.html">&#127757; International Holidays</a></li>
                <li><a href="${prefix}packages/group-tours.html">&#128101; Group Tours</a></li>
                <li><a href="${prefix}packages/domestic.html">&#127470;&#127475; Explore India</a></li>
                <li><a href="${prefix}cruises.html">&#128674; Luxury Cruises</a></li>
              </ul>
            </li>
            <li><a href="${prefix}corporate-travel.html">Corporate Travel</a></li>
            <li><a href="${prefix}blog.html">Blog</a></li>
            <li><a href="${prefix}about.html">About</a></li>
            <li><a href="${prefix}contact.html">Contact</a></li>
          </ul>
          <div class="navbar-cta">
            <a href="${prefix}contact.html" class="navbar-phone hide-mobile" style="text-align: center; display: inline-flex; align-items: center; justify-content: center; width: 38px; height: 38px; text-decoration: none; color: var(--primary-dark); transition: color 0.2s;" title="Contact Us">
              <svg viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"/></svg>
            </a>
            <a href="${prefix}contact.html" class="navbar-enquire hide-mobile">Enquire Now</a>
            <button class="hamburger" id="hamburger"><span></span><span></span><span></span></button>
          </div>
          <a href="${prefix}index.html" class="navbar-logo">
            <img src="${prefix}assets/images/Logo-TTS.png" alt="The Travel Spark" style="height:64px;width:auto;display:block;" />
          </a>
        </div>
      </div>
    </nav>
    <div class="menu-overlay" id="menuOverlay"></div>
    <div class="mobile-menu" id="mobileMenu">
      <a href="${prefix}index.html">Home</a>
      <div class="m-parent">Holiday Packages</div>
      <div class="sub-links">
        <a href="${prefix}packages/international.html">&#127757; International</a>
        <a href="${prefix}packages/group-tours.html">&#128101; Group Tours</a>
        <a href="${prefix}packages/domestic.html">&#127470;&#127475; Explore India</a>
        <a href="${prefix}cruises.html">&#128674; Luxury Cruises</a>
      </div>
      <a href="${prefix}corporate-travel.html">Corporate Travel</a>
      <a href="${prefix}blog.html">Blog</a>
      <a href="${prefix}about.html">About</a>
      <a href="${prefix}contact.html">Contact</a>
      <br/>
      <a href="tel:+919421189999" style="color:var(--primary);font-weight:700;">&#128222; +91 9421189999</a>
    </div>
    `;

    const footerHTML = `
    <footer class="footer">
      <div class="container">
        <div class="footer-grid">
          <div class="footer-brand">
            <div class="footer-logo">
              <img src="${prefix}assets/images/Logo-TTS.png" alt="The Travel Spark" style="height:110px;width:auto;display:block;margin-bottom:12px;" />
            </div>
            <p class="footer-desc" style="color: #000000; font-weight: 600;">Your trusted travel partner for unforgettable holidays, seamless group tours, and premium corporate travel.</p>
            <div class="footer-social">
              <a href="#" title="Instagram">
                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="2" y="2" width="20" height="20" rx="5" ry="5"></rect><path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"></path><line x1="17.5" y1="6.5" x2="17.51" y2="6.5"></line></svg>
              </a>
              <a href="#" title="Facebook">
                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"></path></svg>
              </a>
              <a href="https://wa.me/919421189999" title="WhatsApp">
                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"></path></svg>
              </a>
              <a href="#" title="YouTube">
                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M22.54 6.42a2.78 2.78 0 0 0-1.94-2C18.88 4 12 4 12 4s-6.88 0-8.6.46a2.78 2.78 0 0 0-1.94 2A29 29 0 0 0 1 11.75a29 29 0 0 0 .46 5.33A2.78 2.78 0 0 0 3.4 19c1.72.46 8.6.46 8.6.46s6.88 0 8.6-.46a2.78 2.78 0 0 0 1.94-2 29 29 0 0 0 .46-5.25 29 29 0 0 0-.46-5.33z"></path><polygon points="9.75 15.02 15.5 11.75 9.75 8.48 9.75 15.02"></polygon></svg>
              </a>
            </div>
          </div>
          <div class="footer-col">
            <h4>International</h4>
            <ul>
              <li><a href="${prefix}packages/dubai.html">Dubai Packages</a></li>
              <li><a href="${prefix}packages/europe.html">Europe Packages</a></li>
              <li><a href="${prefix}packages/georgia.html">Georgia Packages</a></li>
              <li><a href="${prefix}packages/japan.html">Japan Packages</a></li>
              <li><a href="${prefix}packages/maldives.html">Maldives Packages</a></li>
              <li><a href="${prefix}packages/philippines.html">Philippines Packages</a></li>
              <li><a href="${prefix}packages/charming-singapore-with-malaysia.html">Singapore Packages</a></li>
              <li><a href="${prefix}packages/vietnam.html">Vietnam Packages</a></li>
            </ul>
          </div>
          <div class="footer-col">
            <h4>India Tours</h4>
            <ul>
              <li><a href="${prefix}packages/andaman-package.html">Andaman Packages</a></li>
              <li><a href="${prefix}packages/goa-escape-neelam.html">Goa Packages</a></li>
              <li><a href="${prefix}packages/fascinating-gujarat.html">Gujarat Packages</a></li>
              <li><a href="${prefix}packages/glorious-himachal.html">Himachal Packages</a></li>
              <li><a href="${prefix}packages/kashmir-heaven-on-earth.html">Kashmir Packages</a></li>
              <li><a href="${prefix}packages/essence-of-kerala.html">Kerala Packages</a></li>
              <li><a href="${prefix}packages/ladakh-delight.html">Ladakh Packages</a></li>
              <li><a href="${prefix}packages/northeast-odyssey.html">North East India</a></li>
              <li><a href="${prefix}packages/marvels-of-rajasthan.html">Rajasthan Packages</a></li>
              <li><a href="${prefix}packages/uttarakhand-06-nights.html">Uttarakhand Packages</a></li>
            </ul>
          </div>
          <div class="footer-col">
            <h4>Services</h4>
            <ul>
              <li><a href="${prefix}packages/group-tours.html">Group Tours</a></li>
              <li><a href="${prefix}packages/international.html">International Holidays</a></li>
              <li><a href="${prefix}packages/domestic.html">Explore India</a></li>
              <li><a href="${prefix}corporate-travel.html">Corporate Travel</a></li>
              <li><a href="${prefix}cruises.html">Luxury Cruises</a></li>
            </ul>
          </div>
          <div class="footer-col">
            <h4>Company</h4>
            <ul>
              <li><a href="${prefix}about.html">About Us</a></li>
              <li><a href="${prefix}contact.html">Contact Us</a></li>
              <li><a href="${prefix}blog.html">Blog</a></li>
              <li><a href="${prefix}legal/privacy-policy.html">Privacy Policy</a></li>
              <li><a href="${prefix}legal/terms-conditions.html">Terms & Conditions</a></li>
            </ul>
          </div>
        </div>
        <div class="footer-bottom">
          <p>© The Travel Spark. All rights reserved.</p>
          <div class="footer-bottom-links">
            <a href="${prefix}legal/privacy-policy.html">Privacy Policy</a>
            <a href="${prefix}legal/terms-conditions.html">Terms</a>
          </div>
        </div>
      </div>
    </footer>
    <a href="https://wa.me/919421189999" class="whatsapp-float" target="_blank">
        <svg viewBox="0 0 24 24"><path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 01-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 01-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 012.893 6.994c-.003 5.45-4.437 9.884-9.885 9.884m8.413-18.297A11.815 11.815 0 0012.05 0C5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L.057 24l6.305-1.654a11.882 11.882 0 005.683 1.448h.005c6.554 0 11.89-5.335 11.893-11.893a11.821 11.821 0 00-3.48-8.413z"/></svg>
    </a>
    <button class="scroll-top" id="scrollTop">&#8593;</button>
    `;

    function injectComponents() {
        const navPlaceholder = document.getElementById('navbar-placeholder');
        const footPlaceholder = document.getElementById('footer-placeholder');

        if (navPlaceholder) navPlaceholder.innerHTML = navbarHTML;
        if (footPlaceholder) footPlaceholder.innerHTML = footerHTML;

        // Trigger events for the newly injected navbar (Hamburger etc.)
        initNavbarEvents();
    }

    function initNavbarEvents() {
        const hamburger = document.getElementById('hamburger');
        const mobileMenu = document.getElementById('mobileMenu');
        const overlay = document.getElementById('menuOverlay');
        const navbar = document.getElementById('navbar');

        hamburger?.addEventListener('click', () => {
            hamburger.classList.toggle('active');
            mobileMenu?.classList.toggle('open');
            overlay?.classList.toggle('visible');
            document.body.style.overflow = mobileMenu?.classList.contains('open') ? 'hidden' : '';
        });

        overlay?.addEventListener('click', () => {
            hamburger?.classList.remove('active');
            mobileMenu?.classList.remove('open');
            overlay.classList.remove('visible');
            document.body.style.overflow = '';
        });

        window.addEventListener('scroll', () => {
            if (window.scrollY > 50) {
                navbar?.classList.add('scrolled');
            } else {
                navbar?.classList.remove('scrolled');
            }
            const scrollBtn = document.getElementById('scrollTop');
            if (scrollBtn) {
                scrollBtn.classList.toggle('visible', window.scrollY > 400);
            }
        });

        document.getElementById('scrollTop')?.addEventListener('click', () => {
            window.scrollTo({ top: 0, behavior: 'smooth' });
        });
        
        // Mark active link
        const currentPath = window.location.pathname.split('/').pop() || 'index.html';
        document.querySelectorAll('.navbar-links a').forEach(link => {
            const href = link.getAttribute('href');
            if (href && (href.endsWith(currentPath) || (currentPath === 'index.html' && href.endsWith('index.html')))) {
                link.classList.add('active');
            }
        });
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', injectComponents);
    } else {
        injectComponents();
    }
})();
