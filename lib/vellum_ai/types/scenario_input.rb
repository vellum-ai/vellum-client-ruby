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
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vellum::ScenarioInput]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of ScenarioInput
    #
    # @param json_object [String] 
    # @return [Vellum::ScenarioInput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.type
      when "STRING"
        member = Vellum::ScenarioInputStringVariableValue.from_json(json_object: json_object)
      when "JSON"
        member = Vellum::ScenarioInputJSONVariableValue.from_json(json_object: json_object)
      when "CHAT_HISTORY"
        member = Vellum::ScenarioInputChatHistoryVariableValue.from_json(json_object: json_object)
      when "AUDIO"
        member = Vellum::ScenarioInputAudioVariableValue.from_json(json_object: json_object)
      when "VIDEO"
        member = Vellum::ScenarioInputVideoVariableValue.from_json(json_object: json_object)
      when "IMAGE"
        member = Vellum::ScenarioInputImageVariableValue.from_json(json_object: json_object)
      when "DOCUMENT"
        member = Vellum::ScenarioInputDocumentVariableValue.from_json(json_object: json_object)
      else
        member = Vellum::ScenarioInputStringVariableValue.from_json(json_object: json_object)
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
        Vellum::ScenarioInputStringVariableValue.validate_raw(obj: obj)
      when "JSON"
        Vellum::ScenarioInputJSONVariableValue.validate_raw(obj: obj)
      when "CHAT_HISTORY"
        Vellum::ScenarioInputChatHistoryVariableValue.validate_raw(obj: obj)
      when "AUDIO"
        Vellum::ScenarioInputAudioVariableValue.validate_raw(obj: obj)
      when "VIDEO"
        Vellum::ScenarioInputVideoVariableValue.validate_raw(obj: obj)
      when "IMAGE"
        Vellum::ScenarioInputImageVariableValue.validate_raw(obj: obj)
      when "DOCUMENT"
        Vellum::ScenarioInputDocumentVariableValue.validate_raw(obj: obj)
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
    # @param member [Vellum::ScenarioInputStringVariableValue] 
    # @return [Vellum::ScenarioInput]
    def self.string(member:)
      new(member: member, discriminant: "STRING")
    end
    # @param member [Vellum::ScenarioInputJSONVariableValue] 
    # @return [Vellum::ScenarioInput]
    def self.json(member:)
      new(member: member, discriminant: "JSON")
    end
    # @param member [Vellum::ScenarioInputChatHistoryVariableValue] 
    # @return [Vellum::ScenarioInput]
    def self.chat_history(member:)
      new(member: member, discriminant: "CHAT_HISTORY")
    end
    # @param member [Vellum::ScenarioInputAudioVariableValue] 
    # @return [Vellum::ScenarioInput]
    def self.audio(member:)
      new(member: member, discriminant: "AUDIO")
    end
    # @param member [Vellum::ScenarioInputVideoVariableValue] 
    # @return [Vellum::ScenarioInput]
    def self.video(member:)
      new(member: member, discriminant: "VIDEO")
    end
    # @param member [Vellum::ScenarioInputImageVariableValue] 
    # @return [Vellum::ScenarioInput]
    def self.image(member:)
      new(member: member, discriminant: "IMAGE")
    end
    # @param member [Vellum::ScenarioInputDocumentVariableValue] 
    # @return [Vellum::ScenarioInput]
    def self.document(member:)
      new(member: member, discriminant: "DOCUMENT")
    end
  end
end