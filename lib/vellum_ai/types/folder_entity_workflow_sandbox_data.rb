# frozen_string_literal: true
require "date"
require "date"
require_relative "entity_status"
require "date"
require_relative "workflow_sandbox_display_data"
require "ostruct"
require "json"

module Vellum
  class FolderEntityWorkflowSandboxData
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
  # @return [String] 
    attr_reader :description
  # @return [DateTime] 
    attr_reader :last_deployed_on
  # @return [Vellum::WorkflowSandboxDisplayData] 
    attr_reader :display_data
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
    # @param description [String] 
    # @param last_deployed_on [DateTime] 
    # @param display_data [Vellum::WorkflowSandboxDisplayData] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::FolderEntityWorkflowSandboxData]
    def initialize(id:, label:, created:, modified:, status:, description: OMIT, last_deployed_on: OMIT, display_data: OMIT, additional_properties: nil)
      @id = id
      @label = label
      @created = created
      @modified = modified
      @status = status
      @description = description if description != OMIT
      @last_deployed_on = last_deployed_on if last_deployed_on != OMIT
      @display_data = display_data if display_data != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "label": label, "created": created, "modified": modified, "status": status, "description": description, "last_deployed_on": last_deployed_on, "display_data": display_data }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of FolderEntityWorkflowSandboxData
    #
    # @param json_object [String] 
    # @return [Vellum::FolderEntityWorkflowSandboxData]
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
      description = parsed_json["description"]
      last_deployed_on = unless parsed_json["last_deployed_on"].nil?
  DateTime.parse(parsed_json["last_deployed_on"])
else
  nil
end
      unless parsed_json["display_data"].nil?
        display_data = parsed_json["display_data"].to_json
        display_data = Vellum::WorkflowSandboxDisplayData.from_json(json_object: display_data)
      else
        display_data = nil
      end
      new(
        id: id,
        label: label,
        created: created,
        modified: modified,
        status: status,
        description: description,
        last_deployed_on: last_deployed_on,
        display_data: display_data,
        additional_properties: struct
      )
    end
# Serialize an instance of FolderEntityWorkflowSandboxData to a JSON object
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
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.last_deployed_on&.is_a?(DateTime) != false || raise("Passed value for field obj.last_deployed_on is not the expected type, validation failed.")
      obj.display_data.nil? || Vellum::WorkflowSandboxDisplayData.validate_raw(obj: obj.display_data)
    end
  end
end