# frozen_string_literal: true
require_relative "vellum_document_request"
require "ostruct"
require "json"

module Vellum
  class NamedTestCaseDocumentVariableValueRequest
  # @return [String] 
    attr_reader :type
  # @return [Vellum::VellumDocumentRequest] 
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
    # @param value [Vellum::VellumDocumentRequest] 
    # @param name [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::NamedTestCaseDocumentVariableValueRequest]
    def initialize(type:, value: OMIT, name:, additional_properties: nil)
      @type = type
      @value = value if value != OMIT
      @name = name
      @additional_properties = additional_properties
      @_field_set = { "type": type, "value": value, "name": name }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  NamedTestCaseDocumentVariableValueRequest
    #
    # @param json_object [String] 
    # @return [Vellum::NamedTestCaseDocumentVariableValueRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      unless parsed_json["value"].nil?
        value = parsed_json["value"].to_json
        value = Vellum::VellumDocumentRequest.from_json(json_object: value)
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
# Serialize an instance of NamedTestCaseDocumentVariableValueRequest to a JSON
#  object
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
      obj.value.nil? || Vellum::VellumDocumentRequest.validate_raw(obj: obj.value)
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end