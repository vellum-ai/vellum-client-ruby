# frozen_string_literal: true
require "json"
require_relative "string_input_request"
require_relative "json_input_request"
require_relative "chat_history_input_request"

module Vellum
  class PromptDeploymentInputRequest


# Deserialize a JSON object to an instance of PromptDeploymentInputRequest
    #
    # @param json_object [String] 
    # @return [Vellum::PromptDeploymentInputRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::StringInputRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::StringInputRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::JsonInputRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::JsonInputRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::ChatHistoryInputRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::ChatHistoryInputRequest.from_json(json_object: struct)
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
        return Vellum::StringInputRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::JsonInputRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::ChatHistoryInputRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end