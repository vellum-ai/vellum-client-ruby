# frozen_string_literal: true
require "json"
require_relative "workflow_execution_span"
require_relative "node_execution_span"

module Vellum
  class VellumSpan


# Deserialize a JSON object to an instance of VellumSpan
    #
    # @param json_object [String] 
    # @return [Vellum::VellumSpan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::WorkflowExecutionSpan.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::WorkflowExecutionSpan.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NodeExecutionSpan.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NodeExecutionSpan.from_json(json_object: struct)
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
        return Vellum::WorkflowExecutionSpan.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NodeExecutionSpan.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end