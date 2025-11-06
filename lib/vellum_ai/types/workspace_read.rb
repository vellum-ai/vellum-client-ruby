# frozen_string_literal: true
require "date"
require_relative "workspace_display_config"
require "ostruct"
require "json"

module Vellum
  class WorkspaceRead
  # @return [String] 
    attr_reader :id
  # @return [String] The name of the Workspace.
    attr_reader :name
  # @return [String] 
    attr_reader :label
  # @return [DateTime] 
    attr_reader :created
  # @return [Vellum::WorkspaceDisplayConfig] 
    attr_reader :display_config
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param name [String] The name of the Workspace.
    # @param label [String] 
    # @param created [DateTime] 
    # @param display_config [Vellum::WorkspaceDisplayConfig] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::WorkspaceRead]
    def initialize(id:, name:, label:, created:, display_config: OMIT, additional_properties: nil)
      @id = id
      @name = name
      @label = label
      @created = created
      @display_config = display_config if display_config != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "name": name, "label": label, "created": created, "display_config": display_config }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of WorkspaceRead
    #
    # @param json_object [String] 
    # @return [Vellum::WorkspaceRead]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      name = parsed_json["name"]
      label = parsed_json["label"]
      created = unless parsed_json["created"].nil?
  DateTime.parse(parsed_json["created"])
else
  nil
end
      unless parsed_json["display_config"].nil?
        display_config = parsed_json["display_config"].to_json
        display_config = Vellum::WorkspaceDisplayConfig.from_json(json_object: display_config)
      else
        display_config = nil
      end
      new(
        id: id,
        name: name,
        label: label,
        created: created,
        display_config: display_config,
        additional_properties: struct
      )
    end
# Serialize an instance of WorkspaceRead to a JSON object
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
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.label.is_a?(String) != false || raise("Passed value for field obj.label is not the expected type, validation failed.")
      obj.created.is_a?(DateTime) != false || raise("Passed value for field obj.created is not the expected type, validation failed.")
      obj.display_config.nil? || Vellum::WorkspaceDisplayConfig.validate_raw(obj: obj.display_config)
    end
  end
end