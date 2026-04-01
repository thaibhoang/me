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
