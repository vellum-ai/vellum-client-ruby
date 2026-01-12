# frozen_string_literal: true
require_relative "integration_name"
require_relative "integration_provider"
require "ostruct"
require "json"

module Vellum
  class SlimIntegrationRead
  # @return [String] 
    attr_reader :id
  # @return [String] 
    attr_reader :label
  # @return [String] 
    attr_reader :icon_url
  # @return [Vellum::IntegrationName] 
    attr_reader :name
  # @return [Vellum::IntegrationProvider] 
    attr_reader :provider
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param label [String] 
    # @param icon_url [String] 
    # @param name [Vellum::IntegrationName] 
    # @param provider [Vellum::IntegrationProvider] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::SlimIntegrationRead]
    def initialize(id:, label: OMIT, icon_url:, name:, provider:, additional_properties: nil)
      @id = id
      @label = label if label != OMIT
      @icon_url = icon_url
      @name = name
      @provider = provider
      @additional_properties = additional_properties
      @_field_set = { "id": id, "label": label, "icon_url": icon_url, "name": name, "provider": provider }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SlimIntegrationRead
    #
    # @param json_object [String] 
    # @return [Vellum::SlimIntegrationRead]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      label = parsed_json["label"]
      icon_url = parsed_json["icon_url"]
      name = parsed_json["name"]
      provider = parsed_json["provider"]
      new(
        id: id,
        label: label,
        icon_url: icon_url,
        name: name,
        provider: provider,
        additional_properties: struct
      )
    end
# Serialize an instance of SlimIntegrationRead to a JSON object
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
      obj.label&.is_a?(String) != false || raise("Passed value for field obj.label is not the expected type, validation failed.")
      obj.icon_url.is_a?(String) != false || raise("Passed value for field obj.icon_url is not the expected type, validation failed.")
      obj.name.is_a?(Vellum::IntegrationName) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.provider.is_a?(Vellum::IntegrationProvider) != false || raise("Passed value for field obj.provider is not the expected type, validation failed.")
    end
  end
end