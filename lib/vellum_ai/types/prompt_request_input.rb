# frozen_string_literal: true
require "json"
require_relative "prompt_request_string_input"
require_relative "prompt_request_json_input"
require_relative "prompt_request_chat_history_input"

module Vellum
  class PromptRequestInput


# Deserialize a JSON object to an instance of PromptRequestInput
    #
    # @param json_object [String] 
    # @return [Vellum::PromptRequestInput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::PromptRequestStringInput.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::PromptRequestStringInput.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::PromptRequestJsonInput.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::PromptRequestJsonInput.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::PromptRequestChatHistoryInput.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::PromptRequestChatHistoryInput.from_json(json_object: struct)
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
        return Vellum::PromptRequestStringInput.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::PromptRequestJsonInput.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::PromptRequestChatHistoryInput.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end