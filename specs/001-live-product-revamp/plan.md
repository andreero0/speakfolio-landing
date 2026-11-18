# Plan 001

1. Research: Mobbin live-app landing sections (hero with both store badges, repeated final CTA); store badge guidelines (Apple and Google official badge art, unmodified).
2. Light council (C, A, M; no Warp seats) on section structure and copy calls: council-sf-site-1118.
3. Edit `index.html` in place (single static file, Tailwind CDN, no build step): delete waitlist/founding markup and JS, add badge row component, pricing rewrite, FAQ fixes, hidden Hub link behind `hubOpen`.
4. Tokens: `design/tokens.css` (CSS custom properties) + `design/tokens.md` (usage, mapping to Tailwind names) taken from the live page.
5. Checks (`scripts/check.sh`, also run in CI on PRs): no `waitlist|founding|early access|supabase` strings in HTML; every internal link resolves; HTML parses; Playwright phone/desktop screenshots with no horizontal overflow and no page errors.
6. Review: review-codex to MERGE at head. PR. CI green.
7. Preview: serve the branch locally and screenshot at 360/390/430/1440; Ero sees the screenshots. Production deploy = merge to `main` after Ero types the phrase from ORCH-REQUEST.
