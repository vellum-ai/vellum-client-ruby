# frozen_string_literal: true
require "json"
require_relative "scenario_input_string_variable_value"
require_relative "scenario_input_json_variable_value"
require_relative "scenario_input_chat_history_variable_value"
require_relative "scenario_input_audio_variable_value"
require_relative "scenario_input_video_variable_value"
require_relative "scenario_input_image_variable_value"
require_relative "scenario_input_document_variable_value"

module Vellum
  class ScenarioInput


# Deserialize a JSON object to an instance of ScenarioInput
    #
    # @param json_object [String] 
    # @return [Vellum::ScenarioInput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::ScenarioInputStringVariableValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::ScenarioInputStringVariableValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::ScenarioInputJsonVariableValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::ScenarioInputJsonVariableValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::ScenarioInputChatHistoryVariableValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::ScenarioInputChatHistoryVariableValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::ScenarioInputAudioVariableValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::ScenarioInputAudioVariableValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::ScenarioInputVideoVariableValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::ScenarioInputVideoVariableValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::ScenarioInputImageVariableValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::ScenarioInputImageVariableValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::ScenarioInputDocumentVariableValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::ScenarioInputDocumentVariableValue.from_json(json_object: struct)
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
        return Vellum::ScenarioInputStringVariableValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::ScenarioInputJsonVariableValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::ScenarioInputChatHistoryVariableValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::ScenarioInputAudioVariableValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::ScenarioInputVideoVariableValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::ScenarioInputImageVariableValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::ScenarioInputDocumentVariableValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end