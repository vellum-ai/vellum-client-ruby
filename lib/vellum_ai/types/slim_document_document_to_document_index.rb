# frozen_string_literal: true
require_relative "indexing_state_enum"
require "ostruct"
require "json"

module Vellum
# A slim representation of the link between a Document and a Document Index it's a
#  member of.
  class SlimDocumentDocumentToDocumentIndex
  # @return [String] Vellum-generated ID that uniquely identifies this link.
    attr_reader :id
  # @return [String] Vellum-generated ID that uniquely identifies the environment index this document
#  is included in.
    attr_reader :environment_document_index_id
  # @return [String] Vellum-generated ID that uniquely identifies the index this document is included
#  in.
    attr_reader :document_index_id
  # @return [Vellum::IndexingStateEnum] An enum value representing where this document is along its indexing lifecycle
#  for this index.
#  * `AWAITING_PROCESSING` - Awaiting Processing
#  * `QUEUED` - Queued
#  * `INDEXING` - Indexing
#  * `INDEXED` - Indexed
#  * `FAILED` - Failed
    attr_reader :indexing_state
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] Vellum-generated ID that uniquely identifies this link.
    # @param environment_document_index_id [String] Vellum-generated ID that uniquely identifies the environment index this document
#  is included in.
    # @param document_index_id [String] Vellum-generated ID that uniquely identifies the index this document is included
#  in.
    # @param indexing_state [Vellum::IndexingStateEnum] An enum value representing where this document is along its indexing lifecycle
#  for this index.
#  * `AWAITING_PROCESSING` - Awaiting Processing
#  * `QUEUED` - Queued
#  * `INDEXING` - Indexing
#  * `INDEXED` - Indexed
#  * `FAILED` - Failed
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::SlimDocumentDocumentToDocumentIndex]
    def initialize(id:, environment_document_index_id:, document_index_id: OMIT, indexing_state: OMIT, additional_properties: nil)
      @id = id
      @environment_document_index_id = environment_document_index_id
      @document_index_id = document_index_id if document_index_id != OMIT
      @indexing_state = indexing_state if indexing_state != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "environment_document_index_id": environment_document_index_id, "document_index_id": document_index_id, "indexing_state": indexing_state }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SlimDocumentDocumentToDocumentIndex
    #
    # @param json_object [String] 
    # @return [Vellum::SlimDocumentDocumentToDocumentIndex]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      environment_document_index_id = parsed_json["environment_document_index_id"]
      document_index_id = parsed_json["document_index_id"]
      indexing_state = parsed_json["indexing_state"]
      new(
        id: id,
        environment_document_index_id: environment_document_index_id,
        document_index_id: document_index_id,
        indexing_state: indexing_state,
        additional_properties: struct
      )
    end
# Serialize an instance of SlimDocumentDocumentToDocumentIndex to a JSON object
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
      obj.environment_document_index_id.is_a?(String) != false || raise("Passed value for field obj.environment_document_index_id is not the expected type, validation failed.")
      obj.document_index_id&.is_a?(String) != false || raise("Passed value for field obj.document_index_id is not the expected type, validation failed.")
      obj.indexing_state&.is_a?(Vellum::IndexingStateEnum) != false || raise("Passed value for field obj.indexing_state is not the expected type, validation failed.")
    end
  end
end