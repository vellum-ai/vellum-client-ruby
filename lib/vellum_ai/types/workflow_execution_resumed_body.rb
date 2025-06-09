# frozen_string_literal: true
require_relative "vellum_code_resource_definition"
require "ostruct"
require "json"

module Vellum
  class WorkflowExecutionResumedBody
  # @return [Vellum::VellumCodeResourceDefinition] 
    attr_reader :workflow_definition
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param workflow_definition [Vellum::VellumCodeResourceDefinition] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::WorkflowExecutionResumedBody]
    def initialize(workflow_definition:, additional_properties: nil)
      @workflow_definition = workflow_definition
      @additional_properties = additional_properties
      @_field_set = { "workflow_definition": workflow_definition }
    end
# Deserialize a JSON object to an instance of WorkflowExecutionResumedBody
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowExecutionResumedBody]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["workflow_definition"].nil?
        workflow_definition = parsed_json["workflow_definition"].to_json
        workflow_definition = Vellum::VellumCodeResourceDefinition.from_json(json_object: workflow_definition)
      else
        workflow_definition = nil
      end
      new(workflow_definition: workflow_definition, additional_properties: struct)
    end
# Serialize an instance of WorkflowExecutionResumedBody to a JSON object
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
      Vellum::VellumCodeResourceDefinition.validate_raw(obj: obj.workflow_definition)
    end
  end
end