# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
  class NodeInputCompiledJSONValue
  # @return [String] 
    attr_reader :node_input_id
  # @return [String] 
    attr_reader :key
  # @return [Object] 
    attr_reader :value
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param node_input_id [String] 
    # @param key [String] 
    # @param value [Object] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::NodeInputCompiledJSONValue]
    def initialize(node_input_id:, key:, value: OMIT, additional_properties: nil)
      @node_input_id = node_input_id
      @key = key
      @value = value if value != OMIT
      @additional_properties = additional_properties
      @_field_set = { "node_input_id": node_input_id, "key": key, "value": value }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of NodeInputCompiledJSONValue
    #
    # @param json_object [String] 
    # @return [Vellum::NodeInputCompiledJSONValue]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      node_input_id = parsed_json["node_input_id"]
      key = parsed_json["key"]
      value = parsed_json["value"]
      new(
        node_input_id: node_input_id,
        key: key,
        value: value,
        additional_properties: struct
      )
    end
# Serialize an instance of NodeInputCompiledJSONValue to a JSON object
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
      obj.node_input_id.is_a?(String) != false || raise("Passed value for field obj.node_input_id is not the expected type, validation failed.")
      obj.key.is_a?(String) != false || raise("Passed value for field obj.key is not the expected type, validation failed.")
      obj.value&.is_a?(Object) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
    end
  end
end