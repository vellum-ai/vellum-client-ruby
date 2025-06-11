# frozen_string_literal: true
require "date"
require_relative "workflow_output"
require "ostruct"
require "json"

module Vellum
# The successful response from the Workflow execution containing the produced
#  outputs.
  class FulfilledExecuteWorkflowWorkflowResultEvent
  # @return [String] 
    attr_reader :id
  # @return [String] 
    attr_reader :state
  # @return [DateTime] 
    attr_reader :ts
  # @return [Array<Vellum::WorkflowOutput>] 
    attr_reader :outputs
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param state [String] 
    # @param ts [DateTime] 
    # @param outputs [Array<Vellum::WorkflowOutput>] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::FulfilledExecuteWorkflowWorkflowResultEvent]
    def initialize(id:, state:, ts:, outputs:, additional_properties: nil)
      @id = id
      @state = state
      @ts = ts
      @outputs = outputs
      @additional_properties = additional_properties
      @_field_set = { "id": id, "state": state, "ts": ts, "outputs": outputs }
    end
# Deserialize a JSON object to an instance of
#  FulfilledExecuteWorkflowWorkflowResultEvent
    #
    # @param json_object [String] 
    # @return [Vellum::FulfilledExecuteWorkflowWorkflowResultEvent]
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
      outputs = parsed_json["outputs"]&.map do | item |
  item = item.to_json
  Vellum::WorkflowOutput.from_json(json_object: item)
end
      new(
        id: id,
        state: state,
        ts: ts,
        outputs: outputs,
        additional_properties: struct
      )
    end
# Serialize an instance of FulfilledExecuteWorkflowWorkflowResultEvent to a JSON
#  object
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
      obj.state.is_a?(String) != false || raise("Passed value for field obj.state is not the expected type, validation failed.")
      obj.ts.is_a?(DateTime) != false || raise("Passed value for field obj.ts is not the expected type, validation failed.")
      obj.outputs.is_a?(Array) != false || raise("Passed value for field obj.outputs is not the expected type, validation failed.")
    end
  end
end