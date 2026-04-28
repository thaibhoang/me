# TODO — Tính năng chưa hoàn thiện

> Cập nhật: 2026-04-28  
> Dựa trên review toàn bộ codebase, schema, view, controller và so sánh với `PROJECT_SCOPE.md`, `FEATURE_ROADMAP.md`, `MVP_IMPLEMENTATION_CHECKLIST.md`.

---

## Tóm tắt nhanh

| Nhóm | Đã làm | Chưa làm |
|---|---|---|
| Core pages (routes + layout) | ✅ | — |
| CMS Admin (RailsAdmin + Devise) | ✅ | — |
| Domain models / Schema | ✅ | — |
| SEO baseline (meta, OG, sitemap) | ✅ | — |
| Analytics GA4 + event tracking | ✅ | — |
| UI ViewComponent system | ✅ | — |
| Blog filter category/tag | ✅ | — |
| Contact form submit | ✅ | — |
| **Nội dung thật (real content)** | ✅ | Seed từ CV thật |
| **About — Skills & Social Links** | ✅ | Hoàn thành |
| **Project detail đầy đủ** | ✅ | Hoàn thành |
| **Tech-badge cross-filter** | ❌ | Chưa làm |
| **Rich text / Action Text** | ❌ | Dùng plain text |
| **Post scheduling** | ❌ | Chưa có column + job |
| **Pagination** | ❌ | Chưa làm |
| **Footer** | ❌ | Thiếu hoàn toàn |
| **JSON-LD Structured Data** | ❌ | Chưa làm |
| **Phase 3: Comments** | ❌ | Chưa làm |
| **Phase 4: Ops / Deploy** | ❌ | Chưa làm |
| **Manual QA** | ❌ | Chưa thực hiện |

---

## Chi tiết từng hạng mục

---

### 1. Nhập nội dung thật (Real Content) ✅

**Hoàn thành** — Đã seed từ CV thật (profile, experiences, skills, social links, 4 projects, 3 posts).

---

### 2. About page — Skills và Social Links ✅

**Hoàn thành** — Đã render đầy đủ:
- Social Links động từ DB (sidebar aside)
- Availability badge với dot indicator
- Experience kèm description và date format đẹp
- Skills nhóm theo `group_name`, hiển thị dạng badge, link đến blog filter theo tag

---

### 3. Project detail — đầy đủ sections ✅

**Hoàn thành** — Đã implement:
- Migration + model `ProjectTag` (join `Project ↔ Tag`)
- `Project` và `Tag` model có `has_many :tags through: :project_tags`
- Seed gán tags thực tế cho 4 projects
- `projects/show.html.erb`: Challenge/Solution, Impact Metrics (before→after), Key Achievements, Tech Stack badges
- `projects/index.html.erb`: filter theo tag + badges hiển thị trên mỗi project card

---

### 4. Contact page — Social Links hardcode

**Ưu tiên: 🟡 Trung bình**

Sidebar trong `app/views/contact/new.html.erb` đang hardcode "GitHub / LinkedIn / Twitter". Cần:

- [ ] Render `@social_links` động từ `Profile#social_links` (đã có model, chưa load trong controller)
- [ ] Thêm `@social_links = Profile.first&.social_links&.order(:position)` trong `ContactController`

---

### 5. Cross-content Tech Badge Filter

**Ưu tiên: 🟡 Trung bình — yêu cầu rõ trong PROJECT_SCOPE.md**

> "Click vào badge (vd: Rails, AWS, React) để lọc toàn bộ nội dung liên quan."

Hiện tại chỉ có filter tag trên `/blog`. Cần:

- [ ] Thêm join `Project ↔ Tag` (migration + model + seed)
- [ ] Cho phép filter project theo tag trên `/projects?tag=rails`
- [ ] Trang `/tags/:slug` hoặc dùng query param thống nhất để hiển thị cả posts lẫn projects liên quan đến một tech tag

---

### 6. Post — Rich Text & Hero Image

**Ưu tiên: 🟡 Trung bình**

- Hiện tại `post.content` là `text` column, render bằng `simple_format` — mất formatting
- `ARCHITECTURE.md` định nghĩa dùng **Action Text** cho body và **Active Storage** cho `hero_image`

- [ ] Migrate `content` sang Action Text (`has_rich_text :body`)
- [ ] Thêm Active Storage attachment `hero_image` cho Post
- [ ] Cập nhật view `blog/show.html.erb` để render `@post.body` (rich text) thay `@post.content`
- [ ] Hiển thị `hero_image` trong post detail và post card

---

### 7. Post Scheduling (Auto-publish)

**Ưu tiên: 🟡 Trung bình — Phase 3**

- Schema hiện tại **không có** cột `scheduled_at` trong `posts`
- Không có background job để tự động publish post khi đến giờ

- [ ] Thêm migration `add_scheduled_at_to_posts`
- [ ] Thêm enum status `scheduled: 2`
- [ ] Tạo `PublishScheduledPostsJob` chạy định kỳ qua Solid Queue + `config/recurring.yml`
- [ ] Cập nhật RailsAdmin để admin set `scheduled_at`

---

### 8. Reading Time

**Ưu tiên: 🟢 Thấp**

`ARCHITECTURE.md` đề xuất `reading_time` cho Post, hiện **chưa có** trong schema.

- [ ] Thêm migration `add_reading_time_to_posts` (integer, minutes)
- [ ] Tính toán auto trong `Post#before_save` hoặc callback dựa vào word count
- [ ] Hiển thị trong post card và post header

---

### 9. Pagination

**Ưu tiên: 🟡 Trung bình**

`/blog` và `/projects` không có pagination — toàn bộ records được load cùng lúc.

- [ ] Thêm gem `pagy` (nhẹ, không phụ thuộc JS)
- [ ] Apply pagination trong `BlogController#index` và `ProjectsController#index`
- [ ] Render pagination links trong view

---

### 10. Footer

**Ưu tiên: 🟡 Trung bình**

Layout `application.html.erb` **không có footer**. Theo design và scope:

- [ ] Tạo footer component hoặc partial với: nav links, social links, copyright
- [ ] Thêm vào cuối `<body>` trong layout

---

### 11. JSON-LD Structured Data

**Ưu tiên: 🟡 Trung bình — Phase 2 scope**

> Đã có OpenGraph/Twitter card nhưng JSON-LD chưa được implement.

- [ ] Thêm JSON-LD `Article` schema cho `/blog/:slug`
- [ ] Thêm JSON-LD `Person` schema cho `/about`
- [ ] Thêm JSON-LD `WebSite` + `BreadcrumbList` cho trang chính
- [ ] Inject qua `yield :head` trong layout tương tự cách SEO meta đang làm

---

### 12. Manual QA — Các flow quan trọng

**Ưu tiên: 🔴 Cao — cần làm trước release**

Theo `MVP_IMPLEMENTATION_CHECKLIST.md` section "Chốt release MVP":

- [ ] QA flow: Publish post từ admin → kiểm tra hiển thị đúng trên `/blog` và `/blog/:slug`
- [ ] QA flow: Browse projects → mở project detail → click link ngoài → verify analytics event
- [ ] QA flow: Gửi contact form → kiểm tra `ContactMessage` được lưu trong DB
- [ ] Chạy lại full quality gates: `bin/rails test`, `bin/rails test:system`, `bin/rubocop`, `bin/brakeman`, `bin/bundler-audit`, `bin/importmap audit`
- [ ] Cập nhật docs nếu có thay đổi

---

### 13. Phase 3 — Comment System

**Ưu tiên: 🟢 Thấp — Phase 3**

- [ ] Tích hợp **Giscus** (GitHub Discussions) vào `blog/show.html.erb` — ưu tiên vì không cần backend thêm
- [ ] Hoặc xây Hotwire comment system nếu muốn kiểm soát hoàn toàn

---

### 14. Phase 3 — Analytics Dashboard nội bộ

**Ưu tiên: 🟢 Thấp — Phase 3**

- [ ] Trang `/admin/analytics` (hoặc tích hợp vào RailsAdmin) hiển thị:
  - Top posts theo lượt xem
  - Conversion rate từ CTA → contact
  - Resume download count

---

### 15. Phase 4 — Ops & Deploy

**Ưu tiên: 🟢 Thấp — Phase 4**

- [ ] Hoàn thiện `config/deploy.yml` cho **Kamal 2** — one-command deploy
- [ ] Kiểm tra **Solid Queue** hoạt động trên production (`config/queue.yml`)
- [ ] Kiểm tra **Solid Cache** hoạt động cho trang public (`config/cache.yml`)
- [ ] Cấu hình **Active Storage** với cloud provider (S3 hoặc tương đương)
- [ ] Lazy loading cho `project_visuals` images
- [ ] Cấu hình image variants (thumbnail, OG image) qua `image_processing`
- [ ] Submit `sitemap.xml` lên Google Search Console

---

## Thứ tự ưu tiên đề xuất

```
1. [🔴] Nhập nội dung thật (profile, projects, posts)
2. [🔴] Manual QA + full quality gates
3. [🔴] About page: Skills + Social Links
4. [🔴] Project detail: Challenge/Solution/Metrics/Achievements
5. [🟡] Contact page: Social links từ DB
6. [🟡] Footer
7. [🟡] Pagination (blog + projects)
8. [🟡] Post rich text (Action Text + hero image)
9. [🟡] JSON-LD Structured Data
10. [🟡] Cross-content tech badge filter
11. [🟡] Post Scheduling
12. [🟢] Reading Time
13. [🟢] Comment System (Giscus)
14. [🟢] Analytics Dashboard nội bộ
15. [🟢] Phase 4 Ops / Kamal Deploy
```
