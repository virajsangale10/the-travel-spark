/* =============================================
   THE TRAVEL SPARK — slider.js
   ============================================= */

document.addEventListener('DOMContentLoaded', function () {

  // ── Tour Packages Slider ──
  if (document.querySelector('.tours-swiper')) {
    new Swiper('.tours-swiper', {
      slidesPerView: 1,
      spaceBetween: 24,
      loop: true,
      autoplay: { delay: 3500, disableOnInteraction: false },
      pagination: { el: '.tours-pagination', clickable: true },
      navigation: {
        nextEl: '.tours-next',
        prevEl: '.tours-prev',
      },
      breakpoints: {
        640: { slidesPerView: 2 },
        1024: { slidesPerView: 3 },
      }
    });
  }

  // ── Testimonials Slider ──
  if (document.querySelector('.testi-swiper')) {
    new Swiper('.testi-swiper', {
      slidesPerView: 1,
      spaceBetween: 24,
      loop: true,
      autoplay: { delay: 4000, disableOnInteraction: false },
      pagination: { el: '.testi-pagination', clickable: true },
      breakpoints: {
        768: { slidesPerView: 2 },
        1100: { slidesPerView: 3 },
      }
    });
  }

  // ── Partners Logo Marquee (CSS-only, but init fallback) ──
  const marquee = document.querySelector('.partners-track');
  if (marquee) {
    // Clone items for infinite scroll effect
    const items = marquee.innerHTML;
    marquee.innerHTML = items + items;
  }

  // ── Destination Tabs ──
  const tabBtns = document.querySelectorAll('.dest-tab');
  const tabPanels = document.querySelectorAll('.dest-panel');

  tabBtns.forEach(btn => {
    btn.addEventListener('click', () => {
      const target = btn.dataset.tab;
      tabBtns.forEach(b => b.classList.remove('active'));
      tabPanels.forEach(p => p.classList.remove('active'));
      btn.classList.add('active');
      document.querySelector(`.dest-panel[data-panel="${target}"]`)?.classList.add('active');
    });
  });

});
