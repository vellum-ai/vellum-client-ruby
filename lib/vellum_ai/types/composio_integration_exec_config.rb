# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
  class ComposioIntegrationExecConfig
  # @return [String] 
    attr_reader :type
  # @return [String] 
    attr_reader :slug
  # @return [Boolean] 
    attr_reader :supports_webhook_triggers
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String] 
    # @param slug [String] 
    # @param supports_webhook_triggers [Boolean] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::ComposioIntegrationExecConfig]
    def initialize(type:, slug:, supports_webhook_triggers: OMIT, additional_properties: nil)
      @type = type
      @slug = slug
      @supports_webhook_triggers = supports_webhook_triggers if supports_webhook_triggers != OMIT
      @additional_properties = additional_properties
      @_field_set = { "type": type, "slug": slug, "supports_webhook_triggers": supports_webhook_triggers }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ComposioIntegrationExecConfig
    #
    # @param json_object [String] 
    # @return [Vellum::ComposioIntegrationExecConfig]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      slug = parsed_json["slug"]
      supports_webhook_triggers = parsed_json["supports_webhook_triggers"]
      new(
        type: type,
        slug: slug,
        supports_webhook_triggers: supports_webhook_triggers,
        additional_properties: struct
      )
    end
# Serialize an instance of ComposioIntegrationExecConfig to a JSON object
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
      obj.slug.is_a?(String) != false || raise("Passed value for field obj.slug is not the expected type, validation failed.")
      obj.supports_webhook_triggers&.is_a?(Boolean) != false || raise("Passed value for field obj.supports_webhook_triggers is not the expected type, validation failed.")
    end
  end
end