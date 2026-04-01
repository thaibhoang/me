# Decisions Log (ADR-lite)

Su dung file nay de luu cac quyet dinh ky thuat quan trong.

## Template
### [DATE] Decision title
- Context:
- Decision:
- Alternatives considered:
- Consequences:
- Owner:

## Initial Decisions
### [2026-04-01] Rails 8 monolith with Hotwire
- Context: Du an can time-to-market nhanh va de maintain.
- Decision: Chon Rails 8 + Hotwire + Importmap theo huong convention-first.
- Alternatives considered: Tach API + SPA, hoac dung JS bundler phuc tap.
- Consequences: Giam do phuc tap ban dau, de mo rong dan theo phase.
- Owner: Project team

### [2026-04-01] Prioritize Giscus for comments
- Context: Can comment system nhanh, co san auth va anti-spam co ban.
- Decision: Uu tien Giscus o phase engagement.
- Alternatives considered: Tu xay comments bang Hotwire ngay tu dau.
- Consequences: Trien khai nhanh, phu thuoc GitHub Discussions.
- Owner: Project team

### [2026-04-01] MVP content stack uses plain Active Record text fields
- Context: Can ra MVP nhanh cho publish/showcase/contact flow, truoc khi mo rong rich editor.
- Decision: Dung `content:text` cho Post va `image_url` cho media links trong Phase 1; chua bat Action Text/Active Storage.
- Alternatives considered: Bat Action Text + Active Storage ngay tu dau.
- Consequences: Toc do trien khai nhanh hon, doi lai can migration nang cap sau khi mo rong CMS.
- Owner: Project team

### [2026-04-01] Public SEO baseline centralized in Application layout
- Context: Moi public route deu phai co title/meta/canonical va social tags.
- Decision: Dat metadata helper o `ApplicationController` va render OG/Twitter tags trong layout chung.
- Alternatives considered: Dat meta rieng le tung view.
- Consequences: Tranh thieu metadata o page moi, de audit SEO hon.
- Owner: Project team

### [2026-04-01] Use RailsAdmin + Devise for MVP internal CMS
- Context: Can mini CMS `/admin` de CRUD nhanh cho Post/Project/Category/Tag ma khong mo rong scope xay giao dien admin rieng.
- Decision: Dung `rails_admin` cho admin panel va `devise` voi model `AdminUser` de bao ve khu vuc admin.
- Alternatives considered: Tu xay admin UI bang SSR/Hotwire; HTTP Basic Auth thu cong cho toan bo `/admin`.
- Consequences: Giam thoi gian trien khai MVP, doi lai phu thuoc vao importmap workaround cho rails_admin tren Rails 8.
- Owner: Project team

### [2026-04-01] Mobile-first polish uses shared ViewComponent style contract
- Context: Da co `view_component` cho button/card/section, can polish UI theo `design/mobile/*` tren toan bo public pages ma khong nhan doi class tai tung view.
- Decision: Chuan hoa style contract trong `Ui::ButtonComponent`, `Ui::CardComponent`, `Ui::SectionTitleComponent`, `Ui::SectionBlockComponent` va cap nhat public layout shell mobile-first.
- Alternatives considered: Them class truc tiep trong tung view cho moi man hinh; tach rieng mobile/desktop views.
- Consequences: Giao dien dong bo va de maintain hon; doi lai test component can update khi doi class naming.
- Owner: Project team

### [2026-04-01] Desktop responsive reuses mobile-first component contract
- Context: Checklist MVP muc UI can bo sung responsive desktop theo `design/pc/*`, trong khi mobile polish da hoan thanh.
- Decision: Mo rong layout shell + responsive utility classes tren `Ui::*Component` va dieu chinh bo cuc tung view bang `md/lg/xl`; khong tach view rieng cho desktop.
- Alternatives considered: Viet class desktop truc tiep tren moi block view; tao cap view rieng cho mobile va desktop.
- Consequences: Giam duplicate style va giu duoc kha nang maintain; doi lai can canh bao regression qua component tests va QA breakpoint.
- Owner: Project team

### [2026-04-01] Client-side GA4 tracking via data attributes
- Context: Phase SEO + Analytics can map day du event convention cho CTA/link/form, dong thoi ho tro Turbo navigation ma khong duplicate code JS theo tung view.
- Decision: Tich hop GA4 qua `GA_MEASUREMENT_ID`, tao tracking layer `app/javascript/analytics.js`, va gan event qua `data-analytics-*` attributes tren view/component.
- Alternatives considered: Goi `gtag` truc tiep tai tung view; tiep tuc chi log server-side.
- Consequences: De mo rong event nhanh va dong bo naming convention; can QA data attributes khi thay doi UI components.
- Owner: Project team
