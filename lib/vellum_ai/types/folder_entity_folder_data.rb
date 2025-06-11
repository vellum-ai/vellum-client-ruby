# frozen_string_literal: true
require "date"
require "date"
require "ostruct"
require "json"

module Vellum
  class FolderEntityFolderData
  # @return [String] 
    attr_reader :id
  # @return [String] 
    attr_reader :label
  # @return [DateTime] 
    attr_reader :created
  # @return [DateTime] 
    attr_reader :modified
  # @return [Boolean] 
    attr_reader :has_contents
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
    # @param has_contents [Boolean] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::FolderEntityFolderData]
    def initialize(id:, label:, created:, modified:, has_contents:, additional_properties: nil)
      @id = id
      @label = label
      @created = created
      @modified = modified
      @has_contents = has_contents
      @additional_properties = additional_properties
      @_field_set = { "id": id, "label": label, "created": created, "modified": modified, "has_contents": has_contents }
    end
# Deserialize a JSON object to an instance of FolderEntityFolderData
    #
    # @param json_object [String] 
    # @return [Vellum::FolderEntityFolderData]
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
      has_contents = parsed_json["has_contents"]
      new(
        id: id,
        label: label,
        created: created,
        modified: modified,
        has_contents: has_contents,
        additional_properties: struct
      )
    end
# Serialize an instance of FolderEntityFolderData to a JSON object
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
      obj.has_contents.is_a?(Boolean) != false || raise("Passed value for field obj.has_contents is not the expected type, validation failed.")
    end
  end
end