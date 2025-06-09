# frozen_string_literal: true
require_relative "metadata_filters_request"
require "ostruct"
require "json"

module Vellum
  class SearchFiltersRequest
  # @return [Array<String>] The document external IDs to filter by
    attr_reader :external_ids
  # @return [Vellum::MetadataFiltersRequest] The metadata filters to apply to the search
    attr_reader :metadata
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param external_ids [Array<String>] The document external IDs to filter by
    # @param metadata [Vellum::MetadataFiltersRequest] The metadata filters to apply to the search
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::SearchFiltersRequest]
    def initialize(external_ids: OMIT, metadata: OMIT, additional_properties: nil)
      @external_ids = external_ids if external_ids != OMIT
      @metadata = metadata if metadata != OMIT
      @additional_properties = additional_properties
      @_field_set = { "external_ids": external_ids, "metadata": metadata }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SearchFiltersRequest
    #
    # @param json_object [String] 
    # @return [Vellum::SearchFiltersRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      external_ids = parsed_json["external_ids"]
      unless parsed_json["metadata"].nil?
        metadata = parsed_json["metadata"].to_json
        metadata = Vellum::MetadataFiltersRequest.from_json(json_object: metadata)
      else
        metadata = nil
      end
      new(
        external_ids: external_ids,
        metadata: metadata,
        additional_properties: struct
      )
    end
# Serialize an instance of SearchFiltersRequest to a JSON object
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
      obj.external_ids&.is_a?(Array) != false || raise("Passed value for field obj.external_ids is not the expected type, validation failed.")
      obj.metadata.nil? || Vellum::MetadataFiltersRequest.validate_raw(obj: obj.metadata)
    end
  end
end