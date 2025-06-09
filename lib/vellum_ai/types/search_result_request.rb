# frozen_string_literal: true
require_relative "search_result_document_request"
require_relative "search_result_meta_request"
require "ostruct"
require "json"

module Vellum
  class SearchResultRequest
  # @return [String] The text of the chunk that matched the search query.
    attr_reader :text
  # @return [Float] A score representing how well the chunk matches the search query.
    attr_reader :score
  # @return [Array<String>] 
    attr_reader :keywords
  # @return [Vellum::SearchResultDocumentRequest] The document that contains the chunk that matched the search query.
    attr_reader :document
  # @return [Vellum::SearchResultMetaRequest] Additional information about the search result.
    attr_reader :meta
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param text [String] The text of the chunk that matched the search query.
    # @param score [Float] A score representing how well the chunk matches the search query.
    # @param keywords [Array<String>] 
    # @param document [Vellum::SearchResultDocumentRequest] The document that contains the chunk that matched the search query.
    # @param meta [Vellum::SearchResultMetaRequest] Additional information about the search result.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::SearchResultRequest]
    def initialize(text:, score:, keywords:, document:, meta: OMIT, additional_properties: nil)
      @text = text
      @score = score
      @keywords = keywords
      @document = document
      @meta = meta if meta != OMIT
      @additional_properties = additional_properties
      @_field_set = { "text": text, "score": score, "keywords": keywords, "document": document, "meta": meta }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SearchResultRequest
    #
    # @param json_object [String] 
    # @return [Vellum::SearchResultRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      text = parsed_json["text"]
      score = parsed_json["score"]
      keywords = parsed_json["keywords"]
      unless parsed_json["document"].nil?
        document = parsed_json["document"].to_json
        document = Vellum::SearchResultDocumentRequest.from_json(json_object: document)
      else
        document = nil
      end
      unless parsed_json["meta"].nil?
        meta = parsed_json["meta"].to_json
        meta = Vellum::SearchResultMetaRequest.from_json(json_object: meta)
      else
        meta = nil
      end
      new(
        text: text,
        score: score,
        keywords: keywords,
        document: document,
        meta: meta,
        additional_properties: struct
      )
    end
# Serialize an instance of SearchResultRequest to a JSON object
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
      obj.text.is_a?(String) != false || raise("Passed value for field obj.text is not the expected type, validation failed.")
      obj.score.is_a?(Float) != false || raise("Passed value for field obj.score is not the expected type, validation failed.")
      obj.keywords.is_a?(Array) != false || raise("Passed value for field obj.keywords is not the expected type, validation failed.")
      Vellum::SearchResultDocumentRequest.validate_raw(obj: obj.document)
      obj.meta.nil? || Vellum::SearchResultMetaRequest.validate_raw(obj: obj.meta)
    end
  end
end