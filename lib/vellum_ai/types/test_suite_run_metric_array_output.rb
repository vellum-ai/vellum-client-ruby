# frozen_string_literal: true
require_relative "vellum_value"
require "ostruct"
require "json"

module Vellum
# Output for a test suite run metric that is of type ARRAY
  class TestSuiteRunMetricArrayOutput
  # @return [Array<Vellum::VellumValue>] 
    attr_reader :value
  # @return [String] 
    attr_reader :type
  # @return [String] 
    attr_reader :name
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param value [Array<Vellum::VellumValue>] 
    # @param type [String] 
    # @param name [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::TestSuiteRunMetricArrayOutput]
    def initialize(value: OMIT, type:, name:, additional_properties: nil)
      @value = value if value != OMIT
      @type = type
      @name = name
      @additional_properties = additional_properties
      @_field_set = { "value": value, "type": type, "name": name }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TestSuiteRunMetricArrayOutput
    #
    # @param json_object [String] 
    # @return [Vellum::TestSuiteRunMetricArrayOutput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      value = parsed_json["value"]&.map do | item |
  item = item.to_json
  Vellum::VellumValue.from_json(json_object: item)
end
      type = parsed_json["type"]
      name = parsed_json["name"]
      new(
        value: value,
        type: type,
        name: name,
        additional_properties: struct
      )
    end
# Serialize an instance of TestSuiteRunMetricArrayOutput to a JSON object
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
      obj.value&.is_a?(Array) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end