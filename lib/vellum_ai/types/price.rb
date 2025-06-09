# frozen_string_literal: true
require_relative "unit_enum"
require "ostruct"
require "json"

module Vellum
  class Price
  # @return [Float] 
    attr_reader :value
  # @return [Vellum::UNIT_ENUM] 
    attr_reader :unit
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param value [Float] 
    # @param unit [Vellum::UNIT_ENUM] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::Price]
    def initialize(value:, unit:, additional_properties: nil)
      @value = value
      @unit = unit
      @additional_properties = additional_properties
      @_field_set = { "value": value, "unit": unit }
    end
# Deserialize a JSON object to an instance of Price
    #
    # @param json_object [String] 
    # @return [Vellum::Price]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      value = parsed_json["value"]
      unit = parsed_json["unit"]
      new(
        value: value,
        unit: unit,
        additional_properties: struct
      )
    end
# Serialize an instance of Price to a JSON object
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
      obj.value.is_a?(Float) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
      obj.unit.is_a?(String) != false || raise("Passed value for field obj.unit is not the expected type, validation failed.")
    end
  end
end