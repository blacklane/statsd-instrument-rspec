# statsd-instrument-rspec

[![Build Status](https://travis-ci.org/blacklane/statsd-instrument-rspec.svg?branch=master)](https://travis-ci.org/blacklane/statsd-instrument-rspec) [![Coverage Status](https://coveralls.io/repos/blacklane/statsd-instrument-rspec/badge.svg?branch=master)](https://coveralls.io/r/blacklane/statsd-instrument-rspec?branch=master) [![Code Climate](https://codeclimate.com/github/blacklane/statsd-instrument-rspec/badges/gpa.svg)](https://codeclimate.com/github/blacklane/statsd-instrument-rspec)

RSpec 3 matchers for `statsd-instrument`.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "statsd-instrument-rspec"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install statsd-instrument-rspec

## Usage

Configure RSpec and StatsD (e.g. via the `spec_helper.rb`):

```ruby
require "statsd/instrument/rspec"

RSpec.configure do |config|
  config.include Statsd::Instrument::Rspec # Enable StatsD matchers

  config.before(:suite) do
    StatsD.backend = StatsD::Instrument::Backends::CaptureBackend.new # Use CaptureBackend
  end

  config.after do
    StatsD.backend.reset # Reset collected metrics after each example
  end
end
```

### Matchers

#### Increment

```ruby
expect { StatsD.increment(:foo) }.to increment_statsd(:foo)
expect { StatsD.increment(:bar) }.not_to increment_statsd(:foo)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

Run the tests with `bundle exec rake`.

## Contributing

1. Fork it ( https://github.com/blacklane/statsd-instrument-rspec/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
