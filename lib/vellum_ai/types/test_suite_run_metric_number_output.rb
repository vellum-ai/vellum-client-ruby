# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
# Output for a test suite run metric that is of type NUMBER
  class TestSuiteRunMetricNumberOutput
  # @return [Float] 
    attr_reader :value
  # @return [String] 
    attr_reader :name
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param value [Float] 
    # @param name [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::TestSuiteRunMetricNumberOutput]
    def initialize(value: OMIT, name:, additional_properties: nil)
      @value = value if value != OMIT
      @name = name
      @additional_properties = additional_properties
      @_field_set = { "value": value, "name": name }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TestSuiteRunMetricNumberOutput
    #
    # @param json_object [String] 
    # @return [Vellum::TestSuiteRunMetricNumberOutput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      value = parsed_json["value"]
      name = parsed_json["name"]
      new(
        value: value,
        name: name,
        additional_properties: struct
      )
    end
# Serialize an instance of TestSuiteRunMetricNumberOutput to a JSON object
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
      obj.value&.is_a?(Float) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end