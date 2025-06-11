# frozen_string_literal: true
require "date"
require_relative "workflow_node_result_data"
require_relative "workflow_event_error"
require "ostruct"
require "json"

module Vellum
# An event that indicates that the node has rejected its execution.
  class RejectedWorkflowNodeResultEvent
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
  # @return [Vellum::WorkflowEventError] 
    attr_reader :error
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
    # @param error [Vellum::WorkflowEventError] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::RejectedWorkflowNodeResultEvent]
    def initialize(id:, node_id:, node_result_id:, state:, ts: OMIT, data: OMIT, source_execution_id: OMIT, error:, additional_properties: nil)
      @id = id
      @node_id = node_id
      @node_result_id = node_result_id
      @state = state
      @ts = ts if ts != OMIT
      @data = data if data != OMIT
      @source_execution_id = source_execution_id if source_execution_id != OMIT
      @error = error
      @additional_properties = additional_properties
      @_field_set = { "id": id, "node_id": node_id, "node_result_id": node_result_id, "state": state, "ts": ts, "data": data, "source_execution_id": source_execution_id, "error": error }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of RejectedWorkflowNodeResultEvent
    #
    # @param json_object [String] 
    # @return [Vellum::RejectedWorkflowNodeResultEvent]
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
      unless parsed_json["error"].nil?
        error = parsed_json["error"].to_json
        error = Vellum::WorkflowEventError.from_json(json_object: error)
      else
        error = nil
      end
      new(
        id: id,
        node_id: node_id,
        node_result_id: node_result_id,
        state: state,
        ts: ts,
        data: data,
        source_execution_id: source_execution_id,
        error: error,
        additional_properties: struct
      )
    end
# Serialize an instance of RejectedWorkflowNodeResultEvent to a JSON object
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
      Vellum::WorkflowEventError.validate_raw(obj: obj.error)
    end
  end
end