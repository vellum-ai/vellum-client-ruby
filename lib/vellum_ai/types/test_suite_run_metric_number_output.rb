# frozen_string_literal: true

require "json"

module Vellum
  # Output for a test suite run metric that is of type NUMBER
  class TestSuiteRunMetricNumberOutput
    attr_reader :value, :name, :additional_properties

    # @param value [Float]
    # @param name [String]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TestSuiteRunMetricNumberOutput]
    def initialize(value:, name:, additional_properties: nil)
      # @type [Float]
      @value = value
      # @type [String]
      @name = name
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of TestSuiteRunMetricNumberOutput
    #
    # @param json_object [JSON]
    # @return [TestSuiteRunMetricNumberOutput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      JSON.parse(json_object)
      value = struct.value
      name = struct.name
      new(value: value, name: name, additional_properties: struct)
    end

    # Serialize an instance of TestSuiteRunMetricNumberOutput to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "value": @value, "name": @name }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.value.is_a?(Float) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end
