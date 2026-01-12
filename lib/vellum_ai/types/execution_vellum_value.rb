# frozen_string_literal: true
require "json"
require_relative "execution_string_vellum_value"
require_relative "execution_number_vellum_value"
require_relative "execution_json_vellum_value"
require_relative "execution_chat_history_vellum_value"
require_relative "execution_search_results_vellum_value"
require_relative "execution_error_vellum_value"
require_relative "execution_array_vellum_value"
require_relative "execution_function_call_vellum_value"
require_relative "execution_thinking_vellum_value"
require_relative "execution_audio_vellum_value"
require_relative "execution_video_vellum_value"
require_relative "execution_image_vellum_value"
require_relative "execution_document_vellum_value"

module Vellum
  class ExecutionVellumValue
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vellum::ExecutionVellumValue]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of ExecutionVellumValue
    #
    # @param json_object [String] 
    # @return [Vellum::ExecutionVellumValue]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.type
      when "STRING"
        member = Vellum::ExecutionStringVellumValue.from_json(json_object: json_object)
      when "NUMBER"
        member = Vellum::ExecutionNumberVellumValue.from_json(json_object: json_object)
      when "JSON"
        member = Vellum::ExecutionJSONVellumValue.from_json(json_object: json_object)
      when "CHAT_HISTORY"
        member = Vellum::ExecutionChatHistoryVellumValue.from_json(json_object: json_object)
      when "SEARCH_RESULTS"
        member = Vellum::ExecutionSearchResultsVellumValue.from_json(json_object: json_object)
      when "ERROR"
        member = Vellum::ExecutionErrorVellumValue.from_json(json_object: json_object)
      when "ARRAY"
        member = Vellum::ExecutionArrayVellumValue.from_json(json_object: json_object)
      when "FUNCTION_CALL"
        member = Vellum::ExecutionFunctionCallVellumValue.from_json(json_object: json_object)
      when "THINKING"
        member = Vellum::ExecutionThinkingVellumValue.from_json(json_object: json_object)
      when "AUDIO"
        member = Vellum::ExecutionAudioVellumValue.from_json(json_object: json_object)
      when "VIDEO"
        member = Vellum::ExecutionVideoVellumValue.from_json(json_object: json_object)
      when "IMAGE"
        member = Vellum::ExecutionImageVellumValue.from_json(json_object: json_object)
      when "DOCUMENT"
        member = Vellum::ExecutionDocumentVellumValue.from_json(json_object: json_object)
      else
        member = Vellum::ExecutionStringVellumValue.from_json(json_object: json_object)
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
      when "CHAT_HISTORY"
        { **@member.to_json, type: @discriminant }.to_json
      when "SEARCH_RESULTS"
        { **@member.to_json, type: @discriminant }.to_json
      when "ERROR"
        { **@member.to_json, type: @discriminant }.to_json
      when "ARRAY"
        { **@member.to_json, type: @discriminant }.to_json
      when "FUNCTION_CALL"
        { **@member.to_json, type: @discriminant }.to_json
      when "THINKING"
        { **@member.to_json, type: @discriminant }.to_json
      when "AUDIO"
        { **@member.to_json, type: @discriminant }.to_json
      when "VIDEO"
        { **@member.to_json, type: @discriminant }.to_json
      when "IMAGE"
        { **@member.to_json, type: @discriminant }.to_json
      when "DOCUMENT"
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
        Vellum::ExecutionStringVellumValue.validate_raw(obj: obj)
      when "NUMBER"
        Vellum::ExecutionNumberVellumValue.validate_raw(obj: obj)
      when "JSON"
        Vellum::ExecutionJSONVellumValue.validate_raw(obj: obj)
      when "CHAT_HISTORY"
        Vellum::ExecutionChatHistoryVellumValue.validate_raw(obj: obj)
      when "SEARCH_RESULTS"
        Vellum::ExecutionSearchResultsVellumValue.validate_raw(obj: obj)
      when "ERROR"
        Vellum::ExecutionErrorVellumValue.validate_raw(obj: obj)
      when "ARRAY"
        Vellum::ExecutionArrayVellumValue.validate_raw(obj: obj)
      when "FUNCTION_CALL"
        Vellum::ExecutionFunctionCallVellumValue.validate_raw(obj: obj)
      when "THINKING"
        Vellum::ExecutionThinkingVellumValue.validate_raw(obj: obj)
      when "AUDIO"
        Vellum::ExecutionAudioVellumValue.validate_raw(obj: obj)
      when "VIDEO"
        Vellum::ExecutionVideoVellumValue.validate_raw(obj: obj)
      when "IMAGE"
        Vellum::ExecutionImageVellumValue.validate_raw(obj: obj)
      when "DOCUMENT"
        Vellum::ExecutionDocumentVellumValue.validate_raw(obj: obj)
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
    # @param member [Vellum::ExecutionStringVellumValue] 
    # @return [Vellum::ExecutionVellumValue]
    def self.string(member:)
      new(member: member, discriminant: "STRING")
    end
    # @param member [Vellum::ExecutionNumberVellumValue] 
    # @return [Vellum::ExecutionVellumValue]
    def self.number(member:)
      new(member: member, discriminant: "NUMBER")
    end
    # @param member [Vellum::ExecutionJSONVellumValue] 
    # @return [Vellum::ExecutionVellumValue]
    def self.json(member:)
      new(member: member, discriminant: "JSON")
    end
    # @param member [Vellum::ExecutionChatHistoryVellumValue] 
    # @return [Vellum::ExecutionVellumValue]
    def self.chat_history(member:)
      new(member: member, discriminant: "CHAT_HISTORY")
    end
    # @param member [Vellum::ExecutionSearchResultsVellumValue] 
    # @return [Vellum::ExecutionVellumValue]
    def self.search_results(member:)
      new(member: member, discriminant: "SEARCH_RESULTS")
    end
    # @param member [Vellum::ExecutionErrorVellumValue] 
    # @return [Vellum::ExecutionVellumValue]
    def self.error(member:)
      new(member: member, discriminant: "ERROR")
    end
    # @param member [Vellum::ExecutionArrayVellumValue] 
    # @return [Vellum::ExecutionVellumValue]
    def self.array(member:)
      new(member: member, discriminant: "ARRAY")
    end
    # @param member [Vellum::ExecutionFunctionCallVellumValue] 
    # @return [Vellum::ExecutionVellumValue]
    def self.function_call(member:)
      new(member: member, discriminant: "FUNCTION_CALL")
    end
    # @param member [Vellum::ExecutionThinkingVellumValue] 
    # @return [Vellum::ExecutionVellumValue]
    def self.thinking(member:)
      new(member: member, discriminant: "THINKING")
    end
    # @param member [Vellum::ExecutionAudioVellumValue] 
    # @return [Vellum::ExecutionVellumValue]
    def self.audio(member:)
      new(member: member, discriminant: "AUDIO")
    end
    # @param member [Vellum::ExecutionVideoVellumValue] 
    # @return [Vellum::ExecutionVellumValue]
    def self.video(member:)
      new(member: member, discriminant: "VIDEO")
    end
    # @param member [Vellum::ExecutionImageVellumValue] 
    # @return [Vellum::ExecutionVellumValue]
    def self.image(member:)
      new(member: member, discriminant: "IMAGE")
    end
    # @param member [Vellum::ExecutionDocumentVellumValue] 
    # @return [Vellum::ExecutionVellumValue]
    def self.document(member:)
      new(member: member, discriminant: "DOCUMENT")
    end
  end
end