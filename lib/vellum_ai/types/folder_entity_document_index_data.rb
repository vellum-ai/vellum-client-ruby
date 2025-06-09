# frozen_string_literal: true
require "date"
require "date"
require_relative "entity_status"
require_relative "document_index_indexing_config"
require "ostruct"
require "json"

module Vellum
  class FolderEntityDocumentIndexData
  # @return [String] 
    attr_reader :id
  # @return [String] 
    attr_reader :label
  # @return [DateTime] 
    attr_reader :created
  # @return [DateTime] 
    attr_reader :modified
  # @return [Vellum::EntityStatus] 
    attr_reader :status
  # @return [Vellum::DocumentIndexIndexingConfig] 
    attr_reader :indexing_config
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param label [String] 
    # @param created [DateTime] 
    # @param modified [DateTime] 
    # @param status [Vellum::EntityStatus] 
    # @param indexing_config [Vellum::DocumentIndexIndexingConfig] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::FolderEntityDocumentIndexData]
    def initialize(id:, label:, created:, modified:, status:, indexing_config:, additional_properties: nil)
      @id = id
      @label = label
      @created = created
      @modified = modified
      @status = status
      @indexing_config = indexing_config
      @additional_properties = additional_properties
      @_field_set = { "id": id, "label": label, "created": created, "modified": modified, "status": status, "indexing_config": indexing_config }
    end
# Deserialize a JSON object to an instance of FolderEntityDocumentIndexData
    #
    # @param json_object [String] 
    # @return [Vellum::FolderEntityDocumentIndexData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      label = parsed_json["label"]
      created = unless parsed_json["created"].nil?
  DateTime.parse(parsed_json["created"])
else
  nil
end
      modified = unless parsed_json["modified"].nil?
  DateTime.parse(parsed_json["modified"])
else
  nil
end
      status = parsed_json["status"]
      unless parsed_json["indexing_config"].nil?
        indexing_config = parsed_json["indexing_config"].to_json
        indexing_config = Vellum::DocumentIndexIndexingConfig.from_json(json_object: indexing_config)
      else
        indexing_config = nil
      end
      new(
        id: id,
        label: label,
        created: created,
        modified: modified,
        status: status,
        indexing_config: indexing_config,
        additional_properties: struct
      )
    end
# Serialize an instance of FolderEntityDocumentIndexData to a JSON object
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
      obj.label.is_a?(String) != false || raise("Passed value for field obj.label is not the expected type, validation failed.")
      obj.created.is_a?(DateTime) != false || raise("Passed value for field obj.created is not the expected type, validation failed.")
      obj.modified.is_a?(DateTime) != false || raise("Passed value for field obj.modified is not the expected type, validation failed.")
      obj.status.is_a?(Vellum::EntityStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      Vellum::DocumentIndexIndexingConfig.validate_raw(obj: obj.indexing_config)
    end
  end
end