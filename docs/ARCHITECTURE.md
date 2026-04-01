# Architecture

## Technical Direction
- Monolith Rails 8 theo convention-first.
- SSR la mac dinh, ket hop Hotwire cho tuong tac realtime/lightweight.
- Tranh phu thuoc khong can thiet trong giai doan dau.

## Suggested Domain Model

### Core Content
- `Post`
  - title, slug, excerpt, status, published_at, scheduled_at, reading_time
  - body dung Action Text
  - hero_image qua Active Storage
- `Category`
  - name, slug
- `Tag`
  - name, slug
- `PostTag` (join)

### Portfolio
- `Project`
  - title, slug, summary, challenge, solution, outcome
  - repo_url, live_url
  - featured:boolean, published_at
- `TechStack`
  - name, slug, badge_style
- `ProjectTechStack` (join)

### Contact and Tracking
- `ContactLead`
  - name, email, message, source, status
- `PageViewEvent` (optional, neu tu luu analytics noi bo)
  - event_name, path, referrer, metadata_json

## Content Relationships
- Post has_one_rich_text :body
- Post has_many :tags, through: :post_tags
- Post belongs_to :category, optional: true
- Project has_many :tech_stacks, through: :project_tech_stacks
- TechStack duoc tai su dung cho ca Post va Project (neu mo rong them join cho Post)

## Feature Mapping To Rails
- Rich text editor: Action Text.
- Media upload + image variants: Active Storage + image_processing.
- Scheduled publish: Active Job voi Solid Queue.
- Page fragment caching: Rails cache voi Solid Cache.
- Dynamic interaction (filter/comment neu tu xay): Turbo + Stimulus.

## Routing Strategy (target)
- Public:
  - `/` home
  - `/blog`, `/blog/:slug`
  - `/projects`, `/projects/:slug`
  - `/about`
  - `/contact`
  - `/tags/:slug`
- Internal CMS:
  - `/admin/posts`
  - `/admin/projects`
  - `/admin/tags`
  - `/admin/categories`

## Implemented MVP Snapshot (2026-04-01)
- Public routes da trien khai:
  - `/` home
  - `/blog`, `/blog/:slug`
  - `/projects`, `/projects/:slug`
  - `/about`
  - `/contact` (GET + POST submit)
  - `/sitemap.xml`
- Internal CMS/auth da trien khai:
  - `/admin` qua `RailsAdmin::Engine`
  - Dang nhap admin qua Devise (`AdminUser`)
  - Route auth admin: `/admin_users/sign_in`, `/admin_users/sign_out`
- Domain models da tao cho MVP:
  - Blog: `Post`, `Category`, `Tag`, `PostTag`
  - Portfolio: `Project`, `ProjectLink`, `ProjectVisual`, `ProjectMetric`, `ProjectAchievement`
  - About/Contact: `Profile`, `Experience`, `Skill`, `SocialLink`, `ContactMessage`
  - Admin: `AdminUser`
- Rang buoc DB da ap dung:
  - Slug unique index cho `posts`, `projects`, `categories`, `tags`
  - Check constraint cho status enum (`posts`, `projects`, `contact_messages`)
  - FK cascade/nullify cho bang con theo use-case

## Markdown Strategy
- Nguoi viet ky thuat can markdown cho code snippet.
- Huong de xuat:
  - Luu noi dung chinh bang Action Text.
  - Ho tro import/convert markdown qua service object (vd: `Content::MarkdownImporter`).
  - Sanitize output de tranh XSS.
- Rule: khong render markdown raw truc tiep neu chua sanitize.

## Background Jobs
- `PublishScheduledPostJob`: chuyen state scheduled -> published.
- `GenerateProjectThumbJob`: tao variant/thumbnail cho media.
- `NotifyContactLeadJob` (tuy chon): gui thong bao email/Slack.

## Caching Entry Points
- Home sections: latest posts + featured projects.
- Blog index filters.
- Project detail public.
- Invalidate cache khi publish/unpublish post hoac cap nhat project featured.

## Admin Operations (MVP)
- Admin panel dung RailsAdmin, uu tien CRUD:
  - `Post`, `Project`, `Category`, `Tag`
- Co mo rong de nhap content that:
  - `Profile`, `SocialLink`, `Experience`, `Skill`
  - `ProjectLink`, `ProjectVisual`, `ProjectMetric`, `ProjectAchievement`
- Bootstrap tai khoan admin ban dau qua task:
  - `ADMIN_EMAIL=... ADMIN_PASSWORD=... bin/rails admin:bootstrap`
