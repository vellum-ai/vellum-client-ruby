# frozen_string_literal: true

require "json"

module Vellum
  class NamedTestCaseNumberVariableValueRequest
    attr_reader :name, :value, :additional_properties

    # @param name [String]
    # @param value [Float]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [NamedTestCaseNumberVariableValueRequest]
    def initialize(name:, value: nil, additional_properties: nil)
      # @type [String]
      @name = name
      # @type [Float]
      @value = value
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of NamedTestCaseNumberVariableValueRequest
    #
    # @param json_object [JSON]
    # @return [NamedTestCaseNumberVariableValueRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      JSON.parse(json_object)
      name = struct.name
      value = struct.value
      new(name: name, value: value, additional_properties: struct)
    end

    # Serialize an instance of NamedTestCaseNumberVariableValueRequest to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "name": @name, "value": @value }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.value&.is_a?(Float) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
    end
  end
end
