# frozen_string_literal: true

require_relative "workflow_node_result_event_state"
require_relative "search_result"
require "json"

module Vellum
  # A Search Results output streamed from a Workflow execution.
  class WorkflowResultEventOutputDataSearchResults
    attr_reader :id, :name, :state, :node_id, :delta, :value, :additional_properties

    # @param id [String]
    # @param name [String]
    # @param state [WORKFLOW_NODE_RESULT_EVENT_STATE]
    # @param node_id [String]
    # @param delta [String] The newly output string value. Only relevant for string outputs with a state of STREAMING.
    # @param value [Array<SearchResult>]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [WorkflowResultEventOutputDataSearchResults]
    def initialize(name:, state:, node_id:, id: nil, delta: nil, value: nil, additional_properties: nil)
      # @type [String]
      @id = id
      # @type [String]
      @name = name
      # @type [WORKFLOW_NODE_RESULT_EVENT_STATE]
      @state = state
      # @type [String]
      @node_id = node_id
      # @type [String] The newly output string value. Only relevant for string outputs with a state of STREAMING.
      @delta = delta
      # @type [Array<SearchResult>]
      @value = value
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of WorkflowResultEventOutputDataSearchResults
    #
    # @param json_object [JSON]
    # @return [WorkflowResultEventOutputDataSearchResults]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = struct.id
      name = struct.name
      state = WORKFLOW_NODE_RESULT_EVENT_STATE.key(parsed_json["state"]) || parsed_json["state"]
      node_id = struct.node_id
      delta = struct.delta
      value = parsed_json["value"].map do |v|
        v = v.to_json
        SearchResult.from_json(json_object: v)
      end
      new(id: id, name: name, state: state, node_id: node_id, delta: delta, value: value, additional_properties: struct)
    end

    # Serialize an instance of WorkflowResultEventOutputDataSearchResults to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      {
        "id": @id,
        "name": @name,
        "state": WORKFLOW_NODE_RESULT_EVENT_STATE[@state] || @state,
        "node_id": @node_id,
        "delta": @delta,
        "value": @value
      }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.state.is_a?(WORKFLOW_NODE_RESULT_EVENT_STATE) != false || raise("Passed value for field obj.state is not the expected type, validation failed.")
      obj.node_id.is_a?(String) != false || raise("Passed value for field obj.node_id is not the expected type, validation failed.")
      obj.delta&.is_a?(String) != false || raise("Passed value for field obj.delta is not the expected type, validation failed.")
      obj.value&.is_a?(Array) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
    end
  end
end
