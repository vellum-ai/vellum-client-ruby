# frozen_string_literal: true
require "json"
require_relative "initiated_workflow_node_result_event"
require_relative "streaming_workflow_node_result_event"
require_relative "fulfilled_workflow_node_result_event"
require_relative "rejected_workflow_node_result_event"

module Vellum
  class WorkflowNodeResultEvent


# Deserialize a JSON object to an instance of WorkflowNodeResultEvent
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowNodeResultEvent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::InitiatedWorkflowNodeResultEvent.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::InitiatedWorkflowNodeResultEvent.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::StreamingWorkflowNodeResultEvent.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::StreamingWorkflowNodeResultEvent.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::FulfilledWorkflowNodeResultEvent.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::FulfilledWorkflowNodeResultEvent.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::RejectedWorkflowNodeResultEvent.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::RejectedWorkflowNodeResultEvent.from_json(json_object: struct)
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
        return Vellum::InitiatedWorkflowNodeResultEvent.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::StreamingWorkflowNodeResultEvent.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::FulfilledWorkflowNodeResultEvent.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::RejectedWorkflowNodeResultEvent.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end