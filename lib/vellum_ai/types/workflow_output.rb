# frozen_string_literal: true
require "json"
require_relative "workflow_output_string"
require_relative "workflow_output_number"
require_relative "workflow_output_json"
require_relative "workflow_output_chat_history"
require_relative "workflow_output_search_results"
require_relative "workflow_output_array"
require_relative "workflow_output_error"
require_relative "workflow_output_function_call"
require_relative "workflow_output_image"

module Vellum
  class WorkflowOutput


# Deserialize a JSON object to an instance of WorkflowOutput
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowOutput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::WorkflowOutputString.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::WorkflowOutputString.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::WorkflowOutputNumber.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::WorkflowOutputNumber.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::WorkflowOutputJson.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::WorkflowOutputJson.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::WorkflowOutputChatHistory.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::WorkflowOutputChatHistory.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::WorkflowOutputSearchResults.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::WorkflowOutputSearchResults.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::WorkflowOutputArray.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::WorkflowOutputArray.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::WorkflowOutputError.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::WorkflowOutputError.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::WorkflowOutputFunctionCall.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::WorkflowOutputFunctionCall.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::WorkflowOutputImage.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::WorkflowOutputImage.from_json(json_object: struct)
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
        return Vellum::WorkflowOutputString.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::WorkflowOutputNumber.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::WorkflowOutputJson.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::WorkflowOutputChatHistory.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::WorkflowOutputSearchResults.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::WorkflowOutputArray.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::WorkflowOutputError.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::WorkflowOutputFunctionCall.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::WorkflowOutputImage.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end