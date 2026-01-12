# frozen_string_literal: true
require_relative "integration"
require "ostruct"
require "json"

module Vellum
# Serializer for Composio tool definition response.
  class ComposioToolDefinition
  # @return [Vellum::Integration] 
    attr_reader :integration
  # @return [String] 
    attr_reader :name
  # @return [String] 
    attr_reader :label
  # @return [String] 
    attr_reader :description
  # @return [Hash{String => Object}] 
    attr_reader :input_parameters
  # @return [Hash{String => Object}] 
    attr_reader :output_parameters
  # @return [String] 
    attr_reader :toolkit_version
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param integration [Vellum::Integration] 
    # @param name [String] 
    # @param label [String] 
    # @param description [String] 
    # @param input_parameters [Hash{String => Object}] 
    # @param output_parameters [Hash{String => Object}] 
    # @param toolkit_version [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::ComposioToolDefinition]
    def initialize(integration:, name:, label:, description:, input_parameters:, output_parameters:, toolkit_version:, additional_properties: nil)
      @integration = integration
      @name = name
      @label = label
      @description = description
      @input_parameters = input_parameters
      @output_parameters = output_parameters
      @toolkit_version = toolkit_version
      @additional_properties = additional_properties
      @_field_set = { "integration": integration, "name": name, "label": label, "description": description, "input_parameters": input_parameters, "output_parameters": output_parameters, "toolkit_version": toolkit_version }
    end
# Deserialize a JSON object to an instance of ComposioToolDefinition
    #
    # @param json_object [String] 
    # @return [Vellum::ComposioToolDefinition]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["integration"].nil?
        integration = parsed_json["integration"].to_json
        integration = Vellum::Integration.from_json(json_object: integration)
      else
        integration = nil
      end
      name = parsed_json["name"]
      label = parsed_json["label"]
      description = parsed_json["description"]
      input_parameters = parsed_json["input_parameters"]
      output_parameters = parsed_json["output_parameters"]
      toolkit_version = parsed_json["toolkit_version"]
      new(
        integration: integration,
        name: name,
        label: label,
        description: description,
        input_parameters: input_parameters,
        output_parameters: output_parameters,
        toolkit_version: toolkit_version,
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
      Vellum::Integration.validate_raw(obj: obj.integration)
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.label.is_a?(String) != false || raise("Passed value for field obj.label is not the expected type, validation failed.")
      obj.description.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.input_parameters.is_a?(Hash) != false || raise("Passed value for field obj.input_parameters is not the expected type, validation failed.")
      obj.output_parameters.is_a?(Hash) != false || raise("Passed value for field obj.output_parameters is not the expected type, validation failed.")
      obj.toolkit_version.is_a?(String) != false || raise("Passed value for field obj.toolkit_version is not the expected type, validation failed.")
    end
  end
end