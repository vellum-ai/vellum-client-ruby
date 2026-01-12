# frozen_string_literal: true
require_relative "vellum_value"
require "ostruct"
require "json"

module Vellum
  class CodeExecutionNodeArrayResult
  # @return [String] 
    attr_reader :id
  # @return [Array<Vellum::VellumValue>] 
    attr_reader :value
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param value [Array<Vellum::VellumValue>] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::CodeExecutionNodeArrayResult]
    def initialize(id:, value: OMIT, additional_properties: nil)
      @id = id
      @value = value if value != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "value": value }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CodeExecutionNodeArrayResult
    #
    # @param json_object [String] 
    # @return [Vellum::CodeExecutionNodeArrayResult]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      value = parsed_json["value"]&.map do | item |
  item = item.to_json
  Vellum::VellumValue.from_json(json_object: item)
end
      new(
        id: id,
        value: value,
        additional_properties: struct
      )
    end
# Serialize an instance of CodeExecutionNodeArrayResult to a JSON object
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
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.value&.is_a?(Array) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
    end
  end
end