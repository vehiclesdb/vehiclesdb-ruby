# frozen_string_literal: true

require_relative "lib/vehiclesdb/version"

Gem::Specification.new do |spec|
  spec.name    = "vehiclesdb"
  spec.version = VehiclesDB::VERSION
  spec.authors = ["rameerez"]
  spec.email   = ["rubygems@rameerez.com"]

  spec.summary     = "Official Ruby SDK for the VehiclesDB API — rich vehicle data (years, images, segments, specs)."
  spec.description = "vehiclesdb is the official Ruby client for the VehiclesDB API (https://vehiclesdb.com), " \
                     "a hosted service for rich vehicle data: production years, model images (year- and " \
                     "color-accurate), market segments, specifications, and more. It's the low-level API " \
                     "wrapper that the `vehicles` gem uses for optional hosted enrichment — but both gems are " \
                     "fully independent and usable on their own."
  spec.homepage = "https://github.com/rameerez/vehiclesdb-ruby"
  spec.license  = "MIT"

  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["homepage_uri"]      = spec.homepage
  spec.metadata["source_code_uri"]   = "#{spec.homepage}/tree/main"
  spec.metadata["changelog_uri"]     = "#{spec.homepage}/blob/main/CHANGELOG.md"
  spec.metadata["rubygems_mfa_required"] = "true"

  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[.aux/ .claude/ .cursor/ .git .github/ bin/ test/
                          Gemfile Rakefile .rubocop.yml .simplecov .gitignore
                          AGENTS.md CLAUDE.md context7.json])
    end
  end
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", ">= 2.0", "< 3.0"
end
