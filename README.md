# 🚗 `vehiclesdb` – Official Ruby SDK for the VehiclesDB API

[![Gem Version](https://badge.fury.io/rb/vehiclesdb.svg)](https://badge.fury.io/rb/vehiclesdb) [![Build Status](https://github.com/rameerez/vehiclesdb-ruby/workflows/Tests/badge.svg)](https://github.com/rameerez/vehiclesdb-ruby/actions)

> [!TIP]
> **🚀 Ship your next Rails app 10x faster!** I've built **[RailsFast](https://railsfast.com/?ref=vehiclesdb)**, a production-ready Rails boilerplate template that comes with everything you need to launch a software business in days, not weeks. Go [check it out](https://railsfast.com/?ref=vehiclesdb)!

`vehiclesdb` is the official Ruby client for the [**VehiclesDB API**](https://vehiclesdb.com) — a hosted service for rich vehicle data: production years, model images (year- and color-accurate), market segments, specifications, and more.

> [!NOTE]
> **This is an early shell release.** It reserves the gem and sets its shape; the VehiclesDB API isn't public yet, so resource methods (models, images, …) land as the service ships. Configuration, the client, and the error model are in place today.

## `vehiclesdb` vs `vehicles` — which do I want?

Two gems, one product, and they're **fully independent** (each works on its own):

| | [`vehicles`](https://github.com/rameerez/vehicles) | `vehiclesdb` (this gem) |
|---|---|---|
| What | Bundled make/model dataset + a delightful local API | Thin client for the hosted VehiclesDB API |
| Data | Ships **inside the gem** (EU, offline) | Lives on the **server** (the paid API) |
| Setup | Zero — no key, no network | Needs an API key |
| Use it for | Make/model dropdowns, search, validation | Years, images, segments, specs |

Most apps want **`vehicles`** — it works offline with zero config. Add **`vehiclesdb`** (and a key) when you want the richer hosted data; `vehicles` will use it automatically for enrichment. Or use `vehiclesdb` directly if all you want is the raw API.

## Installation

```ruby
gem "vehiclesdb"
```

## Usage

```ruby
VehiclesDB.configure do |config|
  config.api_key = ENV["VEHICLESDB_API_KEY"]   # or just set ENV["VEHICLESDB_API_KEY"]
end

VehiclesDB.client.configured?   # => true
```

You can also build a client explicitly (handy for multiple keys / standalone use):

```ruby
client = VehiclesDB::Client.new(api_key: "vdb_live_...")
client.configured?              # => true
```

### Errors

Everything raises a subclass of `VehiclesDB::Error`, so you can rescue broadly or narrowly:

```ruby
VehiclesDB::Error             # rescue-all base
VehiclesDB::ConfigurationError # no API key configured
VehiclesDB::AuthenticationError # bad key (HTTP 401/403)
VehiclesDB::ApiError           # other non-2xx — carries #status and #body
```

## Configuration

| Option | Default | Notes |
|---|---|---|
| `api_key` | `ENV["VEHICLESDB_API_KEY"]` | your VehiclesDB key |
| `api_base_url` | `https://api.vehiclesdb.com` | override for staging/self-host/tests |
| `timeout` | `5` | request timeout (seconds) |
| `user_agent` | `vehiclesdb-ruby/<version>` | sent with every request |

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then run
`rake test`. You can also run `bin/console` for an interactive prompt.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rameerez/vehiclesdb-ruby. Our code of conduct is: just be nice and make your mom proud of what you do and post online.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
