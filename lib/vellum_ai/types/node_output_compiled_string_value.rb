# frozen_string_literal: true
require_relative "workflow_node_result_event_state"
require "ostruct"
require "json"

module Vellum
# An output returned by a node that is of type STRING.
  class NodeOutputCompiledStringValue
  # @return [String] 
    attr_reader :type
  # @return [String] 
    attr_reader :value
  # @return [String] 
    attr_reader :node_output_id
  # @return [Vellum::WorkflowNodeResultEventState] 
    attr_reader :state
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String] 
    # @param value [String] 
    # @param node_output_id [String] 
    # @param state [Vellum::WorkflowNodeResultEventState] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::NodeOutputCompiledStringValue]
    def initialize(type:, value: OMIT, node_output_id:, state: OMIT, additional_properties: nil)
      @type = type
      @value = value if value != OMIT
      @node_output_id = node_output_id
      @state = state if state != OMIT
      @additional_properties = additional_properties
      @_field_set = { "type": type, "value": value, "node_output_id": node_output_id, "state": state }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of NodeOutputCompiledStringValue
    #
    # @param json_object [String] 
    # @return [Vellum::NodeOutputCompiledStringValue]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      value = parsed_json["value"]
      node_output_id = parsed_json["node_output_id"]
      state = parsed_json["state"]
      new(
        type: type,
        value: value,
        node_output_id: node_output_id,
        state: state,
        additional_properties: struct
      )
    end
# Serialize an instance of NodeOutputCompiledStringValue to a JSON object
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
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.value&.is_a?(String) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
      obj.node_output_id.is_a?(String) != false || raise("Passed value for field obj.node_output_id is not the expected type, validation failed.")
      obj.state&.is_a?(Vellum::WorkflowNodeResultEventState) != false || raise("Passed value for field obj.state is not the expected type, validation failed.")
    end
  end
end