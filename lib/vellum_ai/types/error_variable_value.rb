# frozen_string_literal: true

require_relative "vellum_error"
require "json"

module Vellum
  class ErrorVariableValue
    attr_reader :value, :additional_properties

    # @param value [VellumError]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [ErrorVariableValue]
    def initialize(value: nil, additional_properties: nil)
      # @type [VellumError]
      @value = value
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of ErrorVariableValue
    #
    # @param json_object [JSON]
    # @return [ErrorVariableValue]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["value"].nil?
        value = nil
      else
        value = parsed_json["value"].to_json
        value = VellumError.from_json(json_object: value)
      end
      new(value: value, additional_properties: struct)
    end

    # Serialize an instance of ErrorVariableValue to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "value": @value }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.value.nil? || VellumError.validate_raw(obj: obj.value)
    end
  end
end
