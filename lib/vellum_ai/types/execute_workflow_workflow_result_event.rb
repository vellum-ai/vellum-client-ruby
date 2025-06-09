# frozen_string_literal: true
require "json"
require_relative "fulfilled_execute_workflow_workflow_result_event"
require_relative "rejected_execute_workflow_workflow_result_event"

module Vellum
  class ExecuteWorkflowWorkflowResultEvent


# Deserialize a JSON object to an instance of ExecuteWorkflowWorkflowResultEvent
    #
    # @param json_object [String] 
    # @return [Vellum::ExecuteWorkflowWorkflowResultEvent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::FulfilledExecuteWorkflowWorkflowResultEvent.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::FulfilledExecuteWorkflowWorkflowResultEvent.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::RejectedExecuteWorkflowWorkflowResultEvent.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::RejectedExecuteWorkflowWorkflowResultEvent.from_json(json_object: struct)
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
        return Vellum::FulfilledExecuteWorkflowWorkflowResultEvent.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::RejectedExecuteWorkflowWorkflowResultEvent.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end