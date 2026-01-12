# frozen_string_literal: true
require "json"
require_relative "string_chat_message_content_request"
require_relative "function_call_chat_message_content_request"
require_relative "array_chat_message_content_request"
require_relative "audio_chat_message_content_request"
require_relative "video_chat_message_content_request"
require_relative "image_chat_message_content_request"
require_relative "document_chat_message_content_request"

module Vellum
  class ChatMessageContentRequest
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vellum::ChatMessageContentRequest]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of ChatMessageContentRequest
    #
    # @param json_object [String] 
    # @return [Vellum::ChatMessageContentRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.type
      when "STRING"
        member = Vellum::StringChatMessageContentRequest.from_json(json_object: json_object)
      when "FUNCTION_CALL"
        member = Vellum::FunctionCallChatMessageContentRequest.from_json(json_object: json_object)
      when "ARRAY"
        member = Vellum::ArrayChatMessageContentRequest.from_json(json_object: json_object)
      when "AUDIO"
        member = Vellum::AudioChatMessageContentRequest.from_json(json_object: json_object)
      when "VIDEO"
        member = Vellum::VideoChatMessageContentRequest.from_json(json_object: json_object)
      when "IMAGE"
        member = Vellum::ImageChatMessageContentRequest.from_json(json_object: json_object)
      when "DOCUMENT"
        member = Vellum::DocumentChatMessageContentRequest.from_json(json_object: json_object)
      else
        member = Vellum::StringChatMessageContentRequest.from_json(json_object: json_object)
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
      when "FUNCTION_CALL"
        { **@member.to_json, type: @discriminant }.to_json
      when "ARRAY"
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
        Vellum::StringChatMessageContentRequest.validate_raw(obj: obj)
      when "FUNCTION_CALL"
        Vellum::FunctionCallChatMessageContentRequest.validate_raw(obj: obj)
      when "ARRAY"
        Vellum::ArrayChatMessageContentRequest.validate_raw(obj: obj)
      when "AUDIO"
        Vellum::AudioChatMessageContentRequest.validate_raw(obj: obj)
      when "VIDEO"
        Vellum::VideoChatMessageContentRequest.validate_raw(obj: obj)
      when "IMAGE"
        Vellum::ImageChatMessageContentRequest.validate_raw(obj: obj)
      when "DOCUMENT"
        Vellum::DocumentChatMessageContentRequest.validate_raw(obj: obj)
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
    # @param member [Vellum::StringChatMessageContentRequest] 
    # @return [Vellum::ChatMessageContentRequest]
    def self.string(member:)
      new(member: member, discriminant: "STRING")
    end
    # @param member [Vellum::FunctionCallChatMessageContentRequest] 
    # @return [Vellum::ChatMessageContentRequest]
    def self.function_call(member:)
      new(member: member, discriminant: "FUNCTION_CALL")
    end
    # @param member [Vellum::ArrayChatMessageContentRequest] 
    # @return [Vellum::ChatMessageContentRequest]
    def self.array(member:)
      new(member: member, discriminant: "ARRAY")
    end
    # @param member [Vellum::AudioChatMessageContentRequest] 
    # @return [Vellum::ChatMessageContentRequest]
    def self.audio(member:)
      new(member: member, discriminant: "AUDIO")
    end
    # @param member [Vellum::VideoChatMessageContentRequest] 
    # @return [Vellum::ChatMessageContentRequest]
    def self.video(member:)
      new(member: member, discriminant: "VIDEO")
    end
    # @param member [Vellum::ImageChatMessageContentRequest] 
    # @return [Vellum::ChatMessageContentRequest]
    def self.image(member:)
      new(member: member, discriminant: "IMAGE")
    end
    # @param member [Vellum::DocumentChatMessageContentRequest] 
    # @return [Vellum::ChatMessageContentRequest]
    def self.document(member:)
      new(member: member, discriminant: "DOCUMENT")
    end
  end
end