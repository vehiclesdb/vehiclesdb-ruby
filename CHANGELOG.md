# Changelog

## [0.6.1] - 2026-08-01

Track `vehicles 0.6.1`: license **plates** as a first-class citizen
(`VehiclesDB.plates`, two-tier validation), `Model#former_ids` (the
append-only migration aliases — check them before assuming a stored id
disappeared), and the dataset refreshed to the 2026.08.0 correction
release. The hosted **API is live** at vehiclesdb.com/api: resolve messy
strings server-side (`POST /v1/resolve`), fetch enriched records
(`/full`) and rendered imagery (`/images`) with a `vdb_` key.
No changes in this repo beyond the version — the client lives inside
`vehicles`, exactly as designed ("one codebase, two front doors").

## [0.5.0] - 2026-07-26

Track `vehicles 0.5.0`: the hosted VehiclesDB **images API is live**.
`VehiclesDB.find("vw golf").image(color: "red")` returns rendered variant
URLs once you configure an api_key (mint one at
vehiclesdb.com/settings/api-keys); `#images` returns the full payload.
No changes in this repo beyond the version — the client lives inside
`vehicles`, exactly as designed ("one codebase, two front doors").

## [0.4.1] - 2026-07-26

Jump to track `vehicles ~> 0.4` (the alias mirrors the minor it wraps —
0.2.0 was prepared but never published, and rubygems still served 0.1.0
with the old dataset). Brings the 2026.07.4 correction-pass data and the
0.3/0.4 API additions: continent filters, rarity tiers, alternate names,
and the "Other / not in the list" escape hatch.

## [0.2.0] - 2026-07-05

`vehiclesdb` becomes the official alias of the `vehicles` gem (same API,
`VehiclesDB` constant). The previous unreleased API-client shell is gone —
the hosted-API seam lives inside `vehicles` itself.
