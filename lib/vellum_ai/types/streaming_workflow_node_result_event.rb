# frozen_string_literal: true

require "date"
require_relative "workflow_node_result_data"
require_relative "node_output_compiled_value"
require "json"

module Vellum
  # An event that indicates that the node has execution is in progress.
  class StreamingWorkflowNodeResultEvent
    attr_reader :id, :node_id, :node_result_id, :ts, :data, :output, :output_index, :additional_properties

    # @param id [String]
    # @param node_id [String]
    # @param node_result_id [String]
    # @param ts [DateTime]
    # @param data [WorkflowNodeResultData]
    # @param output [NodeOutputCompiledValue]
    # @param output_index [Integer]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [StreamingWorkflowNodeResultEvent]
    def initialize(id:, node_id:, node_result_id:, ts: nil, data: nil, output: nil, output_index: nil,
                   additional_properties: nil)
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
      # @type [NodeOutputCompiledValue]
      @output = output
      # @type [Integer]
      @output_index = output_index
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of StreamingWorkflowNodeResultEvent
    #
    # @param json_object [JSON]
    # @return [StreamingWorkflowNodeResultEvent]
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
      if parsed_json["output"].nil?
        output = nil
      else
        output = parsed_json["output"].to_json
        output = NodeOutputCompiledValue.from_json(json_object: output)
      end
      output_index = struct.output_index
      new(id: id, node_id: node_id, node_result_id: node_result_id, ts: ts, data: data, output: output,
          output_index: output_index, additional_properties: struct)
    end

    # Serialize an instance of StreamingWorkflowNodeResultEvent to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      {
        "id": @id,
        "node_id": @node_id,
        "node_result_id": @node_result_id,
        "ts": @ts,
        "data": @data,
        "output": @output,
        "output_index": @output_index
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
      obj.output.nil? || NodeOutputCompiledValue.validate_raw(obj: obj.output)
      obj.output_index&.is_a?(Integer) != false || raise("Passed value for field obj.output_index is not the expected type, validation failed.")
    end
  end
end
