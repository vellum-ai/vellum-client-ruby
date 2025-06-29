# frozen_string_literal: true
require "json"
require_relative "workflow_execution_initiated_event"
require_relative "workflow_execution_streaming_event"
require_relative "workflow_execution_fulfilled_event"
require_relative "workflow_execution_rejected_event"
require_relative "workflow_execution_paused_event"
require_relative "workflow_execution_resumed_event"
require_relative "workflow_execution_snapshotted_event"

module Vellum
  class VellumWorkflowExecutionEvent


# Deserialize a JSON object to an instance of VellumWorkflowExecutionEvent
    #
    # @param json_object [String] 
    # @return [Vellum::VellumWorkflowExecutionEvent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::WorkflowExecutionInitiatedEvent.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::WorkflowExecutionInitiatedEvent.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::WorkflowExecutionStreamingEvent.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::WorkflowExecutionStreamingEvent.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::WorkflowExecutionFulfilledEvent.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::WorkflowExecutionFulfilledEvent.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::WorkflowExecutionRejectedEvent.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::WorkflowExecutionRejectedEvent.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::WorkflowExecutionPausedEvent.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::WorkflowExecutionPausedEvent.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::WorkflowExecutionResumedEvent.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::WorkflowExecutionResumedEvent.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::WorkflowExecutionSnapshottedEvent.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::WorkflowExecutionSnapshottedEvent.from_json(json_object: struct)
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
        return Vellum::WorkflowExecutionInitiatedEvent.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::WorkflowExecutionStreamingEvent.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::WorkflowExecutionFulfilledEvent.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::WorkflowExecutionRejectedEvent.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::WorkflowExecutionPausedEvent.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::WorkflowExecutionResumedEvent.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::WorkflowExecutionSnapshottedEvent.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end