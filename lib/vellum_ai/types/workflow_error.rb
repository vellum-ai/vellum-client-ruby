# frozen_string_literal: true
require "json"
require_relative "workflow_event_error"
require_relative "workflow_initialization_error"

module Vellum
  class WorkflowError


# Deserialize a JSON object to an instance of WorkflowError
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowError]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::WorkflowEventError.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::WorkflowEventError.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::WorkflowInitializationError.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::WorkflowInitializationError.from_json(json_object: struct)
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
        return Vellum::WorkflowEventError.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::WorkflowInitializationError.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end