# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
# The final resolved function call value.
  class FunctionCall
  # @return [Hash{String => Object}] 
    attr_reader :arguments
  # @return [String] 
    attr_reader :id
  # @return [String] 
    attr_reader :name
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param arguments [Hash{String => Object}] 
    # @param id [String] 
    # @param name [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::FunctionCall]
    def initialize(arguments:, id: OMIT, name:, additional_properties: nil)
      @arguments = arguments
      @id = id if id != OMIT
      @name = name
      @additional_properties = additional_properties
      @_field_set = { "arguments": arguments, "id": id, "name": name }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of FunctionCall
    #
    # @param json_object [String] 
    # @return [Vellum::FunctionCall]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      arguments = parsed_json["arguments"]
      id = parsed_json["id"]
      name = parsed_json["name"]
      new(
        arguments: arguments,
        id: id,
        name: name,
        additional_properties: struct
      )
    end
# Serialize an instance of FunctionCall to a JSON object
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
      obj.arguments.is_a?(Hash) != false || raise("Passed value for field obj.arguments is not the expected type, validation failed.")
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end