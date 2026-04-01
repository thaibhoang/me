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
