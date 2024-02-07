# frozen_string_literal: true

require "json"

module Vellum
  class SearchWeightsRequest
    attr_reader :semantic_similarity, :keywords, :additional_properties

    # @param semantic_similarity [Float] The relative weight to give to semantic similarity
    # @param keywords [Float] The relative weight to give to keywords
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SearchWeightsRequest]
    def initialize(semantic_similarity: nil, keywords: nil, additional_properties: nil)
      # @type [Float] The relative weight to give to semantic similarity
      @semantic_similarity = semantic_similarity
      # @type [Float] The relative weight to give to keywords
      @keywords = keywords
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of SearchWeightsRequest
    #
    # @param json_object [JSON]
    # @return [SearchWeightsRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      JSON.parse(json_object)
      semantic_similarity = struct.semantic_similarity
      keywords = struct.keywords
      new(semantic_similarity: semantic_similarity, keywords: keywords, additional_properties: struct)
    end

    # Serialize an instance of SearchWeightsRequest to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "semantic_similarity": @semantic_similarity, "keywords": @keywords }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.semantic_similarity&.is_a?(Float) != false || raise("Passed value for field obj.semantic_similarity is not the expected type, validation failed.")
      obj.keywords&.is_a?(Float) != false || raise("Passed value for field obj.keywords is not the expected type, validation failed.")
    end
  end
end
