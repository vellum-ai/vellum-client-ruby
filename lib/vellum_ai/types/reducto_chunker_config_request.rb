# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
# Configuration for Reducto chunking
  class ReductoChunkerConfigRequest
  # @return [Integer] 
    attr_reader :character_limit
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param character_limit [Integer] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::ReductoChunkerConfigRequest]
    def initialize(character_limit: OMIT, additional_properties: nil)
      @character_limit = character_limit if character_limit != OMIT
      @additional_properties = additional_properties
      @_field_set = { "character_limit": character_limit }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ReductoChunkerConfigRequest
    #
    # @param json_object [String] 
    # @return [Vellum::ReductoChunkerConfigRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      character_limit = parsed_json["character_limit"]
      new(character_limit: character_limit, additional_properties: struct)
    end
# Serialize an instance of ReductoChunkerConfigRequest to a JSON object
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
      obj.character_limit&.is_a?(Integer) != false || raise("Passed value for field obj.character_limit is not the expected type, validation failed.")
    end
  end
end