# frozen_string_literal: true
require_relative "workflow_result_event_state"
require "ostruct"
require "json"

module Vellum
# Response serializer for workflow execution status check.
  class CheckWorkflowExecutionStatusResponse
  # @return [Vellum::WorkflowResultEventState] 
    attr_reader :status
  # @return [Hash{String => Object}] 
    attr_reader :outputs
  # @return [String] 
    attr_reader :execution_id
  # @return [String] 
    attr_reader :execution_detail_url
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param status [Vellum::WorkflowResultEventState] 
    # @param outputs [Hash{String => Object}] 
    # @param execution_id [String] 
    # @param execution_detail_url [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::CheckWorkflowExecutionStatusResponse]
    def initialize(status:, outputs: OMIT, execution_id:, execution_detail_url: OMIT, additional_properties: nil)
      @status = status
      @outputs = outputs if outputs != OMIT
      @execution_id = execution_id
      @execution_detail_url = execution_detail_url if execution_detail_url != OMIT
      @additional_properties = additional_properties
      @_field_set = { "status": status, "outputs": outputs, "execution_id": execution_id, "execution_detail_url": execution_detail_url }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CheckWorkflowExecutionStatusResponse
    #
    # @param json_object [String] 
    # @return [Vellum::CheckWorkflowExecutionStatusResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      status = parsed_json["status"]
      outputs = parsed_json["outputs"]
      execution_id = parsed_json["execution_id"]
      execution_detail_url = parsed_json["execution_detail_url"]
      new(
        status: status,
        outputs: outputs,
        execution_id: execution_id,
        execution_detail_url: execution_detail_url,
        additional_properties: struct
      )
    end
# Serialize an instance of CheckWorkflowExecutionStatusResponse to a JSON object
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
      obj.status.is_a?(Vellum::WorkflowResultEventState) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.outputs&.is_a?(Hash) != false || raise("Passed value for field obj.outputs is not the expected type, validation failed.")
      obj.execution_id.is_a?(String) != false || raise("Passed value for field obj.execution_id is not the expected type, validation failed.")
      obj.execution_detail_url&.is_a?(String) != false || raise("Passed value for field obj.execution_detail_url is not the expected type, validation failed.")
    end
  end
end