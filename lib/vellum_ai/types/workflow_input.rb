# frozen_string_literal: true
require "json"
require_relative "string_input"
require_relative "json_input"
require_relative "chat_history_input"
require_relative "number_input"
require_relative "search_results_input"
require_relative "error_input"
require_relative "array_input"
require_relative "function_call_input"
require_relative "audio_input"
require_relative "video_input"
require_relative "image_input"
require_relative "document_input"

module Vellum
  class WorkflowInput
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vellum::WorkflowInput]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of WorkflowInput
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowInput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.type
      when "STRING"
        member = Vellum::StringInput.from_json(json_object: json_object)
      when "JSON"
        member = Vellum::JSONInput.from_json(json_object: json_object)
      when "CHAT_HISTORY"
        member = Vellum::ChatHistoryInput.from_json(json_object: json_object)
      when "NUMBER"
        member = Vellum::NumberInput.from_json(json_object: json_object)
      when "SEARCH_RESULTS"
        member = Vellum::SearchResultsInput.from_json(json_object: json_object)
      when "ERROR"
        member = Vellum::ErrorInput.from_json(json_object: json_object)
      when "ARRAY"
        member = Vellum::ArrayInput.from_json(json_object: json_object)
      when "FUNCTION_CALL"
        member = Vellum::FunctionCallInput.from_json(json_object: json_object)
      when "AUDIO"
        member = Vellum::AudioInput.from_json(json_object: json_object)
      when "VIDEO"
        member = Vellum::VideoInput.from_json(json_object: json_object)
      when "IMAGE"
        member = Vellum::ImageInput.from_json(json_object: json_object)
      when "DOCUMENT"
        member = Vellum::DocumentInput.from_json(json_object: json_object)
      else
        member = Vellum::StringInput.from_json(json_object: json_object)
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
      when "CHAT_HISTORY"
        { **@member.to_json, type: @discriminant }.to_json
      when "NUMBER"
        { **@member.to_json, type: @discriminant }.to_json
      when "SEARCH_RESULTS"
        { **@member.to_json, type: @discriminant }.to_json
      when "ERROR"
        { **@member.to_json, type: @discriminant }.to_json
      when "ARRAY"
        { **@member.to_json, type: @discriminant }.to_json
      when "FUNCTION_CALL"
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
        Vellum::StringInput.validate_raw(obj: obj)
      when "JSON"
        Vellum::JSONInput.validate_raw(obj: obj)
      when "CHAT_HISTORY"
        Vellum::ChatHistoryInput.validate_raw(obj: obj)
      when "NUMBER"
        Vellum::NumberInput.validate_raw(obj: obj)
      when "SEARCH_RESULTS"
        Vellum::SearchResultsInput.validate_raw(obj: obj)
      when "ERROR"
        Vellum::ErrorInput.validate_raw(obj: obj)
      when "ARRAY"
        Vellum::ArrayInput.validate_raw(obj: obj)
      when "FUNCTION_CALL"
        Vellum::FunctionCallInput.validate_raw(obj: obj)
      when "AUDIO"
        Vellum::AudioInput.validate_raw(obj: obj)
      when "VIDEO"
        Vellum::VideoInput.validate_raw(obj: obj)
      when "IMAGE"
        Vellum::ImageInput.validate_raw(obj: obj)
      when "DOCUMENT"
        Vellum::DocumentInput.validate_raw(obj: obj)
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
    # @param member [Vellum::StringInput] 
    # @return [Vellum::WorkflowInput]
    def self.string(member:)
      new(member: member, discriminant: "STRING")
    end
    # @param member [Vellum::JSONInput] 
    # @return [Vellum::WorkflowInput]
    def self.json(member:)
      new(member: member, discriminant: "JSON")
    end
    # @param member [Vellum::ChatHistoryInput] 
    # @return [Vellum::WorkflowInput]
    def self.chat_history(member:)
      new(member: member, discriminant: "CHAT_HISTORY")
    end
    # @param member [Vellum::NumberInput] 
    # @return [Vellum::WorkflowInput]
    def self.number(member:)
      new(member: member, discriminant: "NUMBER")
    end
    # @param member [Vellum::SearchResultsInput] 
    # @return [Vellum::WorkflowInput]
    def self.search_results(member:)
      new(member: member, discriminant: "SEARCH_RESULTS")
    end
    # @param member [Vellum::ErrorInput] 
    # @return [Vellum::WorkflowInput]
    def self.error(member:)
      new(member: member, discriminant: "ERROR")
    end
    # @param member [Vellum::ArrayInput] 
    # @return [Vellum::WorkflowInput]
    def self.array(member:)
      new(member: member, discriminant: "ARRAY")
    end
    # @param member [Vellum::FunctionCallInput] 
    # @return [Vellum::WorkflowInput]
    def self.function_call(member:)
      new(member: member, discriminant: "FUNCTION_CALL")
    end
    # @param member [Vellum::AudioInput] 
    # @return [Vellum::WorkflowInput]
    def self.audio(member:)
      new(member: member, discriminant: "AUDIO")
    end
    # @param member [Vellum::VideoInput] 
    # @return [Vellum::WorkflowInput]
    def self.video(member:)
      new(member: member, discriminant: "VIDEO")
    end
    # @param member [Vellum::ImageInput] 
    # @return [Vellum::WorkflowInput]
    def self.image(member:)
      new(member: member, discriminant: "IMAGE")
    end
    # @param member [Vellum::DocumentInput] 
    # @return [Vellum::WorkflowInput]
    def self.document(member:)
      new(member: member, discriminant: "DOCUMENT")
    end
  end
end