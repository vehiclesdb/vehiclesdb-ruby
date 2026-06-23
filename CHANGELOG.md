# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.1.0] - 2026-06-23

Initial release — the shell. Reserves the gem and establishes its shape ahead of
the VehiclesDB API going public.

### Added
- `VehiclesDB.configure` + `VehiclesDB::Configuration` (api_key — defaults from
  `ENV["VEHICLESDB_API_KEY"]` — api_base_url, timeout, user_agent).
- `VehiclesDB::Client` with auth/JSON/timeout request plumbing and a
  `configured?` check; `VehiclesDB.client` memoized default client.
- Error hierarchy: `VehiclesDB::Error` < `ConfigurationError` / `AuthenticationError` / `ApiError`.

Resource methods (model, image, …) land as the API ships.

[Unreleased]: https://github.com/rameerez/vehiclesdb-ruby/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/rameerez/vehiclesdb-ruby/releases/tag/v0.1.0
