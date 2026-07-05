# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name    = "vehiclesdb"
  # Tracks the `vehicles` minor it aliases (no version.rb — the alias is two
  # files; the constant VehiclesDB is Vehicles itself, so a nested VERSION
  # would collide with the real one).
  spec.version = "0.2.0"
  spec.authors = ["rameerez"]
  spec.email   = ["rubygems@rameerez.com"]

  spec.summary     = "Official alias of the `vehicles` gem — the VehiclesDB open vehicle dataset for Ruby."
  spec.description = "vehiclesdb is a thin, official alias of the `vehicles` gem: the VehiclesDB open " \
                     "dataset (18.5k vehicle models across cars, motorcycles, mopeds, vans, trucks and " \
                     "buses, from official registers of 14 countries) with Rails-friendly lookups, " \
                     "dropdown helpers, validators, popularity/availability data, and a bundled MCP " \
                     "server. Installing this gem installs `vehicles` and exposes the same API under " \
                     "the VehiclesDB constant. If in doubt, depend on `vehicles` directly."
  spec.homepage = "https://github.com/vehiclesdb/vehiclesdb-ruby"
  spec.license  = "MIT"

  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["homepage_uri"]      = spec.homepage
  spec.metadata["source_code_uri"]   = "#{spec.homepage}/tree/main"
  spec.metadata["changelog_uri"]     = "#{spec.homepage}/blob/main/CHANGELOG.md"
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files = ["lib/vehiclesdb.rb", "README.md", "LICENSE.txt", "CHANGELOG.md"]
  spec.require_paths = ["lib"]

  spec.add_dependency "vehicles", "~> 0.2"
end
