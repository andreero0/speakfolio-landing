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
