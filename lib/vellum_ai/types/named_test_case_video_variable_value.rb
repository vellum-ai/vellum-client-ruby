# frozen_string_literal: true
require_relative "vellum_video"
require "ostruct"
require "json"

module Vellum
  class NamedTestCaseVideoVariableValue
  # @return [String] 
    attr_reader :type
  # @return [Vellum::VellumVideo] 
    attr_reader :value
  # @return [String] 
    attr_reader :name
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String] 
    # @param value [Vellum::VellumVideo] 
    # @param name [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::NamedTestCaseVideoVariableValue]
    def initialize(type:, value:, name:, additional_properties: nil)
      @type = type
      @value = value
      @name = name
      @additional_properties = additional_properties
      @_field_set = { "type": type, "value": value, "name": name }
    end
# Deserialize a JSON object to an instance of NamedTestCaseVideoVariableValue
    #
    # @param json_object [String] 
    # @return [Vellum::NamedTestCaseVideoVariableValue]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      unless parsed_json["value"].nil?
        value = parsed_json["value"].to_json
        value = Vellum::VellumVideo.from_json(json_object: value)
      else
        value = nil
      end
      name = parsed_json["name"]
      new(
        type: type,
        value: value,
        name: name,
        additional_properties: struct
      )
    end
# Serialize an instance of NamedTestCaseVideoVariableValue to a JSON object
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
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      Vellum::VellumVideo.validate_raw(obj: obj.value)
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end