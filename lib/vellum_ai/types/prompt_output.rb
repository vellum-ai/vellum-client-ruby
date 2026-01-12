# frozen_string_literal: true
require "json"
require_relative "string_vellum_value"
require_relative "json_vellum_value"
require_relative "error_vellum_value"
require_relative "function_call_vellum_value"
require_relative "thinking_vellum_value"

module Vellum
  class PromptOutput
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vellum::PromptOutput]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of PromptOutput
    #
    # @param json_object [String] 
    # @return [Vellum::PromptOutput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.type
      when "STRING"
        member = Vellum::StringVellumValue.from_json(json_object: json_object)
      when "JSON"
        member = Vellum::JSONVellumValue.from_json(json_object: json_object)
      when "ERROR"
        member = Vellum::ErrorVellumValue.from_json(json_object: json_object)
      when "FUNCTION_CALL"
        member = Vellum::FunctionCallVellumValue.from_json(json_object: json_object)
      when "THINKING"
        member = Vellum::ThinkingVellumValue.from_json(json_object: json_object)
      else
        member = Vellum::StringVellumValue.from_json(json_object: json_object)
      end
      new(member: member, discriminant: struct.type)
    end
# For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json
      case @discriminant
      when "STRING"
        { **@member.to_json, type: @discriminant }.to_json
      when "JSON"
        { **@member.to_json, type: @discriminant }.to_json
      when "ERROR"
        { **@member.to_json, type: @discriminant }.to_json
      when "FUNCTION_CALL"
        { **@member.to_json, type: @discriminant }.to_json
      when "THINKING"
        { **@member.to_json, type: @discriminant }.to_json
      else
        { "type": @discriminant, value: @member }.to_json
      end
      @member.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      case obj.type
      when "STRING"
        Vellum::StringVellumValue.validate_raw(obj: obj)
      when "JSON"
        Vellum::JSONVellumValue.validate_raw(obj: obj)
      when "ERROR"
        Vellum::ErrorVellumValue.validate_raw(obj: obj)
      when "FUNCTION_CALL"
        Vellum::FunctionCallVellumValue.validate_raw(obj: obj)
      when "THINKING"
        Vellum::ThinkingVellumValue.validate_raw(obj: obj)
      else
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
# For Union Types, is_a? functionality is delegated to the wrapped member.
    #
    # @param obj [Object] 
    # @return [Boolean]
    def is_a?(obj)
      @member.is_a?(obj)
    end
    # @param member [Vellum::StringVellumValue] 
    # @return [Vellum::PromptOutput]
    def self.string(member:)
      new(member: member, discriminant: "STRING")
    end
    # @param member [Vellum::JSONVellumValue] 
    # @return [Vellum::PromptOutput]
    def self.json(member:)
      new(member: member, discriminant: "JSON")
    end
    # @param member [Vellum::ErrorVellumValue] 
    # @return [Vellum::PromptOutput]
    def self.error(member:)
      new(member: member, discriminant: "ERROR")
    end
    # @param member [Vellum::FunctionCallVellumValue] 
    # @return [Vellum::PromptOutput]
    def self.function_call(member:)
      new(member: member, discriminant: "FUNCTION_CALL")
    end
    # @param member [Vellum::ThinkingVellumValue] 
    # @return [Vellum::PromptOutput]
    def self.thinking(member:)
      new(member: member, discriminant: "THINKING")
    end
  end
end