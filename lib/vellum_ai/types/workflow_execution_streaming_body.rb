# frozen_string_literal: true
require_relative "vellum_code_resource_definition"
require_relative "base_output"
require "ostruct"
require "json"

module Vellum
  class WorkflowExecutionStreamingBody
  # @return [Vellum::VellumCodeResourceDefinition] 
    attr_reader :workflow_definition
  # @return [Vellum::BaseOutput] 
    attr_reader :output
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param workflow_definition [Vellum::VellumCodeResourceDefinition] 
    # @param output [Vellum::BaseOutput] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::WorkflowExecutionStreamingBody]
    def initialize(workflow_definition:, output:, additional_properties: nil)
      @workflow_definition = workflow_definition
      @output = output
      @additional_properties = additional_properties
      @_field_set = { "workflow_definition": workflow_definition, "output": output }
    end
# Deserialize a JSON object to an instance of WorkflowExecutionStreamingBody
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowExecutionStreamingBody]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["workflow_definition"].nil?
        workflow_definition = parsed_json["workflow_definition"].to_json
        workflow_definition = Vellum::VellumCodeResourceDefinition.from_json(json_object: workflow_definition)
      else
        workflow_definition = nil
      end
      unless parsed_json["output"].nil?
        output = parsed_json["output"].to_json
        output = Vellum::BaseOutput.from_json(json_object: output)
      else
        output = nil
      end
      new(
        workflow_definition: workflow_definition,
        output: output,
        additional_properties: struct
      )
    end
# Serialize an instance of WorkflowExecutionStreamingBody to a JSON object
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
      Vellum::BaseOutput.validate_raw(obj: obj.output)
    end
  end
end