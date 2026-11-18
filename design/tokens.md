# SpeakFolio brand tokens (site, Hub, app)

Source of truth for the one shared look. Extracted from the live site on 2026-11-18. `tokens.css` holds the values.

## The look in one line
Brutalist: flat brand colour blocks (yellow, mint, sky), 2px black borders, square corners, hard offset shadows with no blur, uppercase Space Grotesk headings, uppercase JetBrains Mono labels, Inter body text.

## Tokens
| Token | Value | Use |
|---|---|---|
| `--yellow` | #FFE600 | primary action, highlight band, current item |
| `--mint` | #00D9A5 | success, annual/best value, spoken source text |
| `--sky` | #4DA6FF | secondary accent, links on hover, step numbers |
| `--lav` | #B197FC | "your wording" (Hub), secondary cards |
| `--ink` / `--line` | #1A1A1A light, #FFFFFF / #333333 dark | text, every border |
| `--bg` | #FFFFFF light, #0A0A0A dark | page |
| `--sf-font-heading` | Space Grotesk 500/600, uppercase, -0.02em | h1-h3, buttons |
| `--sf-font-mono` | JetBrains Mono 500, uppercase, 0.1em | kickers, tags, small labels |
| `--sf-font-body` | Inter 400 | paragraphs |
| `--sf-border` | 2px solid ink | cards, buttons, inputs, section rules |
| `--shadow-sm` / `--shadow` / `--shadow-lg` | 2/4/6px offset, no blur | hover and raised states |
| `--sf-radius` | 0 (4px allowed on buttons) | corners |

Google Fonts URL: `https://fonts.googleapis.com/css2?family=Inter:wght@400;500&family=Space+Grotesk:wght@500;600;700&family=JetBrains+Mono:wght@500&display=swap`

## Components
- Primary button: yellow fill, ink text, 2px ink border, uppercase heading font; hover lifts 2px and shows `--shadow-sm`.
- Secondary button: transparent, 2px ink border; hover fills ink, text turns bg colour.
- Card: bg, 2px border, square; hover `--shadow` and -2px lift.
- Kicker: mono, 12px, uppercase, 0.1em tracking, with a small yellow square or dot before it.

## Hub adoption (web/hub/src/styles.css)
The Hub already uses the same yellow, mint, lavender, ink borders and offset shadows. To match the site:
1. Load the three fonts; set h1-h3 and buttons to `--sf-font-heading` uppercase; kickers to `--sf-font-mono`.
2. Borders 2px (Hub uses 2-3px); corners square or 4px (Hub uses 8-12px).
3. Add `--sky` as the secondary accent.
4. Keep the Hub's WCAG AA checks (`tests/browser/a11y.spec.ts`) green: uppercase and the new fonts change widths, so re-run the visual and a11y suites.
Body text in the Hub's voice/serif style can stay: the shared look is headings, colour, borders and shadows.
