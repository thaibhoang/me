# Personal Brand Platform (Rails 8)

Website ca nhan duoc xay dung bang Rails 8 de:
- Viet va chia se bai viet ky thuat/trai nghiem.
- Gioi thieu du an portfolio mot cach chuyen nghiep.
- Quang ba thuong hieu ca nhan va ket noi co hoi cong viec moi.

## Stack chinh
- Rails 8.1, PostgreSQL
- Hotwire (Turbo + Stimulus)
- Tailwind CSS
- Propshaft + Importmap
- Solid Cache, Solid Queue, Solid Cable
- Kamal 2 cho deployment

## Tai lieu du an
- `docs/PROJECT_SCOPE.md`: Muc tieu san pham, page structure, KPI.
- `docs/FEATURE_ROADMAP.md`: Lo trinh theo phase MVP -> nang cao.
- `docs/ARCHITECTURE.md`: Kien truc domain va mapping tinh nang Rails.
- `docs/CONTENT_MODEL.md`: Mo hinh noi dung, lifecycle bai viet, quy uoc slug/tag.
- `docs/SEO_ANALYTICS.md`: Chuan SEO, Open Graph, analytics, event tracking.
- `docs/DESIGN_REFERENCE.md`: Nguon tham chieu UI tu thu muc `design/`.
- `docs/AGENT_WORKFLOW.md`: Quy trinh agent, Definition of Done, checklist giao hang.
- `docs/QUALITY_GATES.md`: Bo quality gates bat buoc truoc merge/release.
- `docs/DECISIONS.md`: Nhat ky quyet dinh ky thuat quan trong (ADR-lite).

## Yeu cau moi truong
- Ruby theo `.ruby-version`
- PostgreSQL dang chay local
- Bundler

## Cai dat
```bash
bin/setup
```

Neu can, tao file `.env` cho bien moi truong local (khong commit).

## Chay ung dung local
```bash
bin/dev
```

## Tao va khoi tao database
```bash
bin/rails db:prepare
```

## Chay test va quality gates
```bash
bin/rails test
bin/rails test:system
bin/rubocop
bin/brakeman --no-pager
bin/bundler-audit
bin/importmap audit
```

## Deployment
Du an da co cau hinh co ban cho Kamal tai `config/deploy.yml`.
Khi trien khai that, cap nhat:
- `servers` va `registry`
- bien moi truong/secret (`RAILS_MASTER_KEY`, thong tin DB)
- SSL/proxy theo domain that

## Nguyen tac phat trien
- Bam sat roadmap theo phase trong `docs/FEATURE_ROADMAP.md`.
- Moi thay doi domain model hoac integration ben ngoai phai cap nhat `docs/DECISIONS.md`.
- Uu tien Rails conventions, khong over-engineering.
