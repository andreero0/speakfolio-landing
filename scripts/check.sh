#!/usr/bin/env bash
# Static checks for the SpeakFolio site. Run from the repo root: scripts/check.sh
set -euo pipefail
cd "$(dirname "$0")/.."
fail=0
pages=(index.html privacy.html terms.html support.html delete-account.html)

# 1. Pre-launch leftovers must be gone from every page.
if grep -n -i -E 'waitlist|founding|early access|beta access|supabase\.co|join the list' "${pages[@]}"; then
  echo "FAIL: pre-launch or waitlist text/calls found above"; fail=1
fi

# 2. Store links point at the live listings.
grep -q 'apps.apple.com/app/speakfolio/id6757969505' index.html || { echo "FAIL: App Store link missing"; fail=1; }
grep -q 'play.google.com/store/apps/details?id=com.speakfolio.app' index.html || { echo "FAIL: Google Play link missing"; fail=1; }

# 3. Prices match the app (App Store IAPs, FREE_TIER_GENERATION_LIMIT=5). Update here when the app changes.
for p in '\$9\.99' '\$79\.99'; do grep -q "$p" index.html || { echo "FAIL: price $p missing"; fail=1; }; done
if grep -n -E '\$49\.99|No auto-billing|free trial' index.html; then echo "FAIL: stale pricing claim"; fail=1; fi

# 4. PostHog stays on every page.
for f in "${pages[@]}"; do grep -q "posthog.init('phc_" "$f" || { echo "FAIL: PostHog missing in $f"; fail=1; }; done

# 5. Relative links resolve to files in the repo.
for f in "${pages[@]}"; do
  for href in $(grep -o -E 'href="[^"#:]+\.html' "$f" | sed 's/href="//' | sort -u); do
    [ -f "$href" ] || { echo "FAIL: $f links to missing $href"; fail=1; }
  done
done

# 6. URLs the app and store metadata link to must keep existing.
for f in privacy.html terms.html support.html delete-account.html CNAME; do [ -f "$f" ] || { echo "FAIL: $f removed"; fail=1; }; done

[ $fail -eq 0 ] && echo "check.sh: all checks passed"
exit $fail
