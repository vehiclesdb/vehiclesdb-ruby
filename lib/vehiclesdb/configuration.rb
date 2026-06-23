# frozen_string_literal: true

module VehiclesDB
  # Global configuration. Sensible defaults; the API key is picked up from
  # ENV["VEHICLESDB_API_KEY"] automatically, so the common case needs no setup.
  #
  #   VehiclesDB.configure do |config|
  #     config.api_key = "vdb_live_..."
  #   end
  class Configuration
    # Your VehiclesDB API key. Defaults to ENV["VEHICLESDB_API_KEY"].
    attr_accessor :api_key

    # Base URL of the API. Overridable for self-hosting / staging / testing.
    attr_accessor :api_base_url

    # Request timeout in seconds.
    attr_accessor :timeout

    # Sent as the User-Agent header so VehiclesDB can see SDK usage.
    attr_accessor :user_agent

    def initialize
      @api_key      = ENV.fetch("VEHICLESDB_API_KEY", nil)
      @api_base_url = "https://api.vehiclesdb.com"
      @timeout      = 5
      @user_agent   = "vehiclesdb-ruby/#{VehiclesDB::VERSION}"
    end
  end
end
