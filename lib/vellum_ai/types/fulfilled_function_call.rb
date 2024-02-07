# frozen_string_literal: true

require "json"

module Vellum
  # The final resolved function call value.
  class FulfilledFunctionCall
    attr_reader :arguments, :id, :name, :additional_properties

    # @param arguments [Hash{String => String}]
    # @param id [String]
    # @param name [String]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [FulfilledFunctionCall]
    def initialize(arguments:, name:, id: nil, additional_properties: nil)
      # @type [Hash{String => String}]
      @arguments = arguments
      # @type [String]
      @id = id
      # @type [String]
      @name = name
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of FulfilledFunctionCall
    #
    # @param json_object [JSON]
    # @return [FulfilledFunctionCall]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      JSON.parse(json_object)
      arguments = struct.arguments
      id = struct.id
      name = struct.name
      new(arguments: arguments, id: id, name: name, additional_properties: struct)
    end

    # Serialize an instance of FulfilledFunctionCall to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "arguments": @arguments, "id": @id, "name": @name }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
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
