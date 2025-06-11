# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
  class WorkflowPushDeploymentConfigRequest
  # @return [String] 
    attr_reader :label
  # @return [String] 
    attr_reader :name
  # @return [String] 
    attr_reader :description
  # @return [Array<String>] 
    attr_reader :release_tags
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param label [String] 
    # @param name [String] 
    # @param description [String] 
    # @param release_tags [Array<String>] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::WorkflowPushDeploymentConfigRequest]
    def initialize(label: OMIT, name: OMIT, description: OMIT, release_tags: OMIT, additional_properties: nil)
      @label = label if label != OMIT
      @name = name if name != OMIT
      @description = description if description != OMIT
      @release_tags = release_tags if release_tags != OMIT
      @additional_properties = additional_properties
      @_field_set = { "label": label, "name": name, "description": description, "release_tags": release_tags }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of WorkflowPushDeploymentConfigRequest
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowPushDeploymentConfigRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      label = parsed_json["label"]
      name = parsed_json["name"]
      description = parsed_json["description"]
      release_tags = parsed_json["release_tags"]
      new(
        label: label,
        name: name,
        description: description,
        release_tags: release_tags,
        additional_properties: struct
      )
    end
# Serialize an instance of WorkflowPushDeploymentConfigRequest to a JSON object
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
      obj.label&.is_a?(String) != false || raise("Passed value for field obj.label is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.release_tags&.is_a?(Array) != false || raise("Passed value for field obj.release_tags is not the expected type, validation failed.")
    end
  end
end