# frozen_string_literal: true
require "json"
require_relative "workflow_request_string_input_request"
require_relative "workflow_request_json_input_request"
require_relative "workflow_request_chat_history_input_request"
require_relative "workflow_request_number_input_request"
require_relative "workflow_request_audio_input_request"
require_relative "workflow_request_video_input_request"
require_relative "workflow_request_image_input_request"
require_relative "workflow_request_document_input_request"

module Vellum
  class WorkflowRequestInputRequest
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vellum::WorkflowRequestInputRequest]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of WorkflowRequestInputRequest
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowRequestInputRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.type
      when "STRING"
        member = Vellum::WorkflowRequestStringInputRequest.from_json(json_object: json_object)
      when "JSON"
        member = Vellum::WorkflowRequestJSONInputRequest.from_json(json_object: json_object)
      when "CHAT_HISTORY"
        member = Vellum::WorkflowRequestChatHistoryInputRequest.from_json(json_object: json_object)
      when "NUMBER"
        member = Vellum::WorkflowRequestNumberInputRequest.from_json(json_object: json_object)
      when "AUDIO"
        member = Vellum::WorkflowRequestAudioInputRequest.from_json(json_object: json_object)
      when "VIDEO"
        member = Vellum::WorkflowRequestVideoInputRequest.from_json(json_object: json_object)
      when "IMAGE"
        member = Vellum::WorkflowRequestImageInputRequest.from_json(json_object: json_object)
      when "DOCUMENT"
        member = Vellum::WorkflowRequestDocumentInputRequest.from_json(json_object: json_object)
      else
        member = Vellum::WorkflowRequestStringInputRequest.from_json(json_object: json_object)
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
        Vellum::WorkflowRequestStringInputRequest.validate_raw(obj: obj)
      when "JSON"
        Vellum::WorkflowRequestJSONInputRequest.validate_raw(obj: obj)
      when "CHAT_HISTORY"
        Vellum::WorkflowRequestChatHistoryInputRequest.validate_raw(obj: obj)
      when "NUMBER"
        Vellum::WorkflowRequestNumberInputRequest.validate_raw(obj: obj)
      when "AUDIO"
        Vellum::WorkflowRequestAudioInputRequest.validate_raw(obj: obj)
      when "VIDEO"
        Vellum::WorkflowRequestVideoInputRequest.validate_raw(obj: obj)
      when "IMAGE"
        Vellum::WorkflowRequestImageInputRequest.validate_raw(obj: obj)
      when "DOCUMENT"
        Vellum::WorkflowRequestDocumentInputRequest.validate_raw(obj: obj)
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
    # @param member [Vellum::WorkflowRequestStringInputRequest] 
    # @return [Vellum::WorkflowRequestInputRequest]
    def self.string(member:)
      new(member: member, discriminant: "STRING")
    end
    # @param member [Vellum::WorkflowRequestJSONInputRequest] 
    # @return [Vellum::WorkflowRequestInputRequest]
    def self.json(member:)
      new(member: member, discriminant: "JSON")
    end
    # @param member [Vellum::WorkflowRequestChatHistoryInputRequest] 
    # @return [Vellum::WorkflowRequestInputRequest]
    def self.chat_history(member:)
      new(member: member, discriminant: "CHAT_HISTORY")
    end
    # @param member [Vellum::WorkflowRequestNumberInputRequest] 
    # @return [Vellum::WorkflowRequestInputRequest]
    def self.number(member:)
      new(member: member, discriminant: "NUMBER")
    end
    # @param member [Vellum::WorkflowRequestAudioInputRequest] 
    # @return [Vellum::WorkflowRequestInputRequest]
    def self.audio(member:)
      new(member: member, discriminant: "AUDIO")
    end
    # @param member [Vellum::WorkflowRequestVideoInputRequest] 
    # @return [Vellum::WorkflowRequestInputRequest]
    def self.video(member:)
      new(member: member, discriminant: "VIDEO")
    end
    # @param member [Vellum::WorkflowRequestImageInputRequest] 
    # @return [Vellum::WorkflowRequestInputRequest]
    def self.image(member:)
      new(member: member, discriminant: "IMAGE")
    end
    # @param member [Vellum::WorkflowRequestDocumentInputRequest] 
    # @return [Vellum::WorkflowRequestInputRequest]
    def self.document(member:)
      new(member: member, discriminant: "DOCUMENT")
    end
  end
end