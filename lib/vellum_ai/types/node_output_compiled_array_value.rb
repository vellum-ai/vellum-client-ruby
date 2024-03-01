# frozen_string_literal: true

require_relative "array_variable_value_item"
require "json"

module Vellum
  class NodeOutputCompiledArrayValue
    attr_reader :node_output_id, :value, :additional_properties

    # @param node_output_id [String]
    # @param value [Array<ArrayVariableValueItem>]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [NodeOutputCompiledArrayValue]
    def initialize(node_output_id:, value:, additional_properties: nil)
      # @type [String]
      @node_output_id = node_output_id
      # @type [Array<ArrayVariableValueItem>]
      @value = value
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of NodeOutputCompiledArrayValue
    #
    # @param json_object [JSON]
    # @return [NodeOutputCompiledArrayValue]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      node_output_id = struct.node_output_id
      value = parsed_json["value"].map do |v|
        v = v.to_json
        ArrayVariableValueItem.from_json(json_object: v)
      end
      new(node_output_id: node_output_id, value: value, additional_properties: struct)
    end

    # Serialize an instance of NodeOutputCompiledArrayValue to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "node_output_id": @node_output_id, "value": @value }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.node_output_id.is_a?(String) != false || raise("Passed value for field obj.node_output_id is not the expected type, validation failed.")
      obj.value.is_a?(Array) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
    end
  end
end
