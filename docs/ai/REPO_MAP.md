# Repository map

Use this to choose paths before searching. Source code remains authoritative if the map becomes stale.

- `plugin.rb` — public custom-field/serializer/plugin registration.
- `assets/javascripts/discourse/` — Glimmer/connectors/profile/card/post/preferences UI; read local `AGENTS.md`.
- `assets/` — bundled frontend assets.
- `public/` — large shipped decoration media tree; read `public/AGENTS.md` and inspect exact assets only.
- `config/` — settings/locales/configuration.
- `docs/` — AI state/workflow and stable docs; do not preload wholesale.

Fast read order: root `AGENTS.md` -> task packet -> nearest local `AGENTS.md` -> exact connector/symbol -> exact asset if needed. Never start from a broad `public/` scan.
