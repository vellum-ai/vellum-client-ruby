# frozen_string_literal: true

require_relative "scenario_input_type_enum"
require_relative "chat_message_request"
require "json"

module Vellum
  class ScenarioInputRequest
    attr_reader :key, :type, :value, :chat_history, :additional_properties

    # @param key [String]
    # @param type [SCENARIO_INPUT_TYPE_ENUM]
    # @param value [String]
    # @param chat_history [Array<ChatMessageRequest>]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [ScenarioInputRequest]
    def initialize(key:, type: nil, value: nil, chat_history: nil, additional_properties: nil)
      # @type [String]
      @key = key
      # @type [SCENARIO_INPUT_TYPE_ENUM]
      @type = type
      # @type [String]
      @value = value
      # @type [Array<ChatMessageRequest>]
      @chat_history = chat_history
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of ScenarioInputRequest
    #
    # @param json_object [JSON]
    # @return [ScenarioInputRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      key = struct.key
      type = SCENARIO_INPUT_TYPE_ENUM.key(parsed_json["type"]) || parsed_json["type"]
      value = struct.value
      chat_history = parsed_json["chat_history"].map do |v|
        v = v.to_json
        ChatMessageRequest.from_json(json_object: v)
      end
      new(key: key, type: type, value: value, chat_history: chat_history, additional_properties: struct)
    end

    # Serialize an instance of ScenarioInputRequest to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      {
        "key": @key,
        "type": SCENARIO_INPUT_TYPE_ENUM[@type] || @type,
        "value": @value,
        "chat_history": @chat_history
      }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.key.is_a?(String) != false || raise("Passed value for field obj.key is not the expected type, validation failed.")
      obj.type&.is_a?(SCENARIO_INPUT_TYPE_ENUM) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.value&.is_a?(String) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
      obj.chat_history&.is_a?(Array) != false || raise("Passed value for field obj.chat_history is not the expected type, validation failed.")
    end
  end
end
