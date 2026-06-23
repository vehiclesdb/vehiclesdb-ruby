# frozen_string_literal: true

begin
  require "simplecov"
rescue LoadError
  # coverage optional
end

require "minitest/autorun"
require "vehiclesdb"

module VehiclesDB
  class TestCase < Minitest::Test
    def setup
      # Ensure a clean, key-less baseline regardless of the developer's ENV.
      @original_key = ENV.delete("VEHICLESDB_API_KEY")
      VehiclesDB.reset_configuration!
    end

    def teardown
      ENV["VEHICLESDB_API_KEY"] = @original_key if @original_key
      VehiclesDB.reset_configuration!
    end
  end
end
