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
