# frozen_string_literal: true
require_relative "workflow_node_result_event_state"
require_relative "chat_message"
require "ostruct"
require "json"

module Vellum
# A Chat History output streamed from a Workflow execution.
  class WorkflowResultEventOutputDataChatHistory
  # @return [String] 
    attr_reader :id
  # @return [String] 
    attr_reader :name
  # @return [Vellum::WorkflowNodeResultEventState] 
    attr_reader :state
  # @return [String] 
    attr_reader :node_id
  # @return [String] The newly output string value. Only relevant for string outputs with a state of
#  STREAMING.
    attr_reader :delta
  # @return [Array<Vellum::ChatMessage>] 
    attr_reader :value
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param name [String] 
    # @param state [Vellum::WorkflowNodeResultEventState] 
    # @param node_id [String] 
    # @param delta [String] The newly output string value. Only relevant for string outputs with a state of
#  STREAMING.
    # @param value [Array<Vellum::ChatMessage>] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::WorkflowResultEventOutputDataChatHistory]
    def initialize(id: OMIT, name:, state:, node_id: OMIT, delta: OMIT, value: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @name = name
      @state = state
      @node_id = node_id if node_id != OMIT
      @delta = delta if delta != OMIT
      @value = value if value != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "name": name, "state": state, "node_id": node_id, "delta": delta, "value": value }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  WorkflowResultEventOutputDataChatHistory
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowResultEventOutputDataChatHistory]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      name = parsed_json["name"]
      state = parsed_json["state"]
      node_id = parsed_json["node_id"]
      delta = parsed_json["delta"]
      value = parsed_json["value"]&.map do | item |
  item = item.to_json
  Vellum::ChatMessage.from_json(json_object: item)
end
      new(
        id: id,
        name: name,
        state: state,
        node_id: node_id,
        delta: delta,
        value: value,
        additional_properties: struct
      )
    end
# Serialize an instance of WorkflowResultEventOutputDataChatHistory to a JSON
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
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.state.is_a?(Vellum::WorkflowNodeResultEventState) != false || raise("Passed value for field obj.state is not the expected type, validation failed.")
      obj.node_id&.is_a?(String) != false || raise("Passed value for field obj.node_id is not the expected type, validation failed.")
      obj.delta&.is_a?(String) != false || raise("Passed value for field obj.delta is not the expected type, validation failed.")
      obj.value&.is_a?(Array) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
    end
  end
end