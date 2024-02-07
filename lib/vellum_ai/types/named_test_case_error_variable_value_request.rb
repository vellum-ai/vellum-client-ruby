# frozen_string_literal: true

require_relative "vellum_error_request"
require "json"

module Vellum
  class NamedTestCaseErrorVariableValueRequest
    attr_reader :name, :value, :additional_properties

    # @param name [String]
    # @param value [VellumErrorRequest]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [NamedTestCaseErrorVariableValueRequest]
    def initialize(name:, value: nil, additional_properties: nil)
      # @type [String]
      @name = name
      # @type [VellumErrorRequest]
      @value = value
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of NamedTestCaseErrorVariableValueRequest
    #
    # @param json_object [JSON]
    # @return [NamedTestCaseErrorVariableValueRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = struct.name
      if parsed_json["value"].nil?
        value = nil
      else
        value = parsed_json["value"].to_json
        value = VellumErrorRequest.from_json(json_object: value)
      end
      new(name: name, value: value, additional_properties: struct)
    end

    # Serialize an instance of NamedTestCaseErrorVariableValueRequest to a JSON object
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
      obj.value.nil? || VellumErrorRequest.validate_raw(obj: obj.value)
    end
  end
end
