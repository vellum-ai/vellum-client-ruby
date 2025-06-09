# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
# Configuration for sentence chunking
  class SentenceChunkerConfigRequest
  # @return [Integer] 
    attr_reader :character_limit
  # @return [Float] 
    attr_reader :min_overlap_ratio
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param character_limit [Integer] 
    # @param min_overlap_ratio [Float] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::SentenceChunkerConfigRequest]
    def initialize(character_limit: OMIT, min_overlap_ratio: OMIT, additional_properties: nil)
      @character_limit = character_limit if character_limit != OMIT
      @min_overlap_ratio = min_overlap_ratio if min_overlap_ratio != OMIT
      @additional_properties = additional_properties
      @_field_set = { "character_limit": character_limit, "min_overlap_ratio": min_overlap_ratio }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SentenceChunkerConfigRequest
    #
    # @param json_object [String] 
    # @return [Vellum::SentenceChunkerConfigRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      character_limit = parsed_json["character_limit"]
      min_overlap_ratio = parsed_json["min_overlap_ratio"]
      new(
        character_limit: character_limit,
        min_overlap_ratio: min_overlap_ratio,
        additional_properties: struct
      )
    end
# Serialize an instance of SentenceChunkerConfigRequest to a JSON object
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
      obj.min_overlap_ratio&.is_a?(Float) != false || raise("Passed value for field obj.min_overlap_ratio is not the expected type, validation failed.")
    end
  end
end