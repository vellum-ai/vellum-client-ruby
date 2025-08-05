# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
  class NodeExecutionSpanAttributes
  # @return [String] 
    attr_reader :label
  # @return [String] 
    attr_reader :node_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param label [String] 
    # @param node_id [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::NodeExecutionSpanAttributes]
    def initialize(label:, node_id:, additional_properties: nil)
      @label = label
      @node_id = node_id
      @additional_properties = additional_properties
      @_field_set = { "label": label, "node_id": node_id }
    end
# Deserialize a JSON object to an instance of NodeExecutionSpanAttributes
    #
    # @param json_object [String] 
    # @return [Vellum::NodeExecutionSpanAttributes]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      label = parsed_json["label"]
      node_id = parsed_json["node_id"]
      new(
        label: label,
        node_id: node_id,
        additional_properties: struct
      )
    end
# Serialize an instance of NodeExecutionSpanAttributes to a JSON object
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
      obj.label.is_a?(String) != false || raise("Passed value for field obj.label is not the expected type, validation failed.")
      obj.node_id.is_a?(String) != false || raise("Passed value for field obj.node_id is not the expected type, validation failed.")
    end
  end
end