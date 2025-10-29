# frozen_string_literal: true
require_relative "workflow_display_icon"
require "ostruct"
require "json"

module Vellum
# Workflow Deployment display data
  class WorkflowDeploymentDisplayData
  # @return [Vellum::WorkflowDisplayIcon] The icon associated with this Workflow Deployment.
    attr_reader :icon
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param icon [Vellum::WorkflowDisplayIcon] The icon associated with this Workflow Deployment.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::WorkflowDeploymentDisplayData]
    def initialize(icon: OMIT, additional_properties: nil)
      @icon = icon if icon != OMIT
      @additional_properties = additional_properties
      @_field_set = { "icon": icon }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of WorkflowDeploymentDisplayData
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowDeploymentDisplayData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["icon"].nil?
        icon = parsed_json["icon"].to_json
        icon = Vellum::WorkflowDisplayIcon.from_json(json_object: icon)
      else
        icon = nil
      end
      new(icon: icon, additional_properties: struct)
    end
# Serialize an instance of WorkflowDeploymentDisplayData to a JSON object
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
      obj.icon.nil? || Vellum::WorkflowDisplayIcon.validate_raw(obj: obj.icon)
    end
  end
end