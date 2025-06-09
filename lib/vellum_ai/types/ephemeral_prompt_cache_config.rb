# frozen_string_literal: true
require_relative "ephemeral_prompt_cache_config_type_enum"
require "ostruct"
require "json"

module Vellum
  class EphemeralPromptCacheConfig
  # @return [Vellum::EPHEMERAL_PROMPT_CACHE_CONFIG_TYPE_ENUM] 
    attr_reader :type
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [Vellum::EPHEMERAL_PROMPT_CACHE_CONFIG_TYPE_ENUM] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::EphemeralPromptCacheConfig]
    def initialize(type: OMIT, additional_properties: nil)
      @type = type if type != OMIT
      @additional_properties = additional_properties
      @_field_set = { "type": type }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of EphemeralPromptCacheConfig
    #
    # @param json_object [String] 
    # @return [Vellum::EphemeralPromptCacheConfig]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      new(type: type, additional_properties: struct)
    end
# Serialize an instance of EphemeralPromptCacheConfig to a JSON object
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
      obj.type&.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
    end
  end
end