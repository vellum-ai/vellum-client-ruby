# frozen_string_literal: true
require "json"
require_relative "string_vellum_value"
require_relative "json_vellum_value"
require_relative "error_vellum_value"
require_relative "function_call_vellum_value"
require_relative "thinking_vellum_value"

module Vellum
  class PromptOutput


# Deserialize a JSON object to an instance of PromptOutput
    #
    # @param json_object [String] 
    # @return [Vellum::PromptOutput]
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
        return Vellum::JsonVellumValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::ErrorVellumValue.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::FunctionCallVellumValue.validate_raw(obj: obj)
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