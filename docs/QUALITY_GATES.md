# Quality Gates

## Definition Of Done (DoD)
Mot task duoc xem la hoan thanh khi dam bao:
- Dung scope theo phase trong roadmap.
- Pass test lien quan.
- Khong tao loi lint/security moi.
- Co cap nhat docs neu thay doi behavior, model, hoac tich hop.

## Mandatory Checks Before Merge
- `bin/rails test`
- `bin/rails test:system` (neu task co UI flow)
- `bin/rubocop`
- `bin/brakeman --no-pager`
- `bin/bundler-audit`
- `bin/importmap audit`

## Test Coverage Expectations
- Model-level rules: validation, scopes, state transitions.
- Request/integration: routes public, filter logic, error handling.
- System tests: luong nguoi dung quan trong (publish post, browse project, submit contact).
- Jobs: scheduling, retry behavior, idempotency co ban.

## SEO Gate For Public Features
- Route public moi co:
  - title
  - meta description
  - canonical URL
- Social metadata:
  - Open Graph tags
  - Twitter card tags

## Documentation Gate
- Bat buoc cap nhat:
  - `docs/ARCHITECTURE.md` khi doi model/flow.
  - `docs/CONTENT_MODEL.md` khi doi trang thai/noi dung.
  - `docs/SEO_ANALYTICS.md` khi doi metadata/tracking.
  - `docs/DECISIONS.md` khi co quyet dinh ky thuat lon.

## Security Gate
- Khong commit `.env`, key files, credentials plaintext.
- Validate va sanitize input tu forms.
- Kiem tra output HTML tu markdown/rich text de tranh XSS.

## Release Readiness Checklist
- [ ] Feature pass local checks.
- [ ] Feature pass CI.
- [ ] Docs da cap nhat.
- [ ] No blocking issue in known risks list.
