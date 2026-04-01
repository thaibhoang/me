# Content Model

## Post Lifecycle
- `draft`: dang viet, chua public.
- `scheduled`: da len lich, cho den gio publish.
- `published`: da xuat ban, cho phep index SEO.
- `archived`: an khoi list chinh, giu de tham chieu.

## Post Fields (proposed)
- `title` (required, unique theo slug scope)
- `slug` (required, unique)
- `excerpt` (required cho card SEO/listing)
- `status` (enum)
- `published_at` (datetime)
- `scheduled_at` (datetime, optional)
- `reading_time` (integer, phut)
- `canonical_url` (optional)
- `meta_title`, `meta_description` (optional override)

## Project Fields (proposed)
- `title`, `slug`, `summary`
- `challenge`, `solution`, `outcome`
- `repo_url`, `live_url`
- `featured` (boolean)
- `published_at`

## Taxonomy Rules
- Category dung de nhom chu de lon (vd: Rails, Career, Architecture).
- Tag dung de nhan chi tiet (vd: Hotwire, AWS, CI/CD).
- Moi post nen co:
  - 1 category (khuyen nghi)
  - 2-5 tags

## Tech Stack Badge Rules
- Dung chung mot tap `TechStack` cho Blog va Portfolio.
- Badge slug la key chuan hoa (vd: `rails`, `react`, `aws`, `ai`).
- URL filter thong nhat:
  - `/tags/:slug` cho bai viet
  - `/projects?tech=:slug` cho du an

## Slug and URL Conventions
- Slug lowercase, kebab-case.
- Khong doi slug sau khi da published (neu doi, phai tao redirect 301).
- URL bai viet:
  - `/blog/:slug`
- URL du an:
  - `/projects/:slug`

## Editorial Conventions
- Moi bai viet co:
  - 1 opening paragraph neu van de va gia tri bai viet.
  - heading ro rang theo H2/H3.
  - section "Key takeaways".
- Do dai excerpt:
  - 140-180 ky tu.
- Hero image:
  - Ty le 16:9, co alt text y nghia.

## Publish Rules
- Chi `published` moi duoc index SEO.
- `scheduled` can co `scheduled_at` > now.
- Publish action phai cap nhat `published_at`.

## Validation Baseline
- Presence: title, slug, status.
- Uniqueness: slug.
- URL format: repo/live URL hop le.
- Transition logic:
  - draft -> scheduled/published
  - scheduled -> published/archived
  - published -> archived

## MVP Implementation Notes (2026-04-01)
- Post status hien dang su dung enum:
  - `draft` (0)
  - `published` (1)
- Project status hien dang su dung enum:
  - `draft` (0)
  - `published` (1)
- Contact message status hien dang su dung enum:
  - `unread` (0)
  - `read` (1)
  - `archived` (2)
- MVP hien tai dung `content:text` cho bai viet (SSR), chua bat Action Text.
- Co them `AdminUser` de quan tri noi bo:
  - Auth qua Devise (database_authenticatable, recoverable, rememberable, validatable)
  - Khong mo dang ky cong khai cho admin (`skip: [:registrations]`)
