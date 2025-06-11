# frozen_string_literal: true
require_relative "indexing_config_vectorizer_request"
require_relative "document_index_chunking_request"
require "ostruct"
require "json"

module Vellum
  class DocumentIndexIndexingConfigRequest
  # @return [Vellum::IndexingConfigVectorizerRequest] 
    attr_reader :vectorizer
  # @return [Vellum::DocumentIndexChunkingRequest] 
    attr_reader :chunking
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param vectorizer [Vellum::IndexingConfigVectorizerRequest] 
    # @param chunking [Vellum::DocumentIndexChunkingRequest] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::DocumentIndexIndexingConfigRequest]
    def initialize(vectorizer:, chunking: OMIT, additional_properties: nil)
      @vectorizer = vectorizer
      @chunking = chunking if chunking != OMIT
      @additional_properties = additional_properties
      @_field_set = { "vectorizer": vectorizer, "chunking": chunking }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of DocumentIndexIndexingConfigRequest
    #
    # @param json_object [String] 
    # @return [Vellum::DocumentIndexIndexingConfigRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["vectorizer"].nil?
        vectorizer = parsed_json["vectorizer"].to_json
        vectorizer = Vellum::IndexingConfigVectorizerRequest.from_json(json_object: vectorizer)
      else
        vectorizer = nil
      end
      unless parsed_json["chunking"].nil?
        chunking = parsed_json["chunking"].to_json
        chunking = Vellum::DocumentIndexChunkingRequest.from_json(json_object: chunking)
      else
        chunking = nil
      end
      new(
        vectorizer: vectorizer,
        chunking: chunking,
        additional_properties: struct
      )
    end
# Serialize an instance of DocumentIndexIndexingConfigRequest to a JSON object
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
      Vellum::IndexingConfigVectorizerRequest.validate_raw(obj: obj.vectorizer)
      obj.chunking.nil? || Vellum::DocumentIndexChunkingRequest.validate_raw(obj: obj.chunking)
    end
  end
end