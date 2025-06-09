# frozen_string_literal: true
require_relative "workflow_node_result_event_state"
require "date"
require_relative "workflow_result_event_output_data"
require_relative "workflow_event_error"
require_relative "workflow_output"
require_relative "execution_vellum_value"
require "ostruct"
require "json"

module Vellum
  class WorkflowResultEvent
  # @return [String] 
    attr_reader :id
  # @return [Vellum::WorkflowNodeResultEventState] 
    attr_reader :state
  # @return [DateTime] 
    attr_reader :ts
  # @return [Vellum::WorkflowResultEventOutputData] 
    attr_reader :output
  # @return [Vellum::WorkflowEventError] 
    attr_reader :error
  # @return [Array<Vellum::WorkflowOutput>] 
    attr_reader :outputs
  # @return [Array<Vellum::ExecutionVellumValue>] 
    attr_reader :inputs
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param state [Vellum::WorkflowNodeResultEventState] 
    # @param ts [DateTime] 
    # @param output [Vellum::WorkflowResultEventOutputData] 
    # @param error [Vellum::WorkflowEventError] 
    # @param outputs [Array<Vellum::WorkflowOutput>] 
    # @param inputs [Array<Vellum::ExecutionVellumValue>] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::WorkflowResultEvent]
    def initialize(id:, state:, ts:, output: OMIT, error: OMIT, outputs: OMIT, inputs: OMIT, additional_properties: nil)
      @id = id
      @state = state
      @ts = ts
      @output = output if output != OMIT
      @error = error if error != OMIT
      @outputs = outputs if outputs != OMIT
      @inputs = inputs if inputs != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "state": state, "ts": ts, "output": output, "error": error, "outputs": outputs, "inputs": inputs }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of WorkflowResultEvent
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowResultEvent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      state = parsed_json["state"]
      ts = unless parsed_json["ts"].nil?
  DateTime.parse(parsed_json["ts"])
else
  nil
end
      unless parsed_json["output"].nil?
        output = parsed_json["output"].to_json
        output = Vellum::WorkflowResultEventOutputData.from_json(json_object: output)
      else
        output = nil
      end
      unless parsed_json["error"].nil?
        error = parsed_json["error"].to_json
        error = Vellum::WorkflowEventError.from_json(json_object: error)
      else
        error = nil
      end
      outputs = parsed_json["outputs"]&.map do | item |
  item = item.to_json
  Vellum::WorkflowOutput.from_json(json_object: item)
end
      inputs = parsed_json["inputs"]&.map do | item |
  item = item.to_json
  Vellum::ExecutionVellumValue.from_json(json_object: item)
end
      new(
        id: id,
        state: state,
        ts: ts,
        output: output,
        error: error,
        outputs: outputs,
        inputs: inputs,
        additional_properties: struct
      )
    end
# Serialize an instance of WorkflowResultEvent to a JSON object
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
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.state.is_a?(Vellum::WorkflowNodeResultEventState) != false || raise("Passed value for field obj.state is not the expected type, validation failed.")
      obj.ts.is_a?(DateTime) != false || raise("Passed value for field obj.ts is not the expected type, validation failed.")
      obj.output.nil? || Vellum::WorkflowResultEventOutputData.validate_raw(obj: obj.output)
      obj.error.nil? || Vellum::WorkflowEventError.validate_raw(obj: obj.error)
      obj.outputs&.is_a?(Array) != false || raise("Passed value for field obj.outputs is not the expected type, validation failed.")
      obj.inputs&.is_a?(Array) != false || raise("Passed value for field obj.inputs is not the expected type, validation failed.")
    end
  end
end