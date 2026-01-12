# frozen_string_literal: true
require_relative "integration_provider"
require_relative "integration_name"
require "ostruct"
require "json"

module Vellum
  class IntegrationAuthConfigIntegration
  # @return [String] 
    attr_reader :id
  # @return [Vellum::IntegrationProvider] 
    attr_reader :provider
  # @return [Vellum::IntegrationName] 
    attr_reader :name
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param provider [Vellum::IntegrationProvider] 
    # @param name [Vellum::IntegrationName] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::IntegrationAuthConfigIntegration]
    def initialize(id:, provider:, name:, additional_properties: nil)
      @id = id
      @provider = provider
      @name = name
      @additional_properties = additional_properties
      @_field_set = { "id": id, "provider": provider, "name": name }
    end
# Deserialize a JSON object to an instance of IntegrationAuthConfigIntegration
    #
    # @param json_object [String] 
    # @return [Vellum::IntegrationAuthConfigIntegration]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      provider = parsed_json["provider"]
      name = parsed_json["name"]
      new(
        id: id,
        provider: provider,
        name: name,
        additional_properties: struct
      )
    end
# Serialize an instance of IntegrationAuthConfigIntegration to a JSON object
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
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.provider.is_a?(Vellum::IntegrationProvider) != false || raise("Passed value for field obj.provider is not the expected type, validation failed.")
      obj.name.is_a?(Vellum::IntegrationName) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end