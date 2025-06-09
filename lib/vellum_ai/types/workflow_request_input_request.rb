# frozen_string_literal: true
require "json"
require_relative "workflow_request_string_input_request"
require_relative "workflow_request_json_input_request"
require_relative "workflow_request_chat_history_input_request"
require_relative "workflow_request_number_input_request"

module Vellum
  class WorkflowRequestInputRequest


# Deserialize a JSON object to an instance of WorkflowRequestInputRequest
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowRequestInputRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::WorkflowRequestStringInputRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::WorkflowRequestStringInputRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::WorkflowRequestJsonInputRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::WorkflowRequestJsonInputRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::WorkflowRequestChatHistoryInputRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::WorkflowRequestChatHistoryInputRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::WorkflowRequestNumberInputRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::WorkflowRequestNumberInputRequest.from_json(json_object: struct)
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
        return Vellum::WorkflowRequestStringInputRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::WorkflowRequestJsonInputRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::WorkflowRequestChatHistoryInputRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::WorkflowRequestNumberInputRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end