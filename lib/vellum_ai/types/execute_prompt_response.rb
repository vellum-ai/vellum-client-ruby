# frozen_string_literal: true
require "json"
require_relative "fulfilled_execute_prompt_response"
require_relative "rejected_execute_prompt_response"

module Vellum
  class ExecutePromptResponse


# Deserialize a JSON object to an instance of ExecutePromptResponse
    #
    # @param json_object [String] 
    # @return [Vellum::ExecutePromptResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::FulfilledExecutePromptResponse.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::FulfilledExecutePromptResponse.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::RejectedExecutePromptResponse.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::RejectedExecutePromptResponse.from_json(json_object: struct)
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
        return Vellum::FulfilledExecutePromptResponse.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::RejectedExecutePromptResponse.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end