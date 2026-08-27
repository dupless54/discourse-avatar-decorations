# Discourse Avatar Decorations Agent Router

Canonical instructions for ChatGPT/Codex, Claude, and Gemini.

## Context routing
Current source/tests > `docs/ai/CURRENT_STATE.md` > nearest local `AGENTS.md` > stable docs > plans/history. Read only the current task surface:
- Discourse/Glimmer connectors -> `assets/javascripts/discourse/AGENTS.md`
- shipped media/assets -> `public/AGENTS.md`
For multi-session work use the minimal `docs/ai/work/<feature>/{state.md,progress.md,implementation-plan.md}` packet.

## Fast task path
For non-trivial work, use `.agents/skills/task-packet/SKILL.md` before broad reads. Use `docs/ai/REPO_MAP.md` to locate code/assets, `COMMANDS.md` only for validation, and `DECISIONS.md` only for public-data/cross-plugin choices. Skip the formal packet for trivial one-file edits.

## Product and security invariants
This plugin exposes avatar-frame, nameplate, and user-card-decoration custom fields as intentional public presentation data and renders them across profile/card/post surfaces.

- Do not add sensitive account/auth fields to public serializers/custom fields.
- Server/custom-field values remain the source of presentation state; frontend connectors do not invent authorization or ownership.
- Treat cosmetic identifiers, media paths, CSS classes, URLs, and admin/user-editable values as untrusted unless explicitly allowlisted.
- Escape text and avoid raw HTML/arbitrary CSS/JS injection.
- Keep decoration behavior consistent across profile, card, post, and preferences surfaces.
- Public media is large; never scan/open the entire image tree for unrelated tasks. Inspect exact assets only when the task names or renders them.
- This repository overlaps conceptually with the newer `discourse-user-cosmetics` system. Do not merge/cross-couple architectures or migrate data merely because concepts overlap; that requires an explicit task and migration plan.

## Implementation/tests/safety
Use current Discourse plugin/Glimmer APIs verified from source. Make the smallest maintainable change, preserve existing themes/layout, and use locale-backed visible copy where applicable. For authorization/security work read the security skill. Never claim unrun tests passed; use source/static checks when no runtime suite exists.

Stop for unresolved cross-plugin migration, public-data/privacy, security, or product decisions. Preserve unrelated work and `.claude/settings.local.json`; no destructive Git/deploy/production actions. Remote writes only when explicitly authorized. Prefer targeted reads/diffs over broad scans.

Reusable procedures live under `.agents/skills/` and load on demand; use `task-packet` for non-trivial work.

## Adaptive model / effort routing
Classify execution risk with `docs/ai/EFFORT_ROUTER.md` before broad reads. Start at the lowest sufficient tier: T0 mechanical, T1 routine, T2 high-risk, T3 exceptional. Escalate for risk/ambiguity rather than task size, and de-escalate when the risky phase ends. Use platform-native workers under `.claude/agents/` or `.codex/agents/` when supported; never trade away correctness, public-data safety, or validation to save tokens.
