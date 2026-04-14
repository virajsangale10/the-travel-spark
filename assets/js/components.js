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
            <a href="${prefix}contact.html" class="navbar-phone hide-mobile" style="font-size: 1.25rem; text-decoration: none;" title="Contact Us">&#128222;</a>
            <a href="${prefix}contact.html" class="navbar-enquire hide-mobile">Enquire Now</a>
            <button class="hamburger" id="hamburger"><span></span><span></span><span></span></button>
          </div>
          <a href="${prefix}index.html" class="navbar-logo">
            <span class="logo-text-new">The Travel&nbsp;<span class="spark-mix">Spark</span></span>
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
      <a href="tel:+919421189999" style="color:#E05A00;font-weight:700;">&#128222; +91 9421189999</a>
    </div>
    `;

    const footerHTML = `
    <footer class="footer">
      <div class="container">
        <div class="footer-grid">
          <div class="footer-brand">
            <div class="footer-logo">
              <span class="footer-logo-text">The Travel <i>Spark</i></span>
            </div>
            <p class="footer-desc">Your trusted travel partner for unforgettable holidays, seamless group tours, and premium corporate travel.</p>
            <div class="footer-social">
              <a href="#" title="Instagram">&#128248;</a>
              <a href="#" title="Facebook">&#128100;</a>
              <a href="https://wa.me/919421189999" title="WhatsApp">&#128172;</a>
              <a href="#" title="YouTube">&#9654;&#65039;</a>
            </div>
          </div>
          <div class="footer-col">
            <h4>Quick Links</h4>
            <ul>
              <li><a href="${prefix}index.html">Home</a></li>
              <li><a href="${prefix}about.html">About Us</a></li>
              <li><a href="${prefix}packages/group-tours.html">Group Tours</a></li>
              <li><a href="${prefix}contact.html">Contact</a></li>
            </ul>
          </div>
          <div class="footer-col">
            <h4>Packages</h4>
            <ul>
              <li><a href="${prefix}packages/international.html">International</a></li>
              <li><a href="${prefix}packages/domestic.html">Explore India</a></li>
              <li><a href="${prefix}corporate-travel.html">Corporate</a></li>
              <li><a href="${prefix}cruises.html">Cruises</a></li>
            </ul>
          </div>
          <div class="footer-col">
            <h4>Contact</h4>
            <div class="footer-contact">
              <div class="footer-contact-item">
                <div class="icon">&#128222;</div>
                <div class="info"><a href="tel:+919421189999">+91 9421189999</a></div>
              </div>
              <div class="footer-contact-item">
                <div class="icon">&#9993;&#65039;</div>
                <div class="info"><a href="mailto:thetravelspark2@gmail.com">thetravelspark2@gmail.com</a></div>
              </div>
            </div>
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
