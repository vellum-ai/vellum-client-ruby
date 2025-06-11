# frozen_string_literal: true
require_relative "search_result"
require "ostruct"
require "json"

module Vellum
  class SearchNodeResultData
  # @return [String] 
    attr_reader :results_output_id
  # @return [Array<Vellum::SearchResult>] The results of the search. Each result represents a chunk that matches the
#  search query.
    attr_reader :results
  # @return [String] 
    attr_reader :text_output_id
  # @return [String] 
    attr_reader :text
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param results_output_id [String] 
    # @param results [Array<Vellum::SearchResult>] The results of the search. Each result represents a chunk that matches the
#  search query.
    # @param text_output_id [String] 
    # @param text [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::SearchNodeResultData]
    def initialize(results_output_id:, results:, text_output_id:, text: OMIT, additional_properties: nil)
      @results_output_id = results_output_id
      @results = results
      @text_output_id = text_output_id
      @text = text if text != OMIT
      @additional_properties = additional_properties
      @_field_set = { "results_output_id": results_output_id, "results": results, "text_output_id": text_output_id, "text": text }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SearchNodeResultData
    #
    # @param json_object [String] 
    # @return [Vellum::SearchNodeResultData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      results_output_id = parsed_json["results_output_id"]
      results = parsed_json["results"]&.map do | item |
  item = item.to_json
  Vellum::SearchResult.from_json(json_object: item)
end
      text_output_id = parsed_json["text_output_id"]
      text = parsed_json["text"]
      new(
        results_output_id: results_output_id,
        results: results,
        text_output_id: text_output_id,
        text: text,
        additional_properties: struct
      )
    end
# Serialize an instance of SearchNodeResultData to a JSON object
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
      obj.results_output_id.is_a?(String) != false || raise("Passed value for field obj.results_output_id is not the expected type, validation failed.")
      obj.results.is_a?(Array) != false || raise("Passed value for field obj.results is not the expected type, validation failed.")
      obj.text_output_id.is_a?(String) != false || raise("Passed value for field obj.text_output_id is not the expected type, validation failed.")
      obj.text&.is_a?(String) != false || raise("Passed value for field obj.text is not the expected type, validation failed.")
    end
  end
end