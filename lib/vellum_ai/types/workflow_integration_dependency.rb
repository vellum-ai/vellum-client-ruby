# frozen_string_literal: true
require_relative "integration_name"
require "ostruct"
require "json"

module Vellum
  class WorkflowIntegrationDependency
  # @return [String] 
    attr_reader :type
  # @return [Vellum::IntegrationName] 
    attr_reader :name
  # @return [String] 
    attr_reader :provider
  # @return [String] 
    attr_reader :label
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String] 
    # @param name [Vellum::IntegrationName] 
    # @param provider [String] 
    # @param label [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::WorkflowIntegrationDependency]
    def initialize(type:, name:, provider:, label: OMIT, additional_properties: nil)
      @type = type
      @name = name
      @provider = provider
      @label = label if label != OMIT
      @additional_properties = additional_properties
      @_field_set = { "type": type, "name": name, "provider": provider, "label": label }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of WorkflowIntegrationDependency
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowIntegrationDependency]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      name = parsed_json["name"]
      provider = parsed_json["provider"]
      label = parsed_json["label"]
      new(
        type: type,
        name: name,
        provider: provider,
        label: label,
        additional_properties: struct
      )
    end
# Serialize an instance of WorkflowIntegrationDependency to a JSON object
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
      obj.name.is_a?(Vellum::IntegrationName) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.provider.is_a?(String) != false || raise("Passed value for field obj.provider is not the expected type, validation failed.")
      obj.label&.is_a?(String) != false || raise("Passed value for field obj.label is not the expected type, validation failed.")
    end
  end
end