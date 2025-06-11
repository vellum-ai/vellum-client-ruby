# frozen_string_literal: true
require_relative "search_weights_request"
require_relative "search_result_merging_request"
require_relative "search_filters_request"
require "ostruct"
require "json"

module Vellum
  class SearchRequestOptionsRequest
  # @return [Integer] The maximum number of results to return.
    attr_reader :limit
  # @return [Vellum::SearchWeightsRequest] The weights to use for the search. Must add up to 1.0.
    attr_reader :weights
  # @return [Vellum::SearchResultMergingRequest] The configuration for merging results.
    attr_reader :result_merging
  # @return [Vellum::SearchFiltersRequest] The filters to apply to the search.
    attr_reader :filters
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param limit [Integer] The maximum number of results to return.
    # @param weights [Vellum::SearchWeightsRequest] The weights to use for the search. Must add up to 1.0.
    # @param result_merging [Vellum::SearchResultMergingRequest] The configuration for merging results.
    # @param filters [Vellum::SearchFiltersRequest] The filters to apply to the search.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::SearchRequestOptionsRequest]
    def initialize(limit: OMIT, weights: OMIT, result_merging: OMIT, filters: OMIT, additional_properties: nil)
      @limit = limit if limit != OMIT
      @weights = weights if weights != OMIT
      @result_merging = result_merging if result_merging != OMIT
      @filters = filters if filters != OMIT
      @additional_properties = additional_properties
      @_field_set = { "limit": limit, "weights": weights, "result_merging": result_merging, "filters": filters }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SearchRequestOptionsRequest
    #
    # @param json_object [String] 
    # @return [Vellum::SearchRequestOptionsRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      limit = parsed_json["limit"]
      unless parsed_json["weights"].nil?
        weights = parsed_json["weights"].to_json
        weights = Vellum::SearchWeightsRequest.from_json(json_object: weights)
      else
        weights = nil
      end
      unless parsed_json["result_merging"].nil?
        result_merging = parsed_json["result_merging"].to_json
        result_merging = Vellum::SearchResultMergingRequest.from_json(json_object: result_merging)
      else
        result_merging = nil
      end
      unless parsed_json["filters"].nil?
        filters = parsed_json["filters"].to_json
        filters = Vellum::SearchFiltersRequest.from_json(json_object: filters)
      else
        filters = nil
      end
      new(
        limit: limit,
        weights: weights,
        result_merging: result_merging,
        filters: filters,
        additional_properties: struct
      )
    end
# Serialize an instance of SearchRequestOptionsRequest to a JSON object
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
      obj.limit&.is_a?(Integer) != false || raise("Passed value for field obj.limit is not the expected type, validation failed.")
      obj.weights.nil? || Vellum::SearchWeightsRequest.validate_raw(obj: obj.weights)
      obj.result_merging.nil? || Vellum::SearchResultMergingRequest.validate_raw(obj: obj.result_merging)
      obj.filters.nil? || Vellum::SearchFiltersRequest.validate_raw(obj: obj.filters)
    end
  end
end