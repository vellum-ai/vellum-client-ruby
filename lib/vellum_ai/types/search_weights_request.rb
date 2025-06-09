# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
  class SearchWeightsRequest
  # @return [Float] The relative weight to give to semantic similarity
    attr_reader :semantic_similarity
  # @return [Float] The relative weight to give to keywords
    attr_reader :keywords
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param semantic_similarity [Float] The relative weight to give to semantic similarity
    # @param keywords [Float] The relative weight to give to keywords
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::SearchWeightsRequest]
    def initialize(semantic_similarity: OMIT, keywords: OMIT, additional_properties: nil)
      @semantic_similarity = semantic_similarity if semantic_similarity != OMIT
      @keywords = keywords if keywords != OMIT
      @additional_properties = additional_properties
      @_field_set = { "semantic_similarity": semantic_similarity, "keywords": keywords }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SearchWeightsRequest
    #
    # @param json_object [String] 
    # @return [Vellum::SearchWeightsRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      semantic_similarity = parsed_json["semantic_similarity"]
      keywords = parsed_json["keywords"]
      new(
        semantic_similarity: semantic_similarity,
        keywords: keywords,
        additional_properties: struct
      )
    end
# Serialize an instance of SearchWeightsRequest to a JSON object
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
      obj.semantic_similarity&.is_a?(Float) != false || raise("Passed value for field obj.semantic_similarity is not the expected type, validation failed.")
      obj.keywords&.is_a?(Float) != false || raise("Passed value for field obj.keywords is not the expected type, validation failed.")
    end
  end
end