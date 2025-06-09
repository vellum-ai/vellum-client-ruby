# frozen_string_literal: true
require "json"
require_relative "initiated_execute_prompt_event"
require_relative "streaming_execute_prompt_event"
require_relative "fulfilled_execute_prompt_event"
require_relative "rejected_execute_prompt_event"

module Vellum
  class ExecutePromptEvent


# Deserialize a JSON object to an instance of ExecutePromptEvent
    #
    # @param json_object [String] 
    # @return [Vellum::ExecutePromptEvent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::InitiatedExecutePromptEvent.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::InitiatedExecutePromptEvent.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::StreamingExecutePromptEvent.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::StreamingExecutePromptEvent.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::FulfilledExecutePromptEvent.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::FulfilledExecutePromptEvent.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::RejectedExecutePromptEvent.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::RejectedExecutePromptEvent.from_json(json_object: struct)
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
        return Vellum::InitiatedExecutePromptEvent.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::StreamingExecutePromptEvent.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::FulfilledExecutePromptEvent.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::RejectedExecutePromptEvent.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end