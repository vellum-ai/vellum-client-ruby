# frozen_string_literal: true

require "date"
require_relative "processing_state_enum"
require_relative "document_status"
require_relative "document_document_to_document_index"
require "json"

module Vellum
  class DocumentRead
    attr_reader :id, :external_id, :last_uploaded_at, :label, :processing_state, :status, :original_file_url,
                :processed_file_url, :document_to_document_indexes, :metadata, :additional_properties

    # @param id [String]
    # @param external_id [String] The unique id of this document as it exists in the user's system.
    # @param last_uploaded_at [DateTime]
    # @param label [String] A human-readable label for the document. Defaults to the originally uploaded file's file name.
    # @param processing_state [PROCESSING_STATE_ENUM] The current processing state of the document
    #   - `QUEUED` - Queued
    #   - `PROCESSING` - Processing
    #   - `PROCESSED` - Processed
    #   - `FAILED` - Failed
    # @param status [DOCUMENT_STATUS] The current status of the document
    #   - `ACTIVE` - Active
    # @param original_file_url [String]
    # @param processed_file_url [String]
    # @param document_to_document_indexes [Array<DocumentDocumentToDocumentIndex>]
    # @param metadata [Hash{String => String}] A previously supplied JSON object containing metadata that can be filtered on when searching.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [DocumentRead]
    def initialize(id:, last_uploaded_at:, label:, document_to_document_indexes:, external_id: nil, processing_state: nil, status: nil,
                   original_file_url: nil, processed_file_url: nil, metadata: nil, additional_properties: nil)
      # @type [String]
      @id = id
      # @type [String] The unique id of this document as it exists in the user's system.
      @external_id = external_id
      # @type [DateTime]
      @last_uploaded_at = last_uploaded_at
      # @type [String] A human-readable label for the document. Defaults to the originally uploaded file's file name.
      @label = label
      # @type [PROCESSING_STATE_ENUM] The current processing state of the document
      #   - `QUEUED` - Queued
      #   - `PROCESSING` - Processing
      #   - `PROCESSED` - Processed
      #   - `FAILED` - Failed
      @processing_state = processing_state
      # @type [DOCUMENT_STATUS] The current status of the document
      #   - `ACTIVE` - Active
      @status = status
      # @type [String]
      @original_file_url = original_file_url
      # @type [String]
      @processed_file_url = processed_file_url
      # @type [Array<DocumentDocumentToDocumentIndex>]
      @document_to_document_indexes = document_to_document_indexes
      # @type [Hash{String => String}] A previously supplied JSON object containing metadata that can be filtered on when searching.
      @metadata = metadata
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of DocumentRead
    #
    # @param json_object [JSON]
    # @return [DocumentRead]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = struct.id
      external_id = struct.external_id
      last_uploaded_at = DateTime.parse(parsed_json["last_uploaded_at"])
      label = struct.label
      processing_state = PROCESSING_STATE_ENUM.key(parsed_json["processing_state"]) || parsed_json["processing_state"]
      status = struct.status
      original_file_url = struct.original_file_url
      processed_file_url = struct.processed_file_url
      document_to_document_indexes = parsed_json["document_to_document_indexes"].map do |v|
        v = v.to_json
        DocumentDocumentToDocumentIndex.from_json(json_object: v)
      end
      metadata = struct.metadata
      new(id: id, external_id: external_id, last_uploaded_at: last_uploaded_at, label: label,
          processing_state: processing_state, status: status, original_file_url: original_file_url, processed_file_url: processed_file_url, document_to_document_indexes: document_to_document_indexes, metadata: metadata, additional_properties: struct)
    end

    # Serialize an instance of DocumentRead to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      {
        "id": @id,
        "external_id": @external_id,
        "last_uploaded_at": @last_uploaded_at,
        "label": @label,
        "processing_state": PROCESSING_STATE_ENUM[@processing_state] || @processing_state,
        "status": @status,
        "original_file_url": @original_file_url,
        "processed_file_url": @processed_file_url,
        "document_to_document_indexes": @document_to_document_indexes,
        "metadata": @metadata
      }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.external_id&.is_a?(String) != false || raise("Passed value for field obj.external_id is not the expected type, validation failed.")
      obj.last_uploaded_at.is_a?(DateTime) != false || raise("Passed value for field obj.last_uploaded_at is not the expected type, validation failed.")
      obj.label.is_a?(String) != false || raise("Passed value for field obj.label is not the expected type, validation failed.")
      obj.processing_state&.is_a?(PROCESSING_STATE_ENUM) != false || raise("Passed value for field obj.processing_state is not the expected type, validation failed.")
      obj.status&.is_a?(String) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.original_file_url&.is_a?(String) != false || raise("Passed value for field obj.original_file_url is not the expected type, validation failed.")
      obj.processed_file_url&.is_a?(String) != false || raise("Passed value for field obj.processed_file_url is not the expected type, validation failed.")
      obj.document_to_document_indexes.is_a?(Array) != false || raise("Passed value for field obj.document_to_document_indexes is not the expected type, validation failed.")
      obj.metadata&.is_a?(Hash) != false || raise("Passed value for field obj.metadata is not the expected type, validation failed.")
    end
  end
end
