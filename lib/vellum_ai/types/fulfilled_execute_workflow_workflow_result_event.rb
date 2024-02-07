# frozen_string_literal: true

require "date"
require_relative "workflow_output"
require "json"

module Vellum
  # The successful response from the Workflow execution containing the produced outputs.
  class FulfilledExecuteWorkflowWorkflowResultEvent
    attr_reader :id, :ts, :outputs, :additional_properties

    # @param id [String]
    # @param ts [DateTime]
    # @param outputs [Array<WorkflowOutput>]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [FulfilledExecuteWorkflowWorkflowResultEvent]
    def initialize(id:, ts:, outputs:, additional_properties: nil)
      # @type [String]
      @id = id
      # @type [DateTime]
      @ts = ts
      # @type [Array<WorkflowOutput>]
      @outputs = outputs
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of FulfilledExecuteWorkflowWorkflowResultEvent
    #
    # @param json_object [JSON]
    # @return [FulfilledExecuteWorkflowWorkflowResultEvent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = struct.id
      ts = DateTime.parse(parsed_json["ts"])
      outputs = parsed_json["outputs"].map do |v|
        v = v.to_json
        WorkflowOutput.from_json(json_object: v)
      end
      new(id: id, ts: ts, outputs: outputs, additional_properties: struct)
    end

    # Serialize an instance of FulfilledExecuteWorkflowWorkflowResultEvent to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "id": @id, "ts": @ts, "outputs": @outputs }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.ts.is_a?(DateTime) != false || raise("Passed value for field obj.ts is not the expected type, validation failed.")
      obj.outputs.is_a?(Array) != false || raise("Passed value for field obj.outputs is not the expected type, validation failed.")
    end
  end
end
