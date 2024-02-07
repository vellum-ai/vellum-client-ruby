# frozen_string_literal: true

require "json"

module Vellum
  class NodeInputCompiledStringValue
    attr_reader :node_input_id, :key, :value, :additional_properties

    # @param node_input_id [String]
    # @param key [String]
    # @param value [String]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [NodeInputCompiledStringValue]
    def initialize(node_input_id:, key:, value: nil, additional_properties: nil)
      # @type [String]
      @node_input_id = node_input_id
      # @type [String]
      @key = key
      # @type [String]
      @value = value
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of NodeInputCompiledStringValue
    #
    # @param json_object [JSON]
    # @return [NodeInputCompiledStringValue]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      JSON.parse(json_object)
      node_input_id = struct.node_input_id
      key = struct.key
      value = struct.value
      new(node_input_id: node_input_id, key: key, value: value, additional_properties: struct)
    end

    # Serialize an instance of NodeInputCompiledStringValue to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "node_input_id": @node_input_id, "key": @key, "value": @value }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.node_input_id.is_a?(String) != false || raise("Passed value for field obj.node_input_id is not the expected type, validation failed.")
      obj.key.is_a?(String) != false || raise("Passed value for field obj.key is not the expected type, validation failed.")
      obj.value&.is_a?(String) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
    end
  end
end
