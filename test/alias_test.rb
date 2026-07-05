# frozen_string_literal: true

require "minitest/autorun"
require "vehiclesdb"

class AliasTest < Minitest::Test
  def test_vehiclesdb_is_vehicles
    assert_same Vehicles, VehiclesDB
  end

  def test_the_full_api_answers_under_both_names
    golf = VehiclesDB.find("vw golf")
    assert_equal "Volkswagen Golf", golf.full_name
    assert_equal Vehicles.kinds, VehiclesDB.kinds
  end
end
