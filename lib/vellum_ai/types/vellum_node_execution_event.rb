# frozen_string_literal: true
require "json"
require_relative "node_execution_initiated_event"
require_relative "node_execution_streaming_event"
require_relative "node_execution_fulfilled_event"
require_relative "node_execution_rejected_event"
require_relative "node_execution_paused_event"
require_relative "node_execution_resumed_event"

module Vellum
  class VellumNodeExecutionEvent


# Deserialize a JSON object to an instance of VellumNodeExecutionEvent
    #
    # @param json_object [String] 
    # @return [Vellum::VellumNodeExecutionEvent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::NodeExecutionInitiatedEvent.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NodeExecutionInitiatedEvent.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NodeExecutionStreamingEvent.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NodeExecutionStreamingEvent.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NodeExecutionFulfilledEvent.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NodeExecutionFulfilledEvent.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NodeExecutionRejectedEvent.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NodeExecutionRejectedEvent.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NodeExecutionPausedEvent.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NodeExecutionPausedEvent.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NodeExecutionResumedEvent.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NodeExecutionResumedEvent.from_json(json_object: struct)
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
        return Vellum::NodeExecutionInitiatedEvent.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NodeExecutionStreamingEvent.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NodeExecutionFulfilledEvent.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NodeExecutionRejectedEvent.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NodeExecutionPausedEvent.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NodeExecutionResumedEvent.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end