# frozen_string_literal: true

require_relative "search_weights_request"
require_relative "search_result_merging_request"
require_relative "search_filters_request"
require "json"

module Vellum
  class SearchRequestOptionsRequest
    attr_reader :limit, :weights, :result_merging, :filters, :additional_properties

    # @param limit [Integer] The maximum number of results to return.
    # @param weights [SearchWeightsRequest] The weights to use for the search. Must add up to 1.0.
    # @param result_merging [SearchResultMergingRequest] The configuration for merging results.
    # @param filters [SearchFiltersRequest] The filters to apply to the search.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SearchRequestOptionsRequest]
    def initialize(limit: nil, weights: nil, result_merging: nil, filters: nil, additional_properties: nil)
      # @type [Integer] The maximum number of results to return.
      @limit = limit
      # @type [SearchWeightsRequest] The weights to use for the search. Must add up to 1.0.
      @weights = weights
      # @type [SearchResultMergingRequest] The configuration for merging results.
      @result_merging = result_merging
      # @type [SearchFiltersRequest] The filters to apply to the search.
      @filters = filters
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of SearchRequestOptionsRequest
    #
    # @param json_object [JSON]
    # @return [SearchRequestOptionsRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      limit = struct.limit
      if parsed_json["weights"].nil?
        weights = nil
      else
        weights = parsed_json["weights"].to_json
        weights = SearchWeightsRequest.from_json(json_object: weights)
      end
      if parsed_json["result_merging"].nil?
        result_merging = nil
      else
        result_merging = parsed_json["result_merging"].to_json
        result_merging = SearchResultMergingRequest.from_json(json_object: result_merging)
      end
      if parsed_json["filters"].nil?
        filters = nil
      else
        filters = parsed_json["filters"].to_json
        filters = SearchFiltersRequest.from_json(json_object: filters)
      end
      new(limit: limit, weights: weights, result_merging: result_merging, filters: filters,
          additional_properties: struct)
    end

    # Serialize an instance of SearchRequestOptionsRequest to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "limit": @limit, "weights": @weights, "result_merging": @result_merging, "filters": @filters }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.limit&.is_a?(Integer) != false || raise("Passed value for field obj.limit is not the expected type, validation failed.")
      obj.weights.nil? || SearchWeightsRequest.validate_raw(obj: obj.weights)
      obj.result_merging.nil? || SearchResultMergingRequest.validate_raw(obj: obj.result_merging)
      obj.filters.nil? || SearchFiltersRequest.validate_raw(obj: obj.filters)
    end
  end
end
