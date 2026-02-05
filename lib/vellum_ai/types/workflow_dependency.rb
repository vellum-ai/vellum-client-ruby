# frozen_string_literal: true
require "json"
require_relative "workflow_integration_dependency"
require_relative "workflow_model_provider_dependency"

module Vellum
  class WorkflowDependency


# Deserialize a JSON object to an instance of WorkflowDependency
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowDependency]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::WorkflowIntegrationDependency.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::WorkflowIntegrationDependency.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::WorkflowModelProviderDependency.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::WorkflowModelProviderDependency.from_json(json_object: struct)
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
        return Vellum::WorkflowIntegrationDependency.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::WorkflowModelProviderDependency.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end