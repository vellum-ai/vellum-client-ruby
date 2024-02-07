# frozen_string_literal: true

require_relative "function_call_chat_message_content_value_request"
require "json"

module Vellum
  # A function call value that is used in a chat message.
  class FunctionCallChatMessageContentRequest
    attr_reader :value, :additional_properties

    # @param value [FunctionCallChatMessageContentValueRequest]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [FunctionCallChatMessageContentRequest]
    def initialize(value:, additional_properties: nil)
      # @type [FunctionCallChatMessageContentValueRequest]
      @value = value
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of FunctionCallChatMessageContentRequest
    #
    # @param json_object [JSON]
    # @return [FunctionCallChatMessageContentRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["value"].nil?
        value = nil
      else
        value = parsed_json["value"].to_json
        value = FunctionCallChatMessageContentValueRequest.from_json(json_object: value)
      end
      new(value: value, additional_properties: struct)
    end

    # Serialize an instance of FunctionCallChatMessageContentRequest to a JSON object
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
      FunctionCallChatMessageContentValueRequest.validate_raw(obj: obj.value)
    end
  end
end
