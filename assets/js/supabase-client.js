'use strict';

/**
 * THE TRAVEL SPARK — supabase-client.js
 * Lightweight Supabase helper loaded via CDN (no npm, no build step).
 * Provides two public functions used by cms.js and package pages.
 *
 * SETUP: Replace the two constants below with your real project credentials
 * from: Supabase Dashboard → Project Settings → API
 */

// ─── Configuration ───────────────────────────────────────────────────────────
const SUPABASE_URL      = 'https://YOUR_PROJECT_REF.supabase.co';
const SUPABASE_ANON_KEY = 'YOUR_ANON_PUBLIC_KEY';

// ─── Client initialization ────────────────────────────────────────────────────
// The global `supabase` object is injected by the CDN script tag BEFORE this file.
// Guard so the page doesn't crash if the CDN fails to load.
let _client = null;

(function initClient() {
  try {
    if (typeof supabase !== 'undefined' && supabase.createClient) {
      _client = supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);
    } else {
      console.warn('[TravelSpark CMS] Supabase CDN not loaded — CMS features disabled.');
    }
  } catch (err) {
    console.warn('[TravelSpark CMS] Could not initialise Supabase client:', err);
  }
})();

// ─── Public API ───────────────────────────────────────────────────────────────

/**
 * fetchPackageBySlug(slug)
 * Fetches a single row from the `packages` table matching the given slug.
 * Returns the row object on success, or null on error / no match.
 *
 * @param  {string} slug  e.g. "dubai-5n6d"
 * @returns {Promise<object|null>}
 */
async function fetchPackageBySlug(slug) {
  if (!_client || !slug) return null;
  try {
    const { data, error } = await _client
      .from('packages')
      .select('*')
      .eq('slug', slug)
      .single();

    if (error) {
      // PGRST116 = "no rows" — not a real error, just missing data
      if (error.code !== 'PGRST116') {
        console.warn('[TravelSpark CMS] fetchPackageBySlug error:', error.message);
      }
      return null;
    }
    return data || null;
  } catch (err) {
    console.warn('[TravelSpark CMS] fetchPackageBySlug exception:', err);
    return null;
  }
}

/**
 * updatePackageField(id, field, value)
 * Updates a single field on a packages row identified by its UUID.
 * Returns true on success, false on failure.
 *
 * @param  {string} id     Row UUID
 * @param  {string} field  Column name  e.g. "price"
 * @param  {*}      value  New value
 * @returns {Promise<boolean>}
 */
async function updatePackageField(id, field, value) {
  if (!_client || !id || !field) return false;
  try {
    const { error } = await _client
      .from('packages')
      .update({ [field]: value, updated_at: new Date().toISOString() })
      .eq('id', id);

    if (error) {
      console.warn('[TravelSpark CMS] updatePackageField error:', error.message);
      return false;
    }
    return true;
  } catch (err) {
    console.warn('[TravelSpark CMS] updatePackageField exception:', err);
    return false;
  }
}
