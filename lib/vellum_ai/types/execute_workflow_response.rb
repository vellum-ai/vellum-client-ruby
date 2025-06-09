# frozen_string_literal: true
require_relative "execute_workflow_workflow_result_event"
require "ostruct"
require "json"

module Vellum
  class ExecuteWorkflowResponse
  # @return [String] 
    attr_reader :execution_id
  # @return [String] 
    attr_reader :run_id
  # @return [String] 
    attr_reader :external_id
  # @return [Vellum::ExecuteWorkflowWorkflowResultEvent] 
    attr_reader :data
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param execution_id [String] 
    # @param run_id [String] 
    # @param external_id [String] 
    # @param data [Vellum::ExecuteWorkflowWorkflowResultEvent] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::ExecuteWorkflowResponse]
    def initialize(execution_id:, run_id: OMIT, external_id: OMIT, data:, additional_properties: nil)
      @execution_id = execution_id
      @run_id = run_id if run_id != OMIT
      @external_id = external_id if external_id != OMIT
      @data = data
      @additional_properties = additional_properties
      @_field_set = { "execution_id": execution_id, "run_id": run_id, "external_id": external_id, "data": data }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ExecuteWorkflowResponse
    #
    # @param json_object [String] 
    # @return [Vellum::ExecuteWorkflowResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      execution_id = parsed_json["execution_id"]
      run_id = parsed_json["run_id"]
      external_id = parsed_json["external_id"]
      unless parsed_json["data"].nil?
        data = parsed_json["data"].to_json
        data = Vellum::ExecuteWorkflowWorkflowResultEvent.from_json(json_object: data)
      else
        data = nil
      end
      new(
        execution_id: execution_id,
        run_id: run_id,
        external_id: external_id,
        data: data,
        additional_properties: struct
      )
    end
# Serialize an instance of ExecuteWorkflowResponse to a JSON object
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
      obj.execution_id.is_a?(String) != false || raise("Passed value for field obj.execution_id is not the expected type, validation failed.")
      obj.run_id&.is_a?(String) != false || raise("Passed value for field obj.run_id is not the expected type, validation failed.")
      obj.external_id&.is_a?(String) != false || raise("Passed value for field obj.external_id is not the expected type, validation failed.")
      Vellum::ExecuteWorkflowWorkflowResultEvent.validate_raw(obj: obj.data)
    end
  end
end