# frozen_string_literal: true
require "date"
require_relative "workflow_node_result_data"
require_relative "node_input_variable_compiled_value"
require "ostruct"
require "json"

module Vellum
# An event that indicates that the node has initiated its execution.
  class InitiatedWorkflowNodeResultEvent
  # @return [String] 
    attr_reader :id
  # @return [String] 
    attr_reader :node_id
  # @return [String] 
    attr_reader :node_result_id
  # @return [DateTime] 
    attr_reader :ts
  # @return [Vellum::WorkflowNodeResultData] 
    attr_reader :data
  # @return [String] 
    attr_reader :source_execution_id
  # @return [Array<Vellum::NodeInputVariableCompiledValue>] 
    attr_reader :input_values
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param node_id [String] 
    # @param node_result_id [String] 
    # @param ts [DateTime] 
    # @param data [Vellum::WorkflowNodeResultData] 
    # @param source_execution_id [String] 
    # @param input_values [Array<Vellum::NodeInputVariableCompiledValue>] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::InitiatedWorkflowNodeResultEvent]
    def initialize(id:, node_id:, node_result_id:, ts: OMIT, data: OMIT, source_execution_id: OMIT, input_values: OMIT, additional_properties: nil)
      @id = id
      @node_id = node_id
      @node_result_id = node_result_id
      @ts = ts if ts != OMIT
      @data = data if data != OMIT
      @source_execution_id = source_execution_id if source_execution_id != OMIT
      @input_values = input_values if input_values != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "node_id": node_id, "node_result_id": node_result_id, "ts": ts, "data": data, "source_execution_id": source_execution_id, "input_values": input_values }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of InitiatedWorkflowNodeResultEvent
    #
    # @param json_object [String] 
    # @return [Vellum::InitiatedWorkflowNodeResultEvent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      node_id = parsed_json["node_id"]
      node_result_id = parsed_json["node_result_id"]
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
      input_values = parsed_json["input_values"]&.map do | item |
  item = item.to_json
  Vellum::NodeInputVariableCompiledValue.from_json(json_object: item)
end
      new(
        id: id,
        node_id: node_id,
        node_result_id: node_result_id,
        ts: ts,
        data: data,
        source_execution_id: source_execution_id,
        input_values: input_values,
        additional_properties: struct
      )
    end
# Serialize an instance of InitiatedWorkflowNodeResultEvent to a JSON object
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
      obj.ts&.is_a?(DateTime) != false || raise("Passed value for field obj.ts is not the expected type, validation failed.")
      obj.data.nil? || Vellum::WorkflowNodeResultData.validate_raw(obj: obj.data)
      obj.source_execution_id&.is_a?(String) != false || raise("Passed value for field obj.source_execution_id is not the expected type, validation failed.")
      obj.input_values&.is_a?(Array) != false || raise("Passed value for field obj.input_values is not the expected type, validation failed.")
    end
  end
end