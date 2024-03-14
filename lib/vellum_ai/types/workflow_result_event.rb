# frozen_string_literal: true

require_relative "workflow_node_result_event_state"
require "date"
require_relative "workflow_result_event_output_data"
require_relative "workflow_event_error"
require_relative "workflow_output"
require_relative "execution_vellum_value"
require "json"

module Vellum
  class WorkflowResultEvent
    attr_reader :id, :state, :ts, :output, :error, :outputs, :inputs, :additional_properties

    # @param id [String]
    # @param state [WORKFLOW_NODE_RESULT_EVENT_STATE]
    # @param ts [DateTime]
    # @param output [WorkflowResultEventOutputData]
    # @param error [WorkflowEventError]
    # @param outputs [Array<WorkflowOutput>]
    # @param inputs [Array<ExecutionVellumValue>]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [WorkflowResultEvent]
    def initialize(id:, state:, ts:, output: nil, error: nil, outputs: nil, inputs: nil, additional_properties: nil)
      # @type [String]
      @id = id
      # @type [WORKFLOW_NODE_RESULT_EVENT_STATE]
      @state = state
      # @type [DateTime]
      @ts = ts
      # @type [WorkflowResultEventOutputData]
      @output = output
      # @type [WorkflowEventError]
      @error = error
      # @type [Array<WorkflowOutput>]
      @outputs = outputs
      # @type [Array<ExecutionVellumValue>]
      @inputs = inputs
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of WorkflowResultEvent
    #
    # @param json_object [JSON]
    # @return [WorkflowResultEvent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = struct.id
      state = WORKFLOW_NODE_RESULT_EVENT_STATE.key(parsed_json["state"]) || parsed_json["state"]
      ts = DateTime.parse(parsed_json["ts"])
      if parsed_json["output"].nil?
        output = nil
      else
        output = parsed_json["output"].to_json
        output = WorkflowResultEventOutputData.from_json(json_object: output)
      end
      if parsed_json["error"].nil?
        error = nil
      else
        error = parsed_json["error"].to_json
        error = WorkflowEventError.from_json(json_object: error)
      end
      outputs = parsed_json["outputs"].map do |v|
        v = v.to_json
        WorkflowOutput.from_json(json_object: v)
      end
      inputs = parsed_json["inputs"].map do |v|
        v = v.to_json
        ExecutionVellumValue.from_json(json_object: v)
      end
      new(id: id, state: state, ts: ts, output: output, error: error, outputs: outputs, inputs: inputs,
          additional_properties: struct)
    end

    # Serialize an instance of WorkflowResultEvent to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      {
        "id": @id,
        "state": WORKFLOW_NODE_RESULT_EVENT_STATE[@state] || @state,
        "ts": @ts,
        "output": @output,
        "error": @error,
        "outputs": @outputs,
        "inputs": @inputs
      }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.state.is_a?(WORKFLOW_NODE_RESULT_EVENT_STATE) != false || raise("Passed value for field obj.state is not the expected type, validation failed.")
      obj.ts.is_a?(DateTime) != false || raise("Passed value for field obj.ts is not the expected type, validation failed.")
      obj.output.nil? || WorkflowResultEventOutputData.validate_raw(obj: obj.output)
      obj.error.nil? || WorkflowEventError.validate_raw(obj: obj.error)
      obj.outputs&.is_a?(Array) != false || raise("Passed value for field obj.outputs is not the expected type, validation failed.")
      obj.inputs&.is_a?(Array) != false || raise("Passed value for field obj.inputs is not the expected type, validation failed.")
    end
  end
end
