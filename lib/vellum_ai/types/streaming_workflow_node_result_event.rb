# frozen_string_literal: true
require "date"
require_relative "workflow_node_result_data"
require_relative "node_output_compiled_value"
require "ostruct"
require "json"

module Vellum
# An event that indicates that the node has execution is in progress.
  class StreamingWorkflowNodeResultEvent
  # @return [String] 
    attr_reader :id
  # @return [String] 
    attr_reader :node_id
  # @return [String] 
    attr_reader :node_result_id
  # @return [String] 
    attr_reader :state
  # @return [DateTime] 
    attr_reader :ts
  # @return [Vellum::WorkflowNodeResultData] 
    attr_reader :data
  # @return [String] 
    attr_reader :source_execution_id
  # @return [Vellum::NodeOutputCompiledValue] 
    attr_reader :output
  # @return [Integer] 
    attr_reader :output_index
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param node_id [String] 
    # @param node_result_id [String] 
    # @param state [String] 
    # @param ts [DateTime] 
    # @param data [Vellum::WorkflowNodeResultData] 
    # @param source_execution_id [String] 
    # @param output [Vellum::NodeOutputCompiledValue] 
    # @param output_index [Integer] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::StreamingWorkflowNodeResultEvent]
    def initialize(id:, node_id:, node_result_id:, state:, ts: OMIT, data: OMIT, source_execution_id: OMIT, output: OMIT, output_index: OMIT, additional_properties: nil)
      @id = id
      @node_id = node_id
      @node_result_id = node_result_id
      @state = state
      @ts = ts if ts != OMIT
      @data = data if data != OMIT
      @source_execution_id = source_execution_id if source_execution_id != OMIT
      @output = output if output != OMIT
      @output_index = output_index if output_index != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "node_id": node_id, "node_result_id": node_result_id, "state": state, "ts": ts, "data": data, "source_execution_id": source_execution_id, "output": output, "output_index": output_index }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of StreamingWorkflowNodeResultEvent
    #
    # @param json_object [String] 
    # @return [Vellum::StreamingWorkflowNodeResultEvent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      node_id = parsed_json["node_id"]
      node_result_id = parsed_json["node_result_id"]
      state = parsed_json["state"]
      ts = unless parsed_json["ts"].nil?
  DateTime.parse(parsed_json["ts"])
else
  nil
end
      unless parsed_json["data"].nil?
        data = parsed_json["data"].to_json
        data = Vellum::WorkflowNodeResultData.from_json(json_object: data)
      else
        data = nil
      end
      source_execution_id = parsed_json["source_execution_id"]
      unless parsed_json["output"].nil?
        output = parsed_json["output"].to_json
        output = Vellum::NodeOutputCompiledValue.from_json(json_object: output)
      else
        output = nil
      end
      output_index = parsed_json["output_index"]
      new(
        id: id,
        node_id: node_id,
        node_result_id: node_result_id,
        state: state,
        ts: ts,
        data: data,
        source_execution_id: source_execution_id,
        output: output,
        output_index: output_index,
        additional_properties: struct
      )
    end
# Serialize an instance of StreamingWorkflowNodeResultEvent to a JSON object
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
      obj.node_id.is_a?(String) != false || raise("Passed value for field obj.node_id is not the expected type, validation failed.")
      obj.node_result_id.is_a?(String) != false || raise("Passed value for field obj.node_result_id is not the expected type, validation failed.")
      obj.state.is_a?(String) != false || raise("Passed value for field obj.state is not the expected type, validation failed.")
      obj.ts&.is_a?(DateTime) != false || raise("Passed value for field obj.ts is not the expected type, validation failed.")
      obj.data.nil? || Vellum::WorkflowNodeResultData.validate_raw(obj: obj.data)
      obj.source_execution_id&.is_a?(String) != false || raise("Passed value for field obj.source_execution_id is not the expected type, validation failed.")
      obj.output.nil? || Vellum::NodeOutputCompiledValue.validate_raw(obj: obj.output)
      obj.output_index&.is_a?(Integer) != false || raise("Passed value for field obj.output_index is not the expected type, validation failed.")
    end
  end
end