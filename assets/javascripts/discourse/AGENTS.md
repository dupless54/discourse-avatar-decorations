# Avatar Decorations frontend

- Follow current Discourse/Glimmer connector conventions verified from source.
- Render only server/custom-field presentation state; client code does not decide entitlement.
- Keep avatar/nameplate/card-decoration placement consistent with each Discourse surface and resilient to missing values.
- Escape text; never inject arbitrary HTML/scripts/styles from custom fields.
- Asset identifiers/URLs must map to intended plugin media, not arbitrary remote resources unless explicitly designed and validated.
- Preserve mobile/light/dark behavior and avoid layout overflow.
