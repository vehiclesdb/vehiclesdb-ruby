# `vehiclesdb` — official alias of [`vehicles`](https://github.com/vehiclesdb/vehicles)

This gem is a two-file front door: it depends on
[**`vehicles`**](https://github.com/vehiclesdb/vehicles) — the Ruby SDK for
the [VehiclesDB](https://github.com/vehiclesdb/vehiclesdb) open vehicle
dataset — and exposes the identical API under the `VehiclesDB` constant.

```ruby
gem "vehiclesdb"
```

```ruby
VehiclesDB.find("vw golf")      # => #<Vehicles::Model "Volkswagen Golf">
VehiclesDB.top_models(kind: :motorcycle, country: :th, limit: 5)
VehiclesDB.equal?(Vehicles)     # => true — same module, two names
```

**Why two names?** The project is bigger than Ruby: the dataset lives at
[github.com/vehiclesdb/vehiclesdb](https://github.com/vehiclesdb/vehiclesdb)
and SDKs for other languages follow the `vehiclesdb-<language>` pattern. If
you found the project through that name, this gem takes you to the right
place. If you're starting fresh in Ruby, depend on
[`vehicles`](https://github.com/vehiclesdb/vehicles) directly — it's the
same thing with the shorter, Rails-idiomatic name.

Docs, features, dataset details: **see the
[`vehicles` README](https://github.com/vehiclesdb/vehicles#readme)**.

Code MIT · bundled data CC-BY 4.0 (VehiclesDB).
