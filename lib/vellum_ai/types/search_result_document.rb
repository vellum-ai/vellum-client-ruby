# frozen_string_literal: true

require "json"

module Vellum
  class SearchResultDocument
    attr_reader :id, :label, :external_id, :metadata, :additional_properties

    # @param id [String] The ID of the document.
    # @param label [String] The human-readable name for the document.
    # @param external_id [String] The unique ID of the document as represented in an external system and specified when it was originally uploaded.
    # @param metadata [Hash{String => String}] A previously supplied JSON object containing metadata that can be filtered on when searching.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SearchResultDocument]
    def initialize(id:, label:, external_id: nil, metadata: nil, additional_properties: nil)
      # @type [String] The ID of the document.
      @id = id
      # @type [String] The human-readable name for the document.
      @label = label
      # @type [String] The unique ID of the document as represented in an external system and specified when it was originally uploaded.
      @external_id = external_id
      # @type [Hash{String => String}] A previously supplied JSON object containing metadata that can be filtered on when searching.
      @metadata = metadata
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of SearchResultDocument
    #
    # @param json_object [JSON]
    # @return [SearchResultDocument]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      JSON.parse(json_object)
      id = struct.id
      label = struct.label
      external_id = struct.external_id
      metadata = struct.metadata
      new(id: id, label: label, external_id: external_id, metadata: metadata, additional_properties: struct)
    end

    # Serialize an instance of SearchResultDocument to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "id": @id, "label": @label, "external_id": @external_id, "metadata": @metadata }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.label.is_a?(String) != false || raise("Passed value for field obj.label is not the expected type, validation failed.")
      obj.external_id&.is_a?(String) != false || raise("Passed value for field obj.external_id is not the expected type, validation failed.")
      obj.metadata&.is_a?(Hash) != false || raise("Passed value for field obj.metadata is not the expected type, validation failed.")
    end
  end
end
