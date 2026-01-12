# frozen_string_literal: true
require_relative "vellum_document_request"
require "ostruct"
require "json"

module Vellum
# A user input representing a Vellum Document value
  class DocumentInputRequest
  # @return [String] The variable's name
    attr_reader :name
  # @return [Vellum::VellumDocumentRequest] 
    attr_reader :value
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] The variable's name
    # @param value [Vellum::VellumDocumentRequest] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::DocumentInputRequest]
    def initialize(name:, value:, additional_properties: nil)
      @name = name
      @value = value
      @additional_properties = additional_properties
      @_field_set = { "name": name, "value": value }
    end
# Deserialize a JSON object to an instance of DocumentInputRequest
    #
    # @param json_object [String] 
    # @return [Vellum::DocumentInputRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      unless parsed_json["value"].nil?
        value = parsed_json["value"].to_json
        value = Vellum::VellumDocumentRequest.from_json(json_object: value)
      else
        value = nil
      end
      new(
        name: name,
        value: value,
        additional_properties: struct
      )
    end
# Serialize an instance of DocumentInputRequest to a JSON object
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
      Vellum::VellumDocumentRequest.validate_raw(obj: obj.value)
    end
  end
end