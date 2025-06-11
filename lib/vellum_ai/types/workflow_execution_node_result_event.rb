# frozen_string_literal: true
require_relative "workflow_node_result_event"
require "ostruct"
require "json"

module Vellum
# A NODE-level event emitted from the workflow's execution.
  class WorkflowExecutionNodeResultEvent
  # @return [String] 
    attr_reader :execution_id
  # @return [String] 
    attr_reader :run_id
  # @return [String] 
    attr_reader :external_id
  # @return [String] 
    attr_reader :type
  # @return [Vellum::WorkflowNodeResultEvent] 
    attr_reader :data
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param execution_id [String] 
    # @param run_id [String] 
    # @param external_id [String] 
    # @param type [String] 
    # @param data [Vellum::WorkflowNodeResultEvent] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::WorkflowExecutionNodeResultEvent]
    def initialize(execution_id:, run_id: OMIT, external_id: OMIT, type:, data:, additional_properties: nil)
      @execution_id = execution_id
      @run_id = run_id if run_id != OMIT
      @external_id = external_id if external_id != OMIT
      @type = type
      @data = data
      @additional_properties = additional_properties
      @_field_set = { "execution_id": execution_id, "run_id": run_id, "external_id": external_id, "type": type, "data": data }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of WorkflowExecutionNodeResultEvent
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowExecutionNodeResultEvent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      execution_id = parsed_json["execution_id"]
      run_id = parsed_json["run_id"]
      external_id = parsed_json["external_id"]
      type = parsed_json["type"]
      unless parsed_json["data"].nil?
        data = parsed_json["data"].to_json
        data = Vellum::WorkflowNodeResultEvent.from_json(json_object: data)
      else
        data = nil
      end
      new(
        execution_id: execution_id,
        run_id: run_id,
        external_id: external_id,
        type: type,
        data: data,
        additional_properties: struct
      )
    end
# Serialize an instance of WorkflowExecutionNodeResultEvent to a JSON object
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
      obj.execution_id.is_a?(String) != false || raise("Passed value for field obj.execution_id is not the expected type, validation failed.")
      obj.run_id&.is_a?(String) != false || raise("Passed value for field obj.run_id is not the expected type, validation failed.")
      obj.external_id&.is_a?(String) != false || raise("Passed value for field obj.external_id is not the expected type, validation failed.")
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      Vellum::WorkflowNodeResultEvent.validate_raw(obj: obj.data)
    end
  end
end