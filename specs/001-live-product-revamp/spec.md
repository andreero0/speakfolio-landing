# Spec 001: live-product revamp of speakfolio.kentrologia.com

Source: Ero's note 2026-11-18 00:51 ET: "we're already in business"; revamp the page, drop the founding members, keep the brutalist theme that ties into the Hub.

## Facts this spec rests on (checked 2026-11-18)
- Hosting: GitHub Pages, legacy build from `main` root, CNAME `speakfolio.kentrologia.com`. Merging to `main` is the production deploy.
- iOS: live on the App Store, id6757969505.
- Android: SpeakFolio 1.1.4 published to Google Play production on 2026-11-03 (177 countries); the public listing `play.google.com/store/apps/details?id=com.speakfolio.app` returns 200 with an Install button to a signed-out client.
- Web Hub `speakfoliohub.kentrologia.com`: still behind Cloudflare Access (302 to the Access login). Not open to the public yet.
- Pricing (app source + App Store listing): Free plan has unlimited voice recordings and 5 AI-generated outputs per month (`FREE_TIER_GENERATION_LIMIT = 5`, `frontend/lib/types/output.ts`; same limit server side in `generate-output`). Pro: US$9.99/month or US$79.99/year (App Store in-app purchases "Speakfolio Pro $9.99 / $79.99"). The app shows store-localized prices at runtime (RevenueCat `priceString`). Pro adds unlimited AI outputs, PDF and Word export, advanced insights, career growth coaching (`CustomPaywall.tsx` FEATURES).
- Subscriptions auto-renew (terms.html). The current FAQ says "No auto-billing" and "free trial": both wrong.
- The app links to `terms.html`, `privacy.html`, `support.html` on this site (sign-up, settings, paywall, store metadata). Those URLs must not move.

## Requirements
- FR-1 Remove every waitlist form, waitlist count, "Join Waitlist", "Get Early Access", "Beta Access Open", and the Founding 100 offer.
- FR-2 Remove the Supabase waitlist calls and the anon key from the page (`submitWaitlist`, `loadWaitlistCount`, `supabaseUrl/Key`). No network call to Supabase remains.
- FR-3 Primary CTAs are the official App Store and Google Play badges, linking to id6757969505 and com.speakfolio.app. They appear in the hero, the mid-page band, pricing and the final CTA.
- FR-4 "Sign in on the web" link to the Hub is built but held off (config flag `hubOpen: false`) until the Hub leaves Cloudflare Access. Flipping the flag is a one-line change.
- FR-5 Pricing shows Free and Pro (monthly US$9.99, annual US$79.99, save 33%), from the facts above, with a line that the store shows the local price and that subscriptions renew until cancelled. No trial claim.
- FR-6 Copy states only what the app does: voice capture by the user (not "runs in the background"), no invented user statistics ("143 wins", "2-3 wins per week") and no unsourced money claims, unless the council keeps them as clearly rhetorical.
- FR-7 Keep PostHog exactly as configured. Add `posthog.capture('store_badge_click', {store, placement})` on badge clicks.
- FR-8 Keep the brutalist look: brand yellow #FFE600, mint #00D9A5, sky #4DA6FF, 2px #1A1A1A borders, Space Grotesk uppercase headings, JetBrains Mono labels, hard offset shadows. Extract these as tokens into `design/tokens.md` + `design/tokens.css` for the Hub to adopt.
- FR-9 Phone widths 360, 390 and 430 px: no horizontal scroll, badges fit, nav usable.
- FR-10 Legal and support pages keep their URLs; any text there that contradicts the app is corrected.

## Out of scope
- Rewriting privacy/terms for the MCP connector or the web Hub (flagged separately; see STATUS).
- Hub theming (separate PR in the speakfolio repo after HUB-OPEN merges).
