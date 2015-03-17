require "rspec/expectations"
require "statsd-instrument"
require "statsd/instrument/rspec/version"

module Statsd
  module Instrument
    module Rspec
      extend RSpec::Matchers::DSL

      matcher :increment_statsd do |key|
        match do |block|
          block.call
          metric_captured?(:c, key)
        end

        failure_message do |_block|
          "Expected that block would increase StatsD metric '#{key}'."
        end

        failure_message_when_negated do |_block|
          "Expected that block would not increase StatsD metric '#{key}'."
        end

        def supports_block_expectations?
          true
        end
      end

      def metric_captured?(type, key)
        metrics = StatsD.backend.collected_metrics
        metrics.any? { |metric| metric.type == type && metric.name == key }
      end
    end
  end
end
