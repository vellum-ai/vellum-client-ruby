# frozen_string_literal: true
require "json"
require_relative "string_vellum_value"
require_relative "number_vellum_value"
require_relative "json_vellum_value"
require_relative "audio_vellum_value"
require_relative "video_vellum_value"
require_relative "image_vellum_value"
require_relative "document_vellum_value"
require_relative "function_call_vellum_value"
require_relative "error_vellum_value"
require_relative "array_vellum_value"
require_relative "chat_history_vellum_value"
require_relative "search_results_vellum_value"
require_relative "thinking_vellum_value"

module Vellum
  class VellumValue
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vellum::VellumValue]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of VellumValue
    #
    # @param json_object [String] 
    # @return [Vellum::VellumValue]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.type
      when "STRING"
        member = Vellum::StringVellumValue.from_json(json_object: json_object)
      when "NUMBER"
        member = Vellum::NumberVellumValue.from_json(json_object: json_object)
      when "JSON"
        member = Vellum::JSONVellumValue.from_json(json_object: json_object)
      when "AUDIO"
        member = Vellum::AudioVellumValue.from_json(json_object: json_object)
      when "VIDEO"
        member = Vellum::VideoVellumValue.from_json(json_object: json_object)
      when "IMAGE"
        member = Vellum::ImageVellumValue.from_json(json_object: json_object)
      when "DOCUMENT"
        member = Vellum::DocumentVellumValue.from_json(json_object: json_object)
      when "FUNCTION_CALL"
        member = Vellum::FunctionCallVellumValue.from_json(json_object: json_object)
      when "ERROR"
        member = Vellum::ErrorVellumValue.from_json(json_object: json_object)
      when "ARRAY"
        member = Vellum::ArrayVellumValue.from_json(json_object: json_object)
      when "CHAT_HISTORY"
        member = Vellum::ChatHistoryVellumValue.from_json(json_object: json_object)
      when "SEARCH_RESULTS"
        member = Vellum::SearchResultsVellumValue.from_json(json_object: json_object)
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
      when "NUMBER"
        { **@member.to_json, type: @discriminant }.to_json
      when "JSON"
        { **@member.to_json, type: @discriminant }.to_json
      when "AUDIO"
        { **@member.to_json, type: @discriminant }.to_json
      when "VIDEO"
        { **@member.to_json, type: @discriminant }.to_json
      when "IMAGE"
        { **@member.to_json, type: @discriminant }.to_json
      when "DOCUMENT"
        { **@member.to_json, type: @discriminant }.to_json
      when "FUNCTION_CALL"
        { **@member.to_json, type: @discriminant }.to_json
      when "ERROR"
        { **@member.to_json, type: @discriminant }.to_json
      when "ARRAY"
        { **@member.to_json, type: @discriminant }.to_json
      when "CHAT_HISTORY"
        { **@member.to_json, type: @discriminant }.to_json
      when "SEARCH_RESULTS"
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
      when "NUMBER"
        Vellum::NumberVellumValue.validate_raw(obj: obj)
      when "JSON"
        Vellum::JSONVellumValue.validate_raw(obj: obj)
      when "AUDIO"
        Vellum::AudioVellumValue.validate_raw(obj: obj)
      when "VIDEO"
        Vellum::VideoVellumValue.validate_raw(obj: obj)
      when "IMAGE"
        Vellum::ImageVellumValue.validate_raw(obj: obj)
      when "DOCUMENT"
        Vellum::DocumentVellumValue.validate_raw(obj: obj)
      when "FUNCTION_CALL"
        Vellum::FunctionCallVellumValue.validate_raw(obj: obj)
      when "ERROR"
        Vellum::ErrorVellumValue.validate_raw(obj: obj)
      when "ARRAY"
        Vellum::ArrayVellumValue.validate_raw(obj: obj)
      when "CHAT_HISTORY"
        Vellum::ChatHistoryVellumValue.validate_raw(obj: obj)
      when "SEARCH_RESULTS"
        Vellum::SearchResultsVellumValue.validate_raw(obj: obj)
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
    # @return [Vellum::VellumValue]
    def self.string(member:)
      new(member: member, discriminant: "STRING")
    end
    # @param member [Vellum::NumberVellumValue] 
    # @return [Vellum::VellumValue]
    def self.number(member:)
      new(member: member, discriminant: "NUMBER")
    end
    # @param member [Vellum::JSONVellumValue] 
    # @return [Vellum::VellumValue]
    def self.json(member:)
      new(member: member, discriminant: "JSON")
    end
    # @param member [Vellum::AudioVellumValue] 
    # @return [Vellum::VellumValue]
    def self.audio(member:)
      new(member: member, discriminant: "AUDIO")
    end
    # @param member [Vellum::VideoVellumValue] 
    # @return [Vellum::VellumValue]
    def self.video(member:)
      new(member: member, discriminant: "VIDEO")
    end
    # @param member [Vellum::ImageVellumValue] 
    # @return [Vellum::VellumValue]
    def self.image(member:)
      new(member: member, discriminant: "IMAGE")
    end
    # @param member [Vellum::DocumentVellumValue] 
    # @return [Vellum::VellumValue]
    def self.document(member:)
      new(member: member, discriminant: "DOCUMENT")
    end
    # @param member [Vellum::FunctionCallVellumValue] 
    # @return [Vellum::VellumValue]
    def self.function_call(member:)
      new(member: member, discriminant: "FUNCTION_CALL")
    end
    # @param member [Vellum::ErrorVellumValue] 
    # @return [Vellum::VellumValue]
    def self.error(member:)
      new(member: member, discriminant: "ERROR")
    end
    # @param member [Vellum::ArrayVellumValue] 
    # @return [Vellum::VellumValue]
    def self.array(member:)
      new(member: member, discriminant: "ARRAY")
    end
    # @param member [Vellum::ChatHistoryVellumValue] 
    # @return [Vellum::VellumValue]
    def self.chat_history(member:)
      new(member: member, discriminant: "CHAT_HISTORY")
    end
    # @param member [Vellum::SearchResultsVellumValue] 
    # @return [Vellum::VellumValue]
    def self.search_results(member:)
      new(member: member, discriminant: "SEARCH_RESULTS")
    end
    # @param member [Vellum::ThinkingVellumValue] 
    # @return [Vellum::VellumValue]
    def self.thinking(member:)
      new(member: member, discriminant: "THINKING")
    end
  end
end