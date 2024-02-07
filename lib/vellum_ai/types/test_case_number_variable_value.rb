# frozen_string_literal: true

require "json"

module Vellum
  class TestCaseNumberVariableValue
    attr_reader :variable_id, :value, :additional_properties

    # @param variable_id [String]
    # @param value [Float]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TestCaseNumberVariableValue]
    def initialize(variable_id:, value: nil, additional_properties: nil)
      # @type [String]
      @variable_id = variable_id
      # @type [Float]
      @value = value
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of TestCaseNumberVariableValue
    #
    # @param json_object [JSON]
    # @return [TestCaseNumberVariableValue]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      JSON.parse(json_object)
      variable_id = struct.variable_id
      value = struct.value
      new(variable_id: variable_id, value: value, additional_properties: struct)
    end

    # Serialize an instance of TestCaseNumberVariableValue to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "variable_id": @variable_id, "value": @value }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.variable_id.is_a?(String) != false || raise("Passed value for field obj.variable_id is not the expected type, validation failed.")
      obj.value&.is_a?(Float) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
    end
  end
end
