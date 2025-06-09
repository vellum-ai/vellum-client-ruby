# frozen_string_literal: true
require "json"
require_relative "execution_string_vellum_value"
require_relative "execution_number_vellum_value"
require_relative "execution_json_vellum_value"
require_relative "execution_chat_history_vellum_value"
require_relative "execution_search_results_vellum_value"
require_relative "execution_error_vellum_value"
require_relative "execution_array_vellum_value"
require_relative "execution_function_call_vellum_value"

module Vellum
  class ExecutionVellumValue


# Deserialize a JSON object to an instance of ExecutionVellumValue
    #
    # @param json_object [String] 
    # @return [Vellum::ExecutionVellumValue]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::ExecutionStringVellumValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::ExecutionStringVellumValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::ExecutionNumberVellumValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::ExecutionNumberVellumValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::ExecutionJsonVellumValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::ExecutionJsonVellumValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::ExecutionChatHistoryVellumValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::ExecutionChatHistoryVellumValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::ExecutionSearchResultsVellumValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::ExecutionSearchResultsVellumValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::ExecutionErrorVellumValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::ExecutionErrorVellumValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::ExecutionArrayVellumValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::ExecutionArrayVellumValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::ExecutionFunctionCallVellumValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::ExecutionFunctionCallVellumValue.from_json(json_object: struct)
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
        return Vellum::ExecutionStringVellumValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::ExecutionNumberVellumValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::ExecutionJsonVellumValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::ExecutionChatHistoryVellumValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::ExecutionSearchResultsVellumValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::ExecutionErrorVellumValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::ExecutionArrayVellumValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::ExecutionFunctionCallVellumValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end