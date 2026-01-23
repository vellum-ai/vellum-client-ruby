# frozen_string_literal: true
require_relative "vellum_code_resource_definition"
require "ostruct"
require "json"

module Vellum
  class WorkflowExecutionInitiatedBody
  # @return [Vellum::VellumCodeResourceDefinition] 
    attr_reader :workflow_definition
  # @return [Hash{String => Object}] 
    attr_reader :inputs
  # @return [Vellum::VellumCodeResourceDefinition] 
    attr_reader :trigger
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param workflow_definition [Vellum::VellumCodeResourceDefinition] 
    # @param inputs [Hash{String => Object}] 
    # @param trigger [Vellum::VellumCodeResourceDefinition] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::WorkflowExecutionInitiatedBody]
    def initialize(workflow_definition:, inputs:, trigger: OMIT, additional_properties: nil)
      @workflow_definition = workflow_definition
      @inputs = inputs
      @trigger = trigger if trigger != OMIT
      @additional_properties = additional_properties
      @_field_set = { "workflow_definition": workflow_definition, "inputs": inputs, "trigger": trigger }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of WorkflowExecutionInitiatedBody
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowExecutionInitiatedBody]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["workflow_definition"].nil?
        workflow_definition = parsed_json["workflow_definition"].to_json
        workflow_definition = Vellum::VellumCodeResourceDefinition.from_json(json_object: workflow_definition)
      else
        workflow_definition = nil
      end
      inputs = parsed_json["inputs"]
      unless parsed_json["trigger"].nil?
        trigger = parsed_json["trigger"].to_json
        trigger = Vellum::VellumCodeResourceDefinition.from_json(json_object: trigger)
      else
        trigger = nil
      end
      new(
        workflow_definition: workflow_definition,
        inputs: inputs,
        trigger: trigger,
        additional_properties: struct
      )
    end
# Serialize an instance of WorkflowExecutionInitiatedBody to a JSON object
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
      obj.inputs.is_a?(Hash) != false || raise("Passed value for field obj.inputs is not the expected type, validation failed.")
      obj.trigger.nil? || Vellum::VellumCodeResourceDefinition.validate_raw(obj: obj.trigger)
    end
  end
end