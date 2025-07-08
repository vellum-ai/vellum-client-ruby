# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
  class WorkflowSandboxExample
  # @return [String] 
    attr_reader :id
  # @return [String] 
    attr_reader :label
  # @return [String] 
    attr_reader :description
  # @return [String] 
    attr_reader :icon_name
  # @return [String] 
    attr_reader :ui_image_url
  # @return [String] 
    attr_reader :code_image_url
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param label [String] 
    # @param description [String] 
    # @param icon_name [String] 
    # @param ui_image_url [String] 
    # @param code_image_url [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::WorkflowSandboxExample]
    def initialize(id:, label:, description: OMIT, icon_name: OMIT, ui_image_url: OMIT, code_image_url: OMIT, additional_properties: nil)
      @id = id
      @label = label
      @description = description if description != OMIT
      @icon_name = icon_name if icon_name != OMIT
      @ui_image_url = ui_image_url if ui_image_url != OMIT
      @code_image_url = code_image_url if code_image_url != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "label": label, "description": description, "icon_name": icon_name, "ui_image_url": ui_image_url, "code_image_url": code_image_url }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of WorkflowSandboxExample
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowSandboxExample]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      label = parsed_json["label"]
      description = parsed_json["description"]
      icon_name = parsed_json["icon_name"]
      ui_image_url = parsed_json["ui_image_url"]
      code_image_url = parsed_json["code_image_url"]
      new(
        id: id,
        label: label,
        description: description,
        icon_name: icon_name,
        ui_image_url: ui_image_url,
        code_image_url: code_image_url,
        additional_properties: struct
      )
    end
# Serialize an instance of WorkflowSandboxExample to a JSON object
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
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.icon_name&.is_a?(String) != false || raise("Passed value for field obj.icon_name is not the expected type, validation failed.")
      obj.ui_image_url&.is_a?(String) != false || raise("Passed value for field obj.ui_image_url is not the expected type, validation failed.")
      obj.code_image_url&.is_a?(String) != false || raise("Passed value for field obj.code_image_url is not the expected type, validation failed.")
    end
  end
end