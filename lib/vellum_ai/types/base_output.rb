# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
  class BaseOutput
  # @return [Hash{String => Object}] 
    attr_reader :value
  # @return [Hash{String => Object}] 
    attr_reader :delta
  # @return [String] 
    attr_reader :name
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param value [Hash{String => Object}] 
    # @param delta [Hash{String => Object}] 
    # @param name [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::BaseOutput]
    def initialize(value: OMIT, delta: OMIT, name:, additional_properties: nil)
      @value = value if value != OMIT
      @delta = delta if delta != OMIT
      @name = name
      @additional_properties = additional_properties
      @_field_set = { "value": value, "delta": delta, "name": name }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of BaseOutput
    #
    # @param json_object [String] 
    # @return [Vellum::BaseOutput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      value = parsed_json["value"]
      delta = parsed_json["delta"]
      name = parsed_json["name"]
      new(
        value: value,
        delta: delta,
        name: name,
        additional_properties: struct
      )
    end
# Serialize an instance of BaseOutput to a JSON object
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
      obj.value&.is_a?(Hash) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
      obj.delta&.is_a?(Hash) != false || raise("Passed value for field obj.delta is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end