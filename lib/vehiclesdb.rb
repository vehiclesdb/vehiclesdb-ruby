# frozen_string_literal: true

# The `vehiclesdb` gem is a thin, official ALIAS of the `vehicles` gem — one
# require away from the same bundled dataset, lookups, validators, and MCP
# server. It exists so that people who discover the project through the
# VehiclesDB name (github.com/vehiclesdb, huggingface.co/vehiclesdb,
# vehiclesdb.com) can `gem "vehiclesdb"` and land on the real thing, and so
# the name is defended in the vehiclesdb-<language> SDK family.
#
# There is deliberately NO separate API client here: the hosted API client
# lives inside `vehicles` (configure an api_key and the providers answer —
# the images endpoint is LIVE as of vehicles 0.5.0; mint a key at
# https://vehiclesdb.com/settings/api-keys). One codebase, two front doors.

require "vehicles"

# Both spellings resolve to the same module — pick whichever reads better:
#   VehiclesDB.find("vw golf") == Vehicles.find("vw golf")
VehiclesDB = Vehicles
