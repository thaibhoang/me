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
