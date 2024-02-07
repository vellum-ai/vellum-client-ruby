# frozen_string_literal: true

require_relative "search_result_document"
require "json"

module Vellum
  class SearchResult
    attr_reader :text, :score, :keywords, :document, :additional_properties

    # @param text [String] The text of the chunk that matched the search query.
    # @param score [Float] A score representing how well the chunk matches the search query.
    # @param keywords [Array<String>]
    # @param document [SearchResultDocument] The document that contains the chunk that matched the search query.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SearchResult]
    def initialize(text:, score:, keywords:, document:, additional_properties: nil)
      # @type [String] The text of the chunk that matched the search query.
      @text = text
      # @type [Float] A score representing how well the chunk matches the search query.
      @score = score
      # @type [Array<String>]
      @keywords = keywords
      # @type [SearchResultDocument] The document that contains the chunk that matched the search query.
      @document = document
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of SearchResult
    #
    # @param json_object [JSON]
    # @return [SearchResult]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      text = struct.text
      score = struct.score
      keywords = struct.keywords
      if parsed_json["document"].nil?
        document = nil
      else
        document = parsed_json["document"].to_json
        document = SearchResultDocument.from_json(json_object: document)
      end
      new(text: text, score: score, keywords: keywords, document: document, additional_properties: struct)
    end

    # Serialize an instance of SearchResult to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "text": @text, "score": @score, "keywords": @keywords, "document": @document }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.text.is_a?(String) != false || raise("Passed value for field obj.text is not the expected type, validation failed.")
      obj.score.is_a?(Float) != false || raise("Passed value for field obj.score is not the expected type, validation failed.")
      obj.keywords.is_a?(Array) != false || raise("Passed value for field obj.keywords is not the expected type, validation failed.")
      SearchResultDocument.validate_raw(obj: obj.document)
    end
  end
end
