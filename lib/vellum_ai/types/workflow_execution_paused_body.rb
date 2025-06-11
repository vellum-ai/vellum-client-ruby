# frozen_string_literal: true
require_relative "vellum_code_resource_definition"
require_relative "external_input_descriptor"
require "ostruct"
require "json"

module Vellum
  class WorkflowExecutionPausedBody
  # @return [Vellum::VellumCodeResourceDefinition] 
    attr_reader :workflow_definition
  # @return [Array<Vellum::ExternalInputDescriptor>] 
    attr_reader :external_inputs
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param workflow_definition [Vellum::VellumCodeResourceDefinition] 
    # @param external_inputs [Array<Vellum::ExternalInputDescriptor>] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::WorkflowExecutionPausedBody]
    def initialize(workflow_definition:, external_inputs:, additional_properties: nil)
      @workflow_definition = workflow_definition
      @external_inputs = external_inputs
      @additional_properties = additional_properties
      @_field_set = { "workflow_definition": workflow_definition, "external_inputs": external_inputs }
    end
# Deserialize a JSON object to an instance of WorkflowExecutionPausedBody
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowExecutionPausedBody]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["workflow_definition"].nil?
        workflow_definition = parsed_json["workflow_definition"].to_json
        workflow_definition = Vellum::VellumCodeResourceDefinition.from_json(json_object: workflow_definition)
      else
        workflow_definition = nil
      end
      external_inputs = parsed_json["external_inputs"]&.map do | item |
  item = item.to_json
  Vellum::ExternalInputDescriptor.from_json(json_object: item)
end
      new(
        workflow_definition: workflow_definition,
        external_inputs: external_inputs,
        additional_properties: struct
      )
    end
# Serialize an instance of WorkflowExecutionPausedBody to a JSON object
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
      obj.external_inputs.is_a?(Array) != false || raise("Passed value for field obj.external_inputs is not the expected type, validation failed.")
    end
  end
end