'use strict';

/**
 * THE TRAVEL SPARK — cms.js
 * Lightweight inline CMS for the website owner.
 *
 * How it works:
 *  1. A subtle "Edit Page" button appears bottom-right (only visible when you know it's there).
 *  2. Click it → enter the password → edit mode activates.
 *  3. Click any highlighted field on the page → type the new value → click elsewhere → auto-saved.
 *  4. Refresh or close the tab → back to normal visitor view.
 *
 * Dependencies (must be loaded BEFORE this script):
 *   - supabase CDN  (https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2/dist/umd/supabase.js)
 *   - assets/js/supabase-client.js
 */

// ─── Configuration ────────────────────────────────────────────────────────────
const CMS_PASSWORD   = 'TRAVELSPARK2024';
const SESSION_KEY    = 'ts_edit_auth';

// ─── State ────────────────────────────────────────────────────────────────────
let _editMode   = false;
let _packageId  = null;   // UUID from Supabase row; populated after page fetch

// ─── Initialise on DOM ready ──────────────────────────────────────────────────
document.addEventListener('DOMContentLoaded', function () {
  _injectEditButton();
  _injectStyles();
  _injectToastContainer();

  // If the owner already authenticated in this browser session, auto-activate
  if (sessionStorage.getItem(SESSION_KEY) === '1') {
    _activateEditMode();
  }

  // Wire up package slug hydration (used by package detail pages)
  _hydratePageFromSupabase();
});

// ─── Edit button ─────────────────────────────────────────────────────────────
function _injectEditButton() {
  const btn = document.createElement('button');
  btn.id        = 'cms-edit-btn';
  btn.innerHTML = 'Edit Page';
  btn.setAttribute('aria-label', 'Toggle CMS edit mode');
  document.body.appendChild(btn);

  btn.addEventListener('click', function () {
    if (!_editMode) {
      // Already authenticated this session — go straight to edit mode
      if (sessionStorage.getItem(SESSION_KEY) === '1') {
        _activateEditMode();
        return;
      }
      // Show inline password modal (no browser prompt — works on all browsers)
      _showPasswordModal();
    } else {
      _deactivateEditMode();
    }
  });
}

// ─── Inline password modal ──────────────────────────────────────────────────────
function _showPasswordModal() {
  // Prevent duplicate
  if (document.getElementById('cms-pw-modal')) return;

  const overlay = document.createElement('div');
  overlay.id = 'cms-pw-modal';
  overlay.innerHTML = [
    '<div id="cms-pw-box">',
    '  <p id="cms-pw-label">Enter edit password</p>',
    '  <input id="cms-pw-input" type="password" placeholder="Password" autocomplete="off" />',
    '  <p id="cms-pw-error"></p>',
    '  <div id="cms-pw-actions">',
    '    <button id="cms-pw-cancel">Cancel</button>',
    '    <button id="cms-pw-ok">Unlock</button>',
    '  </div>',
    '</div>'
  ].join('');
  document.body.appendChild(overlay);

  var input  = document.getElementById('cms-pw-input');
  var error  = document.getElementById('cms-pw-error');
  var cancel = document.getElementById('cms-pw-cancel');
  var ok     = document.getElementById('cms-pw-ok');

  input.focus();

  function _submit() {
    var val = input.value;
    if (val === CMS_PASSWORD) {
      sessionStorage.setItem(SESSION_KEY, '1');
      overlay.remove();
      _activateEditMode();
    } else {
      error.textContent = 'Incorrect password — try again';
      input.value = '';
      input.focus();
    }
  }

  input.addEventListener('keydown', function (e) {
    if (e.key === 'Enter') _submit();
    if (e.key === 'Escape') overlay.remove();
  });
  ok.addEventListener('click', _submit);
  cancel.addEventListener('click', function () { overlay.remove(); });
  // Close on backdrop click
  overlay.addEventListener('click', function (e) {
    if (e.target === overlay) overlay.remove();
  });
}

// ─── Edit mode ON ─────────────────────────────────────────────────────────────
function _activateEditMode() {
  _editMode = true;
  document.body.classList.add('cms-active');

  const btn = document.getElementById('cms-edit-btn');
  if (btn) {
    btn.classList.add('editing');
    btn.innerHTML = '<span class="cms-pulse"></span>Editing…';
  }

  const editables = document.querySelectorAll('.cms-editable');

  // Inform owner if this page has no editable fields
  if (editables.length === 0) {
    _showToast('No editable fields on this page');
    return;
  }

  // Make every .cms-editable field interactive
  editables.forEach(function (el) {
    if (!el.dataset.cmsWired) {
      el.dataset.cmsWired = '1';
      el.addEventListener('click', _handleEditClick);
    }
  });
}

// ─── Edit mode OFF ────────────────────────────────────────────────────────────
function _deactivateEditMode() {
  _editMode = false;
  document.body.classList.remove('cms-active');

  const btn = document.getElementById('cms-edit-btn');
  if (btn) {
    btn.classList.remove('editing');
    btn.innerHTML = 'Edit Page';
  }
}

// ─── Click handler for editable fields ───────────────────────────────────────
function _handleEditClick(e) {
  if (!_editMode) return;

  const el = e.currentTarget;

  // Prevent double-instantiation while already editing
  if (el.querySelector('input, textarea')) return;

  const field       = el.dataset.field;
  const currentText = el.textContent.trim();
  const isLong      = currentText.length > 60;

  // Build the inline input
  const input = document.createElement(isLong ? 'textarea' : 'input');
  input.value = currentText;
  input.className = 'cms-inline-input';
  if (isLong) {
    input.rows = 3;
    input.style.resize = 'vertical';
  }

  // Replace content with input
  el.textContent = '';
  el.appendChild(input);
  input.focus();
  input.select();

  // Save on blur
  input.addEventListener('blur', async function () {
    const newValue = input.value.trim();

    // Restore display
    el.textContent = newValue || currentText;

    // Only save if the value actually changed
    if (newValue === currentText || !field) return;

    let saved = false;
    if (_packageId && typeof updatePackageField === 'function') {
      saved = await updatePackageField(_packageId, field, newValue);
    }

    _showToast(saved ? 'Saved ✓' : 'Could not save — check connection');
  });

  // Prevent click propagation triggering parent listeners
  e.stopPropagation();
}

// ─── Hydrate page from Supabase ───────────────────────────────────────────────
async function _hydratePageFromSupabase() {
  const slug = document.body.dataset.packageSlug;
  if (!slug) return;   // Not a package detail page

  if (typeof fetchPackageBySlug !== 'function') return;

  const pkg = await fetchPackageBySlug(slug);
  if (!pkg) return;   // Fail silently — keep hardcoded HTML

  _packageId = pkg.id;  // Store so edits can reference the row UUID

  // Map Supabase fields to DOM elements via [data-field]
  document.querySelectorAll('[data-field]').forEach(function (el) {
    const field = el.dataset.field;
    if (pkg[field] == null) return;

    // Special formatting for price
    if (field === 'price') {
      const formatted = '₹' + Number(pkg[field]).toLocaleString('en-IN');
      el.textContent = formatted;
    } else if (Array.isArray(pkg[field])) {
      // highlights[] → comma-separated for now
      el.textContent = pkg[field].join(', ');
    } else {
      el.textContent = pkg[field];
    }
  });
}

// ─── Toast notification ───────────────────────────────────────────────────────
function _injectToastContainer() {
  const container = document.createElement('div');
  container.id = 'cms-toast-container';
  document.body.appendChild(container);
}

function _showToast(message) {
  const container = document.getElementById('cms-toast-container');
  if (!container) return;

  const toast = document.createElement('div');
  toast.className = 'cms-toast';
  toast.textContent = message;
  container.appendChild(toast);

  // Animate in
  requestAnimationFrame(function () {
    toast.classList.add('cms-toast--visible');
  });

  // Auto-dismiss after 2s
  setTimeout(function () {
    toast.classList.remove('cms-toast--visible');
    setTimeout(function () { toast.remove(); }, 300);
  }, 2000);
}

// ─── Injected styles ──────────────────────────────────────────────────────────
// All CMS visual chrome is self-contained here — zero footprint on normal visitors.
function _injectStyles() {
  const style = document.createElement('style');
  style.textContent = `
    /* ── Edit button (barely visible to strangers) ── */
    #cms-edit-btn {
      position: fixed;
      bottom: 20px;
      left: 20px;
      z-index: 99999;
      background: #4A7C59;
      color: #fff;
      border: none;
      border-radius: 6px;
      padding: 7px 14px;
      font-size: 12px;
      font-family: system-ui, sans-serif;
      font-weight: 500;
      letter-spacing: 0.02em;
      cursor: pointer;
      opacity: 0.55;
      transition: opacity 0.2s, background 0.2s;
      display: flex;
      align-items: center;
      gap: 7px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.18);
    }
    #cms-edit-btn:hover { opacity: 1; background: #3a6347; }
    #cms-edit-btn.editing { opacity: 1; background: #1C3A2A; }

    /* Pulsing green dot when editing */
    .cms-pulse {
      width: 8px; height: 8px;
      background: #6B9E7A;
      border-radius: 50%;
      display: inline-block;
      animation: cms-pulse-anim 1.4s ease-in-out infinite;
    }
    @keyframes cms-pulse-anim {
      0%, 100% { opacity: 1; transform: scale(1); }
      50%       { opacity: 0.4; transform: scale(0.75); }
    }

    /* ── Editable fields (only visible when cms-active on body) ── */
    .cms-active .cms-editable {
      outline: 2px dashed #4A7C59;
      border-radius: 3px;
      cursor: text;
      transition: background 0.15s;
    }
    .cms-active .cms-editable:hover {
      background: rgba(74, 124, 89, 0.08);
    }

    /* ── Inline input / textarea ── */
    .cms-inline-input {
      width: 100%;
      font-family: inherit;
      font-size: inherit;
      font-weight: inherit;
      color: inherit;
      background: #fff;
      border: 1.5px solid #4A7C59;
      border-radius: 4px;
      padding: 2px 6px;
      outline: none;
      box-shadow: 0 0 0 3px rgba(74,124,89,0.15);
      box-sizing: border-box;
      line-height: inherit;
    }
    textarea.cms-inline-input { min-height: 60px; }

    /* ── Toast ── */
    #cms-toast-container {
      position: fixed;
      bottom: 32px;
      left: 50%;
      transform: translateX(-50%);
      z-index: 100000;
      display: flex;
      flex-direction: column;
      align-items: center;
      gap: 8px;
      pointer-events: none;
    }
    .cms-toast {
      background: #1C3A2A;
      color: #A8C5A0;
      font-family: system-ui, sans-serif;
      font-size: 13px;
      font-weight: 500;
      padding: 9px 20px;
      border-radius: 20px;
      box-shadow: 0 4px 16px rgba(28,58,42,0.25);
      opacity: 0;
      transform: translateY(8px);
      transition: opacity 0.25s, transform 0.25s;
      white-space: nowrap;
    }
    .cms-toast--visible {
      opacity: 1;
      transform: translateY(0);
    }
    /* ── Password modal overlay ── */
    #cms-pw-modal {
      position: fixed;
      inset: 0;
      background: rgba(0,0,0,0.55);
      z-index: 999999;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    #cms-pw-box {
      background: #1C3A2A;
      border: 1px solid rgba(168,197,160,0.2);
      border-radius: 12px;
      padding: 32px 28px;
      width: 320px;
      box-shadow: 0 16px 48px rgba(0,0,0,0.35);
    }
    #cms-pw-label {
      font-family: 'DM Sans', system-ui, sans-serif;
      font-size: 14px;
      color: #A8C5A0;
      margin-bottom: 12px;
    }
    #cms-pw-input {
      width: 100%;
      padding: 10px 14px;
      background: rgba(255,255,255,0.07);
      border: 1.5px solid rgba(168,197,160,0.25);
      border-radius: 6px;
      color: #F5F0E8;
      font-family: 'DM Sans', system-ui, sans-serif;
      font-size: 14px;
      outline: none;
      box-sizing: border-box;
    }
    #cms-pw-input:focus { border-color: #C9A84C; }
    #cms-pw-error {
      font-size: 12px;
      color: #f87171;
      min-height: 18px;
      margin: 6px 0;
    }
    #cms-pw-actions {
      display: flex;
      gap: 10px;
      justify-content: flex-end;
      margin-top: 6px;
    }
    #cms-pw-cancel {
      padding: 8px 18px;
      background: transparent;
      border: 1px solid rgba(168,197,160,0.3);
      border-radius: 6px;
      color: #A8C5A0;
      font-size: 13px;
      cursor: pointer;
    }
    #cms-pw-ok {
      padding: 8px 20px;
      background: #C9A84C;
      border: none;
      border-radius: 6px;
      color: #1C3A2A;
      font-size: 13px;
      font-weight: 600;
      cursor: pointer;
    }
    #cms-pw-ok:hover { background: #A8893A; }
  `;
  document.head.appendChild(style);
}
