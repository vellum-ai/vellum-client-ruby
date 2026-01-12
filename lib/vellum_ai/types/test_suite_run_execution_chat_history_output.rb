# frozen_string_literal: true
require_relative "chat_message"
require "ostruct"
require "json"

module Vellum
# Execution output of an entity evaluated during a Test Suite Run that is of type
#  CHAT_HISTORY
  class TestSuiteRunExecutionChatHistoryOutput
  # @return [String] 
    attr_reader :name
  # @return [Array<Vellum::ChatMessage>] 
    attr_reader :value
  # @return [String] 
    attr_reader :output_variable_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] 
    # @param value [Array<Vellum::ChatMessage>] 
    # @param output_variable_id [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::TestSuiteRunExecutionChatHistoryOutput]
    def initialize(name:, value: OMIT, output_variable_id:, additional_properties: nil)
      @name = name
      @value = value if value != OMIT
      @output_variable_id = output_variable_id
      @additional_properties = additional_properties
      @_field_set = { "name": name, "value": value, "output_variable_id": output_variable_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  TestSuiteRunExecutionChatHistoryOutput
    #
    # @param json_object [String] 
    # @return [Vellum::TestSuiteRunExecutionChatHistoryOutput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      value = parsed_json["value"]&.map do | item |
  item = item.to_json
  Vellum::ChatMessage.from_json(json_object: item)
end
      output_variable_id = parsed_json["output_variable_id"]
      new(
        name: name,
        value: value,
        output_variable_id: output_variable_id,
        additional_properties: struct
      )
    end
# Serialize an instance of TestSuiteRunExecutionChatHistoryOutput to a JSON object
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
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.value&.is_a?(Array) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
      obj.output_variable_id.is_a?(String) != false || raise("Passed value for field obj.output_variable_id is not the expected type, validation failed.")
    end
  end
end