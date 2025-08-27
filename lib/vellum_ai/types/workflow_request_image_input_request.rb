# frozen_string_literal: true
require_relative "vellum_image_request"
require "ostruct"
require "json"

module Vellum
# The input for an image variable in a Workflow.
  class WorkflowRequestImageInputRequest
  # @return [String] The variable's name, as defined in the Workflow.
    attr_reader :name
  # @return [String] 
    attr_reader :type
  # @return [Vellum::VellumImageRequest] 
    attr_reader :value
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] The variable's name, as defined in the Workflow.
    # @param type [String] 
    # @param value [Vellum::VellumImageRequest] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::WorkflowRequestImageInputRequest]
    def initialize(name:, type:, value:, additional_properties: nil)
      @name = name
      @type = type
      @value = value
      @additional_properties = additional_properties
      @_field_set = { "name": name, "type": type, "value": value }
    end
# Deserialize a JSON object to an instance of WorkflowRequestImageInputRequest
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowRequestImageInputRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      type = parsed_json["type"]
      unless parsed_json["value"].nil?
        value = parsed_json["value"].to_json
        value = Vellum::VellumImageRequest.from_json(json_object: value)
      else
        value = nil
      end
      new(
        name: name,
        type: type,
        value: value,
        additional_properties: struct
      )
    end
# Serialize an instance of WorkflowRequestImageInputRequest to a JSON object
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
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      Vellum::VellumImageRequest.validate_raw(obj: obj.value)
    end
  end
end