# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
  class Quota
  # @return [String] 
    attr_reader :name
  # @return [Integer] 
    attr_reader :value
  # @return [Integer] 
    attr_reader :period_seconds
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] 
    # @param value [Integer] 
    # @param period_seconds [Integer] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::Quota]
    def initialize(name:, value: OMIT, period_seconds: OMIT, additional_properties: nil)
      @name = name
      @value = value if value != OMIT
      @period_seconds = period_seconds if period_seconds != OMIT
      @additional_properties = additional_properties
      @_field_set = { "name": name, "value": value, "period_seconds": period_seconds }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of Quota
    #
    # @param json_object [String] 
    # @return [Vellum::Quota]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      value = parsed_json["value"]
      period_seconds = parsed_json["period_seconds"]
      new(
        name: name,
        value: value,
        period_seconds: period_seconds,
        additional_properties: struct
      )
    end
# Serialize an instance of Quota to a JSON object
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
      obj.value&.is_a?(Integer) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
      obj.period_seconds&.is_a?(Integer) != false || raise("Passed value for field obj.period_seconds is not the expected type, validation failed.")
    end
  end
end