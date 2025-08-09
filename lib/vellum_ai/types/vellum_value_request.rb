# frozen_string_literal: true
require "json"
require_relative "string_vellum_value_request"
require_relative "number_vellum_value_request"
require_relative "json_vellum_value_request"
require_relative "audio_vellum_value_request"
require_relative "video_vellum_value_request"
require_relative "image_vellum_value_request"
require_relative "document_vellum_value_request"
require_relative "function_call_vellum_value_request"
require_relative "error_vellum_value_request"
require_relative "array_vellum_value_request"
require_relative "chat_history_vellum_value_request"
require_relative "search_results_vellum_value_request"
require_relative "thinking_vellum_value_request"

module Vellum
  class VellumValueRequest


# Deserialize a JSON object to an instance of VellumValueRequest
    #
    # @param json_object [String] 
    # @return [Vellum::VellumValueRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::StringVellumValueRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::StringVellumValueRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::NumberVellumValueRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::NumberVellumValueRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::JsonVellumValueRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::JsonVellumValueRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::AudioVellumValueRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::AudioVellumValueRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::VideoVellumValueRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::VideoVellumValueRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::ImageVellumValueRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::ImageVellumValueRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::DocumentVellumValueRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::DocumentVellumValueRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::FunctionCallVellumValueRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::FunctionCallVellumValueRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::ErrorVellumValueRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::ErrorVellumValueRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::ArrayVellumValueRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::ArrayVellumValueRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::ChatHistoryVellumValueRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::ChatHistoryVellumValueRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::SearchResultsVellumValueRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::SearchResultsVellumValueRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::ThinkingVellumValueRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::ThinkingVellumValueRequest.from_json(json_object: struct)
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
        return Vellum::StringVellumValueRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::NumberVellumValueRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::JsonVellumValueRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::AudioVellumValueRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::VideoVellumValueRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::ImageVellumValueRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::DocumentVellumValueRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::FunctionCallVellumValueRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::ErrorVellumValueRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::ArrayVellumValueRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::ChatHistoryVellumValueRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::SearchResultsVellumValueRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::ThinkingVellumValueRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end