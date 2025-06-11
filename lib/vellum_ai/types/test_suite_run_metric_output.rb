# frozen_string_literal: true
require "json"
require_relative "test_suite_run_metric_string_output"
require_relative "test_suite_run_metric_number_output"
require_relative "test_suite_run_metric_json_output"
require_relative "test_suite_run_metric_error_output"
require_relative "test_suite_run_metric_array_output"

module Vellum
  class TestSuiteRunMetricOutput


# Deserialize a JSON object to an instance of TestSuiteRunMetricOutput
    #
    # @param json_object [String] 
    # @return [Vellum::TestSuiteRunMetricOutput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::TestSuiteRunMetricStringOutput.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TestSuiteRunMetricStringOutput.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TestSuiteRunMetricNumberOutput.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TestSuiteRunMetricNumberOutput.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TestSuiteRunMetricJsonOutput.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TestSuiteRunMetricJsonOutput.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TestSuiteRunMetricErrorOutput.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TestSuiteRunMetricErrorOutput.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TestSuiteRunMetricArrayOutput.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TestSuiteRunMetricArrayOutput.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
 return struct
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      begin
        return Vellum::TestSuiteRunMetricStringOutput.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TestSuiteRunMetricNumberOutput.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TestSuiteRunMetricJsonOutput.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TestSuiteRunMetricErrorOutput.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TestSuiteRunMetricArrayOutput.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end