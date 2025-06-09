# frozen_string_literal: true
require_relative "indexing_config_vectorizer"
require_relative "document_index_chunking"
require "ostruct"
require "json"

module Vellum
  class DocumentIndexIndexingConfig
  # @return [Vellum::IndexingConfigVectorizer] 
    attr_reader :vectorizer
  # @return [Vellum::DocumentIndexChunking] 
    attr_reader :chunking
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param vectorizer [Vellum::IndexingConfigVectorizer] 
    # @param chunking [Vellum::DocumentIndexChunking] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::DocumentIndexIndexingConfig]
    def initialize(vectorizer:, chunking: OMIT, additional_properties: nil)
      @vectorizer = vectorizer
      @chunking = chunking if chunking != OMIT
      @additional_properties = additional_properties
      @_field_set = { "vectorizer": vectorizer, "chunking": chunking }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of DocumentIndexIndexingConfig
    #
    # @param json_object [String] 
    # @return [Vellum::DocumentIndexIndexingConfig]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["vectorizer"].nil?
        vectorizer = parsed_json["vectorizer"].to_json
        vectorizer = Vellum::IndexingConfigVectorizer.from_json(json_object: vectorizer)
      else
        vectorizer = nil
      end
      unless parsed_json["chunking"].nil?
        chunking = parsed_json["chunking"].to_json
        chunking = Vellum::DocumentIndexChunking.from_json(json_object: chunking)
      else
        chunking = nil
      end
      new(
        vectorizer: vectorizer,
        chunking: chunking,
        additional_properties: struct
      )
    end
# Serialize an instance of DocumentIndexIndexingConfig to a JSON object
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
      Vellum::IndexingConfigVectorizer.validate_raw(obj: obj.vectorizer)
      obj.chunking.nil? || Vellum::DocumentIndexChunking.validate_raw(obj: obj.chunking)
    end
  end
end