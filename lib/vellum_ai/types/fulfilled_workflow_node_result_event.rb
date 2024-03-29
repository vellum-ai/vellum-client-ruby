# frozen_string_literal: true

require "date"
require_relative "workflow_node_result_data"
require_relative "node_output_compiled_value"
require "json"

module Vellum
  # An event that indicates that the node has fulfilled its execution.
  class FulfilledWorkflowNodeResultEvent
    attr_reader :id, :node_id, :node_result_id, :ts, :data, :source_execution_id, :output_values, :mocked,
                :additional_properties

    # @param id [String]
    # @param node_id [String]
    # @param node_result_id [String]
    # @param ts [DateTime]
    # @param data [WorkflowNodeResultData]
    # @param source_execution_id [String]
    # @param output_values [Array<NodeOutputCompiledValue>]
    # @param mocked [Boolean]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [FulfilledWorkflowNodeResultEvent]
    def initialize(id:, node_id:, node_result_id:, ts: nil, data: nil, source_execution_id: nil, output_values: nil,
                   mocked: nil, additional_properties: nil)
      # @type [String]
      @id = id
      # @type [String]
      @node_id = node_id
      # @type [String]
      @node_result_id = node_result_id
      # @type [DateTime]
      @ts = ts
      # @type [WorkflowNodeResultData]
      @data = data
      # @type [String]
      @source_execution_id = source_execution_id
      # @type [Array<NodeOutputCompiledValue>]
      @output_values = output_values
      # @type [Boolean]
      @mocked = mocked
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of FulfilledWorkflowNodeResultEvent
    #
    # @param json_object [JSON]
    # @return [FulfilledWorkflowNodeResultEvent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = struct.id
      node_id = struct.node_id
      node_result_id = struct.node_result_id
      ts = DateTime.parse(parsed_json["ts"])
      if parsed_json["data"].nil?
        data = nil
      else
        data = parsed_json["data"].to_json
        data = WorkflowNodeResultData.from_json(json_object: data)
      end
      source_execution_id = struct.source_execution_id
      output_values = parsed_json["output_values"].map do |v|
        v = v.to_json
        NodeOutputCompiledValue.from_json(json_object: v)
      end
      mocked = struct.mocked
      new(id: id, node_id: node_id, node_result_id: node_result_id, ts: ts, data: data,
          source_execution_id: source_execution_id, output_values: output_values, mocked: mocked, additional_properties: struct)
    end

    # Serialize an instance of FulfilledWorkflowNodeResultEvent to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      {
        "id": @id,
        "node_id": @node_id,
        "node_result_id": @node_result_id,
        "ts": @ts,
        "data": @data,
        "source_execution_id": @source_execution_id,
        "output_values": @output_values,
        "mocked": @mocked
      }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.node_id.is_a?(String) != false || raise("Passed value for field obj.node_id is not the expected type, validation failed.")
      obj.node_result_id.is_a?(String) != false || raise("Passed value for field obj.node_result_id is not the expected type, validation failed.")
      obj.ts&.is_a?(DateTime) != false || raise("Passed value for field obj.ts is not the expected type, validation failed.")
      obj.data.nil? || WorkflowNodeResultData.validate_raw(obj: obj.data)
      obj.source_execution_id&.is_a?(String) != false || raise("Passed value for field obj.source_execution_id is not the expected type, validation failed.")
      obj.output_values&.is_a?(Array) != false || raise("Passed value for field obj.output_values is not the expected type, validation failed.")
      obj.mocked&.is_a?(Boolean) != false || raise("Passed value for field obj.mocked is not the expected type, validation failed.")
    end
  end
end
