# frozen_string_literal: true
require "json"
require_relative "named_scenario_input_string_variable_value_request"
require_relative "named_scenario_input_json_variable_value_request"
require_relative "named_scenario_input_chat_history_variable_value_request"

module Vellum
  class NamedScenarioInputRequest


# Deserialize a JSON object to an instance of NamedScenarioInputRequest
    #
    # @param json_object [String] 
    # @return [Vellum::NamedScenarioInputRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::NamedScenarioInputStringVariableValueRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NamedScenarioInputStringVariableValueRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NamedScenarioInputJsonVariableValueRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NamedScenarioInputJsonVariableValueRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NamedScenarioInputChatHistoryVariableValueRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NamedScenarioInputChatHistoryVariableValueRequest.from_json(json_object: struct)
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
        return Vellum::NamedScenarioInputStringVariableValueRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NamedScenarioInputJsonVariableValueRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NamedScenarioInputChatHistoryVariableValueRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end