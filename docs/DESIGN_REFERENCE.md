# Design Reference

## Source Of Truth For UI
- Toan bo giao dien phai bam sat mockup trong thu muc `design/`.
- Uu tien theo thu tu:
  - `design/mobile/*` cho responsive mobile-first.
  - `design/pc/*` cho desktop adjustments.

## Current Design Files
- Mobile:
  - `design/mobile/home.html`
  - `design/mobile/blog_index.html`
  - `design/mobile/portfolio.html`
  - `design/mobile/project_detail.html`
  - `design/mobile/about.html`
  - `design/mobile/contact.html`
- PC:
  - `design/pc/about.html`

## Mapping To Rails Views
- Home -> `app/views/home/index.html.erb`
- Blog index/detail -> `app/views/blog/*`
- Portfolio index/detail -> `app/views/projects/*`
- About -> `app/views/about/show.html.erb`
- Contact -> `app/views/contact/new.html.erb`

## Agent UI Implementation Rules
- Khong tu y doi layout/chu de mau neu chua co cap nhat design file.
- Uu tien tai su dung component style (button, card, section title) tu design.
- Neu design mobile va desktop khac nhau, dung Tailwind responsive classes, khong tao 2 view tach roi.
- Text placeholder trong design duoc phep doi sang noi dung that, nhung giu nguyen hierarchy va spacing.

## Implemented Mobile-first Baseline (2026-04-01)
- Layout shell:
  - Header sticky + nav compact cho mobile, mo rong spacing tu `sm` tro len.
  - Main container dung `max-w-7xl`, padding mobile `px-4` va desktop `sm:px-6`.
- Shared components (`app/components/ui/*`) da chuan hoa:
  - `ButtonComponent`: rounded-full CTA/chip styles, tracking uppercase cho primary/secondary.
  - `CardComponent`: surface card `rounded-xl`, border/subtle background, text hierarchy title/meta/body.
  - `SectionTitleComponent`: heading `text-3xl` + subtitle rhythm `mt-3` theo mobile-first.
  - `SectionBlockComponent`: spacing mac dinh `space-y-5`.
- Mapping da polish theo mobile mockup:
  - `home/index`, `blog/index`, `blog/show`, `projects/index`, `projects/show`, `about/show`, `contact/new`.

## Design Gap Handling
- Neu design chua co cho mot man hinh:
  - Giu style nhat quan voi man da co.
  - Ghi lai quyet dinh vao `docs/DECISIONS.md`.
- Neu xung dot giua UX thuc te va mockup:
  - Uu tien kha dung/accessibility.
  - Ghi ro trade-off trong PR note.
