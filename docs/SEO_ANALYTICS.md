# SEO And Analytics

## SEO Baseline
- Moi page public can co:
  - title
  - meta description
  - canonical URL
- Uu tien metadata theo page type thay vi dung 1 cau hinh chung.

## Meta Strategy

### Home
- Title: ten + vai tro chinh + gia tri.
- Description: tom tat nang luc + loi moi hanh dong.

### Blog Index
- Title: Blog | Ten ca nhan.
- Description: Noi dung kien thuc/trai nghiem theo chu de.

### Post Detail
- Title uu tien: `meta_title` fallback `title`.
- Description uu tien: `meta_description` fallback `excerpt`.
- Open Graph image: hero image neu co.

### Project Detail
- Meta nhan manh ket qua du an, cong nghe, domain.

## Open Graph And Social Sharing
- Required tags:
  - `og:title`
  - `og:description`
  - `og:type`
  - `og:url`
  - `og:image`
- Twitter card:
  - `twitter:card` = `summary_large_image`
  - `twitter:title`, `twitter:description`, `twitter:image`

## Robots And Sitemap
- robots:
  - Allow toan bo page public.
  - Disallow `/admin`.
- sitemap:
  - Home, blog index, project index, about, contact.
  - Tat ca post/project published.
  - Khong dua draft/scheduled vao sitemap.

## Structured Data (JSON-LD)
- `Person` cho profile ca nhan.
- `BlogPosting` cho post detail.
- `CreativeWork` hoac `SoftwareSourceCode` cho project detail.

## Analytics Options
- Option A: GA4 (pho bien, he sinh thai day du).
- Option B: Plausible (nhe, ton trong privacy).

## Event Naming Convention
- `page_view`
- `cta_click_hire_me`
- `cta_click_view_project`
- `contact_submit`
- `resume_download`
- `project_outbound_click`
- `post_tag_click`

## Dashboard Minimum
- Top 10 post theo views.
- Conversion cua contact form.
- CTR cua CTA o home.

## Verification Checklist
- Kiem tra preview link bang social debugger.
- Kiem tra sitemap reachable va dung noi dung.
- Kiem tra metadata voi browser devtools.

## MVP Baseline Da Trien Khai (2026-04-01)
- Meta tags da duoc dat tai layout theo tung page metadata:
  - title
  - description
  - canonical
  - Open Graph (`og:title`, `og:description`, `og:type`, `og:url`, `og:image`)
  - Twitter card (`summary_large_image`, title/description/image)
- `sitemap.xml` da expose public route va chi dua `Post.published`, `Project.published`.
- `public/robots.txt` da cho phep crawl page public, disallow `/admin`, va khai bao sitemap.
- Event baseline da duoc log theo convention:
  - `page_view`
  - `contact_submit`

## Phase SEO + GA4 Da Trien Khai (2026-04-01)
- GA4 duoc tich hop qua bien moi truong `GA_MEASUREMENT_ID`.
- Layout public chi nap `gtag.js` khi `GA_MEASUREMENT_ID` co gia tri.
- `gtag("config", "...", { send_page_view: false })` duoc dung de tu kiem soat event `page_view`.
- Tracking layer client-side:
  - File: `app/javascript/analytics.js`
  - API chung: `window.appTrack(eventName, params)`
  - Tu dong track `page_view` cho initial load va Turbo navigation (`turbo:load`).

## Event Mapping Thuc Te
- `page_view`:
  - Tu dong tren moi public page sau moi lan `turbo:load`.
  - Params: `page_location`, `page_path`, `page_title`.
- `cta_click_hire_me`:
  - Nut `Hire Me` tren header global.
- `cta_click_view_project`:
  - Nut `View Projects` o hero section trang Home.
- `contact_submit`:
  - Form contact (`/contact`) qua `data-analytics-event` tren form.
- `resume_download`:
  - Nut `Download CV` tai trang About.
- `project_outbound_click`:
  - Cac outbound link (repo/live demo/...) trong project detail.
- `post_tag_click`:
  - Cac nut tag o blog index va blog detail.

## GA4 Setup Notes
- Dat bien moi truong khi chay app:
  - `GA_MEASUREMENT_ID=G-XXXXXXX`
- Dev/test:
  - Khong dat bien thi tracking script khong duoc inject.
- Production:
  - Dat `GA_MEASUREMENT_ID` trong env/secret manager cua he thong deploy.

## Verification Checklist (DevTools + Social Debugger)
- DevTools:
  - Mo Network tab, loc `collect?v=2` va xac nhan event GA4 duoc gui.
  - Kiem tra head metadata tren cac page: home, blog index/detail, project index/detail, about, contact.
  - Kiem tra `canonical`, `og:*`, `twitter:*` map dung theo page.
- GA4 DebugView:
  - Xac nhan co event: `page_view`, `contact_submit`, `project_outbound_click`, `post_tag_click`, `resume_download`, `cta_click_hire_me`, `cta_click_view_project`.
- Social debugger:
  - Facebook Sharing Debugger: scrape lai URL va xac nhan title/description/image.
  - LinkedIn Post Inspector: inspect lai URL va xac nhan preview tuong ung.
