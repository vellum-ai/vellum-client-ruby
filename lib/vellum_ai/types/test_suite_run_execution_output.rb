# frozen_string_literal: true
require "json"
require_relative "test_suite_run_execution_string_output"
require_relative "test_suite_run_execution_number_output"
require_relative "test_suite_run_execution_json_output"
require_relative "test_suite_run_execution_chat_history_output"
require_relative "test_suite_run_execution_search_results_output"
require_relative "test_suite_run_execution_error_output"
require_relative "test_suite_run_execution_function_call_output"
require_relative "test_suite_run_execution_array_output"

module Vellum
  class TestSuiteRunExecutionOutput


# Deserialize a JSON object to an instance of TestSuiteRunExecutionOutput
    #
    # @param json_object [String] 
    # @return [Vellum::TestSuiteRunExecutionOutput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::TestSuiteRunExecutionStringOutput.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TestSuiteRunExecutionStringOutput.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TestSuiteRunExecutionNumberOutput.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TestSuiteRunExecutionNumberOutput.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TestSuiteRunExecutionJsonOutput.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TestSuiteRunExecutionJsonOutput.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TestSuiteRunExecutionChatHistoryOutput.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TestSuiteRunExecutionChatHistoryOutput.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TestSuiteRunExecutionSearchResultsOutput.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TestSuiteRunExecutionSearchResultsOutput.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TestSuiteRunExecutionErrorOutput.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TestSuiteRunExecutionErrorOutput.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TestSuiteRunExecutionFunctionCallOutput.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TestSuiteRunExecutionFunctionCallOutput.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TestSuiteRunExecutionArrayOutput.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TestSuiteRunExecutionArrayOutput.from_json(json_object: struct)
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
        return Vellum::TestSuiteRunExecutionStringOutput.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TestSuiteRunExecutionNumberOutput.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TestSuiteRunExecutionJsonOutput.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TestSuiteRunExecutionChatHistoryOutput.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TestSuiteRunExecutionSearchResultsOutput.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TestSuiteRunExecutionErrorOutput.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TestSuiteRunExecutionFunctionCallOutput.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TestSuiteRunExecutionArrayOutput.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end