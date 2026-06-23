# frozen_string_literal: true

require_relative "vehiclesdb/version"
require_relative "vehiclesdb/error"
require_relative "vehiclesdb/configuration"
require_relative "vehiclesdb/client"

# VehiclesDB — the official Ruby SDK for the VehiclesDB API
# (https://vehiclesdb.com): a hosted service for rich vehicle data — production
# years, model images (year- and color-accurate), market segments, specs, and more.
#
# This is the low-level API wrapper. If you just want make/model dropdowns that
# work offline with zero setup, use the `vehicles` gem instead — it bundles the
# data locally and reaches for VehiclesDB only for optional hosted enrichment.
# The two are independent: `vehicles` works without this gem, and this gem works
# without `vehicles`.
#
#   VehiclesDB.configure { |c| c.api_key = ENV["VEHICLESDB_API_KEY"] }
#   VehiclesDB.client.configured?   # => true
#
# NOTE: the VehiclesDB API is not public yet. This release reserves the gem and
# establishes its shape; resource methods land as the API ships.
module VehiclesDB
  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end

    # Reset config + the memoized default client. Mainly for tests.
    def reset_configuration!
      @configuration = Configuration.new
      @client = nil
    end

    # Memoized default client, built from the global configuration.
    def client
      @client ||= Client.new
    end
  end
end
