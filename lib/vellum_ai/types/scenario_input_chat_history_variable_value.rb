# frozen_string_literal: true
require_relative "chat_message"
require "ostruct"
require "json"

module Vellum
# Prompt Sandbox Scenario input value that is of type CHAT_HISTORY
  class ScenarioInputChatHistoryVariableValue
  # @return [String] 
    attr_reader :type
  # @return [Array<Vellum::ChatMessage>] 
    attr_reader :value
  # @return [String] 
    attr_reader :input_variable_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String] 
    # @param value [Array<Vellum::ChatMessage>] 
    # @param input_variable_id [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::ScenarioInputChatHistoryVariableValue]
    def initialize(type:, value: OMIT, input_variable_id:, additional_properties: nil)
      @type = type
      @value = value if value != OMIT
      @input_variable_id = input_variable_id
      @additional_properties = additional_properties
      @_field_set = { "type": type, "value": value, "input_variable_id": input_variable_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  ScenarioInputChatHistoryVariableValue
    #
    # @param json_object [String] 
    # @return [Vellum::ScenarioInputChatHistoryVariableValue]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      value = parsed_json["value"]&.map do | item |
  item = item.to_json
  Vellum::ChatMessage.from_json(json_object: item)
end
      input_variable_id = parsed_json["input_variable_id"]
      new(
        type: type,
        value: value,
        input_variable_id: input_variable_id,
        additional_properties: struct
      )
    end
# Serialize an instance of ScenarioInputChatHistoryVariableValue to a JSON object
    #
    # @return [String]
    def to_json
      @_field_set&.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.value&.is_a?(Array) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
      obj.input_variable_id.is_a?(String) != false || raise("Passed value for field obj.input_variable_id is not the expected type, validation failed.")
    end
  end
end