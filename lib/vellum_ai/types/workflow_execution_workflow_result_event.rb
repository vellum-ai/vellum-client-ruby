# frozen_string_literal: true

require_relative "workflow_result_event"
require "json"

module Vellum
  # A WORKFLOW-level event emitted from the workflow's execution.
  class WorkflowExecutionWorkflowResultEvent
    attr_reader :execution_id, :run_id, :external_id, :data, :additional_properties

    # @param execution_id [String]
    # @param run_id [String]
    # @param external_id [String]
    # @param data [WorkflowResultEvent]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [WorkflowExecutionWorkflowResultEvent]
    def initialize(execution_id:, data:, run_id: nil, external_id: nil, additional_properties: nil)
      # @type [String]
      @execution_id = execution_id
      # @type [String]
      @run_id = run_id
      # @type [String]
      @external_id = external_id
      # @type [WorkflowResultEvent]
      @data = data
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of WorkflowExecutionWorkflowResultEvent
    #
    # @param json_object [JSON]
    # @return [WorkflowExecutionWorkflowResultEvent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      execution_id = struct.execution_id
      run_id = struct.run_id
      external_id = struct.external_id
      if parsed_json["data"].nil?
        data = nil
      else
        data = parsed_json["data"].to_json
        data = WorkflowResultEvent.from_json(json_object: data)
      end
      new(execution_id: execution_id, run_id: run_id, external_id: external_id, data: data,
          additional_properties: struct)
    end

    # Serialize an instance of WorkflowExecutionWorkflowResultEvent to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "execution_id": @execution_id, "run_id": @run_id, "external_id": @external_id, "data": @data }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.execution_id.is_a?(String) != false || raise("Passed value for field obj.execution_id is not the expected type, validation failed.")
      obj.run_id&.is_a?(String) != false || raise("Passed value for field obj.run_id is not the expected type, validation failed.")
      obj.external_id&.is_a?(String) != false || raise("Passed value for field obj.external_id is not the expected type, validation failed.")
      WorkflowResultEvent.validate_raw(obj: obj.data)
    end
  end
end
