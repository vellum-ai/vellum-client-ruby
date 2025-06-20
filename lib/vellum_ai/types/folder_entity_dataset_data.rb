# frozen_string_literal: true
require "date"
require "date"
require "ostruct"
require "json"

module Vellum
  class FolderEntityDatasetData
  # @return [String] 
    attr_reader :id
  # @return [String] 
    attr_reader :label
  # @return [String] 
    attr_reader :name
  # @return [String] 
    attr_reader :description
  # @return [DateTime] 
    attr_reader :created
  # @return [DateTime] 
    attr_reader :modified
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param label [String] 
    # @param name [String] 
    # @param description [String] 
    # @param created [DateTime] 
    # @param modified [DateTime] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::FolderEntityDatasetData]
    def initialize(id:, label:, name:, description: OMIT, created:, modified:, additional_properties: nil)
      @id = id
      @label = label
      @name = name
      @description = description if description != OMIT
      @created = created
      @modified = modified
      @additional_properties = additional_properties
      @_field_set = { "id": id, "label": label, "name": name, "description": description, "created": created, "modified": modified }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of FolderEntityDatasetData
    #
    # @param json_object [String] 
    # @return [Vellum::FolderEntityDatasetData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      label = parsed_json["label"]
      name = parsed_json["name"]
      description = parsed_json["description"]
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
      new(
        id: id,
        label: label,
        name: name,
        description: description,
        created: created,
        modified: modified,
        additional_properties: struct
      )
    end
# Serialize an instance of FolderEntityDatasetData to a JSON object
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
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.created.is_a?(DateTime) != false || raise("Passed value for field obj.created is not the expected type, validation failed.")
      obj.modified.is_a?(DateTime) != false || raise("Passed value for field obj.modified is not the expected type, validation failed.")
    end
  end
end