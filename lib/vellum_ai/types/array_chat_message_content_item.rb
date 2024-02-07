# frozen_string_literal: true

require "json"
require_relative "string_chat_message_content"
require_relative "function_call_chat_message_content"
require_relative "image_chat_message_content"

module Vellum
  class ArrayChatMessageContentItem
    attr_reader :member, :discriminant

    private_class_method :new
    alias kind_of? is_a?
    # @param member [Object]
    # @param discriminant [String]
    # @return [ArrayChatMessageContentItem]
    def initialize(member:, discriminant:)
      # @type [Object]
      @member = member
      # @type [String]
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of ArrayChatMessageContentItem
    #
    # @param json_object [JSON]
    # @return [ArrayChatMessageContentItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.type
               when "STRING"
                 StringChatMessageContent.from_json(json_object: json_object)
               when "FUNCTION_CALL"
                 FunctionCallChatMessageContent.from_json(json_object: json_object)
               when "IMAGE"
                 ImageChatMessageContent.from_json(json_object: json_object)
               else
                 StringChatMessageContent.from_json(json_object: json_object)
               end
      new(member: member, discriminant: struct.type)
    end

    # For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [JSON]
    def to_json(*_args)
      case @discriminant
      when "STRING"
        { **@member.to_json, type: @discriminant }.to_json
      when "FUNCTION_CALL"
        { **@member.to_json, type: @discriminant }.to_json
      when "IMAGE"
        { **@member.to_json, type: @discriminant }.to_json
      else
        { "type": @discriminant, value: @member }.to_json
      end
      @member.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      case obj.type
      when "STRING"
        StringChatMessageContent.validate_raw(obj: obj)
      when "FUNCTION_CALL"
        FunctionCallChatMessageContent.validate_raw(obj: obj)
      when "IMAGE"
        ImageChatMessageContent.validate_raw(obj: obj)
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

    # @param member [StringChatMessageContent]
    # @return [ArrayChatMessageContentItem]
    def self.string(member:)
      new(member: member, discriminant: "STRING")
    end

    # @param member [FunctionCallChatMessageContent]
    # @return [ArrayChatMessageContentItem]
    def self.function_call(member:)
      new(member: member, discriminant: "FUNCTION_CALL")
    end

    # @param member [ImageChatMessageContent]
    # @return [ArrayChatMessageContentItem]
    def self.image(member:)
      new(member: member, discriminant: "IMAGE")
    end
  end
end
