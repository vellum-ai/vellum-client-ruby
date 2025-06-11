# frozen_string_literal: true
require "json"
require_relative "named_test_case_string_variable_value"
require_relative "named_test_case_number_variable_value"
require_relative "named_test_case_json_variable_value"
require_relative "named_test_case_chat_history_variable_value"
require_relative "named_test_case_search_results_variable_value"
require_relative "named_test_case_error_variable_value"
require_relative "named_test_case_function_call_variable_value"
require_relative "named_test_case_array_variable_value"

module Vellum
  class NamedTestCaseVariableValue


# Deserialize a JSON object to an instance of NamedTestCaseVariableValue
    #
    # @param json_object [String] 
    # @return [Vellum::NamedTestCaseVariableValue]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::NamedTestCaseStringVariableValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NamedTestCaseStringVariableValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NamedTestCaseNumberVariableValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NamedTestCaseNumberVariableValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NamedTestCaseJsonVariableValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NamedTestCaseJsonVariableValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NamedTestCaseChatHistoryVariableValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NamedTestCaseChatHistoryVariableValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NamedTestCaseSearchResultsVariableValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NamedTestCaseSearchResultsVariableValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NamedTestCaseErrorVariableValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NamedTestCaseErrorVariableValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NamedTestCaseFunctionCallVariableValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NamedTestCaseFunctionCallVariableValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NamedTestCaseArrayVariableValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NamedTestCaseArrayVariableValue.from_json(json_object: struct)
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
        return Vellum::NamedTestCaseStringVariableValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NamedTestCaseNumberVariableValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NamedTestCaseJsonVariableValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NamedTestCaseChatHistoryVariableValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NamedTestCaseSearchResultsVariableValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NamedTestCaseErrorVariableValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NamedTestCaseFunctionCallVariableValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NamedTestCaseArrayVariableValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end