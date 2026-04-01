# Agent Workflow

## Operating Principles
- Agent phai doc tai lieu trong `docs/` truoc khi implement tinh nang.
- Uu tien dung Rails conventions truoc khi tao abstraction moi.
- Bam sat phase trong `docs/FEATURE_ROADMAP.md`.

## Implementation Flow
1. Xac dinh feature thuoc phase nao.
2. Doc cac tai lieu lien quan:
   - Scope: `docs/PROJECT_SCOPE.md`
   - Domain/content: `docs/ARCHITECTURE.md`, `docs/CONTENT_MODEL.md`
   - SEO/analytics: `docs/SEO_ANALYTICS.md`
3. De xuat thay doi nho, co the test duoc.
4. Implement theo convention Rails.
5. Them/cap nhat test.
6. Chay quality gates.
7. Cap nhat docs neu thay doi model/flow.

## Definition Of Done
- Feature dung scope va dung phase.
- Code pass test lien quan.
- Khong co loi lint/security moi.
- Co xu ly SEO co ban cho route public moi.
- Docs duoc cap nhat neu co thay doi behavior/domain.
- Tuan thu day du `docs/QUALITY_GATES.md` truoc khi dong task.

## Test Expectations
- Model logic -> model tests.
- HTTP behavior/controller flow -> request/integration tests.
- User flow quan trong -> system tests (Capybara).
- Background job -> job tests.

## Security And Reliability Checklist
- Params filtering cho du lieu nhay cam.
- Sanitize content render tu markdown/rich text.
- Khong commit secrets (`.env`, key files).
- Validate outbound URLs khi luu project links.

## Documentation Update Rules
- Thay doi domain model -> cap nhat `docs/ARCHITECTURE.md` va `docs/CONTENT_MODEL.md`.
- Thay doi SEO behavior -> cap nhat `docs/SEO_ANALYTICS.md`.
- Them rule quy trinh moi -> cap nhat `docs/AGENT_WORKFLOW.md`.
- Quyet dinh lon (gem/external service/data migration strategy) -> ghi vao `docs/DECISIONS.md`.

## Pull Request Checklist (for agents)
- Mo ta ro muc tieu thay doi.
- Neu co trade-off, ghi ly do trong PR notes.
- Liet ke test da chay.
- Liet ke docs da cap nhat.
