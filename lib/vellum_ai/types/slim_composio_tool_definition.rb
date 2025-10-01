# frozen_string_literal: true
require_relative "tool_definition_integration"
require "ostruct"
require "json"

module Vellum
  class SlimComposioToolDefinition
  # @return [String] 
    attr_reader :provider
  # @return [Vellum::ToolDefinitionIntegration] 
    attr_reader :integration
  # @return [String] 
    attr_reader :name
  # @return [String] 
    attr_reader :label
  # @return [String] 
    attr_reader :description
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param provider [String] 
    # @param integration [Vellum::ToolDefinitionIntegration] 
    # @param name [String] 
    # @param label [String] 
    # @param description [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::SlimComposioToolDefinition]
    def initialize(provider:, integration:, name:, label:, description:, additional_properties: nil)
      @provider = provider
      @integration = integration
      @name = name
      @label = label
      @description = description
      @additional_properties = additional_properties
      @_field_set = { "provider": provider, "integration": integration, "name": name, "label": label, "description": description }
    end
# Deserialize a JSON object to an instance of SlimComposioToolDefinition
    #
    # @param json_object [String] 
    # @return [Vellum::SlimComposioToolDefinition]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      provider = parsed_json["provider"]
      unless parsed_json["integration"].nil?
        integration = parsed_json["integration"].to_json
        integration = Vellum::ToolDefinitionIntegration.from_json(json_object: integration)
      else
        integration = nil
      end
      name = parsed_json["name"]
      label = parsed_json["label"]
      description = parsed_json["description"]
      new(
        provider: provider,
        integration: integration,
        name: name,
        label: label,
        description: description,
        additional_properties: struct
      )
    end
# Serialize an instance of SlimComposioToolDefinition to a JSON object
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
      Vellum::ToolDefinitionIntegration.validate_raw(obj: obj.integration)
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.label.is_a?(String) != false || raise("Passed value for field obj.label is not the expected type, validation failed.")
      obj.description.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
    end
  end
end