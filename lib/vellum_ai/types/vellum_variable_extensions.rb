# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
# A set of fields with additional properties for use in Vellum Variables.
  class VellumVariableExtensions
  # @return [String] 
    attr_reader :color
  # @return [String] 
    attr_reader :description
  # @return [String] 
    attr_reader :title
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param color [String] 
    # @param description [String] 
    # @param title [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::VellumVariableExtensions]
    def initialize(color: OMIT, description: OMIT, title: OMIT, additional_properties: nil)
      @color = color if color != OMIT
      @description = description if description != OMIT
      @title = title if title != OMIT
      @additional_properties = additional_properties
      @_field_set = { "color": color, "description": description, "title": title }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of VellumVariableExtensions
    #
    # @param json_object [String] 
    # @return [Vellum::VellumVariableExtensions]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      color = parsed_json["color"]
      description = parsed_json["description"]
      title = parsed_json["title"]
      new(
        color: color,
        description: description,
        title: title,
        additional_properties: struct
      )
    end
# Serialize an instance of VellumVariableExtensions to a JSON object
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
      obj.color&.is_a?(String) != false || raise("Passed value for field obj.color is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.title&.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
    end
  end
end