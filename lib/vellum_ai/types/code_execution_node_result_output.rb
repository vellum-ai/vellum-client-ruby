# frozen_string_literal: true
require "json"
require_relative "code_execution_node_string_result"
require_relative "code_execution_node_number_result"
require_relative "code_execution_node_json_result"
require_relative "code_execution_node_chat_history_result"
require_relative "code_execution_node_search_results_result"
require_relative "code_execution_node_error_result"
require_relative "code_execution_node_array_result"
require_relative "code_execution_node_function_call_result"

module Vellum
  class CodeExecutionNodeResultOutput


# Deserialize a JSON object to an instance of CodeExecutionNodeResultOutput
    #
    # @param json_object [String] 
    # @return [Vellum::CodeExecutionNodeResultOutput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::CodeExecutionNodeStringResult.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::CodeExecutionNodeStringResult.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::CodeExecutionNodeNumberResult.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::CodeExecutionNodeNumberResult.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::CodeExecutionNodeJsonResult.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::CodeExecutionNodeJsonResult.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::CodeExecutionNodeChatHistoryResult.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::CodeExecutionNodeChatHistoryResult.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::CodeExecutionNodeSearchResultsResult.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::CodeExecutionNodeSearchResultsResult.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::CodeExecutionNodeErrorResult.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::CodeExecutionNodeErrorResult.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::CodeExecutionNodeArrayResult.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::CodeExecutionNodeArrayResult.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::CodeExecutionNodeFunctionCallResult.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::CodeExecutionNodeFunctionCallResult.from_json(json_object: struct)
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
        return Vellum::CodeExecutionNodeStringResult.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::CodeExecutionNodeNumberResult.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::CodeExecutionNodeJsonResult.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::CodeExecutionNodeChatHistoryResult.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::CodeExecutionNodeSearchResultsResult.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::CodeExecutionNodeErrorResult.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::CodeExecutionNodeArrayResult.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::CodeExecutionNodeFunctionCallResult.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end