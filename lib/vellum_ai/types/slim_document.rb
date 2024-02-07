# frozen_string_literal: true

require "date"
require_relative "processing_state_enum"
require_relative "processing_failure_reason_enum"
require_relative "document_status"
require_relative "document_document_to_document_index"
require "json"

module Vellum
  class SlimDocument
    attr_reader :id, :external_id, :last_uploaded_at, :label, :processing_state, :processing_failure_reason, :status,
                :keywords, :metadata, :document_to_document_indexes, :additional_properties

    # @param id [String] Vellum-generated ID that uniquely identifies this document.
    # @param external_id [String] The external ID that was originally provided when uploading the document.
    # @param last_uploaded_at [DateTime] A timestamp representing when this document was most recently uploaded.
    # @param label [String] Human-friendly name for this document.
    # @param processing_state [PROCESSING_STATE_ENUM] An enum value representing where this document is along its processing lifecycle. Note that this is different than its indexing lifecycle.
    #   - `QUEUED` - Queued
    #   - `PROCESSING` - Processing
    #   - `PROCESSED` - Processed
    #   - `FAILED` - Failed
    # @param processing_failure_reason [PROCESSING_FAILURE_REASON_ENUM] An enum value representing why the document could not be processed. Is null unless processing_state is FAILED.
    #   - `EXCEEDED_CHARACTER_LIMIT` - Exceeded Character Limit
    #   - `INVALID_FILE` - Invalid File
    # @param status [DOCUMENT_STATUS] The document's current status.
    #   - `ACTIVE` - Active
    # @param keywords [Array<String>] A list of keywords associated with this document. Originally provided when uploading the document.
    # @param metadata [Hash{String => String}] A previously supplied JSON object containing metadata that can be filtered on when searching.
    # @param document_to_document_indexes [Array<DocumentDocumentToDocumentIndex>]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SlimDocument]
    def initialize(id:, last_uploaded_at:, label:, document_to_document_indexes:, external_id: nil, processing_state: nil,
                   processing_failure_reason: nil, status: nil, keywords: nil, metadata: nil, additional_properties: nil)
      # @type [String] Vellum-generated ID that uniquely identifies this document.
      @id = id
      # @type [String] The external ID that was originally provided when uploading the document.
      @external_id = external_id
      # @type [DateTime] A timestamp representing when this document was most recently uploaded.
      @last_uploaded_at = last_uploaded_at
      # @type [String] Human-friendly name for this document.
      @label = label
      # @type [PROCESSING_STATE_ENUM] An enum value representing where this document is along its processing lifecycle. Note that this is different than its indexing lifecycle.
      #   - `QUEUED` - Queued
      #   - `PROCESSING` - Processing
      #   - `PROCESSED` - Processed
      #   - `FAILED` - Failed
      @processing_state = processing_state
      # @type [PROCESSING_FAILURE_REASON_ENUM] An enum value representing why the document could not be processed. Is null unless processing_state is FAILED.
      #   - `EXCEEDED_CHARACTER_LIMIT` - Exceeded Character Limit
      #   - `INVALID_FILE` - Invalid File
      @processing_failure_reason = processing_failure_reason
      # @type [DOCUMENT_STATUS] The document's current status.
      #   - `ACTIVE` - Active
      @status = status
      # @type [Array<String>] A list of keywords associated with this document. Originally provided when uploading the document.
      @keywords = keywords
      # @type [Hash{String => String}] A previously supplied JSON object containing metadata that can be filtered on when searching.
      @metadata = metadata
      # @type [Array<DocumentDocumentToDocumentIndex>]
      @document_to_document_indexes = document_to_document_indexes
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of SlimDocument
    #
    # @param json_object [JSON]
    # @return [SlimDocument]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = struct.id
      external_id = struct.external_id
      last_uploaded_at = DateTime.parse(parsed_json["last_uploaded_at"])
      label = struct.label
      processing_state = PROCESSING_STATE_ENUM.key(parsed_json["processing_state"]) || parsed_json["processing_state"]
      processing_failure_reason = PROCESSING_FAILURE_REASON_ENUM.key(parsed_json["processing_failure_reason"]) || parsed_json["processing_failure_reason"]
      status = struct.status
      keywords = struct.keywords
      metadata = struct.metadata
      document_to_document_indexes = parsed_json["document_to_document_indexes"].map do |v|
        v = v.to_json
        DocumentDocumentToDocumentIndex.from_json(json_object: v)
      end
      new(id: id, external_id: external_id, last_uploaded_at: last_uploaded_at, label: label,
          processing_state: processing_state, processing_failure_reason: processing_failure_reason, status: status, keywords: keywords, metadata: metadata, document_to_document_indexes: document_to_document_indexes, additional_properties: struct)
    end

    # Serialize an instance of SlimDocument to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      {
        "id": @id,
        "external_id": @external_id,
        "last_uploaded_at": @last_uploaded_at,
        "label": @label,
        "processing_state": PROCESSING_STATE_ENUM[@processing_state] || @processing_state,
        "processing_failure_reason": PROCESSING_FAILURE_REASON_ENUM[@processing_failure_reason] || @processing_failure_reason,
        "status": @status,
        "keywords": @keywords,
        "metadata": @metadata,
        "document_to_document_indexes": @document_to_document_indexes
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
      obj.processing_failure_reason&.is_a?(PROCESSING_FAILURE_REASON_ENUM) != false || raise("Passed value for field obj.processing_failure_reason is not the expected type, validation failed.")
      obj.status&.is_a?(String) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.keywords&.is_a?(Array) != false || raise("Passed value for field obj.keywords is not the expected type, validation failed.")
      obj.metadata&.is_a?(Hash) != false || raise("Passed value for field obj.metadata is not the expected type, validation failed.")
      obj.document_to_document_indexes.is_a?(Array) != false || raise("Passed value for field obj.document_to_document_indexes is not the expected type, validation failed.")
    end
  end
end
