# frozen_string_literal: true

require_relative "chat_message"
require "json"

module Vellum
  class CodeExecutionNodeChatHistoryResult
    attr_reader :id, :value, :additional_properties

    # @param id [String]
    # @param value [Array<ChatMessage>]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [CodeExecutionNodeChatHistoryResult]
    def initialize(id:, value: nil, additional_properties: nil)
      # @type [String]
      @id = id
      # @type [Array<ChatMessage>]
      @value = value
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of CodeExecutionNodeChatHistoryResult
    #
    # @param json_object [JSON]
    # @return [CodeExecutionNodeChatHistoryResult]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = struct.id
      value = parsed_json["value"].map do |v|
        v = v.to_json
        ChatMessage.from_json(json_object: v)
      end
      new(id: id, value: value, additional_properties: struct)
    end

    # Serialize an instance of CodeExecutionNodeChatHistoryResult to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "id": @id, "value": @value }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.value&.is_a?(Array) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
    end
  end
end
