# frozen_string_literal: true

require_relative "indexing_state_enum"
require "json"

module Vellum
  class DocumentDocumentToDocumentIndex
    attr_reader :id, :document_index_id, :indexing_state, :additional_properties

    # @param id [String] Vellum-generated ID that uniquely identifies this link.
    # @param document_index_id [String] Vellum-generated ID that uniquely identifies the index this document is included in.
    # @param indexing_state [INDEXING_STATE_ENUM] An enum value representing where this document is along its indexing lifecycle for this index.
    #   - `AWAITING_PROCESSING` - Awaiting Processing
    #   - `QUEUED` - Queued
    #   - `INDEXING` - Indexing
    #   - `INDEXED` - Indexed
    #   - `FAILED` - Failed
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [DocumentDocumentToDocumentIndex]
    def initialize(id:, document_index_id:, indexing_state: nil, additional_properties: nil)
      # @type [String] Vellum-generated ID that uniquely identifies this link.
      @id = id
      # @type [String] Vellum-generated ID that uniquely identifies the index this document is included in.
      @document_index_id = document_index_id
      # @type [INDEXING_STATE_ENUM] An enum value representing where this document is along its indexing lifecycle for this index.
      #   - `AWAITING_PROCESSING` - Awaiting Processing
      #   - `QUEUED` - Queued
      #   - `INDEXING` - Indexing
      #   - `INDEXED` - Indexed
      #   - `FAILED` - Failed
      @indexing_state = indexing_state
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of DocumentDocumentToDocumentIndex
    #
    # @param json_object [JSON]
    # @return [DocumentDocumentToDocumentIndex]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = struct.id
      document_index_id = struct.document_index_id
      indexing_state = INDEXING_STATE_ENUM.key(parsed_json["indexing_state"]) || parsed_json["indexing_state"]
      new(id: id, document_index_id: document_index_id, indexing_state: indexing_state, additional_properties: struct)
    end

    # Serialize an instance of DocumentDocumentToDocumentIndex to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      {
        "id": @id,
        "document_index_id": @document_index_id,
        "indexing_state": INDEXING_STATE_ENUM[@indexing_state] || @indexing_state
      }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.document_index_id.is_a?(String) != false || raise("Passed value for field obj.document_index_id is not the expected type, validation failed.")
      obj.indexing_state&.is_a?(INDEXING_STATE_ENUM) != false || raise("Passed value for field obj.indexing_state is not the expected type, validation failed.")
    end
  end
end
