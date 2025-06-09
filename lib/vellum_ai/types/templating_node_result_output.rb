# frozen_string_literal: true
require "json"
require_relative "templating_node_string_result"
require_relative "templating_node_number_result"
require_relative "templating_node_json_result"
require_relative "templating_node_chat_history_result"
require_relative "templating_node_search_results_result"
require_relative "templating_node_error_result"
require_relative "templating_node_array_result"
require_relative "templating_node_function_call_result"

module Vellum
  class TemplatingNodeResultOutput


# Deserialize a JSON object to an instance of TemplatingNodeResultOutput
    #
    # @param json_object [String] 
    # @return [Vellum::TemplatingNodeResultOutput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::TemplatingNodeStringResult.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TemplatingNodeStringResult.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TemplatingNodeNumberResult.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TemplatingNodeNumberResult.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TemplatingNodeJsonResult.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TemplatingNodeJsonResult.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TemplatingNodeChatHistoryResult.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TemplatingNodeChatHistoryResult.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TemplatingNodeSearchResultsResult.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TemplatingNodeSearchResultsResult.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TemplatingNodeErrorResult.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TemplatingNodeErrorResult.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TemplatingNodeArrayResult.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TemplatingNodeArrayResult.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TemplatingNodeFunctionCallResult.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TemplatingNodeFunctionCallResult.from_json(json_object: struct)
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
        return Vellum::TemplatingNodeStringResult.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TemplatingNodeNumberResult.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TemplatingNodeJsonResult.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TemplatingNodeChatHistoryResult.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TemplatingNodeSearchResultsResult.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TemplatingNodeErrorResult.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TemplatingNodeArrayResult.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TemplatingNodeFunctionCallResult.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end