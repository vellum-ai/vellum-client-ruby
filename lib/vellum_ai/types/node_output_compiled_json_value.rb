# frozen_string_literal: true

require "json"

module Vellum
  class NodeOutputCompiledJsonValue
    attr_reader :node_output_id, :value, :additional_properties

    # @param node_output_id [String]
    # @param value [Hash{String => String}]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [NodeOutputCompiledJsonValue]
    def initialize(node_output_id:, value: nil, additional_properties: nil)
      # @type [String]
      @node_output_id = node_output_id
      # @type [Hash{String => String}]
      @value = value
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of NodeOutputCompiledJsonValue
    #
    # @param json_object [JSON]
    # @return [NodeOutputCompiledJsonValue]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      JSON.parse(json_object)
      node_output_id = struct.node_output_id
      value = struct.value
      new(node_output_id: node_output_id, value: value, additional_properties: struct)
    end

    # Serialize an instance of NodeOutputCompiledJsonValue to a JSON object
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
      obj.value&.is_a?(Hash) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
    end
  end
end
