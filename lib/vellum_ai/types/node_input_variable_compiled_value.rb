# frozen_string_literal: true
require "json"
require_relative "node_input_compiled_string_value"
require_relative "node_input_compiled_number_value"
require_relative "node_input_compiled_json_value"
require_relative "node_input_compiled_chat_history_value"
require_relative "node_input_compiled_search_results_value"
require_relative "node_input_compiled_error_value"
require_relative "node_input_compiled_array_value"
require_relative "node_input_compiled_function_call_value"
require_relative "node_input_compiled_secret_value"
require_relative "node_input_compiled_audio_value"
require_relative "node_input_compiled_video_value"
require_relative "node_input_compiled_image_value"
require_relative "node_input_compiled_document_value"

module Vellum
  class NodeInputVariableCompiledValue


# Deserialize a JSON object to an instance of NodeInputVariableCompiledValue
    #
    # @param json_object [String] 
    # @return [Vellum::NodeInputVariableCompiledValue]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::NodeInputCompiledStringValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NodeInputCompiledStringValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NodeInputCompiledNumberValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NodeInputCompiledNumberValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NodeInputCompiledJsonValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NodeInputCompiledJsonValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NodeInputCompiledChatHistoryValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NodeInputCompiledChatHistoryValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NodeInputCompiledSearchResultsValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NodeInputCompiledSearchResultsValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NodeInputCompiledErrorValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NodeInputCompiledErrorValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NodeInputCompiledArrayValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NodeInputCompiledArrayValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NodeInputCompiledFunctionCallValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NodeInputCompiledFunctionCallValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NodeInputCompiledSecretValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NodeInputCompiledSecretValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NodeInputCompiledAudioValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NodeInputCompiledAudioValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NodeInputCompiledVideoValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NodeInputCompiledVideoValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NodeInputCompiledImageValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NodeInputCompiledImageValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NodeInputCompiledDocumentValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NodeInputCompiledDocumentValue.from_json(json_object: struct)
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
        return Vellum::NodeInputCompiledStringValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NodeInputCompiledNumberValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NodeInputCompiledJsonValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NodeInputCompiledChatHistoryValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NodeInputCompiledSearchResultsValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NodeInputCompiledErrorValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NodeInputCompiledArrayValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NodeInputCompiledFunctionCallValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NodeInputCompiledSecretValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NodeInputCompiledAudioValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NodeInputCompiledVideoValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NodeInputCompiledImageValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NodeInputCompiledDocumentValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end