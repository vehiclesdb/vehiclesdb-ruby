# frozen_string_literal: true

module VehiclesDB
  # Base class for every error this gem raises — rescue `VehiclesDB::Error` to
  # catch them all.
  class Error < StandardError; end

  # No API key configured (or an empty one).
  class ConfigurationError < Error; end

  # The API rejected the credentials (HTTP 401/403).
  class AuthenticationError < Error; end

  # Any other non-success API response. Carries the HTTP status and parsed body.
  class ApiError < Error
    attr_reader :status, :body

    def initialize(message = nil, status: nil, body: nil)
      @status = status
      @body = body
      super(message)
    end
  end
end
