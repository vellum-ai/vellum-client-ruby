# frozen_string_literal: true

require_relative "search_result"
require "json"

module Vellum
  class SearchNodeResultData
    attr_reader :results_output_id, :results, :text_output_id, :text, :additional_properties

    # @param results_output_id [String]
    # @param results [Array<SearchResult>] The results of the search. Each result represents a chunk that matches the search query.
    # @param text_output_id [String]
    # @param text [String]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SearchNodeResultData]
    def initialize(results_output_id:, results:, text_output_id:, text: nil, additional_properties: nil)
      # @type [String]
      @results_output_id = results_output_id
      # @type [Array<SearchResult>] The results of the search. Each result represents a chunk that matches the search query.
      @results = results
      # @type [String]
      @text_output_id = text_output_id
      # @type [String]
      @text = text
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of SearchNodeResultData
    #
    # @param json_object [JSON]
    # @return [SearchNodeResultData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      results_output_id = struct.results_output_id
      results = parsed_json["results"].map do |v|
        v = v.to_json
        SearchResult.from_json(json_object: v)
      end
      text_output_id = struct.text_output_id
      text = struct.text
      new(results_output_id: results_output_id, results: results, text_output_id: text_output_id, text: text,
          additional_properties: struct)
    end

    # Serialize an instance of SearchNodeResultData to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      {
        "results_output_id": @results_output_id,
        "results": @results,
        "text_output_id": @text_output_id,
        "text": @text
      }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.results_output_id.is_a?(String) != false || raise("Passed value for field obj.results_output_id is not the expected type, validation failed.")
      obj.results.is_a?(Array) != false || raise("Passed value for field obj.results is not the expected type, validation failed.")
      obj.text_output_id.is_a?(String) != false || raise("Passed value for field obj.text_output_id is not the expected type, validation failed.")
      obj.text&.is_a?(String) != false || raise("Passed value for field obj.text is not the expected type, validation failed.")
    end
  end
end
