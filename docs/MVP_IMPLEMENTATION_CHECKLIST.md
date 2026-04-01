# MVP Implementation Checklist

Cap nhat lan cuoi: 2026-04-01

## 1) Da hoan thanh

- [x] Chot scope Phase 1 theo `docs/PROJECT_SCOPE.md` va `docs/FEATURE_ROADMAP.md`.
- [x] Tao domain schema cho MVP:
  - [x] Blog: `posts`, `categories`, `tags`, `post_tags`
  - [x] Portfolio: `projects`, `project_links`, `project_visuals`, `project_metrics`, `project_achievements`
  - [x] About/Contact: `profiles`, `experiences`, `skills`, `social_links`, `contact_messages`
- [x] Bo sung index/constraint quan trong (slug unique, status checks, FK strategy).
- [x] Tao model associations, validations, enum status, scopes co ban.
- [x] Dung routes/controllers/views cho 5 trang core:
  - [x] `/`, `/blog`, `/blog/:slug`
  - [x] `/projects`, `/projects/:slug`
  - [x] `/about`, `/contact` (GET + POST)
- [x] Hoan thien flow contact submit va luu ban ghi `contact_messages`.
- [x] Them SEO baseline trong layout:
  - [x] title, meta description, canonical
  - [x] Open Graph tags
  - [x] Twitter card tags
- [x] Them `sitemap.xml` va cap nhat `public/robots.txt`.
- [x] Them seed data mau de demo luong MVP.
- [x] Bo sung test cho flow chinh (model/controller/system).
- [x] Chay quality gates thanh cong:
  - [x] `bin/rails test`
  - [x] `bin/rails test:system`
  - [x] `bin/rubocop`
  - [x] `bin/brakeman --no-pager`
  - [x] `bin/bundler-audit`
  - [x] `bin/importmap audit`
- [x] Cap nhat tai lieu:
  - [x] `docs/ARCHITECTURE.md`
  - [x] `docs/CONTENT_MODEL.md`
  - [x] `docs/SEO_ANALYTICS.md`
  - [x] `docs/DECISIONS.md`

## 2) Buoc tiep theo (de xuat)

### A. Uu tien ngay (de MVP su dung duoc thuc te)
- [x] Tao mini CMS noi bo (`/admin`) cho CRUD:
  - [x] Post
  - [x] Project
  - [x] Category/Tag
- [x] Them co che auth don gian cho khu vuc admin.
- [ ] Nhap noi dung that thay cho seed demo (profile, projects, posts, social, CV link).

### B. Hoan thien UI theo design
- [ ] Doi chieu va polish giao dien theo `design/mobile/*` (mobile-first).
- [ ] Bo sung responsive adjustments theo `design/pc/*`.
- [x] Chuan hoa component style dung lai (button, card, section title, spacing) bang `view_component`.

### C. SEO + Analytics phase tiep theo
- [ ] Tich hop analytics that (GA4 hoac Plausible).
- [ ] Mapping day du event convention:
  - [ ] `page_view`
  - [ ] `cta_click_hire_me`
  - [ ] `cta_click_view_project`
  - [ ] `contact_submit`
  - [ ] `resume_download`
  - [ ] `project_outbound_click`
  - [ ] `post_tag_click`
- [ ] Verify metadata bang devtools va social debugger.

### D. Chot release MVP
- [ ] QA thu cong tren cac flow quan trong:
  - [ ] Publish va xem post
  - [ ] Browse va mo project detail
  - [ ] Gui contact form
- [ ] Chay lai full quality gates truoc release.
- [ ] Cap nhat docs neu co thay doi moi trong qua trinh polish/admin.
