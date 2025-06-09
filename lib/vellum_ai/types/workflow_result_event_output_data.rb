# frozen_string_literal: true
require "json"
require_relative "workflow_result_event_output_data_string"
require_relative "workflow_result_event_output_data_number"
require_relative "workflow_result_event_output_data_json"
require_relative "workflow_result_event_output_data_chat_history"
require_relative "workflow_result_event_output_data_search_results"
require_relative "workflow_result_event_output_data_array"
require_relative "workflow_result_event_output_data_function_call"
require_relative "workflow_result_event_output_data_error"

module Vellum
  class WorkflowResultEventOutputData


# Deserialize a JSON object to an instance of WorkflowResultEventOutputData
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowResultEventOutputData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::WorkflowResultEventOutputDataString.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::WorkflowResultEventOutputDataString.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::WorkflowResultEventOutputDataNumber.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::WorkflowResultEventOutputDataNumber.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::WorkflowResultEventOutputDataJson.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::WorkflowResultEventOutputDataJson.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::WorkflowResultEventOutputDataChatHistory.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::WorkflowResultEventOutputDataChatHistory.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::WorkflowResultEventOutputDataSearchResults.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::WorkflowResultEventOutputDataSearchResults.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::WorkflowResultEventOutputDataArray.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::WorkflowResultEventOutputDataArray.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::WorkflowResultEventOutputDataFunctionCall.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::WorkflowResultEventOutputDataFunctionCall.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::WorkflowResultEventOutputDataError.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::WorkflowResultEventOutputDataError.from_json(json_object: struct)
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
        return Vellum::WorkflowResultEventOutputDataString.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::WorkflowResultEventOutputDataNumber.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::WorkflowResultEventOutputDataJson.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::WorkflowResultEventOutputDataChatHistory.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::WorkflowResultEventOutputDataSearchResults.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::WorkflowResultEventOutputDataArray.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::WorkflowResultEventOutputDataFunctionCall.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::WorkflowResultEventOutputDataError.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end