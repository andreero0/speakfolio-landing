# Account deletion page and privacy policy updates

## New page: delete-account.html

Title: "Delete your SpeakFolio account and data". Uses the same head, navigation, styles and footer as privacy.html. The footer's Legal column adds a highlighted "Delete account" link.

Sections:

1. Delete in the app: Settings > Account > Delete Account, or start from Settings > Privacy & Data.
2. If you no longer have the app: email privacy@speakfolio.app from the account's email address with the subject "Delete my account" (the mailto link pre-fills the subject).
3. What is deleted: sign-in account, profile, entries (including Recently Deleted), voice recordings, transcripts, generated documents including Salary Brief inputs, stored data-export files.
4. When it happens: deletion starts as soon as it is confirmed in the app (for email, once the request is matched to the account). File removal from storage runs in the background; failed steps are retried.
5. What may be retained: payment records (App Store, Google Play, Stripe), analytics records, service provider logs and backups for a limited time, minimal deletion records, and anything the law requires. Wording follows privacy.html's Data Retention section. No day counts are stated beyond what privacy.html states.

The page links to privacy.html#data-retention.

## privacy.html

1. Last Updated changed to October 29, 2026.
2. Usage Data: analytics is linked to an account identifier only and does not include name or email address, with a note that the app change removing them is in progress.
3. Usage Data: new line stating analytics does not use precise or IP-based location.
4. Usage Data: new line "A notification token for your device, if you allow notifications, to send reminders".
5. Data Sharing: the analytics provider line now says "linked to an account identifier only".
6. Your Rights: the Delete item links to delete-account.html.
7. Data Retention section has id="data-retention"; a small script opens a details section when the URL hash targets it.
8. Added `<!DOCTYPE html>`.

No error or crash tracking line carried "(optional)", so nothing was removed for that item. The only "(optional)" on the page is "Profile information (optional)", which was left unchanged.

## index.html

Footer Legal column links to delete-account.html as "Delete account".

## Checks

1. html-validate (document preset): no structural errors. The only findings are missing SRI attributes on the CDN scripts and fonts, and footer `<h5>` heading order, both inherited from the existing template.
2. Rendered visible text of all three pages (with every details section open), checked in Chromium: no em or en dashes and no AI vendor or model names. No em dashes in the source either.

## Review fix pass

### privacy.html

1. Usage Data and Data Sharing analytics lines now carry the same sentence: "From app version 1.1.4 on iOS and the matching Android update, analytics use a random account identifier only and never include your name or email address. Earlier app versions may have included them."
2. Voice Recordings (Information We Collect) now matches Data Retention: automatic audio deletion is currently off, and the audio retention choice in Privacy & Data settings is coming in an app update. Until then, recordings stay until the entry is permanently deleted from Recently Deleted or the account is deleted.
3. Footer Legal column has the "Delete account" link to delete-account.html, matching index.html and delete-account.html.
4. AI Processing permission wording checked and left as is. No line on the page claims consent is required for every account today; the Permission list states that processing also runs for accounts that have not made a choice yet.

### delete-account.html

1. Header adds "SpeakFolio is made by Kentrologia Innovation Inc." (developer name as in terms.html).
2. Delete in the app: new first step to cancel any subscription in App Store (iPhone) or Google Play (Android) subscriptions settings, since deleting the account does not cancel a store subscription. The email path is unchanged.
3. What may be retained: each category now states how long, using only what privacy.html and terms.html already say. Neither document states a day count for any of these, so none was added.
   1. Payment records: kept only as long as required by law or for the provider's own billing and security records.
   2. Analytics records: set by the provider's retention settings; the Privacy Policy states no fixed period.
   3. Service provider logs: a limited time, under their own terms (from privacy.html).
   4. Backups (now its own item): removed from backups when those backups expire.
   5. Minimal deletion records: the Privacy Policy states no fixed period.
   6. Legal obligations: as long as the law requires.

### Checks

1. html-validate (document preset) on privacy.html and delete-account.html: only the inherited require-sri, footer heading-level and doctype-style findings, the same set as before this pass.
2. All internal links and fragment targets on privacy.html, delete-account.html and index.html resolve.
3. Rendered in Chromium at 375px with every details section open: no horizontal scroll, no em or en dashes in visible text, no AI vendor, model or provider names.
