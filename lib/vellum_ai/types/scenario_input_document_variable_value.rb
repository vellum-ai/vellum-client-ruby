# frozen_string_literal: true
require_relative "vellum_document"
require "ostruct"
require "json"

module Vellum
  class ScenarioInputDocumentVariableValue
  # @return [String] 
    attr_reader :type
  # @return [Vellum::VellumDocument] 
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
    # @param value [Vellum::VellumDocument] 
    # @param input_variable_id [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::ScenarioInputDocumentVariableValue]
    def initialize(type:, value:, input_variable_id:, additional_properties: nil)
      @type = type
      @value = value
      @input_variable_id = input_variable_id
      @additional_properties = additional_properties
      @_field_set = { "type": type, "value": value, "input_variable_id": input_variable_id }
    end
# Deserialize a JSON object to an instance of ScenarioInputDocumentVariableValue
    #
    # @param json_object [String] 
    # @return [Vellum::ScenarioInputDocumentVariableValue]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      unless parsed_json["value"].nil?
        value = parsed_json["value"].to_json
        value = Vellum::VellumDocument.from_json(json_object: value)
      else
        value = nil
      end
      input_variable_id = parsed_json["input_variable_id"]
      new(
        type: type,
        value: value,
        input_variable_id: input_variable_id,
        additional_properties: struct
      )
    end
# Serialize an instance of ScenarioInputDocumentVariableValue to a JSON object
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
      Vellum::VellumDocument.validate_raw(obj: obj.value)
      obj.input_variable_id.is_a?(String) != false || raise("Passed value for field obj.input_variable_id is not the expected type, validation failed.")
    end
  end
end