# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
  class SearchResultDocument
  # @return [String] The ID of the document.
    attr_reader :id
  # @return [String] The human-readable name for the document.
    attr_reader :label
  # @return [String] The unique ID of the document as represented in an external system and specified
#  when it was originally uploaded.
    attr_reader :external_id
  # @return [Hash{String => Object}] A previously supplied JSON object containing metadata that can be filtered on
#  when searching.
    attr_reader :metadata
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The ID of the document.
    # @param label [String] The human-readable name for the document.
    # @param external_id [String] The unique ID of the document as represented in an external system and specified
#  when it was originally uploaded.
    # @param metadata [Hash{String => Object}] A previously supplied JSON object containing metadata that can be filtered on
#  when searching.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::SearchResultDocument]
    def initialize(id: OMIT, label:, external_id: OMIT, metadata: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @label = label
      @external_id = external_id if external_id != OMIT
      @metadata = metadata if metadata != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "label": label, "external_id": external_id, "metadata": metadata }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SearchResultDocument
    #
    # @param json_object [String] 
    # @return [Vellum::SearchResultDocument]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      label = parsed_json["label"]
      external_id = parsed_json["external_id"]
      metadata = parsed_json["metadata"]
      new(
        id: id,
        label: label,
        external_id: external_id,
        metadata: metadata,
        additional_properties: struct
      )
    end
# Serialize an instance of SearchResultDocument to a JSON object
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
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.label.is_a?(String) != false || raise("Passed value for field obj.label is not the expected type, validation failed.")
      obj.external_id&.is_a?(String) != false || raise("Passed value for field obj.external_id is not the expected type, validation failed.")
      obj.metadata&.is_a?(Hash) != false || raise("Passed value for field obj.metadata is not the expected type, validation failed.")
    end
  end
end