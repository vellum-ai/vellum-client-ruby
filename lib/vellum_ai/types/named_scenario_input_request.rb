# frozen_string_literal: true
require "json"
require_relative "named_scenario_input_string_variable_value_request"
require_relative "named_scenario_input_json_variable_value_request"
require_relative "named_scenario_input_chat_history_variable_value_request"
require_relative "named_scenario_input_audio_variable_value_request"
require_relative "named_scenario_input_video_variable_value_request"
require_relative "named_scenario_input_image_variable_value_request"
require_relative "named_scenario_input_document_variable_value_request"

module Vellum
  class NamedScenarioInputRequest
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vellum::NamedScenarioInputRequest]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of NamedScenarioInputRequest
    #
    # @param json_object [String] 
    # @return [Vellum::NamedScenarioInputRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.type
      when "STRING"
        member = Vellum::NamedScenarioInputStringVariableValueRequest.from_json(json_object: json_object)
      when "JSON"
        member = Vellum::NamedScenarioInputJSONVariableValueRequest.from_json(json_object: json_object)
      when "CHAT_HISTORY"
        member = Vellum::NamedScenarioInputChatHistoryVariableValueRequest.from_json(json_object: json_object)
      when "AUDIO"
        member = Vellum::NamedScenarioInputAudioVariableValueRequest.from_json(json_object: json_object)
      when "VIDEO"
        member = Vellum::NamedScenarioInputVideoVariableValueRequest.from_json(json_object: json_object)
      when "IMAGE"
        member = Vellum::NamedScenarioInputImageVariableValueRequest.from_json(json_object: json_object)
      when "DOCUMENT"
        member = Vellum::NamedScenarioInputDocumentVariableValueRequest.from_json(json_object: json_object)
      else
        member = Vellum::NamedScenarioInputStringVariableValueRequest.from_json(json_object: json_object)
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
        Vellum::NamedScenarioInputStringVariableValueRequest.validate_raw(obj: obj)
      when "JSON"
        Vellum::NamedScenarioInputJSONVariableValueRequest.validate_raw(obj: obj)
      when "CHAT_HISTORY"
        Vellum::NamedScenarioInputChatHistoryVariableValueRequest.validate_raw(obj: obj)
      when "AUDIO"
        Vellum::NamedScenarioInputAudioVariableValueRequest.validate_raw(obj: obj)
      when "VIDEO"
        Vellum::NamedScenarioInputVideoVariableValueRequest.validate_raw(obj: obj)
      when "IMAGE"
        Vellum::NamedScenarioInputImageVariableValueRequest.validate_raw(obj: obj)
      when "DOCUMENT"
        Vellum::NamedScenarioInputDocumentVariableValueRequest.validate_raw(obj: obj)
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
    # @param member [Vellum::NamedScenarioInputStringVariableValueRequest] 
    # @return [Vellum::NamedScenarioInputRequest]
    def self.string(member:)
      new(member: member, discriminant: "STRING")
    end
    # @param member [Vellum::NamedScenarioInputJSONVariableValueRequest] 
    # @return [Vellum::NamedScenarioInputRequest]
    def self.json(member:)
      new(member: member, discriminant: "JSON")
    end
    # @param member [Vellum::NamedScenarioInputChatHistoryVariableValueRequest] 
    # @return [Vellum::NamedScenarioInputRequest]
    def self.chat_history(member:)
      new(member: member, discriminant: "CHAT_HISTORY")
    end
    # @param member [Vellum::NamedScenarioInputAudioVariableValueRequest] 
    # @return [Vellum::NamedScenarioInputRequest]
    def self.audio(member:)
      new(member: member, discriminant: "AUDIO")
    end
    # @param member [Vellum::NamedScenarioInputVideoVariableValueRequest] 
    # @return [Vellum::NamedScenarioInputRequest]
    def self.video(member:)
      new(member: member, discriminant: "VIDEO")
    end
    # @param member [Vellum::NamedScenarioInputImageVariableValueRequest] 
    # @return [Vellum::NamedScenarioInputRequest]
    def self.image(member:)
      new(member: member, discriminant: "IMAGE")
    end
    # @param member [Vellum::NamedScenarioInputDocumentVariableValueRequest] 
    # @return [Vellum::NamedScenarioInputRequest]
    def self.document(member:)
      new(member: member, discriminant: "DOCUMENT")
    end
  end
end