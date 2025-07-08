# frozen_string_literal: true
require "date"
require_relative "document_processing_state"
require_relative "document_status"
require_relative "document_document_to_document_index"
require "ostruct"
require "json"

module Vellum
  class DocumentRead
  # @return [String] 
    attr_reader :id
  # @return [String] The unique id of this document as it exists in the user's system.
    attr_reader :external_id
  # @return [DateTime] 
    attr_reader :last_uploaded_at
  # @return [String] A human-readable label for the document. Defaults to the originally uploaded
#  file's file name.
    attr_reader :label
  # @return [Vellum::DocumentProcessingState] 
    attr_reader :processing_state
  # @return [Vellum::DOCUMENT_STATUS] The current status of the document
#  * `ACTIVE` - Active
    attr_reader :status
  # @return [Array<String>] A list of keywords that'll be associated with the document. Used as part of
#  keyword search.
    attr_reader :keywords
  # @return [String] 
    attr_reader :original_file_url
  # @return [Array<Vellum::DocumentDocumentToDocumentIndex>] 
    attr_reader :document_to_document_indexes
  # @return [Hash{String => Object}] A previously supplied JSON object containing metadata that can be filtered on
#  when searching.
    attr_reader :metadata
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param external_id [String] The unique id of this document as it exists in the user's system.
    # @param last_uploaded_at [DateTime] 
    # @param label [String] A human-readable label for the document. Defaults to the originally uploaded
#  file's file name.
    # @param processing_state [Vellum::DocumentProcessingState] 
    # @param status [Vellum::DOCUMENT_STATUS] The current status of the document
#  * `ACTIVE` - Active
    # @param keywords [Array<String>] A list of keywords that'll be associated with the document. Used as part of
#  keyword search.
    # @param original_file_url [String] 
    # @param document_to_document_indexes [Array<Vellum::DocumentDocumentToDocumentIndex>] 
    # @param metadata [Hash{String => Object}] A previously supplied JSON object containing metadata that can be filtered on
#  when searching.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::DocumentRead]
    def initialize(id:, external_id: OMIT, last_uploaded_at:, label:, processing_state:, status: OMIT, keywords: OMIT, original_file_url: OMIT, document_to_document_indexes:, metadata: OMIT, additional_properties: nil)
      @id = id
      @external_id = external_id if external_id != OMIT
      @last_uploaded_at = last_uploaded_at
      @label = label
      @processing_state = processing_state
      @status = status if status != OMIT
      @keywords = keywords if keywords != OMIT
      @original_file_url = original_file_url if original_file_url != OMIT
      @document_to_document_indexes = document_to_document_indexes
      @metadata = metadata if metadata != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "external_id": external_id, "last_uploaded_at": last_uploaded_at, "label": label, "processing_state": processing_state, "status": status, "keywords": keywords, "original_file_url": original_file_url, "document_to_document_indexes": document_to_document_indexes, "metadata": metadata }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of DocumentRead
    #
    # @param json_object [String] 
    # @return [Vellum::DocumentRead]
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
      status = parsed_json["status"]
      keywords = parsed_json["keywords"]
      original_file_url = parsed_json["original_file_url"]
      document_to_document_indexes = parsed_json["document_to_document_indexes"]&.map do | item |
  item = item.to_json
  Vellum::DocumentDocumentToDocumentIndex.from_json(json_object: item)
end
      metadata = parsed_json["metadata"]
      new(
        id: id,
        external_id: external_id,
        last_uploaded_at: last_uploaded_at,
        label: label,
        processing_state: processing_state,
        status: status,
        keywords: keywords,
        original_file_url: original_file_url,
        document_to_document_indexes: document_to_document_indexes,
        metadata: metadata,
        additional_properties: struct
      )
    end
# Serialize an instance of DocumentRead to a JSON object
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
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.external_id&.is_a?(String) != false || raise("Passed value for field obj.external_id is not the expected type, validation failed.")
      obj.last_uploaded_at.is_a?(DateTime) != false || raise("Passed value for field obj.last_uploaded_at is not the expected type, validation failed.")
      obj.label.is_a?(String) != false || raise("Passed value for field obj.label is not the expected type, validation failed.")
      obj.processing_state.is_a?(Vellum::DocumentProcessingState) != false || raise("Passed value for field obj.processing_state is not the expected type, validation failed.")
      obj.status&.is_a?(String) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.keywords&.is_a?(Array) != false || raise("Passed value for field obj.keywords is not the expected type, validation failed.")
      obj.original_file_url&.is_a?(String) != false || raise("Passed value for field obj.original_file_url is not the expected type, validation failed.")
      obj.document_to_document_indexes.is_a?(Array) != false || raise("Passed value for field obj.document_to_document_indexes is not the expected type, validation failed.")
      obj.metadata&.is_a?(Hash) != false || raise("Passed value for field obj.metadata is not the expected type, validation failed.")
    end
  end
end