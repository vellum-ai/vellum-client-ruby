# frozen_string_literal: true
require "json"
require_relative "string_input_request"
require_relative "json_input_request"
require_relative "chat_history_input_request"
require_relative "audio_input_request"
require_relative "video_input_request"
require_relative "image_input_request"
require_relative "document_input_request"

module Vellum
  class PromptDeploymentInputRequest
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vellum::PromptDeploymentInputRequest]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of PromptDeploymentInputRequest
    #
    # @param json_object [String] 
    # @return [Vellum::PromptDeploymentInputRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.type
      when "STRING"
        member = Vellum::StringInputRequest.from_json(json_object: json_object)
      when "JSON"
        member = Vellum::JSONInputRequest.from_json(json_object: json_object)
      when "CHAT_HISTORY"
        member = Vellum::ChatHistoryInputRequest.from_json(json_object: json_object)
      when "AUDIO"
        member = Vellum::AudioInputRequest.from_json(json_object: json_object)
      when "VIDEO"
        member = Vellum::VideoInputRequest.from_json(json_object: json_object)
      when "IMAGE"
        member = Vellum::ImageInputRequest.from_json(json_object: json_object)
      when "DOCUMENT"
        member = Vellum::DocumentInputRequest.from_json(json_object: json_object)
      else
        member = Vellum::StringInputRequest.from_json(json_object: json_object)
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
        Vellum::StringInputRequest.validate_raw(obj: obj)
      when "JSON"
        Vellum::JSONInputRequest.validate_raw(obj: obj)
      when "CHAT_HISTORY"
        Vellum::ChatHistoryInputRequest.validate_raw(obj: obj)
      when "AUDIO"
        Vellum::AudioInputRequest.validate_raw(obj: obj)
      when "VIDEO"
        Vellum::VideoInputRequest.validate_raw(obj: obj)
      when "IMAGE"
        Vellum::ImageInputRequest.validate_raw(obj: obj)
      when "DOCUMENT"
        Vellum::DocumentInputRequest.validate_raw(obj: obj)
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
    # @param member [Vellum::StringInputRequest] 
    # @return [Vellum::PromptDeploymentInputRequest]
    def self.string(member:)
      new(member: member, discriminant: "STRING")
    end
    # @param member [Vellum::JSONInputRequest] 
    # @return [Vellum::PromptDeploymentInputRequest]
    def self.json(member:)
      new(member: member, discriminant: "JSON")
    end
    # @param member [Vellum::ChatHistoryInputRequest] 
    # @return [Vellum::PromptDeploymentInputRequest]
    def self.chat_history(member:)
      new(member: member, discriminant: "CHAT_HISTORY")
    end
    # @param member [Vellum::AudioInputRequest] 
    # @return [Vellum::PromptDeploymentInputRequest]
    def self.audio(member:)
      new(member: member, discriminant: "AUDIO")
    end
    # @param member [Vellum::VideoInputRequest] 
    # @return [Vellum::PromptDeploymentInputRequest]
    def self.video(member:)
      new(member: member, discriminant: "VIDEO")
    end
    # @param member [Vellum::ImageInputRequest] 
    # @return [Vellum::PromptDeploymentInputRequest]
    def self.image(member:)
      new(member: member, discriminant: "IMAGE")
    end
    # @param member [Vellum::DocumentInputRequest] 
    # @return [Vellum::PromptDeploymentInputRequest]
    def self.document(member:)
      new(member: member, discriminant: "DOCUMENT")
    end
  end
end