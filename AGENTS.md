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

Stop for unresolved cross-plugin migration, public-data/privacy, security, or product decisions. Preserve unrelated work and `.claude/settings.local.json`; no destructive Git/deploy/production actions. Prefer targeted reads/diffs over broad scans.

## CI-only merge gate
Claude/Gemini/Codex reviewer or verifier approval is not required and must never block merge. Do not request or wait for AI approvals as a merge condition.

For a normal scoped PR, the merge gate is CI only:
- validate exact changed paths still match the task;
- use only the latest exact PR head SHA;
- require the official `Discourse Plugin` CI workflow on that exact head to conclude GREEN;
- the base branch must keep `.github/workflows/discourse-plugin.yml` using the official Discourse reusable workflow;
- a new commit invalidates all older CI evidence;
- `NO_CI`, missing, skipped, pending, cancelled, neutral, stale-head, or failed checks are not GREEN.

When the latest exact head is GREEN and no unresolved security/schema/product/architecture blocker remains, the agent is pre-authorized to merge without another user confirmation. Prefer squash merge with `expected_head_sha` when supported. Never weaken tests or broaden scope just to obtain GREEN.

Reusable procedures live under `.agents/skills/` and load on demand; use `task-packet` for non-trivial work.

## Adaptive model / effort routing
Classify execution risk with `docs/ai/EFFORT_ROUTER.md` before broad reads. Start at the lowest sufficient tier: T0 mechanical, T1 routine, T2 high-risk, T3 exceptional. Escalate for risk/ambiguity rather than task size, and de-escalate when the risky phase ends. Use platform-native workers under `.claude/agents/` or `.codex/agents/` when supported; never trade away correctness, public-data safety, or validation to save tokens.

## Live Discourse developer source gate

Canonical live upstream index: https://meta.discourse.org/t/developer-guides-index/308036?tl=en

For any Discourse-version-sensitive implementation, refactor, review, or compatibility decision:
- start at the live Developer Guides Index and open only the task-relevant official topic(s);
- for plugin work prioritize **Code & Internals + Plugins**; for theme work prioritize **Code & Internals + Themes & Components / Theme Developer Tutorial**; use environment/general guides only when relevant;
- verify version-sensitive APIs and deprecations against current `discourse/discourse` core or the current official plugin/theme skeleton before coding when needed;
- current official docs/core beat remembered examples, old snippets, and copied local guidance unless the repo deliberately targets an older validated release via `.discourse-compatibility` / d-compat;
- do not preload the full index: read the nearest local rules and target source/tests first, then fetch only the upstream guide(s) needed for the current choice.
