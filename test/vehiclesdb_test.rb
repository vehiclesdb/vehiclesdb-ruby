# frozen_string_literal: true

require "test_helper"

module VehiclesDB
  class VehiclesDBTest < TestCase
    def test_version
      assert_match(/\A\d+\.\d+\.\d+/, VehiclesDB::VERSION)
    end

    # --- configuration -------------------------------------------------------

    def test_configuration_defaults
      config = VehiclesDB.configuration

      assert_nil config.api_key
      assert_equal "https://api.vehiclesdb.com", config.api_base_url
      assert_equal 5, config.timeout
      assert_match(%r{\Avehiclesdb-ruby/}, config.user_agent)
    end

    def test_configure_yields_configuration
      VehiclesDB.configure { |c| c.api_key = "vdb_test" }

      assert_equal "vdb_test", VehiclesDB.configuration.api_key
    end

    def test_api_key_defaults_from_env
      ENV["VEHICLESDB_API_KEY"] = "vdb_from_env"
      VehiclesDB.reset_configuration!

      assert_equal "vdb_from_env", VehiclesDB.configuration.api_key
    ensure
      ENV.delete("VEHICLESDB_API_KEY")
    end

    def test_reset_configuration_restores_defaults
      VehiclesDB.configure do |c|
        c.api_key = "x"
        c.timeout = 99
      end
      VehiclesDB.reset_configuration!

      assert_nil VehiclesDB.configuration.api_key
      assert_equal 5, VehiclesDB.configuration.timeout
    end

    # --- client --------------------------------------------------------------

    def test_client_reads_global_config
      VehiclesDB.configure { |c| c.api_key = "vdb_global" }

      assert_predicate VehiclesDB.client, :configured?
      assert_equal "vdb_global", VehiclesDB.client.api_key
    end

    def test_client_is_unconfigured_without_a_key
      refute_predicate VehiclesDB::Client.new, :configured?
    end

    def test_client_accepts_explicit_overrides
      client = VehiclesDB::Client.new(api_key: "vdb_explicit", timeout: 12)

      assert_predicate client, :configured?
      assert_equal "vdb_explicit", client.api_key
      assert_equal 12, client.timeout
    end

    def test_client_is_memoized
      assert_same VehiclesDB.client, VehiclesDB.client
      VehiclesDB.reset_configuration!

      refute_same VehiclesDB.client.object_id, nil
    end

    def test_get_raises_without_a_key
      error = assert_raises(VehiclesDB::ConfigurationError) do
        VehiclesDB::Client.new.send(:get, "/v1/anything")
      end
      assert_match(/api key/i, error.message)
    end

    # --- errors --------------------------------------------------------------

    def test_error_hierarchy
      assert_operator VehiclesDB::ConfigurationError, :<, VehiclesDB::Error
      assert_operator VehiclesDB::AuthenticationError, :<, VehiclesDB::Error
      assert_operator VehiclesDB::ApiError, :<, VehiclesDB::Error
    end

    def test_api_error_carries_status_and_body
      error = VehiclesDB::ApiError.new("boom", status: 503, body: { "error" => "down" })

      assert_equal 503, error.status
      assert_equal({ "error" => "down" }, error.body)
      assert_equal "boom", error.message
    end
  end
end
