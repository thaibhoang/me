# Feature Roadmap

## Phase 1 - MVP (Core Publishing + Portfolio)
Muc tieu: co the xuat ban noi dung, gioi thieu du an, va nhan lien he.

### Scope
- Home page gom intro, featured projects, latest posts, CTA.
- Blog:
  - Post CRUD.
  - Post state: draft/published.
  - Category/Tag filter.
- Portfolio:
  - Project CRUD.
  - Hinh anh demo + mo ta + tech badges + link.
- About page.
- Contact page (form gui lien he va/hoac mailto/social links).

### Acceptance Criteria
- Co the tao bai viet moi va publish.
- Nguoi dung loc duoc bai viet theo tag/category.
- Nguoi dung xem duoc project detail va click link ngoai.
- Form lien he tao ban ghi hoac gui email thanh cong.

## Phase 2 - SEO + Discoverability + Analytics
Muc tieu: tang kha nang tim thay tren search va do luong hieu qua noi dung.

### Scope
- Gem/meta strategy cho title, description, canonical theo tung page type.
- Open Graph/Twitter card cho bai viet va du an.
- Sitemap XML va robots.txt.
- Structured data JSON-LD co ban.
- Tich hop analytics (GA4 hoac Plausible).

### Acceptance Criteria
- Moi page public co title/description hop ly.
- Preview link dep tren LinkedIn/Facebook.
- Sitemap hoat dong va duoc submit Search Console.
- Co dashboard event co ban (page_view, contact_submit, project_click).

## Phase 3 - Engagement Layer
Muc tieu: tao tuong tac va toi uu quy trinh xuat ban noi dung.

### Scope
- Comment system:
  - Uu tien Giscus (GitHub Discussions) de trien khai nhanh.
  - Option Hotwire comments cho ban nang cao.
- Post scheduling (scheduled -> published bang background job).
- Internal lightweight dashboard:
  - Top posts.
  - Conversion from CTA.

### Acceptance Criteria
- Co comment tren bai viet da publish.
- Bai viet scheduled duoc publish dung thoi diem.
- Theo doi duoc bai nao hieu qua nhat theo view/click.

## Phase 4 - Ops + Performance + Scale
Muc tieu: tang do on dinh va kha nang deploy van hanh.

### Scope
- Hoan thien deploy voi Kamal 2.
- Toi uu media pipeline (image variant, lazy loading, cache policy).
- Dung Solid Queue cho job nen.
- Dung Solid Cache cho trang public cache-friendly.

### Acceptance Criteria
- Deploy one-command qua Kamal.
- TTFB/page load duoc cai thien ro tren page public.
- Job queue va cache hoat dong on dinh tren production.

## Prioritization Rules
- Uu tien thu tu: Publish > Discoverability > Engagement > Optimization.
- Tinh nang moi phai gan voi KPI trong `docs/PROJECT_SCOPE.md`.
- Khong mo rong scope neu chua pass quality gates cua phase hien tai.
