# Durable decisions

Load only when public presentation data or cross-plugin architecture is relevant.

- Avatar frame/nameplate/card-decoration fields are public presentation data only; never expand them with sensitive account/auth data.
- Frontend connectors render server/custom-field state; they do not establish entitlement or authorization.
- Cosmetic identifiers/media paths/CSS/URLs remain injection-sensitive and must be constrained/escaped.
- Large `public/` media trees are exact-asset only for AI inspection; broad scans are not part of normal work.
- Conceptual overlap with `discourse-user-cosmetics` does not authorize coupling, migration, or architecture merging without an explicit migration task.

Do not record temporary PR/CI state here; use `CURRENT_STATE.md` for volatile facts.
