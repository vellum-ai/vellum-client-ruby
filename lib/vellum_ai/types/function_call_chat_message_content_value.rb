# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
# The final resolved function call value.
  class FunctionCallChatMessageContentValue
  # @return [String] 
    attr_reader :name
  # @return [Hash{String => Object}] 
    attr_reader :arguments
  # @return [String] 
    attr_reader :id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] 
    # @param arguments [Hash{String => Object}] 
    # @param id [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::FunctionCallChatMessageContentValue]
    def initialize(name:, arguments:, id: OMIT, additional_properties: nil)
      @name = name
      @arguments = arguments
      @id = id if id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "name": name, "arguments": arguments, "id": id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of FunctionCallChatMessageContentValue
    #
    # @param json_object [String] 
    # @return [Vellum::FunctionCallChatMessageContentValue]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      arguments = parsed_json["arguments"]
      id = parsed_json["id"]
      new(
        name: name,
        arguments: arguments,
        id: id,
        additional_properties: struct
      )
    end
# Serialize an instance of FunctionCallChatMessageContentValue to a JSON object
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
      obj.arguments.is_a?(Hash) != false || raise("Passed value for field obj.arguments is not the expected type, validation failed.")
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
    end
  end
end