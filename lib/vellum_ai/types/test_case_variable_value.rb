# frozen_string_literal: true
require "json"
require_relative "test_case_string_variable_value"
require_relative "test_case_number_variable_value"
require_relative "test_case_json_variable_value"
require_relative "test_case_chat_history_variable_value"
require_relative "test_case_search_results_variable_value"
require_relative "test_case_error_variable_value"
require_relative "test_case_function_call_variable_value"
require_relative "test_case_array_variable_value"

module Vellum
  class TestCaseVariableValue


# Deserialize a JSON object to an instance of TestCaseVariableValue
    #
    # @param json_object [String] 
    # @return [Vellum::TestCaseVariableValue]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::TestCaseStringVariableValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TestCaseStringVariableValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TestCaseNumberVariableValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TestCaseNumberVariableValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TestCaseJsonVariableValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TestCaseJsonVariableValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TestCaseChatHistoryVariableValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TestCaseChatHistoryVariableValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TestCaseSearchResultsVariableValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TestCaseSearchResultsVariableValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TestCaseErrorVariableValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TestCaseErrorVariableValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TestCaseFunctionCallVariableValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TestCaseFunctionCallVariableValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TestCaseArrayVariableValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TestCaseArrayVariableValue.from_json(json_object: struct)
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
        return Vellum::TestCaseStringVariableValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TestCaseNumberVariableValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TestCaseJsonVariableValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TestCaseChatHistoryVariableValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TestCaseSearchResultsVariableValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TestCaseErrorVariableValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TestCaseFunctionCallVariableValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TestCaseArrayVariableValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end