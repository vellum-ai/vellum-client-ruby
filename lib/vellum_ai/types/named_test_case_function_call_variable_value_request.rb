# frozen_string_literal: true
require_relative "function_call_request"
require "ostruct"
require "json"

module Vellum
# Named Test Case value that is of type FUNCTION_CALL
  class NamedTestCaseFunctionCallVariableValueRequest
  # @return [Vellum::FunctionCallRequest] 
    attr_reader :value
  # @return [String] 
    attr_reader :name
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param value [Vellum::FunctionCallRequest] 
    # @param name [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::NamedTestCaseFunctionCallVariableValueRequest]
    def initialize(value: OMIT, name:, additional_properties: nil)
      @value = value if value != OMIT
      @name = name
      @additional_properties = additional_properties
      @_field_set = { "value": value, "name": name }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  NamedTestCaseFunctionCallVariableValueRequest
    #
    # @param json_object [String] 
    # @return [Vellum::NamedTestCaseFunctionCallVariableValueRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["value"].nil?
        value = parsed_json["value"].to_json
        value = Vellum::FunctionCallRequest.from_json(json_object: value)
      else
        value = nil
      end
      name = parsed_json["name"]
      new(
        value: value,
        name: name,
        additional_properties: struct
      )
    end
# Serialize an instance of NamedTestCaseFunctionCallVariableValueRequest to a JSON
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
      obj.value.nil? || Vellum::FunctionCallRequest.validate_raw(obj: obj.value)
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end