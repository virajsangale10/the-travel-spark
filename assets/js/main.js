/* =============================================
   THE TRAVEL SPARK — main.js
   ============================================= */

document.addEventListener('DOMContentLoaded', function () {
  // Page-specific logic remains here (e.g., counters, custom animations)


  // ── Animate numbers (stats counter) ──
  function animateCounter(el) {
    const target = parseInt(el.dataset.target);
    const suffix = el.dataset.suffix || '';
    const duration = 2000;
    const step = target / (duration / 16);
    let current = 0;

    const timer = setInterval(() => {
      current += step;
      if (current >= target) {
        current = target;
        clearInterval(timer);
      }
      el.textContent = Math.floor(current).toLocaleString() + suffix;
    }, 16);
  }

  const counters = document.querySelectorAll('[data-counter]');
  if (counters.length) {
    const observer = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting && !entry.target.dataset.counted) {
          entry.target.dataset.counted = true;
          animateCounter(entry.target);
        }
      });
    }, { threshold: 0.5 });
    counters.forEach(c => observer.observe(c));
  }

  // ── Smooth appear for elements (fallback if AOS not loaded) ──
  if (typeof AOS === 'undefined') {
    document.querySelectorAll('[data-aos]').forEach(el => {
      el.style.opacity = '1';
      el.style.transform = 'none';
    });
  }

});
