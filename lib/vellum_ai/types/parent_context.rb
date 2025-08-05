# frozen_string_literal: true
require "json"
require_relative "workflow_parent_context"
require_relative "node_parent_context"
require_relative "workflow_deployment_parent_context"
require_relative "workflow_sandbox_parent_context"
require_relative "prompt_deployment_parent_context"
require_relative "api_request_parent_context"
require_relative "external_parent_context"

module Vellum
  class ParentContext


# Deserialize a JSON object to an instance of ParentContext
    #
    # @param json_object [String] 
    # @return [Vellum::ParentContext]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::WorkflowParentContext.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::WorkflowParentContext.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NodeParentContext.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NodeParentContext.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::WorkflowDeploymentParentContext.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::WorkflowDeploymentParentContext.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::WorkflowSandboxParentContext.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::WorkflowSandboxParentContext.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::PromptDeploymentParentContext.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::PromptDeploymentParentContext.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::ApiRequestParentContext.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::ApiRequestParentContext.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::ExternalParentContext.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::ExternalParentContext.from_json(json_object: struct)
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
        return Vellum::WorkflowParentContext.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NodeParentContext.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::WorkflowDeploymentParentContext.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::WorkflowSandboxParentContext.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::PromptDeploymentParentContext.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::ApiRequestParentContext.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::ExternalParentContext.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end