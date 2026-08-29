<p align="center">
  <a href="https://buymeacoffee.com/erespawn">
    <img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me a Coffee" width="217" height="60">
  </a>
</p>

# Discourse Avatar Decorations

A lightweight Discourse cosmetics presentation plugin for avatar frames, nameplates, and user-card decorations.

## Status

The repository currently provides the original lightweight cosmetics implementation and is maintained separately from the newer `discourse-user-cosmetics` platform. The two projects overlap conceptually, but they do not share an automatic migration path or dependency.

## Features

- Editable `avatar_frame`, `nameplate`, and `user_card_decoration` user custom fields.
- Public presentation data for user profiles and user cards.
- Avatar-frame and nameplate presentation data on posts.
- Theme/frontend assets for rendering cosmetic presentation across supported Discourse surfaces.
- Site-level enable/disable control through `cosmetics_enabled`.

Only cosmetic presentation identifiers are exposed publicly. Account, authentication, authorization, and other sensitive user data are outside this plugin's public contract.

## Recent Repository Updates

Recent maintenance has focused on repository governance and development tooling rather than changing the runtime cosmetics contract:

- token-efficient project context and task routing;
- risk-based development/review guidance;
- CI-first delivery documentation;
- project funding metadata and Buy Me a Coffee support link.

## Installation

Add the plugin to your Discourse container configuration and rebuild the application:

```yaml
hooks:
  after_code:
    - exec:
        cd: $home/plugins
        cmd:
          - git clone https://github.com/dupless54/discourse-avatar-decorations.git
```

Then rebuild Discourse:

```bash
cd /var/discourse
./launcher rebuild app
```

Enable the plugin in site settings after the rebuild.

## Development Notes

This plugin intentionally keeps its public custom fields limited to cosmetic presentation state. Treat cosmetic IDs, media URLs, CSS-related values, and administrator-editable configuration as untrusted input when extending the plugin.

For current repository development rules, start with [`AGENTS.md`](AGENTS.md).

## Related Project

For the actively developed catalog, ownership, entitlement, loadout, profile-effect, and integration platform, see [`discourse-user-cosmetics`](https://github.com/dupless54/discourse-user-cosmetics).

## Support

If this project is useful to you, you can support its development through the Buy Me a Coffee banner at the top of this README.
