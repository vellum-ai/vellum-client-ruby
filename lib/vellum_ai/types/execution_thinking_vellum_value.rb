# frozen_string_literal: true
require_relative "string_vellum_value"
require "ostruct"
require "json"

module Vellum
# A value representing Thinking mode output.
  class ExecutionThinkingVellumValue
  # @return [String] The variable's uniquely identifying internal id.
    attr_reader :id
  # @return [String] 
    attr_reader :name
  # @return [String] 
    attr_reader :type
  # @return [Vellum::StringVellumValue] 
    attr_reader :value
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The variable's uniquely identifying internal id.
    # @param name [String] 
    # @param type [String] 
    # @param value [Vellum::StringVellumValue] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::ExecutionThinkingVellumValue]
    def initialize(id:, name:, type:, value: OMIT, additional_properties: nil)
      @id = id
      @name = name
      @type = type
      @value = value if value != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "name": name, "type": type, "value": value }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ExecutionThinkingVellumValue
    #
    # @param json_object [String] 
    # @return [Vellum::ExecutionThinkingVellumValue]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      name = parsed_json["name"]
      type = parsed_json["type"]
      unless parsed_json["value"].nil?
        value = parsed_json["value"].to_json
        value = Vellum::StringVellumValue.from_json(json_object: value)
      else
        value = nil
      end
      new(
        id: id,
        name: name,
        type: type,
        value: value,
        additional_properties: struct
      )
    end
# Serialize an instance of ExecutionThinkingVellumValue to a JSON object
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
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.value.nil? || Vellum::StringVellumValue.validate_raw(obj: obj.value)
    end
  end
end