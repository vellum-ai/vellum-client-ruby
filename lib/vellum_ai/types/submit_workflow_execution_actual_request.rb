# frozen_string_literal: true
require "json"
require_relative "workflow_execution_actual_string_request"
require_relative "workflow_execution_actual_json_request"
require_relative "workflow_execution_actual_chat_history_request"

module Vellum
  class SubmitWorkflowExecutionActualRequest


# Deserialize a JSON object to an instance of SubmitWorkflowExecutionActualRequest
    #
    # @param json_object [String] 
    # @return [Vellum::SubmitWorkflowExecutionActualRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::WorkflowExecutionActualStringRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::WorkflowExecutionActualStringRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::WorkflowExecutionActualJsonRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::WorkflowExecutionActualJsonRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::WorkflowExecutionActualChatHistoryRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::WorkflowExecutionActualChatHistoryRequest.from_json(json_object: struct)
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
        return Vellum::WorkflowExecutionActualStringRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::WorkflowExecutionActualJsonRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::WorkflowExecutionActualChatHistoryRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end