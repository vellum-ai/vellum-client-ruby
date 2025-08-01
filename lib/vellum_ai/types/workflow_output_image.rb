# frozen_string_literal: true
require_relative "vellum_image"
require "ostruct"
require "json"

module Vellum
# An image output from a Workflow execution.
  class WorkflowOutputImage
  # @return [String] 
    attr_reader :id
  # @return [String] The output's name, as defined in the workflow
    attr_reader :name
  # @return [String] 
    attr_reader :type
  # @return [Vellum::VellumImage] 
    attr_reader :value
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param name [String] The output's name, as defined in the workflow
    # @param type [String] 
    # @param value [Vellum::VellumImage] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::WorkflowOutputImage]
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
# Deserialize a JSON object to an instance of WorkflowOutputImage
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowOutputImage]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      name = parsed_json["name"]
      type = parsed_json["type"]
      unless parsed_json["value"].nil?
        value = parsed_json["value"].to_json
        value = Vellum::VellumImage.from_json(json_object: value)
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
# Serialize an instance of WorkflowOutputImage to a JSON object
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
      obj.value.nil? || Vellum::VellumImage.validate_raw(obj: obj.value)
    end
  end
end