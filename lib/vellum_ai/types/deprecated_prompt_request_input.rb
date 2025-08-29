# frozen_string_literal: true
require "json"
require_relative "workflow_input"
require_relative "prompt_request_input"

module Vellum
  class DeprecatedPromptRequestInput


# Deserialize a JSON object to an instance of DeprecatedPromptRequestInput
    #
    # @param json_object [String] 
    # @return [Vellum::DeprecatedPromptRequestInput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::WorkflowInput.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::WorkflowInput.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::PromptRequestInput.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::PromptRequestInput.from_json(json_object: struct)
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
        return Vellum::WorkflowInput.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::PromptRequestInput.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end