# frozen_string_literal: true
require "json"
require_relative "prompt_request_string_input"
require_relative "prompt_request_json_input"
require_relative "prompt_request_chat_history_input"
require_relative "prompt_request_audio_input"
require_relative "prompt_request_video_input"
require_relative "prompt_request_image_input"
require_relative "prompt_request_document_input"

module Vellum
  class PromptRequestInput
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vellum::PromptRequestInput]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of PromptRequestInput
    #
    # @param json_object [String] 
    # @return [Vellum::PromptRequestInput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.type
      when "STRING"
        member = Vellum::PromptRequestStringInput.from_json(json_object: json_object)
      when "JSON"
        member = Vellum::PromptRequestJSONInput.from_json(json_object: json_object)
      when "CHAT_HISTORY"
        member = Vellum::PromptRequestChatHistoryInput.from_json(json_object: json_object)
      when "AUDIO"
        member = Vellum::PromptRequestAudioInput.from_json(json_object: json_object)
      when "VIDEO"
        member = Vellum::PromptRequestVideoInput.from_json(json_object: json_object)
      when "IMAGE"
        member = Vellum::PromptRequestImageInput.from_json(json_object: json_object)
      when "DOCUMENT"
        member = Vellum::PromptRequestDocumentInput.from_json(json_object: json_object)
      else
        member = Vellum::PromptRequestStringInput.from_json(json_object: json_object)
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
        Vellum::PromptRequestStringInput.validate_raw(obj: obj)
      when "JSON"
        Vellum::PromptRequestJSONInput.validate_raw(obj: obj)
      when "CHAT_HISTORY"
        Vellum::PromptRequestChatHistoryInput.validate_raw(obj: obj)
      when "AUDIO"
        Vellum::PromptRequestAudioInput.validate_raw(obj: obj)
      when "VIDEO"
        Vellum::PromptRequestVideoInput.validate_raw(obj: obj)
      when "IMAGE"
        Vellum::PromptRequestImageInput.validate_raw(obj: obj)
      when "DOCUMENT"
        Vellum::PromptRequestDocumentInput.validate_raw(obj: obj)
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
    # @param member [Vellum::PromptRequestStringInput] 
    # @return [Vellum::PromptRequestInput]
    def self.string(member:)
      new(member: member, discriminant: "STRING")
    end
    # @param member [Vellum::PromptRequestJSONInput] 
    # @return [Vellum::PromptRequestInput]
    def self.json(member:)
      new(member: member, discriminant: "JSON")
    end
    # @param member [Vellum::PromptRequestChatHistoryInput] 
    # @return [Vellum::PromptRequestInput]
    def self.chat_history(member:)
      new(member: member, discriminant: "CHAT_HISTORY")
    end
    # @param member [Vellum::PromptRequestAudioInput] 
    # @return [Vellum::PromptRequestInput]
    def self.audio(member:)
      new(member: member, discriminant: "AUDIO")
    end
    # @param member [Vellum::PromptRequestVideoInput] 
    # @return [Vellum::PromptRequestInput]
    def self.video(member:)
      new(member: member, discriminant: "VIDEO")
    end
    # @param member [Vellum::PromptRequestImageInput] 
    # @return [Vellum::PromptRequestInput]
    def self.image(member:)
      new(member: member, discriminant: "IMAGE")
    end
    # @param member [Vellum::PromptRequestDocumentInput] 
    # @return [Vellum::PromptRequestInput]
    def self.document(member:)
      new(member: member, discriminant: "DOCUMENT")
    end
  end
end