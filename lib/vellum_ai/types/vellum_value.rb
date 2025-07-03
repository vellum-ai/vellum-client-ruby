# frozen_string_literal: true
require "json"
require_relative "string_vellum_value"
require_relative "number_vellum_value"
require_relative "json_vellum_value"
require_relative "image_vellum_value"
require_relative "audio_vellum_value"
require_relative "document_vellum_value"
require_relative "function_call_vellum_value"
require_relative "error_vellum_value"
require_relative "array_vellum_value"
require_relative "chat_history_vellum_value"
require_relative "search_results_vellum_value"
require_relative "thinking_vellum_value"

module Vellum
  class VellumValue


# Deserialize a JSON object to an instance of VellumValue
    #
    # @param json_object [String] 
    # @return [Vellum::VellumValue]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::StringVellumValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::StringVellumValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NumberVellumValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NumberVellumValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::JsonVellumValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::JsonVellumValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::ImageVellumValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::ImageVellumValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::AudioVellumValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::AudioVellumValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::DocumentVellumValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::DocumentVellumValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::FunctionCallVellumValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::FunctionCallVellumValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::ErrorVellumValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::ErrorVellumValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::ArrayVellumValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::ArrayVellumValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::ChatHistoryVellumValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::ChatHistoryVellumValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::SearchResultsVellumValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::SearchResultsVellumValue.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::ThinkingVellumValue.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::ThinkingVellumValue.from_json(json_object: struct)
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
        return Vellum::StringVellumValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NumberVellumValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::JsonVellumValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::ImageVellumValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::AudioVellumValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::DocumentVellumValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::FunctionCallVellumValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::ErrorVellumValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::ArrayVellumValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::ChatHistoryVellumValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::SearchResultsVellumValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::ThinkingVellumValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end