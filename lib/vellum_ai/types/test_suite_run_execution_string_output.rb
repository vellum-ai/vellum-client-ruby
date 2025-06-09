# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
# Execution output of an entity evaluated during a Test Suite Run that is of type
#  STRING
  class TestSuiteRunExecutionStringOutput
  # @return [String] 
    attr_reader :name
  # @return [String] 
    attr_reader :type
  # @return [String] 
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
    # @param type [String] 
    # @param value [String] 
    # @param output_variable_id [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::TestSuiteRunExecutionStringOutput]
    def initialize(name:, type:, value: OMIT, output_variable_id:, additional_properties: nil)
      @name = name
      @type = type
      @value = value if value != OMIT
      @output_variable_id = output_variable_id
      @additional_properties = additional_properties
      @_field_set = { "name": name, "type": type, "value": value, "output_variable_id": output_variable_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TestSuiteRunExecutionStringOutput
    #
    # @param json_object [String] 
    # @return [Vellum::TestSuiteRunExecutionStringOutput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      type = parsed_json["type"]
      value = parsed_json["value"]
      output_variable_id = parsed_json["output_variable_id"]
      new(
        name: name,
        type: type,
        value: value,
        output_variable_id: output_variable_id,
        additional_properties: struct
      )
    end
# Serialize an instance of TestSuiteRunExecutionStringOutput to a JSON object
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
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.value&.is_a?(String) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
      obj.output_variable_id.is_a?(String) != false || raise("Passed value for field obj.output_variable_id is not the expected type, validation failed.")
    end
  end
end