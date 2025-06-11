# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
# Configuration for token overlapping window chunking
  class TokenOverlappingWindowChunkerConfig
  # @return [Integer] 
    attr_reader :token_limit
  # @return [Float] 
    attr_reader :overlap_ratio
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param token_limit [Integer] 
    # @param overlap_ratio [Float] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::TokenOverlappingWindowChunkerConfig]
    def initialize(token_limit: OMIT, overlap_ratio: OMIT, additional_properties: nil)
      @token_limit = token_limit if token_limit != OMIT
      @overlap_ratio = overlap_ratio if overlap_ratio != OMIT
      @additional_properties = additional_properties
      @_field_set = { "token_limit": token_limit, "overlap_ratio": overlap_ratio }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TokenOverlappingWindowChunkerConfig
    #
    # @param json_object [String] 
    # @return [Vellum::TokenOverlappingWindowChunkerConfig]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      token_limit = parsed_json["token_limit"]
      overlap_ratio = parsed_json["overlap_ratio"]
      new(
        token_limit: token_limit,
        overlap_ratio: overlap_ratio,
        additional_properties: struct
      )
    end
# Serialize an instance of TokenOverlappingWindowChunkerConfig to a JSON object
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
      obj.token_limit&.is_a?(Integer) != false || raise("Passed value for field obj.token_limit is not the expected type, validation failed.")
      obj.overlap_ratio&.is_a?(Float) != false || raise("Passed value for field obj.overlap_ratio is not the expected type, validation failed.")
    end
  end
end