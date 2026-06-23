# frozen_string_literal: true

require "faraday"

module VehiclesDB
  # A thin client over the VehiclesDB HTTP API. Standalone: construct one
  # directly, or use `VehiclesDB.client` (which reads the global configuration).
  #
  #   client = VehiclesDB::Client.new(api_key: "vdb_...")
  #   client.configured?   # => true
  #
  # The request plumbing (auth header, JSON, timeout, error mapping) is ready;
  # resource methods (e.g. `model`, `image`) are added as the API ships — they'll
  # build on the private `get` below. Kept deliberately small for now: this
  # release reserves the gem and sets the shape.
  class Client
    attr_reader :api_key, :api_base_url, :timeout

    def initialize(api_key: nil, api_base_url: nil, timeout: nil)
      config        = VehiclesDB.configuration
      @api_key      = api_key      || config.api_key
      @api_base_url = api_base_url || config.api_base_url
      @timeout      = timeout      || config.timeout
    end

    # True when an API key is present (the client can authenticate).
    def configured?
      !api_key.to_s.empty?
    end

    private

    # GET a JSON resource and return the parsed body. Raises ConfigurationError
    # when unconfigured, AuthenticationError on 401/403, ApiError otherwise. The
    # caller decides whether to rescue. Resource methods will wrap this.
    def get(path, params = {})
      raise ConfigurationError, "No VehiclesDB API key configured" unless configured?

      handle(connection.get(path, params))
    end

    def handle(response)
      return response.body if response.success?
      raise AuthenticationError, "Invalid VehiclesDB API key" if [401, 403].include?(response.status)

      raise ApiError.new("VehiclesDB API error (HTTP #{response.status})",
                         status: response.status, body: response.body)
    end

    def connection
      @connection ||= Faraday.new(url: api_base_url) do |f|
        f.request :json
        f.response :json
        f.headers["Authorization"] = "Bearer #{api_key}"
        f.headers["User-Agent"] = VehiclesDB.configuration.user_agent
        f.options.timeout = timeout
        f.adapter Faraday.default_adapter
      end
    end
  end
end
