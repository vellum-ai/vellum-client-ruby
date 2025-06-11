# frozen_string_literal: true
require "json"
require_relative "initiated_ad_hoc_execute_prompt_event"
require_relative "streaming_ad_hoc_execute_prompt_event"
require_relative "fulfilled_ad_hoc_execute_prompt_event"
require_relative "rejected_ad_hoc_execute_prompt_event"

module Vellum
  class AdHocExecutePromptEvent


# Deserialize a JSON object to an instance of AdHocExecutePromptEvent
    #
    # @param json_object [String] 
    # @return [Vellum::AdHocExecutePromptEvent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::InitiatedAdHocExecutePromptEvent.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::InitiatedAdHocExecutePromptEvent.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::StreamingAdHocExecutePromptEvent.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::StreamingAdHocExecutePromptEvent.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::FulfilledAdHocExecutePromptEvent.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::FulfilledAdHocExecutePromptEvent.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::RejectedAdHocExecutePromptEvent.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::RejectedAdHocExecutePromptEvent.from_json(json_object: struct)
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
        return Vellum::InitiatedAdHocExecutePromptEvent.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::StreamingAdHocExecutePromptEvent.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::FulfilledAdHocExecutePromptEvent.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::RejectedAdHocExecutePromptEvent.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end