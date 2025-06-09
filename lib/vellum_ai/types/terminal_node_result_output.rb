# frozen_string_literal: true
require "json"
require_relative "terminal_node_string_result"
require_relative "terminal_node_number_result"
require_relative "terminal_node_json_result"
require_relative "terminal_node_chat_history_result"
require_relative "terminal_node_search_results_result"
require_relative "terminal_node_error_result"
require_relative "terminal_node_array_result"
require_relative "terminal_node_function_call_result"

module Vellum
  class TerminalNodeResultOutput


# Deserialize a JSON object to an instance of TerminalNodeResultOutput
    #
    # @param json_object [String] 
    # @return [Vellum::TerminalNodeResultOutput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::TerminalNodeStringResult.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TerminalNodeStringResult.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TerminalNodeNumberResult.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TerminalNodeNumberResult.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TerminalNodeJsonResult.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TerminalNodeJsonResult.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TerminalNodeChatHistoryResult.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TerminalNodeChatHistoryResult.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TerminalNodeSearchResultsResult.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TerminalNodeSearchResultsResult.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TerminalNodeErrorResult.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TerminalNodeErrorResult.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TerminalNodeArrayResult.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TerminalNodeArrayResult.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TerminalNodeFunctionCallResult.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TerminalNodeFunctionCallResult.from_json(json_object: struct)
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
        return Vellum::TerminalNodeStringResult.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TerminalNodeNumberResult.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TerminalNodeJsonResult.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TerminalNodeChatHistoryResult.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TerminalNodeSearchResultsResult.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TerminalNodeErrorResult.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TerminalNodeArrayResult.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TerminalNodeFunctionCallResult.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end