# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
# Serializer for Composio tool definition response.
  class ComposioToolDefinition
  # @return [String] 
    attr_reader :provider
  # @return [String] 
    attr_reader :name
  # @return [String] 
    attr_reader :description
  # @return [Hash{String => Object}] 
    attr_reader :parameters
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param provider [String] 
    # @param name [String] 
    # @param description [String] 
    # @param parameters [Hash{String => Object}] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::ComposioToolDefinition]
    def initialize(provider:, name:, description:, parameters:, additional_properties: nil)
      @provider = provider
      @name = name
      @description = description
      @parameters = parameters
      @additional_properties = additional_properties
      @_field_set = { "provider": provider, "name": name, "description": description, "parameters": parameters }
    end
# Deserialize a JSON object to an instance of ComposioToolDefinition
    #
    # @param json_object [String] 
    # @return [Vellum::ComposioToolDefinition]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      provider = parsed_json["provider"]
      name = parsed_json["name"]
      description = parsed_json["description"]
      parameters = parsed_json["parameters"]
      new(
        provider: provider,
        name: name,
        description: description,
        parameters: parameters,
        additional_properties: struct
      )
    end
# Serialize an instance of ComposioToolDefinition to a JSON object
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
      obj.provider.is_a?(String) != false || raise("Passed value for field obj.provider is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.description.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.parameters.is_a?(Hash) != false || raise("Passed value for field obj.parameters is not the expected type, validation failed.")
    end
  end
end