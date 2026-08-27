# Validation commands

Run from a Discourse checkout with this repository installed under `plugins/discourse-avatar-decorations`.

- One Ruby spec, only if relevant spec exists: `LOAD_PLUGINS=1 bin/rspec plugins/discourse-avatar-decorations/spec/path/to/example_spec.rb`
- Plugin Ruby specs, only if specs exist: `bundle exec rake "plugin:spec[discourse-avatar-decorations]"`
- Plugin QUnit, only if frontend tests exist: `CI=1 bundle exec rake "plugin:qunit[discourse-avatar-decorations]"`

No `.github/workflows` directory was present on `main` when created (2026-08-27). Do not call CI GREEN unless an exact-head workflow/check actually exists and ran.

For media/frontend-only work, prefer targeted source/static validation; do not scan all assets or invent a runtime suite.
