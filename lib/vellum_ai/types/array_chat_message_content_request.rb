# frozen_string_literal: true

require_relative "array_chat_message_content_item_request"
require "json"

module Vellum
  # A list of chat message content items.
  class ArrayChatMessageContentRequest
    attr_reader :value, :additional_properties

    # @param value [Array<ArrayChatMessageContentItemRequest>]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [ArrayChatMessageContentRequest]
    def initialize(value:, additional_properties: nil)
      # @type [Array<ArrayChatMessageContentItemRequest>]
      @value = value
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of ArrayChatMessageContentRequest
    #
    # @param json_object [JSON]
    # @return [ArrayChatMessageContentRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      value = parsed_json["value"].map do |v|
        v = v.to_json
        ArrayChatMessageContentItemRequest.from_json(json_object: v)
      end
      new(value: value, additional_properties: struct)
    end

    # Serialize an instance of ArrayChatMessageContentRequest to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "value": @value }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.value.is_a?(Array) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
    end
  end
end
