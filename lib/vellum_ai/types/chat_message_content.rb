# frozen_string_literal: true
require "json"
require_relative "string_chat_message_content"
require_relative "function_call_chat_message_content"
require_relative "array_chat_message_content"
require_relative "audio_chat_message_content"
require_relative "video_chat_message_content"
require_relative "image_chat_message_content"
require_relative "document_chat_message_content"

module Vellum
  class ChatMessageContent
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vellum::ChatMessageContent]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of ChatMessageContent
    #
    # @param json_object [String] 
    # @return [Vellum::ChatMessageContent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.type
      when "STRING"
        member = Vellum::StringChatMessageContent.from_json(json_object: json_object)
      when "FUNCTION_CALL"
        member = Vellum::FunctionCallChatMessageContent.from_json(json_object: json_object)
      when "ARRAY"
        member = Vellum::ArrayChatMessageContent.from_json(json_object: json_object)
      when "AUDIO"
        member = Vellum::AudioChatMessageContent.from_json(json_object: json_object)
      when "VIDEO"
        member = Vellum::VideoChatMessageContent.from_json(json_object: json_object)
      when "IMAGE"
        member = Vellum::ImageChatMessageContent.from_json(json_object: json_object)
      when "DOCUMENT"
        member = Vellum::DocumentChatMessageContent.from_json(json_object: json_object)
      else
        member = Vellum::StringChatMessageContent.from_json(json_object: json_object)
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
        Vellum::StringChatMessageContent.validate_raw(obj: obj)
      when "FUNCTION_CALL"
        Vellum::FunctionCallChatMessageContent.validate_raw(obj: obj)
      when "ARRAY"
        Vellum::ArrayChatMessageContent.validate_raw(obj: obj)
      when "AUDIO"
        Vellum::AudioChatMessageContent.validate_raw(obj: obj)
      when "VIDEO"
        Vellum::VideoChatMessageContent.validate_raw(obj: obj)
      when "IMAGE"
        Vellum::ImageChatMessageContent.validate_raw(obj: obj)
      when "DOCUMENT"
        Vellum::DocumentChatMessageContent.validate_raw(obj: obj)
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
    # @param member [Vellum::StringChatMessageContent] 
    # @return [Vellum::ChatMessageContent]
    def self.string(member:)
      new(member: member, discriminant: "STRING")
    end
    # @param member [Vellum::FunctionCallChatMessageContent] 
    # @return [Vellum::ChatMessageContent]
    def self.function_call(member:)
      new(member: member, discriminant: "FUNCTION_CALL")
    end
    # @param member [Vellum::ArrayChatMessageContent] 
    # @return [Vellum::ChatMessageContent]
    def self.array(member:)
      new(member: member, discriminant: "ARRAY")
    end
    # @param member [Vellum::AudioChatMessageContent] 
    # @return [Vellum::ChatMessageContent]
    def self.audio(member:)
      new(member: member, discriminant: "AUDIO")
    end
    # @param member [Vellum::VideoChatMessageContent] 
    # @return [Vellum::ChatMessageContent]
    def self.video(member:)
      new(member: member, discriminant: "VIDEO")
    end
    # @param member [Vellum::ImageChatMessageContent] 
    # @return [Vellum::ChatMessageContent]
    def self.image(member:)
      new(member: member, discriminant: "IMAGE")
    end
    # @param member [Vellum::DocumentChatMessageContent] 
    # @return [Vellum::ChatMessageContent]
    def self.document(member:)
      new(member: member, discriminant: "DOCUMENT")
    end
  end
end