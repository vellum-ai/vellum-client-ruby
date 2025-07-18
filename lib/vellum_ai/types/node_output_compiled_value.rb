# frozen_string_literal: true
require "json"
require_relative "node_output_compiled_string_value"
require_relative "node_output_compiled_number_value"
require_relative "node_output_compiled_json_value"
require_relative "node_output_compiled_chat_history_value"
require_relative "node_output_compiled_search_results_value"
require_relative "node_output_compiled_error_value"
require_relative "node_output_compiled_array_value"
require_relative "node_output_compiled_function_call_value"
require_relative "node_output_compiled_thinking_value"

module Vellum
  class NodeOutputCompiledValue


# Deserialize a JSON object to an instance of NodeOutputCompiledValue
    #
    # @param json_object [String] 
    # @return [Vellum::NodeOutputCompiledValue]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::NodeOutputCompiledStringValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NodeOutputCompiledStringValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NodeOutputCompiledNumberValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NodeOutputCompiledNumberValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NodeOutputCompiledJsonValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NodeOutputCompiledJsonValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NodeOutputCompiledChatHistoryValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NodeOutputCompiledChatHistoryValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NodeOutputCompiledSearchResultsValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NodeOutputCompiledSearchResultsValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NodeOutputCompiledErrorValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NodeOutputCompiledErrorValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NodeOutputCompiledArrayValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NodeOutputCompiledArrayValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NodeOutputCompiledFunctionCallValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NodeOutputCompiledFunctionCallValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NodeOutputCompiledThinkingValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NodeOutputCompiledThinkingValue.from_json(json_object: struct)
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
        return Vellum::NodeOutputCompiledStringValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NodeOutputCompiledNumberValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NodeOutputCompiledJsonValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NodeOutputCompiledChatHistoryValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NodeOutputCompiledSearchResultsValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NodeOutputCompiledErrorValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NodeOutputCompiledArrayValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NodeOutputCompiledFunctionCallValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NodeOutputCompiledThinkingValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end