# frozen_string_literal: true

require "json"
require_relative "string_chat_message_content_request"
require_relative "function_call_chat_message_content_request"
require_relative "image_chat_message_content_request"

module Vellum
  class ArrayChatMessageContentItemRequest
    attr_reader :member, :discriminant

    private_class_method :new
    alias kind_of? is_a?
    # @param member [Object]
    # @param discriminant [String]
    # @return [ArrayChatMessageContentItemRequest]
    def initialize(member:, discriminant:)
      # @type [Object]
      @member = member
      # @type [String]
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of ArrayChatMessageContentItemRequest
    #
    # @param json_object [JSON]
    # @return [ArrayChatMessageContentItemRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.type
               when "STRING"
                 StringChatMessageContentRequest.from_json(json_object: json_object)
               when "FUNCTION_CALL"
                 FunctionCallChatMessageContentRequest.from_json(json_object: json_object)
               when "IMAGE"
                 ImageChatMessageContentRequest.from_json(json_object: json_object)
               else
                 StringChatMessageContentRequest.from_json(json_object: json_object)
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
        StringChatMessageContentRequest.validate_raw(obj: obj)
      when "FUNCTION_CALL"
        FunctionCallChatMessageContentRequest.validate_raw(obj: obj)
      when "IMAGE"
        ImageChatMessageContentRequest.validate_raw(obj: obj)
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

    # @param member [StringChatMessageContentRequest]
    # @return [ArrayChatMessageContentItemRequest]
    def self.string(member:)
      new(member: member, discriminant: "STRING")
    end

    # @param member [FunctionCallChatMessageContentRequest]
    # @return [ArrayChatMessageContentItemRequest]
    def self.function_call(member:)
      new(member: member, discriminant: "FUNCTION_CALL")
    end

    # @param member [ImageChatMessageContentRequest]
    # @return [ArrayChatMessageContentItemRequest]
    def self.image(member:)
      new(member: member, discriminant: "IMAGE")
    end
  end
end
