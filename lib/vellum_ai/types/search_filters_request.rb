# frozen_string_literal: true

require_relative "metadata_filter_config_request"
require "json"

module Vellum
  class SearchFiltersRequest
    attr_reader :external_ids, :metadata, :additional_properties

    # @param external_ids [Array<String>] The document external IDs to filter by
    # @param metadata [MetadataFilterConfigRequest] The metadata filters to apply to the search
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SearchFiltersRequest]
    def initialize(external_ids: nil, metadata: nil, additional_properties: nil)
      # @type [Array<String>] The document external IDs to filter by
      @external_ids = external_ids
      # @type [MetadataFilterConfigRequest] The metadata filters to apply to the search
      @metadata = metadata
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of SearchFiltersRequest
    #
    # @param json_object [JSON]
    # @return [SearchFiltersRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      external_ids = struct.external_ids
      if parsed_json["metadata"].nil?
        metadata = nil
      else
        metadata = parsed_json["metadata"].to_json
        metadata = MetadataFilterConfigRequest.from_json(json_object: metadata)
      end
      new(external_ids: external_ids, metadata: metadata, additional_properties: struct)
    end

    # Serialize an instance of SearchFiltersRequest to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "external_ids": @external_ids, "metadata": @metadata }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.external_ids&.is_a?(Array) != false || raise("Passed value for field obj.external_ids is not the expected type, validation failed.")
      obj.metadata.nil? || MetadataFilterConfigRequest.validate_raw(obj: obj.metadata)
    end
  end
end
