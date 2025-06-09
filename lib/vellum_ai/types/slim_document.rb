# frozen_string_literal: true
require "date"
require_relative "document_processing_state"
require_relative "processing_failure_reason_enum"
require_relative "document_status"
require_relative "slim_document_document_to_document_index"
require "ostruct"
require "json"

module Vellum
  class SlimDocument
  # @return [String] Vellum-generated ID that uniquely identifies this document.
    attr_reader :id
  # @return [String] The external ID that was originally provided when uploading the document.
    attr_reader :external_id
  # @return [DateTime] A timestamp representing when this document was most recently uploaded.
    attr_reader :last_uploaded_at
  # @return [String] Human-friendly name for this document.
    attr_reader :label
  # @return [Vellum::DocumentProcessingState] 
    attr_reader :processing_state
  # @return [Vellum::ProcessingFailureReasonEnum] An enum value representing why the document could not be processed. Is null
#  unless processing_state is FAILED.
#  * `EXCEEDED_CHARACTER_LIMIT` - Exceeded Character Limit
#  * `INVALID_FILE` - Invalid File
    attr_reader :processing_failure_reason
  # @return [Vellum::DOCUMENT_STATUS] The document's current status.
#  * `ACTIVE` - Active
    attr_reader :status
  # @return [Array<String>] A list of keywords associated with this document. Originally provided when
#  uploading the document.
    attr_reader :keywords
  # @return [Hash{String => Object}] A previously supplied JSON object containing metadata that can be filtered on
#  when searching.
    attr_reader :metadata
  # @return [Array<Vellum::SlimDocumentDocumentToDocumentIndex>] 
    attr_reader :document_to_document_indexes
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] Vellum-generated ID that uniquely identifies this document.
    # @param external_id [String] The external ID that was originally provided when uploading the document.
    # @param last_uploaded_at [DateTime] A timestamp representing when this document was most recently uploaded.
    # @param label [String] Human-friendly name for this document.
    # @param processing_state [Vellum::DocumentProcessingState] 
    # @param processing_failure_reason [Vellum::ProcessingFailureReasonEnum] An enum value representing why the document could not be processed. Is null
#  unless processing_state is FAILED.
#  * `EXCEEDED_CHARACTER_LIMIT` - Exceeded Character Limit
#  * `INVALID_FILE` - Invalid File
    # @param status [Vellum::DOCUMENT_STATUS] The document's current status.
#  * `ACTIVE` - Active
    # @param keywords [Array<String>] A list of keywords associated with this document. Originally provided when
#  uploading the document.
    # @param metadata [Hash{String => Object}] A previously supplied JSON object containing metadata that can be filtered on
#  when searching.
    # @param document_to_document_indexes [Array<Vellum::SlimDocumentDocumentToDocumentIndex>] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::SlimDocument]
    def initialize(id: OMIT, external_id: OMIT, last_uploaded_at:, label:, processing_state:, processing_failure_reason: OMIT, status: OMIT, keywords: OMIT, metadata: OMIT, document_to_document_indexes:, additional_properties: nil)
      @id = id if id != OMIT
      @external_id = external_id if external_id != OMIT
      @last_uploaded_at = last_uploaded_at
      @label = label
      @processing_state = processing_state
      @processing_failure_reason = processing_failure_reason if processing_failure_reason != OMIT
      @status = status if status != OMIT
      @keywords = keywords if keywords != OMIT
      @metadata = metadata if metadata != OMIT
      @document_to_document_indexes = document_to_document_indexes
      @additional_properties = additional_properties
      @_field_set = { "id": id, "external_id": external_id, "last_uploaded_at": last_uploaded_at, "label": label, "processing_state": processing_state, "processing_failure_reason": processing_failure_reason, "status": status, "keywords": keywords, "metadata": metadata, "document_to_document_indexes": document_to_document_indexes }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SlimDocument
    #
    # @param json_object [String] 
    # @return [Vellum::SlimDocument]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      external_id = parsed_json["external_id"]
      last_uploaded_at = unless parsed_json["last_uploaded_at"].nil?
  DateTime.parse(parsed_json["last_uploaded_at"])
else
  nil
end
      label = parsed_json["label"]
      processing_state = parsed_json["processing_state"]
      processing_failure_reason = parsed_json["processing_failure_reason"]
      status = parsed_json["status"]
      keywords = parsed_json["keywords"]
      metadata = parsed_json["metadata"]
      document_to_document_indexes = parsed_json["document_to_document_indexes"]&.map do | item |
  item = item.to_json
  Vellum::SlimDocumentDocumentToDocumentIndex.from_json(json_object: item)
end
      new(
        id: id,
        external_id: external_id,
        last_uploaded_at: last_uploaded_at,
        label: label,
        processing_state: processing_state,
        processing_failure_reason: processing_failure_reason,
        status: status,
        keywords: keywords,
        metadata: metadata,
        document_to_document_indexes: document_to_document_indexes,
        additional_properties: struct
      )
    end
# Serialize an instance of SlimDocument to a JSON object
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
      obj.external_id&.is_a?(String) != false || raise("Passed value for field obj.external_id is not the expected type, validation failed.")
      obj.last_uploaded_at.is_a?(DateTime) != false || raise("Passed value for field obj.last_uploaded_at is not the expected type, validation failed.")
      obj.label.is_a?(String) != false || raise("Passed value for field obj.label is not the expected type, validation failed.")
      obj.processing_state.is_a?(Vellum::DocumentProcessingState) != false || raise("Passed value for field obj.processing_state is not the expected type, validation failed.")
      obj.processing_failure_reason&.is_a?(Vellum::ProcessingFailureReasonEnum) != false || raise("Passed value for field obj.processing_failure_reason is not the expected type, validation failed.")
      obj.status&.is_a?(String) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.keywords&.is_a?(Array) != false || raise("Passed value for field obj.keywords is not the expected type, validation failed.")
      obj.metadata&.is_a?(Hash) != false || raise("Passed value for field obj.metadata is not the expected type, validation failed.")
      obj.document_to_document_indexes.is_a?(Array) != false || raise("Passed value for field obj.document_to_document_indexes is not the expected type, validation failed.")
    end
  end
end