# frozen_string_literal: true
require_relative "vellum_code_resource_definition"
require "ostruct"
require "json"

module Vellum
  class WorkflowExecutionFulfilledBody
  # @return [Vellum::VellumCodeResourceDefinition] 
    attr_reader :workflow_definition
  # @return [Hash{String => Object}] 
    attr_reader :outputs
  # @return [Hash{String => Object}] 
    attr_reader :final_state
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param workflow_definition [Vellum::VellumCodeResourceDefinition] 
    # @param outputs [Hash{String => Object}] 
    # @param final_state [Hash{String => Object}] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::WorkflowExecutionFulfilledBody]
    def initialize(workflow_definition:, outputs:, final_state: OMIT, additional_properties: nil)
      @workflow_definition = workflow_definition
      @outputs = outputs
      @final_state = final_state if final_state != OMIT
      @additional_properties = additional_properties
      @_field_set = { "workflow_definition": workflow_definition, "outputs": outputs, "final_state": final_state }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of WorkflowExecutionFulfilledBody
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowExecutionFulfilledBody]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["workflow_definition"].nil?
        workflow_definition = parsed_json["workflow_definition"].to_json
        workflow_definition = Vellum::VellumCodeResourceDefinition.from_json(json_object: workflow_definition)
      else
        workflow_definition = nil
      end
      outputs = parsed_json["outputs"]
      final_state = parsed_json["final_state"]
      new(
        workflow_definition: workflow_definition,
        outputs: outputs,
        final_state: final_state,
        additional_properties: struct
      )
    end
# Serialize an instance of WorkflowExecutionFulfilledBody to a JSON object
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
      obj.outputs.is_a?(Hash) != false || raise("Passed value for field obj.outputs is not the expected type, validation failed.")
      obj.final_state&.is_a?(Hash) != false || raise("Passed value for field obj.final_state is not the expected type, validation failed.")
    end
  end
end