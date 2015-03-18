# Keep SimpleCov & coveralls on the very top to ensure correct code coverage reporting

require "simplecov"
require "coveralls"

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start do
  add_filter "/spec/"
  add_filter "/vendor/"
  minimum_coverage 100
end

require "statsd/instrument/rspec"

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.default_formatter = "doc" if config.files_to_run.one?
  config.disable_monkey_patching!
  config.filter_run :focus
  config.order = :random
  config.profile_examples = 10
  config.run_all_when_everything_filtered = true
  config.warnings = true

  Kernel.srand config.seed

  config.before(:suite) do
    StatsD.backend = StatsD::Instrument::Backends::CaptureBackend.new
  end

  config.after do
    StatsD.backend.reset
  end
end
